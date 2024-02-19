Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2043.outbound.protection.outlook.com [40.107.22.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A3220B00
	for <stable-rt@vger.kernel.org>; Mon, 19 Feb 2024 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708329867; cv=fail; b=mNhsFoGi6/I6zbdhfLhlz15T7D2ODvxiLUK3g7ScoCBXpw5QZRxewicTimnR6jv1USwZY4Nuv60BLPxuf3j6xu0ivwbv6unQVDDY+0ocXR1M/TpEVHEE+E+07Dfpl9UwVbCauJbevlSVCloLYc4qntxun8/Q5lB2ZVsRYoNJ1bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708329867; c=relaxed/simple;
	bh=8moGcPAIJKNuf4ZDdqb70IwrXYrvsHEHtonjDsReHk4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bVeKmUhBMM913r+apdfLOOXtGm7KvPHdZR8mGOumz+Tl5UIEA/E1Y3sPiUa6g3IyRCJGrmo7wCZjv9L5q6pehU5v3/Ui12z+5O/U8JcCFwzZlv+jKGsMdtLMeYVtQ2Fl8qHLUolsw/mp6lREE27CpC9+gGeDJS1TScgTs94E05g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=A1ipZ36V; arc=fail smtp.client-ip=40.107.22.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="A1ipZ36V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqhT4nr2ej4WBu+7YxvfbPJfB6xA5Cc8IRZYs2/LaMc2qGXpkk/wKCtJEZkM8wUARYrzMENfhGSJ+085aOkxS1WTXMEP41ELvfCPoGhXedfSGBCugHqUAi0wthkIyPGlaLI/Qwp25Nn8M8aYCeGaEBZEehHQ26wtp7f50ZE7bN+5BhtfSgk2KwO1jVurKvh1FnxMPn6rcZ4Q46P/SBEJY3Ui12rEgd2a5lRUXfDr2vPs5zoxGtI4dHGo8/NAD4qU4YD9U++jrALOG4wj+hx14jI7JBoTHrntjFIb0P3RrOjRFLwyvzAmTlzPz5j/jBQj2HigwKh1TdEW3OyWUjJPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8moGcPAIJKNuf4ZDdqb70IwrXYrvsHEHtonjDsReHk4=;
 b=JBEfhvK/FE4Qu9z2J7TlGcLTBDHes54cUY5mzWSm0+xYs1ruPZsI9h9rvvY+SEt9K2RCqyrWQ62AbOwcjCgB8zFMvl/uOfEBE9XoNAAH5ahfzTXHVvGTvZHtCQpyezhfrQiIN4/Qvny4MxBUHEmPpPWlcW0ihLo/EXWnf/ExIfm8UXv+8/z+vTsApN6gGeBE0Lq6p+gtuy3CetC+TVhzq42fGRH+yOzxjfqg56IbY9E8VBHmlgNd8JOsQgUof5w9X+OHJXWJxYU3pMHRhvEvYVJ84U542+NEbALotjWkKg/cKTlWOieiezxq0j1O55uqy8TvtWQWb8U/2hqnEZzyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8moGcPAIJKNuf4ZDdqb70IwrXYrvsHEHtonjDsReHk4=;
 b=A1ipZ36VwxXUiLTlUXUz64V5cQhA5yzqc9Bz973xEgZ+C/SQn2TuKqDuNNt3pPLaFl3+xjW+9NpeduZ2O2c5B6cY5eVJnNEKDwiqbYJAH2Tnet/MO6BDsvL9qu9ZF96hfpjsBzRpbeyeGcMD1a5TiILz43KlH6Ea2xo1cGeT1/vfHdqOzirMrWYOG0gWYqG+ay3Mqqtj106/3/ld9NMXq23bliO6ZXb7BtUwqVhbN+XvpEFVbzPimKUC/YudSuoBam9RkKzSSc7YMZGmDeOfhIAbCqaGtJaAug/c0Pj6UzEtE284k4LLzsZKTfQcgCmymr9DDGszCmX/R8Tku+ZPCQ==
Received: from DU0PR10MB6828.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:47f::13)
 by DU0PR10MB5851.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3bd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Mon, 19 Feb
 2024 08:04:21 +0000
Received: from DU0PR10MB6828.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c123:2b7e:a12a:d53c]) by DU0PR10MB6828.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c123:2b7e:a12a:d53c%7]) with mapi id 15.20.7292.033; Mon, 19 Feb 2024
 08:04:21 +0000
