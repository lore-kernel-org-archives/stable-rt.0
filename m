Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2093.outbound.protection.outlook.com [40.107.20.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B479AC2E9
	for <stable-rt@vger.kernel.org>; Sun, 12 May 2024 04:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715486738; cv=fail; b=VsSC5cClArfviu/ljERNNBQF3r/+L/beLa+Lff9K0QGd/zBGUccVkL2Uq6oY0A3i4oybmcQzOZxrjKWg06q7hWEIIRuvrb5CfO8H6dF8ESxltSJLQNQTHkslepGU0W+KJHM8vsgjIcydwZlm0y87TOS+oFP1AFxAWavQpN04Ko8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715486738; c=relaxed/simple;
	bh=PMfLfX7afw9pF477EQCcm2XvTjiVNmej1i0wUY8X37c=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DCK/n6GFnY63BD2uMzLPZyn4wy2lSccBHrTaRWS5x21DOTUSsOZPxYeaHsKDS0J31jCglvkfHFBoh6T2R6ocf2seZ98sCO+ZprDBY2j4+M8BAdc4Xipy/wVHFv5EAWmP2bwvgG+YR31ftkeAyVfPIje9PgyfL3SIXc6HBU3nHX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it; spf=pass smtp.mailfrom=santannapisa.it; dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b=F1hE3Dxp; arc=fail smtp.client-ip=40.107.20.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=santannapisa.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=santannapisa.it header.i=@santannapisa.it header.b="F1hE3Dxp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7v365ZnRhSfKnqPmeWC2Xga6kucmWev5L6O5/LxdWRV1i3EAvi9yrJGJKTMy9sSrsNjeu5eOoupUSkPC2eREqYOZ1cK/EP2Smpzsd8ErS0JwC+RUf6iHn/JuT4+y2AztGIIrPmL1E4vM4wOQlOZc4QDX0JVlnpvLWJrASuHBEDZJOSy+kGVVkXH28R+MSYuN1ylywrHNARjcYZ+87wTwrA1EH2/zx7Y6LFKYN2blIn/JNVip15IQkBCfmsNpRlfFzSZesYXUn5F9H+39H+XqsLga43ZUAoaSdernC+FNl0+4jf25meutDFFX1U3z5s5c0skQZ93+Wq8ucqr3ANIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMfLfX7afw9pF477EQCcm2XvTjiVNmej1i0wUY8X37c=;
 b=QPv5tQaXhKupn1j9a7Ffw9so/EWlzTwUro8mfyY8wUfmR7ig4COEgxC57hoTnASLXTWTrVEyE3Vpf7HoeU1coy0sCEfj8fdG/wRVewfPmvQoZD7SdQehiW4PAxYyX0vlYvdOvFIlVF7vldiF5p/ijFb/x7vYMwbSDkjpwV6EiBTwfaiAaFYNgQ+aCiLx9sbmzNrhQBTclFzL0yzVd2kdoTwSs7xm7YX85rm2H3902LiJnAKQjQRZJtzdXS1iJKSGsgrhrmd2cq0UBymttp8s1IsSo1cECKtuWh0+pIrA+V1BUd8X7S1N3XwZMk5l4edTz9pWnTBQkOkTMgGHg9ilXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMfLfX7afw9pF477EQCcm2XvTjiVNmej1i0wUY8X37c=;
 b=F1hE3DxpuOIA9sfRTJ2giMfDSw1RJHz8wJee8UP6FOYYfl/3ea1pYvw2Lx+cW6PSjSTSNVtpSGVleMhCMIyA3VdWwPqjCJAkSSNjRXgCmz5tM4xUYwRBOCyDtNI/b5EaL7lhR9oVG2fEwiGPLNcIfbmkyk2CW6ErLdofLJuIcD0=
Received: from DB6PR03MB3109.eurprd03.prod.outlook.com (2603:10a6:6:36::30) by
 DBBPR03MB7131.eurprd03.prod.outlook.com (2603:10a6:10:1f4::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21; Sun, 12 May 2024 04:05:29 +0000
Received: from DB6PR03MB3109.eurprd03.prod.outlook.com
 ([fe80::2f0e:5d1c:af40:b510]) by DB6PR03MB3109.eurprd03.prod.outlook.com
 ([fe80::2f0e:5d1c:af40:b510%2]) with mapi id 15.20.7544.036; Sun, 12 May 2024
 04:05:29 +0000
From: Remo Andreoli <Remo.Andreoli@santannapisa.it>
To: "stable-rt@vger.kernel.org" <stable-rt@vger.kernel.org>
Subject: RT-Cloud 2024 - The third International Workshop on Real-Time Cloud
 Systems (Extended submission deadline: 16th May)
Thread-Topic: RT-Cloud 2024 - The third International Workshop on Real-Time
 Cloud Systems (Extended submission deadline: 16th May)
Thread-Index: AQHapCFQYLNBUij/lkGva6YrrGNjabGS+q0s
Date: Sun, 12 May 2024 04:05:29 +0000
Message-ID:
 <DB6PR03MB3109F319AC45E84B378560C0E7E12@DB6PR03MB3109.eurprd03.prod.outlook.com>
References:
 <DB6PR03MB310909DD2065C7C65AF0ABD4E7E12@DB6PR03MB3109.eurprd03.prod.outlook.com>
 <DB6PR03MB3109A4B998D67923422CA515E7E12@DB6PR03MB3109.eurprd03.prod.outlook.com>
In-Reply-To:
 <DB6PR03MB3109A4B998D67923422CA515E7E12@DB6PR03MB3109.eurprd03.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR03MB3109:EE_|DBBPR03MB7131:EE_
x-ms-office365-filtering-correlation-id: 334b4fc4-81fd-4a8b-3f81-08dc7238c315
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MA1B9uuJDkWjHGHissv7ch9Fn04e2Irclrq66ckdOiU2jw6uWx0Jrh9EGY?=
 =?iso-8859-1?Q?YXlh/SQgqkzkS40UYJReFyvMf5n2658eMHhq5OLZY+i6IVIje5FltFZzLJ?=
 =?iso-8859-1?Q?ahmNfNN9bG0aunZTQzvYXvbeM0lv4Mdd7nn5DPD7Sk2z0/2CYjXUZerZjc?=
 =?iso-8859-1?Q?kU5DB4Xj/1PaucrorJ6MLrf8K5+Sm53yVxG567fdhq6H2GLgUn8p94AW+m?=
 =?iso-8859-1?Q?b7Az+V0ECAk71aVFcg123/t2xERVHKS2inR1GN4W0DyQe5H8ZsaZDMaMXS?=
 =?iso-8859-1?Q?3YdM95ejOiW4ouZj4XGn531vEq9dvHeaT5Sn6tzoH4yAnPJnKx5c2nn03u?=
 =?iso-8859-1?Q?tKXT0C36xtfA73TxosFZMZdtL0kcK/pjWILtm7V0Xvzbv2+4qMOQM20ymj?=
 =?iso-8859-1?Q?2+CZuBwbxbkyb2xuc1eRhbqij55fviGROECweaXwYLz0ymaT/JbNGSBRvF?=
 =?iso-8859-1?Q?wt0+sEiFWdbXF0XJTYVA2AyVV0njZwfqFo0FjmxIa337wYas0Ocf8JooY4?=
 =?iso-8859-1?Q?TDKqCLL4j8Qy4X6gspTJCIBGvDf5dNdqkskJROYZK/JCP0sNVs6xZppYGi?=
 =?iso-8859-1?Q?zpCOE8A+EKWJIXvmjlPud1BkhMJzMzdyB1u8eCvcdeCZaHj49gvXR9fUoA?=
 =?iso-8859-1?Q?2rXfGuiVPVrqEuyA+gw6J8NWDFiG0ajzcklkh6gbH0GmEYfUzDId/sKkYw?=
 =?iso-8859-1?Q?m6cwmku3KomiZCxvsHH15/ATJId1jayZWfc69t7Uy626kyVqWHEYQ7Wv2V?=
 =?iso-8859-1?Q?MvUzZQhhmWkY3QdiZUst/G0NtUZNvLhcfkRVEBzPEpSXlgxbw0XvPm8T7a?=
 =?iso-8859-1?Q?AneUezY2wrvqxjaNGYorHRcwVmsWMWp6uHvBSLf7H8lmwdtqLXOah3OI9m?=
 =?iso-8859-1?Q?kwZnWaTyDfYAlIpggCIjCks/JYT+gSS1YTV+psPpNU4SpTii9rNO4gI+E6?=
 =?iso-8859-1?Q?6Oxm/iSEVjGZpMt1Mc6cOY0hzsKQr+XKT3S2jA5txAFl642zjAAQWpw06m?=
 =?iso-8859-1?Q?AiQ7swKy28ApfvaSqEc9PUlr1kOE5uvdyuoIAeqGfSAP1liXMql54BqDgo?=
 =?iso-8859-1?Q?LbpITHQLEUWsnPp373z5k8jdm/yUTC+MZgGi5IWOn19wona7nyLwAryZVU?=
 =?iso-8859-1?Q?/Dc65DbInwneoNvUNXELXW6bg2W4WDCAIlQar+OimBVHQDZIsQVgjDo1kz?=
 =?iso-8859-1?Q?GNADhzjhj8+bYaUCZ08CIjl/5htnLqQiGXojf4BMzhj1jhjPlc+C643gnQ?=
 =?iso-8859-1?Q?yh+CJ74kM/RhLIN6wINyY4qaCSkKhMqPlY0Hk6JaAEqAZ4FXtOJcY0NPCl?=
 =?iso-8859-1?Q?BgVJ8y2KE6ig5lnME4Bh1mnz9Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3109.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gEIoISY60iUU1nGruC/C+yReGWfrMv712KoRXn+vSRmHZTEaChfo90GB9B?=
 =?iso-8859-1?Q?NGNm1y9W+1jiZyzGE8sMKn1oOVNbFCuv7SkW69lqmIApmjsIr+KpxXaZ8w?=
 =?iso-8859-1?Q?Z0p7nvOisAhCuWHs1pBaw59cfIaVYEOYztKAgMzXVcN83KKmTCQqMQIlH2?=
 =?iso-8859-1?Q?q8u1d+yoUA7Hy1ybm40y6buObVAVG89pKOwm15IGe8AsPQGhD93x4MBKdI?=
 =?iso-8859-1?Q?gfPcJgXrYB6D10gPbd/l59J9eFYMcsQ8toV/e6qR7Rf8xAuh7IP2fxRqjx?=
 =?iso-8859-1?Q?TWyG9OUiJtkGz0IRYMqb9YxjW4TwKg808Yv8vZaXgW/uq06sSOou11hxap?=
 =?iso-8859-1?Q?OP8TWToQvGptLbdHxCtqSiegs4mNxqfMrkY03D1iTeyYRMDVi4hVsx7Wnr?=
 =?iso-8859-1?Q?jM0bNofxlIJSCieELdUbOOlZa3oYbvrv6X4bcdp/X3UpBFsCLe0MhOThyv?=
 =?iso-8859-1?Q?U1F2LacuFvF4jQzW1BGscggTXWLXlquNyAS5E9QPcNJpicm1z0zQqrmXMm?=
 =?iso-8859-1?Q?rIXpcrpDtl1hVj2DZIybRMx5IXaar2RHlEF2ILCzVG2ABKSHdS1lV3sL+d?=
 =?iso-8859-1?Q?v3yWMkij4D80FXvzYj9+I24qomu69HukDHRv3iXKrNFqaFIyPTSBFRYvZj?=
 =?iso-8859-1?Q?8k8eDkx9KgVD2lU1eLtdAswSP8xg14cFfdr8pHq7iEyus3+400/6EtJ9Nx?=
 =?iso-8859-1?Q?sTKzCChUF2bZj5DZRWG0pdQ1NsfTq7rxe8v+tMOGnHVzC5wVlH5/dnEY+q?=
 =?iso-8859-1?Q?uSafxynA4K51P4y4+pztmqkzcATjnsYxn3rwW6zGGnqy95ASfy1yVg85yU?=
 =?iso-8859-1?Q?v08ZE3vJW+SvuGTthgtgh7SIL3gsOHwIbEfQ1kJfivRz3ewp35o4MLNeHy?=
 =?iso-8859-1?Q?QE0KZ42UC/+ug5DLY3h1b3xjfyZiQuoJ7aKuV02pT5P8MnyJ6xZSMHdja9?=
 =?iso-8859-1?Q?CHV7gh6KoA0dSKRgbBOWmLlomW1ccijAAwj5h030UtFDB5VwxIbT91RxRU?=
 =?iso-8859-1?Q?nlMHgjcBGCG/FcZbDNJubbhOuI5G2VS1I0eA5/ez1tT/oQE/sh+bJvFvtW?=
 =?iso-8859-1?Q?kuWcg3lmiVwlonMz2N9pyEVyS8u8ZTK74VA06Ojbyj6h7Qasu3nWXQHcVv?=
 =?iso-8859-1?Q?edIGmznw0fWyMKJdrFrmHJqdF55iKS9EMb2phh0nP8wxA2tAM7Ml7p+LuN?=
 =?iso-8859-1?Q?kRZQupyZmJkGdK6NZ4MYy5Am7NRBXOgEiewcuHrKfdPnc855IpP2BNFNQA?=
 =?iso-8859-1?Q?+lP97w83u/LlJdwmkgXtP9ZI7RuHIBR2xl2r2hn4Ek8bjaoAdGukJxj5lN?=
 =?iso-8859-1?Q?6hgUymPCkaAP0UiQKw73ga54d4Yot5AyqN2xCgwxWY9Juv4OKYmSPybzXz?=
 =?iso-8859-1?Q?dSaO+n938YvmdflyvPWxOgVW6IkfilXXBykiIlqSw3cYdz82YoH2adI59j?=
 =?iso-8859-1?Q?gW8IXslA2GpFNXNAcm//KypRKCJajjCj6RRNZq3cGoCbqqAU2kayazbdFu?=
 =?iso-8859-1?Q?Q+QPLSaE5xAcE0z0BUUQIzzqVldBmYpp7XVFMH4OIwjOTRmoRYsEsLNLt+?=
 =?iso-8859-1?Q?NdTBJUAQK5TOoKsCtupga6j+2yfG7X+q09DtsCWRcmyvo9gWZtr8d5H2y/?=
 =?iso-8859-1?Q?kg5KvL0YH8moPIUM/f+nB5mlXXITfBKqcFFKUu4TKcx+q3L2/3vmQVaw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3109.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334b4fc4-81fd-4a8b-3f81-08dc7238c315
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2024 04:05:29.6351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LR/ZFzQwleiFH9jSyXt/3kHhOcLi875X94DQ6VqnBp7Q1X7TQIgqKoghm9LRzSBh+sTXA9LA51L59nicvA/pJ/5PFZ97OEzNHPdWg+tT1Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB7131

=A0=0A=
---------------------------------------------------------------------------=
-----=0A=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0The third International Workshop on=0A=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Real-Time Cloud Systems=0A=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (RT-Cloud 2024)=0A=
=0A=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 www.ecrts.org/rt-cloud-2024/=
=0A=
---------------------------------------------------------------------------=
-----=0A=
=0A=
While most cloud services operate on a best-effort basis and provide no =0A=
timing guarantees, there is a growing interest in cloud technologies for =
=0A=
industrial and critical applications. Edge computing is a recent paradigm =
=0A=
that brings processing and storage resources closer to the user. As a =0A=
result, it provides benefits such as low latency and high bandwidth while =
=0A=
still providing the benefits of cloud computing, making it lucrative for =
=0A=
low-latency, real-time / safety-critical applications. However, a higher =
=0A=
degree of determinism is desired for cloud and edge technologies to be =0A=
fully embraced by the real-time / safety-critical industry. This calls =0A=
for new techniques and methodologies to design predictable and reliable =0A=
cloud/edge technologies and applications.=0A=
=0A=
The 3rd International Workshop on Real-Time Cloud Systems (RT-Cloud) aims =
=0A=
to bring together industrial and academic researchers and become a forum =
=0A=
for discussing topics (including ideas, open and upcoming challenges, use =
=0A=
cases, initiatives, calls to action, and projects, regulations and =0A=
standards, future research directions, etc.) related to real-time cloud/=0A=
edge/fog computing and virtualization techniques. This year, the workshop =
=0A=
will have a focus on industrial cloud use cases. The workshop also =0A=
welcomes short and full papers that consider:=0A=
=0A=
- New technologies, innovative approaches/ideas, including work-in-progress=
=0A=
- Open problems and upcoming challenges=0A=
- Regulations and standards=0A=
- Demos and tutorials, especially, for open-source projects=0A=
- Call to actions=0A=
- Experimental reports on existing technologies, including negative ones=0A=
=0A=
Original full and short papers on all aspects of real-time/safety-critical =
=0A=
cloud/edge/fog and virtualization are welcome. Researchers are encouraged =
=0A=
(but not limited) to submit papers regarding the following:=0A=
=0A=
1. Use cases and applications for RT-cloud=0A=
- Use of cloud computing principles to improve performance/safety/=0A=
security in existing real-time systems/use cases=0A=
- Real-time cloud and edge applications=0A=
-- Industrial use cases and requirements=0A=
-- Experiments and experiences with RT-cloud=0A=
-- Real-time / safety-critical applications as a cloud-based service=0A=
-- Real-time extension to existing cloud-computing technologies=0A=
-- Decomposition between the edge, fog, and cloud=0A=
=0A=
2. Virtualization and cloud computing technologies/models for RT-cloud=0A=
- Development Operations (DevOps) for RT-cloud=0A=
- Deterministic hypervisors and cloud execution environments, including =0A=
containers and WASM=0A=
- Real-time Saas, Paas, Iaas, and XaaS (anything as a service model)=0A=
- Execution and deployment models for RT-Cloud, including =0A=
serverless computing=0A=
- Microservices Architectures for real-time system=0A=
- Modeling of network and cloud, execution stacks, and applications=0A=
- Adaptive SLAs for RT-cloud=0A=
=0A=
=0A=
3. Resource management (including monitoring, scheduling) and =0A=
orchestration for RT-cloud=0A=
-- Predictable orchestration and cloud operation=0A=
-- Tools and techniques for resource sharing and isolation=0A=
-- End-to-end resource management and scheduling in edge-cloud continuum=0A=
-- Co-scheduling of virtual network and compute resources=0A=
-- Edge-cloud-IoT continuum and interaction/interfacing=0A=
-- QoS mechanisms and isolation guarantees=0A=
-- Autonomous monitoring systems=0A=
=0A=
4. Safety and Security for RT-cloud=0A=
- Assurance in RT-cloud, deterministic scaling, fail-over, migration, etc.=
=0A=
- Trusted RT-Cloud/edge environment=0A=
-- Considering security and privacy together with safety=0A=
=0A=
---------------------------------------------------------------------------=
-----=0A=
=0A=
IMPORTANT DATES=0A=
=0A=
 =A0Submission deadline: =A0 =A0 =A0 =A0 May =A016, 2024 (AoE)=0A=
 =A0Notification of Acceptance: =A0June 6, 2024=0A=
 =A0RT-Cloud Workshop: =A0 =A0 =A0 =A0 =A0 July 9, 2024=0A=
 =A0ECRTS 2024: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0July 9-12, 2024=0A=
 =A0=0A=
---------------------------------------------------------------------------=
-----=0A=
=0A=
SUBMISSION INSTRUCTIONS=0A=
=0A=
Manuscripts must present original work. They must be written in English, =
=0A=
using the IEEE format, and submitted through easychair. There are no strict=
 =0A=
rules about the number of pages, but the recommended length for full papers=
 =0A=
is 6 to 8 pages, and for short papers is 3-4 pages.=0A=
=0A=
Submission link: https://easychair.org/conferences/?conf=3Drtcloud2024=0A=
=0A=
All submissions will be reviewed by the technical program committee members=
, =0A=
and accepted papers will be included in the workshop proceedings, which wil=
l =0A=
be available online on the workshop website. Papers will not be assigned a =
=0A=
DOI to enable authors to submit a full/extended paper later on to a =0A=
conference or a journal. For every accepted paper, at least one author is =
=0A=
expected to register for the workshop and present the paper.=0A=
=0A=
---------------------------------------------------------------------------=
-----=0A=
=0A=
WORKSHOP CHAIRS=0A=
=0A=
- Johan Eker (Lund University/Ericsson)=0A=
- Luca Abeni (Scuola Superiore Sant'Anna - luca.abeni@santannapisa.it)=0A=
- Gautam Gala (University of Kaiserslautern-Landau - gala@eit.uni-kl.de)=0A=
PUBLICITY CHAIR=A0=0A=
=0A=
- Remo Andreoli (Scuola Superiore Sant'Anna - remo.andreoli@santannapisa.it=
)=
