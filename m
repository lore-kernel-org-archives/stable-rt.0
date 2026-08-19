Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8B48A8CC
	for <stable-rt@vger.kernel.org>; Wed, 19 Aug 2026 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157045; cv=fail; b=W1EWRDvPsyb10Epec4mvrN5ZGzLfvddzgd1z8IWWdHeR1soiVOxV9MbjhojuH51/vARwS1MYeT096g43QOzy9fnBpVj86sr4/uBT51OZijRD31FbmyoWb5r506YUhChJSy7fE4+s8hcH3WaQv36G832xUSBoLx5f3VrTCMCumqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157045; c=relaxed/simple;
	bh=eOadvr3emgI1W4dSJeQbYgoWSGLUtN4CfXHKllGOosM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKo7h2XR+HCeYTG8MsB5vv29BCLjzAkcDUghPMf7XFSQs+taISlNLuWqw10+RkxukllFBfVu0I/QA9NXWDAMCcfMLPoQYEPzD0W+k6v7CvVocoOCLuPnh4RdD9OT2T1/B5M6d0mHZR4YbwPndZuEfTqsBex0cZOLpHOOpoawyYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Yi8/CN33; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BFtHhbx5; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Yi8/CN33";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BFtHhbx5"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEcD6Q2345135;
	Wed, 19 Aug 2026 11:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=HHVvupcgEgELjVm
	CXqx39f1tMQNWy5/URTrQwGGgBXU=; b=Yi8/CN33UFKKkRRleI9MQA9IspI5PKn
	78KFdCle/13KPz3lriSNgbEBzjFAhjzjfUW+gGyGyuTorzbiN86AE5oP0/F1fEs5
	yNnJ72IBp9/0gHI/9zAKZgJcRYD6U/wrBWs2fbns6Cs5uN0KzlyMKogHaiNsYPfN
	gO+AopDqqvtqfwt3dPr2eThDp7Zh9IFFjE+1MQB42RILZpzEJdsreyW9kAg+m2P4
	bfi4t8bBeOmeduWX2PaHuwDdvStQNMITgz7XQ8oxiwX3Gf/fKdw0kCeElU4QbMAZ
	GR6LuL4oxHa5LpuK9xEr8RNKehORfBl6Wz5b9U6ZoUa7hzNXOdpcb1A==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g4yejnw31-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 11:30:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjp3oAF2iiHmgoiqpGVQVpy1Q7PvgR6UgCAdt00u/pJI6rb76/6T9PCfywljB/0mGvcC3opGowWJISwQHK0el9pixMNRK/Aj4/nh8fRzmes5gOC4tQSqZ4i0O3NDB9d9BW+sNFqDqXkU/nMFMPp8yAxtrj9nWUt2/7pKIKk8yZzxDgZVDYYnW+deqAUhY70m1MEFepY4DTrEVjb0SicmVz8yuyRADLR0I0lzLoYhN1HSUWje71dDbZYIseewuNEwTzAhBFRRADjSormQixxkNJq/gG1C9j3vgohiP2C9qFHwS8tDJFV7H8bcMq+9mjXGHovAIstvDg+vlicBZoHm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHVvupcgEgELjVmCXqx39f1tMQNWy5/URTrQwGGgBXU=;
 b=Xqr0l8sdVcl9rzIZJ3jUSXuUbcU7Bh/WYsXSNE/npoV040fybBAP2PeHNHD4I7FKIMGKP8J4CA4JOY6JISsE2UzrtA7V2l3z3GCkzb617a1IPKWiNybsjnbaA/K0Ik7oQAx1VrpnMHn5YAGDMI5UVuerKV1KmXHY0pYTP0Mo0lxCkrDZLnTCFyuMeTqT7nMV/WmozvIbVElzBM8bEI0ny2d7XIQdqct1/uA83e0MZkiXRcdVrtQyUVCiH886jeDvCgmCxTDWgSdh9d8+pJRcTo6fFFe/GyRf2WmQ/mNz2k/4yGyak64ZmyRZhbtKpwBxzDlDp8bY1esc2K8uWFdcug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linutronix.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHVvupcgEgELjVmCXqx39f1tMQNWy5/URTrQwGGgBXU=;
 b=BFtHhbx5bGYas8X3bs3qIOPEH+PfHMO2cJuRmBw6GhSVC4tLHo56MslKJcPvyTUwMpz1XdeoGXegrWF8gxm/1ESBH4bKXAKsOWN01tFZVIW5GFSbKlmdeqC1B63wSmKnyXMJkCAswfT5Wg+UvYesaeTX3kyG8WgcD/sg0WZZ3tU=