From: "MOESSBAUER, Felix" <felix.moessbauer@siemens.com>
To: "stable-rt@vger.kernel.org" <stable-rt@vger.kernel.org>
CC: "Kiszka, Jan" <jan.kiszka@siemens.com>, "bigeasy@linutronix.de"
	<bigeasy@linutronix.de>, "Ivanov, Petr" <petr.ivanov@siemens.com>
Subject: Re: [PATCH][5.10, 5.15, 6.1][0/1] hrtimer: Ignore slack time for RT
 tasks
Thread-Topic: [PATCH][5.10, 5.15, 6.1][0/1] hrtimer: Ignore slack time for RT
 tasks
Thread-Index: AQHaYPtYFWl+HDo/FEWHo0b1Ld6pUrERUoOA
Date: Mon, 19 Feb 2024 08:04:21 +0000
Message-ID: <817fd168d2a64a5359985139bcf9c34aa809af8d.camel@siemens.com>
References: <20240216171156.569294-1-felix.moessbauer@siemens.com>
In-Reply-To: <20240216171156.569294-1-felix.moessbauer@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB6828:EE_|DU0PR10MB5851:EE_
x-ms-office365-filtering-correlation-id: 6661f4be-239a-4ce7-59de-08dc3121611a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 3kU9go6V4AjMTEej8da0HQ34/8QnDQ99xoB7Sfdo3RbXrLqw8shXSvktiKXE9m0rWjuML/fNVxZzzRrIMJYsSTGs990+wCMMibJZTJozF5YrwMvjiyQXwO6LiNYYRCZNmKtEJrX4hNd0kuprqCmoWvl/uPjM363EfVBTjHw2oG+ZdjQLBfvAR9p44h07vmOU69rT91tZ9cXAx96gSDk1XVxR+eL76kGZReByZf2/qPePWbxCf4RJGiYIZwascjiV4KQ20VBl4RKUYfgpvQ6orJmN2GFz9t5cEKb0bRx9PkXEKxrlmPahQ7EPEL4nR7ZD+boEdb4tpu8DllRCP76Tu0fQHggRn+XSQLKZqVykuWCXtZ7dQfn5J3xXVbU4T1K0l/J2ITuszh8PFUG1y0Kqt2vWKiq3AIDw5bHkOwpXrzGVDeBz3mgzR7akQiOr/q4vDW1/g3ENEHQXaud2/jzoN6lx6JQL9gsatRv3LUlgvhV85IyNB2YAh4tdRgJeTub2FJNvLXqutRdT2hSXwUHeDzvDopgT/mRbUdPmlDJx0hlkY/EtP2spFAWLIsQnyNJI/tnf010ZZP/4kn8kcQTZ6iPOmKXZWRi558F5WjQvYvU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6828.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(396003)(39860400002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(66476007)(66446008)(76116006)(8936002)(8676002)(64756008)(66946007)(66556008)(4744005)(2906002)(6916009)(4326008)(86362001)(122000001)(36756003)(82960400001)(38070700009)(71200400001)(54906003)(107886003)(83380400001)(2616005)(41300700001)(6512007)(6506007)(6486002)(38100700002)(478600001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZmRlVEVnSW9iaWxIaENaR0VXb1RVelR2UHBVcFdPWU1lNnZ1dnhyQlVmRWJz?=
 =?utf-8?B?SXVjYndYUWZqNm43SkRMRnk3c0pmbGIyeGh4aEhmYWgrV0p5ODRNMWxnbE1h?=
 =?utf-8?B?d010ZlMrbElBekJheDRHYXBsdFZEZXpZd1RSZHJUU3dWV1RzSDVPSTJCaFNU?=
 =?utf-8?B?VnQ5SDNicGRKRVpjd0NCSmIyTFIzakpzcjdTVGhFazFyZmNDTW9ZM2U2N0JT?=
 =?utf-8?B?SFVEM1NOQ2NCU3lyYWJuL3BWSkM2T1lxeGwxMjZYcTdqL2pVRFBxWE85U0pZ?=
 =?utf-8?B?eTVhdE9CRGhsY1JXMDZpYXlPV0tHSExTVzJiR09xdExUNWFHNXdEbVdieHVC?=
 =?utf-8?B?TzUvNFdlYTYyNndwMUVlYVhabE5JN21TTHEzK1JoSWVsT2hoS1V1TTdZYUNV?=
 =?utf-8?B?cXY4a09Pc0cwSFVvWUxXVnY0c2E2U2dkaklqa2VRRFpaUFJpQWFrM1lLRnJI?=
 =?utf-8?B?SzE0bkowOUFlZmF3SkFwUHRiNzdxdENCcTc0WDZjejVxUWZiVkx2SitQUHVS?=
 =?utf-8?B?L2kzS3V0SkRnd1VyTmRybExWa0ZLTE0vREFxdEttRVpQb1FqWGlabW5ycWQw?=
 =?utf-8?B?L3RkOHgwL1JET1dzY1IvRk1tbys1MThjU2R2SUtiQ2NuR1Z3Z3NHV3J2VVhY?=
 =?utf-8?B?SVhLSGRTeUExRUFuRWlnZmY0NmVEQjBLM1Z0UjBOSExsaWRaUFFrcFNzMXRM?=
 =?utf-8?B?OGZEdnpxb0VVc0FFL2hhYlluclNSRUJGOGJsbTRNSFZKWnRuZ2x3MmdrcUwx?=
 =?utf-8?B?SGYzczVvVFRFL0Q1QzN4VFlsTjlndUhrTlRoZmUrVktvVnNiSVI3anZad1J4?=
 =?utf-8?B?aml1WDVuTVdNRDllSWdhYW84QkZGbzJTTk5UK0tlWElHZFFZalhwWHNQTEp0?=
 =?utf-8?B?aTZ0K2d5ejRIN1FIemR4L1pOclY5amtWbHhHSHErTTZYOXcrOGNaaEcvT1dJ?=
 =?utf-8?B?S2NkRU85SitmVExWamxoc3RYRHhUeFEvTE9QL3lrWExZMHBxb1VjY3ZmZElS?=
 =?utf-8?B?YSs5OU50OUxhelNrOGcrV24rR0QyK05sVkdlYjQ4ZzBIRGpkSnM5cmxXWk96?=
 =?utf-8?B?MG1uS2FSczZXa29RWm9uZG42SWhpcGdpK1lMbk1jMVZKNmFlN0Q0N1dLSW4y?=
 =?utf-8?B?QnNaR0krbFZCMDRoaUxNL1hZVWhaaWpiZFZBY21hWG84cU9zUEtGS0hqc2NF?=
 =?utf-8?B?TEFEc2l2SlRrcWdlUUw5ZU9aOEp1VCtPNE1vQ3IzbGtuOXp4bi9EaFpPWG1H?=
 =?utf-8?B?Y0ZWYlo0dDNQci9XclFleHdHMkVJT2FpckxabkJicFcva25udDhQNW1CMXFX?=
 =?utf-8?B?UThnRjJXTHN0c3o4VWlPbEg3cks2d2FzMEFNczQ1cHJ6QjJ0QWpkVVNYeWY4?=
 =?utf-8?B?Nm5ubTdncEFKUnJ3U21WUWlLOTBrWHVxRTZLNGJWbjl4UmF1VHgvbzFEVGZY?=
 =?utf-8?B?QXF0RlJVTml4d2ZnTk41UEhrcG9hOS9HNkhpMVhOdlFhUHRUYUR1eEN3d0JZ?=
 =?utf-8?B?TTMveFZ2Q1F0U0dFRlNsd2t3NVBITWF0Q0pSQjUxNjdwc0RNaTZ6aENBOUdl?=
 =?utf-8?B?aDNkYVJucGMxRVl3UE1wS3NwNms0UGdVcUxWRDJpRCtyODZGZGRFeXM5N201?=
 =?utf-8?B?L2NadnhSakI3VHozaDN1aWRCNHU5M0lGK29VWWZ1QVMxUHdHNjR1MyszN0xF?=
 =?utf-8?B?czgyOTEzQkVuVFBOd1ROTW5sK3FGNzRIbFoveUlDS3JveldmcUc5aGNMa01O?=
 =?utf-8?B?WExycERHZ1l0Smd6cHhSeGxQRjRlZCsyeDFoUUZMaURVcXJmTkVQQzVZUWRj?=
 =?utf-8?B?U3Jzb0RrRzFMWEhOcGJOc3Qvd0xaTXp1VjVyQXY1WXM4aXpNbGg4ckRhclJk?=
 =?utf-8?B?VmdRbGxpSlRWUm1kMXpjekQ4T1VNOG5BVkkyOGFOVWJkYk8rVWhick1EQ0Nj?=
 =?utf-8?B?MFB2bUpRTEsxQ24vdVJaZHlrZ2I1VzBQdUJyOFR4azZwZ3gySm5wbVFTK1Uv?=
 =?utf-8?B?VFZzQnRWb3cybVRDcHNqUFZ5dmJ3RzhGUUNELzdoeWVYL3RsZ2RsVTFQT1hw?=
 =?utf-8?B?Yy9GekUwM0tmTjJaOElEbVZSdnZ4YXV2ZGRxM2R5RG0wSFdvc1k4K0s3RlZq?=
 =?utf-8?B?V0xtbGRuV29NRk1vL3dRUDdHaTBiM1BnM0N3QllpRG5RQWk0aTdKanpBQ1JE?=
 =?utf-8?B?SUowS3VjNzh3b3hRb2E2eVV1M1FpNG5tNzduSjlhUDlObGY5Sm10NDNOWmZY?=
 =?utf-8?B?Sm5IcVY2ZGVpL2FvemNJa0RjQlZ3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <533D1DBC7581494FA6E5AAFD3696BAE6@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6828.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6661f4be-239a-4ce7-59de-08dc3121611a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 08:04:21.2267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f4M0chtMkAbwHWqEQEy813Evr1rS2Q52dNVROirmthWRkHklgjWsJ8q68qMxp4rh7TYS4I89GCh1LK4XqcDbfd5uAVL+DlzHswKRPpkiEHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5851

T24gRnJpLCAyMDI0LTAyLTE2IGF0IDE4OjExICswMTAwLCBGZWxpeCBNb2Vzc2JhdWVyIHdyb3Rl
Og0KPiBUaGlzIHN1Z2dlc3RzIGEgZml4IGZyb20gNi4zIGZvciBzdGFibGUgdGhhdCBmaXhlcyBh
IG5hc3R5IGJ1ZyBpbiB0aGUNCj4gdGltaW5nIGJlaGF2aW9yIG9mIHBlcmlvZGljIFJUIHRhc2tz
IHcuci50IHRpbWVyc2xhY2tfbnMuIFdoaWxlIHRoZQ0KPiBkb2N1bWVudGF0aW9uIGNsZWFybHkg
c3RhdGVzIHRoYXQgdGhlIHNsYWNrIHRpbWUgaXMgaWdub3JlZCBmb3IgUlQNCj4gdGFza3MsDQo+
IHRoaXMgaXMgbm90IHRoZSBjYXNlIGZvciB0aGUgaHJ0aW1lciBjb2RlLiBUaGlzIHBhdGNoIGZp
eGVzIHRoZSBpc3N1ZQ0KPiBhbmQNCj4gYXBwbGllcyB0byBhbGwgc3RhYmxlIGtlcm5lbHMuDQoN
CkhpLCBhY3R1YWxseSB0aGlzIGlzIG5vdCBhbiBydC1zdGFibGUgYnV0IGEgc3RhYmxlIHRvcGlj
LCBhcyB0aGlzIGNvZGUNCmlzIG5vdCBQUkVFTVBUX1JUIHNwZWNpZmljLiBJJ2xsIHJlc2VuZCB0
aGUgcGF0Y2ggdG8gdGhlIHN0YWJsZSBNTC4NCg0KU29ycnkgZm9yIHRoZSBub2lzZS4NCg0KRmVs
aXgNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBGZWxpeCBNb2Vzc2JhdWVyDQo+IFNpZW1lbnMg
QUcNCj4gDQo+IERhdmlkbG9ociBCdWVzbyAoMSk6DQo+IMKgIGhydGltZXI6IElnbm9yZSBzbGFj
ayB0aW1lIGZvciBSVCB0YXNrcyBpbg0KPiBzY2hlZHVsZV9ocnRpbWVvdXRfcmFuZ2UoKQ0KPiAN
Cj4gwqBrZXJuZWwvdGltZS9ocnRpbWVyLmMgfCAxNCArKysrKysrKysrKy0tLQ0KPiDCoDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpT
aWVtZW5zIEFHLCBUZWNobm9sb2d5DQpMaW51eCBFeHBlcnQgQ2VudGVyDQoNCg0K