Received: from BY3PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:217::19)
 by DS0PR10MB997552.namprd10.prod.outlook.com (2603:10b6:8:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 16:30:21 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:217:cafe::54) by BY3PR04CA0014.outlook.office365.com
 (2603:10b6:a03:217::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 16:30:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 16:30:21 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 11:30:11 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 11:30:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 11:30:11 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67JGUBQS2669701;
	Wed, 19 Aug 2026 11:30:11 -0500
Date: Wed, 19 Aug 2026 11:30:11 -0500
From: Bryan Brattlof <bb@ti.com>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
CC: Steven Rostedt <rostedt@goodmis.org>,
        Stable RT List
	<stable-rt@vger.kernel.org>,
        Praneeth Bajjuri <praneeth@ti.com>,
        "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <20260819163011.v7uqv6zbavgbebq5@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
 <aju8K3aPXCWr7v7z@redhat.com>
 <20260625-afar-trailside-f84c5025dc57@thorsis.com>
 <20260625080227.WCsryMw4@linutronix.de>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260625080227.WCsryMw4@linutronix.de>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|DS0PR10MB997552:EE_
X-MS-Office365-Filtering-Correlation-Id: 178c99c7-564a-4222-7851-08defe0f29cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|10067099003|56012099006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Sa2eMa7QBQ4CrpEubgGV8J4Et5V6YFsE2F2bQ5DwVH1bWoFmGTSaF5K9OSSL35Y6AgoD8akQ815U9z/dY4e/w73pMMuHl5BnXYTSXbUR+Qp7mTnQV6u42UPZSqxwJhWmMRCMwHspbHJI+mZ58Irlifhtzb2kwiPV1gxIjf26Wdn8oqH26KNMsd7+2CW7HqieQIYwn/KPhhSdv5g58h4xG9BlzPTASGaHQs8DnJraNsI9/rgD3l1tM5o60EjXnomW88LeLiopaxApxblwkxiiEJHreeasbJB2T6WFgx+6/q4RWWN4PoJliOcOfJngE9+KpJBMnVeZ8keLJtu7sdzZ3BKPcCLsXsMXuw860J3+3sqbTHlhOJ2u4ZanIZsKMfmtLUl64o8m1kylvWhlBnqZD/PjrvGVHpxDbAhEo7mwgHjHGFBbRIzFIU8R6GyU48xs1FwrxTk1kiIGIjuPnGZ6lu2vs8D07W28Luej6rp0Dt6+WsQ6m6Y0s1mCcBl7fob1mKoL6LvwIhDm7tyFRnjj7qo7IWha8mARjFMVV+qQoKK6vXgKWjdn0HKnsAMR/bynOG4EBrcp+3jy1cvlYTguqH0lahdvA9oQrSIXFKVS5orrpolD11I2Hmf8FEyPtCT5beLeXDoq6vXIP7Y6MGnOXSlmkWkNjJuVfT3XULwjIwFNjHgmGZ5faygSmk55QjmQ3gipb+xwCf4V6+1VNkMmJA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(10067099003)(56012099006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SJR0bOKKEryCKkAgWTSgJ+DP2Oz90mj5f6R6pQqLrQWygGa5EurX/JY48psZxjsslQACHb/q6jfk5CbCCLcICKIt3JaxOK4ABb5IPgWjsTxQtpZMi44/puGsqJdONNRUFRR1MWiGaq67jn/75RoXzrm06Q8sa07qMKVs6eBuHClzVPcBGCDJDjw+ug/ZekKxrdM3t5mgoCikYNJAugdaZXOe+oKheVjFaFy2Hj5r+Q/GGfUnjGYlKY0lmj24+CzBIBlhFDF7+ROfr5K34FDoYpVN7xh6z+Aoe01rtDrmlujl4E0I5ngzPgo1LZBUUFQZ05m/52deFdpvQxzn6IlfbNQUyiesCBqIQNRxGUovBkMskJsIMOW8W9xTz/9d9pN2+32JWj5WuTAdQYtrKyj4ANpN5qUJ3g7Zxf6Y+GI7KnBT9kAfItafI3xtSu9JiF0n
X-Exchange-RoutingPolicyChecked:
	R1/6gSQ6k+P1qqVl+rG7fhF0x3yuQHEPlaOrNEjcQc1yHxBuVm8ebKXW2xbWzK5AGWbpX/sucp7RKXX1D8XXipeLtJA5iHu0lso4I1uw7lublQLcutwTO/exivpXzPHZHr7OSKpYHJFqdGL/YKI4di9fs1crHo+aDu+9yxyqgm0kw02CAYjjtwMO9xbgEW6zM8gNQmzq6WlBzz3y201AyFvM6Cl190ig7k5PoXptUl6mMQzVolVkVLcbbv0O6YviOulUH72DgPV+rq6cQnhG7WEqcqwG2+b1ixZn6qhvgk0aI6HlHVa88OKj24XhbsI/wIQyX+ptCsLbZBqo8kTVLw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 16:30:21.0990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 178c99c7-564a-4222-7851-08defe0f29cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997552
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyOCBTYWx0ZWRfX491f+C5h5aee
 FOWqHXPmpSi4rCFaa/R4r3akLe7A+jOQ02J9hXfp/AQ5XiXFW2kUYQ7nnuIZli8lAptB3LzrhTs
 10mnM5AFCTQ0l1TnkExA+Of3BP35Atk=
X-Proofpoint-GUID: RKjjl09aHg7SooLpEAZoA8DtZ_QtSVSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyOCBTYWx0ZWRfX2iKUr2dlIWsn
 kU9opVLBz1zIU8ibHyz9gTLUe5oiC30bv76Ojk3RHm+ykHhctPtlM/22CDFtj34HMUSCCUOdK70
 T0TWrCucOisNnhloh3qSEzEGlKLa2Yqx+Kw9mgb+wcpP6Cv/8MtKavVx4eJZwPKMn3qEMHKBvZ4
 Od1pl8ptGbJ0WEqvb2DIaLsWaIyIMN0aPcu3TsomqNF9vVXMQwSZ11PbRAERDnWyOd4GWnTPvzw
 Qc/Zo2MMfgXUa9zGkpdyIN56fYneKySXrcgVTD2ibaPOs3IcoTxDSdhG8z1t0J4qHt21gOabbmH
 bAbbVVQRDx289Ehqfvbvscs56vzyoiol8XCBRkFfynk7kHrfhBWQwlpbxvOYooMDTpOAu46lUiK
 ymJ/Qlm6S/e/a0f9QoKcoKF/lhzSMxKKUJpGiBRHOTOhOQf4/CEQ/MdkvpVRKWw8LytrjEGo/xk
 5u08yBN5AZmEnAL5W3w==
X-Authority-Analysis: v=2.4 cv=f854wuyM c=1 sm=1 tr=0 ts=6a85da20 cx=c_pps
 a=9V9/KAGQR/RGwytZTnC4xw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=d_v4vWkb5PnHgcTM:21 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=1qDlhB2VyPot-eSq9FIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: RKjjl09aHg7SooLpEAZoA8DtZ_QtSVSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1011 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190128

On June 25, 2026 thus sayeth Sebastian Andrzej Siewior:
> On 2026-06-25 09:35:19 [+0200], Alexander Dahl wrote:
> > Hello,
> > 
> > just adding one datapoint here in case someone is wondering if there
> > are users out there? ;-)
> 
> Sure. Having an update from _any_ user feels good. At least the work is
> used ;)

Yeah I should probably be better at thanking everyone for providing the 
stable branches. Thank you all :)

> 
> > > Sebastian, just to make sure I understood your answer, then we don't need
> > > to keep the OOT patches up-to-date for v6.18-rt specifically? My question
> > > came from comments raised on the last two RT maintainers meetings and the
> > > LF RT Board meeting. I just want to have a good answer if somebody else
> > > asks about that. And to volunteer if work is needed.
> > 
> > We still use v6.12 LTS with PREEMPT_RT on arm32 (at91),
> > and plan to use PREEMPT_RT on at91 (sam9x60, sama5d2) in the future.
> > 
> > If there are no regular patches for v6.18 we will probably skip that
> > and use the LTS coming later this year.
> 
> I did assume we have v6.18 in maintenance but somehow it skipped. *I*
> usually skip updates if there are no clashes and nothing changes.

Did we decide to skip v6.18 ? There are a few people internally asking 
me for a roadmap again with some guidance on the lifetime of the branch.

~Bryan
