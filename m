Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBB41D95A1
	for <stable-rt@vger.kernel.org>; Fri,  4 Oct 2024 19:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728069522; cv=fail; b=H6ldE+s/bNJFoj1RM2UShUHTUauxrOm8+hdvewvWsHI/KDY7kM4qXK+QcD1lpNT9fOKn3sLYRbdoGWGIB/fOaNWFIbt++r9o/4ux2/FJv9akp8y+8jmcVyIsIVPwKcBDOI375WB3uPGX/aaCVSvWpKIGHCeOhvEulk2HxmmJ/cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728069522; c=relaxed/simple;
	bh=WjUU3uYyj9N34dw3ae0VBd7MZSYElWXpBoUdgY/cPfE=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tGl1J4OwqFSsPBrbfxp+acrDLwlmQqF4Jv+DXY9o3747QpwIJ5SbMA6ozmvrpY8Zo9/imOqHCR8HmvVcOf8llYSsLgmimSdEqtp2dUlg6gAXLSsjE2sJgA6yGCUth+L5yYbkJA06uFjxfoYI4/52cZeB8ND/7eFeTaBXTVUuBbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CShGGViA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=trZ+XE4s; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CShGGViA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="trZ+XE4s"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494HfesY022201
	for <stable-rt@vger.kernel.org>; Fri, 4 Oct 2024 19:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=1HrUUWBEU120cWNf/XSLagULA0fiD2hTJR50/Bxphew=; b=
	CShGGViAgrX944eY9JWI9cIlMZQ1WJeCikN+Jwl1+u0lCoRshc2dG3ESApAI+JzU
	Qb+XmwRgluSC54Z/VeoOmuOHrCDrPiQzZYQUmGtF+qZY6EcO2IQc1cPn5jEyR6O9
	n51YeTTaSvR8lUI2DW5sZefkx+rOKoqddwgiczGgQiLk4CS8JappDgvp8W5233y/
	sfUE+ZNLL5IkWy8vPs8qk+zjJ+ofnCPNYtChr7hC3uLecmFuxqMkFJbcPMP68COS
	r4/1JCRCXDUaznGDxHNoa8HFdHwpHsEgfxAJ5aRV7I904q77DdJaggvZfgz55EMM
	0w7CQlR2ZF25L3CpiFMwTg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42204et9ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <stable-rt@vger.kernel.org>; Fri, 04 Oct 2024 19:18:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 494Idsje026488
	for <stable-rt@vger.kernel.org>; Fri, 4 Oct 2024 19:18:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4220567r80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <stable-rt@vger.kernel.org>; Fri, 04 Oct 2024 19:18:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoyEB9SYIaYN8bUT4XiQUH6+J3bgXm/U/vEMCLom+d7flEc9HQ/wIK22m3grXtwpsAF1qFXDqpInbYEr/98aLgPMVxcSNGFyIclV0b+DJATuXQPaIk06ZH/h/+TM0Sy/IylQZPsvX45PE4U+44LN3HbjwzntX/3MOOj+ayyR9oOPVI6R+joFjgJIFXq+T39Zfnjuh//dc4r5shfmVByLxYBgAmTa5KF7IP0xTeJ+w1rmbRrOsclAudKmMOcYcby2ncXLS5D8/VcgMkvd1xBXLnfLDiw9tMsZaXx8rq8ELfM0X/tw8szXH07Y7eqUuUOfAGrBVHXt1kiTVJYh8zGksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HrUUWBEU120cWNf/XSLagULA0fiD2hTJR50/Bxphew=;
 b=pD3xsbGopmJ2mr34oZ7blPvexsCdNQmNxuoJ6OT8/enu9pkqxRg10CNxSB/j8LjKbqmZKfHtHS35Jt4TDbgpmq1jh+ohtczjwbXWFZ+7AF3NbdEyaou0trcfWgEntmAHe3LKhUZsUpsiANmng5t2/0mjha+8DdxzShyDPcijrorv2lgLmBdeIxW+/qDkwBcRVJ8DobEHup30PCfsO2FwxUA9dSfyoMoXIFUQwmaOL2wYwwE5tdyeDQ8VEitNz3QczWg577TJkpJBwDxqxy8boU85kkBbWZyHHmgcuQyM9e3Fntdz3cR5Yrii9E427kTEm8BsJDS1JpWMX1E797ypFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HrUUWBEU120cWNf/XSLagULA0fiD2hTJR50/Bxphew=;
 b=trZ+XE4slRgmvWhCbmcLIQe+4T2gx1ZBrpzjiMG/yiL/EF0VDcKjO5s8sZ5QomITb3yhQQGAuVXy1Giiv0K0UxMeXdQKqfyYsSw5B/ZfQozvKBtHjcZHTSIH3eUVCD4Tou31c8ihiV5y/Gsc2vO2R3Po2itQQeJJRjyUjWFlwRw=
Received: from DM6PR10MB3977.namprd10.prod.outlook.com (2603:10b6:5:1d0::20)
 by CY8PR10MB6906.namprd10.prod.outlook.com (2603:10b6:930:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 19:18:36 +0000
Received: from DM6PR10MB3977.namprd10.prod.outlook.com
 ([fe80::5748:741f:2230:d6a9]) by DM6PR10MB3977.namprd10.prod.outlook.com
 ([fe80::5748:741f:2230:d6a9%5]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 19:18:35 +0000
Message-ID: <1c30d1b7-081d-46aa-b72c-5439a28be880@oracle.com>
Date: Fri, 4 Oct 2024 15:18:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: Please backport: netfilter: nft_counter: Use
 u64_stats_t for statistic.
To: stable-rt@vger.kernel.org
References: <20240927155656.Z-s6BO9B@linutronix.de>
 <20240927144126.0dba172a@gandalf.local.home>
 <bab856cc-7c9f-4ee9-84f6-ab228b2648c0@oracle.com>
 <20241004073934.501MFrgf@linutronix.de>
Content-Language: en-US, en-AG
From: Joseph Salisbury <joseph.salisbury@oracle.com>
In-Reply-To: <20241004073934.501MFrgf@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To DM6PR10MB3977.namprd10.prod.outlook.com
 (2603:10b6:5:1d0::20)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB3977:EE_|CY8PR10MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c342bf6-72df-4e4c-da17-08dce4a957ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEp5dHdhZG9rVHR6S3FpOHcrVEFxWVIyTmJxOWx3TC9nNnhKbHQ2MGpFQm1k?=
 =?utf-8?B?aWdlNk5tK1NNbWRGZ1pQS1IxMXZkWlpNanRIU05RazdhVUthWmcvOUpCNGVZ?=
 =?utf-8?B?d1RxeGpzYWJRL1BibTZ1ektjMnJJenN0Yk9XeXd3dzBmcU5KU0tBNDYwV0Fu?=
 =?utf-8?B?RDNuT2hRTlJzNnJCbmZra3EzYlkwZ0ZCdnFOdDA5dnA3TEcweHM3TElLSVNX?=
 =?utf-8?B?ZzQra05VdG0wa3E3bDViSWJvaGNORjRFUXRVYmVOVytub0o4dkI0WE4wZS95?=
 =?utf-8?B?TWdZOFplanZ2c1ZCNWZyY3VYVGQxcm5iNUlXaXRqNXNaTVNPTTBzTXV5aHpX?=
 =?utf-8?B?djJ1Q05JaXJFc25Kc2JYSTFnK2pOWGVuN1dTUEEzN2praERSRVRGb0NYd0Jw?=
 =?utf-8?B?bDMzK0hJd2JBYmMySmlXUCtPeUF3WEl4enBuYXIvOHZsUHNvVjcxQlV5T3JK?=
 =?utf-8?B?YVpTbFRRa2VzbXJ2bDBsK3NYMGpBNWtNejhUVG13RGo0ZnUvUm1PbUZxQkY1?=
 =?utf-8?B?M1R0ZjFPSDJrZGtldExBMzNUZ3Y0R3RXT3hjM0V6UUpsNW54MFhKZm9DQ0dj?=
 =?utf-8?B?Wlg1TTd4VHA4dWkrT2wwa2pjYU5hSlpPTDdMeVd3ZmNNOHZVMlpuWFZlazZ0?=
 =?utf-8?B?WWNuU2IvV2xiNGNvam9vQkxYMkRodVluN05ZdkkrMDZBbDEyTEdHTWVzMDZ0?=
 =?utf-8?B?eGxlOElzY1Y4UGpuVHFRdVppM3hMalMvSHQyYWlmZGdTTmd0dkhMMmpFbVB2?=
 =?utf-8?B?UUt3VGpsSUdvQ2ttQkZCd3BRMjM2UXNOb3dSeCtMdCtBTmUrRHRPTzN1S1hW?=
 =?utf-8?B?aHdlZ3VCbDJ5UFhkN3lBUnFZNkRzSEpHekIwS3NQVU52TWowQXZkdi9UMXZz?=
 =?utf-8?B?cDZqOHBkMkZ1cXgwTVdEeXBDdGVyZkNON3FaRU9jMVNKRTZucnVnY0Fmekdv?=
 =?utf-8?B?L1JrdWtYLzEzdlRoWDQwNWNINWg0RFo4TS9PQU9LakE2eGgwMkcwNndNdkhW?=
 =?utf-8?B?bjRLcGx0QzRCRVBDVi93eEtQZ3JncEpVR29KenRYMFJnRVVpM2xrRklLYU54?=
 =?utf-8?B?RlZPbGlaTE9sZ3RvRDk0ODFQUVJoS2JVYlhKYU9pZ2R2YnlQcHcyaDBnaVh5?=
 =?utf-8?B?NzRFb2ovZnAwNTR5dUpldHVyS2VZc290NkJmSnBpNmVxTjRnZ3ltZWZxNXhy?=
 =?utf-8?B?Tk94YVNaV0VtZWlaK2hHQzhBc25iTjZiWDZPdXFIZkFHQ3VndWx1bUNHNUtz?=
 =?utf-8?B?QXpuWWM5MVZqNGlBb0kwckZMM1BFM1g1UWlTQmNFZ2w4Zld4cExTdHJxdG1B?=
 =?utf-8?B?bE9IT3pCRE9mTCt0WFZNSGhML0ZhNWROeU1rSFhtTXc2SHFBNTJVNHR2VVFs?=
 =?utf-8?B?dWx0V0xjc2xVZW9zQmNNRnlkaTlSaGQ4bS9ZWlpJY0c0MXFqeURWTm9DdjU1?=
 =?utf-8?B?NmFJSFFQdG9nMlphRExuNit0STYxRUZoRmFvL0FKQjFsbmQ0TVpsQjhMUWg4?=
 =?utf-8?B?a2FMWTFSRmVrRXI5Ujc1akU1dy9LNDVPd0IyUFNrRDFpWVNRNHlMY01ZaTV3?=
 =?utf-8?B?TnI3UWtMSkNUb0xIbW03U1hjRU5VYXhWdjVCWmRTVWlaTFZHclBUTEQ5WjdM?=
 =?utf-8?B?b1BLZUlMeHJLZ1NKVW5GK0xGRERPOUxrdjI2NTY4amZVTFViQXhkTkhFYkMx?=
 =?utf-8?B?alQ0KzZZN0Jsekl5YnU0eTV4LzF2SmdzQ1IySXA3ZGJ6THJ3VDB0WWFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3977.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a01YUlVuREt4bHBJbGprRzVnNWtETEE0dlBaUzlVS2gyQTJTSmFQT2ZGaG90?=
 =?utf-8?B?cURkVGkra290V3ljWFRlNUovcnB1ejdCYThEa3lyR21OaktTZHlQMkkzTm5y?=
 =?utf-8?B?bHh3c0sveWtIL0NEU1VtQWRndG5aS29tYlhrWlFHTXgva0IvcHNXSDJDelFL?=
 =?utf-8?B?TG9aMjZZbGhuR1VLc3ZvMTUxQzhWc1VNcWtCK1pUT016K0FNOVNEZXhBZGtN?=
 =?utf-8?B?SWhBOUJhUmVKSGZweDRZNVQzTmVQZzRPRzNqVkFpeHovZDJQL2Jicm1YcTdO?=
 =?utf-8?B?SitIUXZXUUg5TitScTc4NnZRazV0dS9lM2NPZlhrb0lwWndzdDVYb3Y1UStH?=
 =?utf-8?B?ZFhRbXVnRzRZbG5tRUExeERzK252QWhWZERDc2gzdTJQbmV0bnhRVXltU081?=
 =?utf-8?B?QmJoQkhVWFpoMGs3KzZPN0ZNUGREaElYSGtvU0FGSUdMOUVtbmJoakU0WHVu?=
 =?utf-8?B?N3dxZWdyTmJUTUN2eEMxMXpRSWx3V1pod25DbkVVVS91MFVXVEZtS0tpMW5K?=
 =?utf-8?B?cUltbU9lL1FIU0FvZTMvNUJPcnNwdEx2b3cweUp4MTJQbGw1MlhINk11RW05?=
 =?utf-8?B?ditPdUlZdDBUQzV0cmRaQS81blU3VDhrQXNqZllsT0VQSjRsc0VVanhNSlBa?=
 =?utf-8?B?MnBqdGRuQ1dMa0lJeVp0N25FczhRQ0VUOUZzdEIwZWpCMHg5Z0hLTWNHakpH?=
 =?utf-8?B?V05FeE5EaDJIalBOSzNVdXRLNFhwUlErdmVCdmFzQmZOUTRmTU9WM2RRd2NH?=
 =?utf-8?B?Y2w3MEI2aVVURXBxNkRheVdiazF2TVNZalBmQ3ZUbkpLaTBKNytNdGtJZHpW?=
 =?utf-8?B?U3hRYlZsc20zZ1pwT1Zzd2hFaFlrZ1B5T2dicGp6NTdoWm0xeVZkZ3JNVXBj?=
 =?utf-8?B?akV3OUVUVmZub1RUbXpFT2NTZEs0dlQvbmdYQXBtRS84SS9iS0Z3R0tCbDdK?=
 =?utf-8?B?VVMxSzJZcWM4ampXaENqSTNYTU9BNlZGM2ZSMklUOVNRbW5qRU56cVJYNDYw?=
 =?utf-8?B?R2lmTytRZ01DbDZSdWNqVFVkUTc4WkRRbGorZjUzZFFUOUFiTmM2TmZ1aDJI?=
 =?utf-8?B?a3VGVGFHWERTSmNoOExhRGZ2YmozQUk5cXlOWFRIQmsyOTFuYlJuV2VGRkQr?=
 =?utf-8?B?aExEcmlxWWlrK1FybGtacS8vbjRjWE1FaFNHUXZtN2NuMHV2b3lzSU1VcU1l?=
 =?utf-8?B?SlpEejBCcVBRK3B0THBlUXdxTFV3WUtEckIwL3lBbXJsV0VLL1VCTGtWdWxZ?=
 =?utf-8?B?NDV0OWh6a3pRc3VCM3VaKzc5bVVGTkZpVGRhV2NzSERUT1pzRDVnVWxOL281?=
 =?utf-8?B?R09hckVEZit0bWZXZFdIZXlTVndGMzFWVmN4YWhwUlNseWh2QnJ5dkdQcWhp?=
 =?utf-8?B?L3VCWjV2OUdxUjR5YTBubVJHWHg3M0JBSDdPMnB4RjAzc2htenBSOHlpY05Y?=
 =?utf-8?B?ZFl6NDVhRi9ZbjZhdGVxTG14blJGQzZMREluNHppZDc4NnZWd3JwaWhRYzJk?=
 =?utf-8?B?OTBtVngzRWpYMEJIUlM2NFlUdjN6T3VXWU5oUGVYTXBTbi8zbUc1Y1lMb0dU?=
 =?utf-8?B?Sm9LVlRhKytwMkVCbm1qZitSRk1yNGR1MktaTzJsbWd6SDBVZnFvVEV6enp1?=
 =?utf-8?B?eXZjK0NSSUlwR0JNT1pEZUlmRitydWlmcksyYmRtcXlxVTFuN1JHcUVXclVK?=
 =?utf-8?B?VHF3UWJ0U25oSnhuY0N3MkxHandHSzRUbkpmeFlDMW1mdDRKRC9BdzhkRlVQ?=
 =?utf-8?B?QXJ3RWlnK1Rqb2F6STduTERSSDUvMWEyaE12WVZPazZCbnlsQnU4TnZUanhz?=
 =?utf-8?B?KzFxSUtCOXIwYk1GQUJYMUNNMW5UTnc2dFVQNUg4eU1YT0tJQVZZY1VFalZM?=
 =?utf-8?B?VjRwMWFqaHRLamdXdDNnUDFpWGVYRktsOGZuY0taK2w2NXRmZUN2TTFPRi9m?=
 =?utf-8?B?TjF0ZFpqN1JVYXlKekttYkF6akF3dUR6SElycTNNc1k1QnNzN2NINlExbE5D?=
 =?utf-8?B?d1RmMEw1VyszRE9oL3VyL0dBMnpOUWs0bWYrcGhCL0IrSzk2Q0E0VjVyZTRi?=
 =?utf-8?B?OC9qTXQwaXRNK3p4WjhNV2Z4aWNBS0poR0g2bnVhWDF0VHhOODliMFhnN1k5?=
 =?utf-8?B?YkpSK212V3hSVGtPUkhBSjloQzFjN2JtWGhESk5oNkhlekVvbzdpalZQa2Zk?=
 =?utf-8?Q?argVF4fZE4PU3BdL0Ghd+u4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OCtRtIvJvyvDGOrFzSBiyp92GX5z8E4stgghmLCqSPJbNRgX0/7Fxnpe5EOmevemr4nRLB8cAx3IqIsNXRFEpp8kWZeMX1KFSmTiKNTfHzwMfjVAcn3DyHsREd21OnlM7qxQj/UeFp8M5avEhYijeHmRZJZOeNmtVpNhOrU9HcJHbS5iR13vEvp4y6e3MlY+zG7lPrSNiAtbLeoo97qKZdbefQN69p4SAJcGl38la2CPecpBYuSA9ul6Qs6aiao4pOsrqNEf9pA11feaY03WuS2yoMNpzbRIdEPXAxw47tK127I5t56Xl9oq8LB8xENAaazN5aBiBO7sP+kD6trrYfnBlZ7IwnRj/0S5SgtTy90L59GKJyA1trHI2m/trNEBBxQO+OFenByOJ8691MAgwjFUf5oQD7ldysX0pVVuCM/zbVIfH13JA1Eakfe88W1ngwYDFsfedtmLXJlfqlFtetMiXPqYHto3np8cHoYvuHQj7y+n+L1L/hmQsNxY9jk0fRrPedWhEvRelyf2wTuSnqSkJB4gnZAtz+bk2jRq/exjA0PHrFLQBF0waQu44H/LY4NSl4gafBm671tdURud8O+AKtVPRkN/sPfKZwmO0Ec=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c342bf6-72df-4e4c-da17-08dce4a957ef
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3977.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 19:18:35.8268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndcKOJJRy8SQwSUuJEhl0NMAsaoRUcQwOrlEMHB7Emn2SjR/vACaVPA5xT+3txXK0aeSj9L/SCiIDIwgylgZ9dZKqekt9fJEAhp2BByt3sM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6906
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_16,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410040133
X-Proofpoint-GUID: fpRHxqENa9_uhceUfLW4sX0OOwDOiOw_
X-Proofpoint-ORIG-GUID: fpRHxqENa9_uhceUfLW4sX0OOwDOiOw_




On 10/4/24 03:39, Sebastian Andrzej Siewior wrote:
> On 2024-09-27 15:01:00 [-0400], Joseph Salisbury wrote:
>> Is it needed in all stable release patch sets, including v5.15?
> Yes. I would appreciate backporting it all the way where the code is
> available. The dependencies
> 	1eacdd71b3436 ("netfilter: nft_counter: Disable BH in nft_counter_offload_stats().")
> 	a0b39e2dc7017 ("netfilter: nft_counter: Synchronize nft_counter_reset() against reader.")
>
> were already routed via stable.
> The problem is that the seqcount has no lock associated so a reader
> could preempt a writer and then lockup spinning.
>
> Sebastian
Re-send to stable-rt mailing list after turning off HTML:



Thanks for the feedback, Sebastian!

I confirmed that v5.15-rt received those commits via stable.

I attempted a backport of commit 4a1d3acd6ea8 to v5.15-rt.  Commit 
4a1d3acd6ea8 removes nft_counter_seq() from most places, but in v5.15 it 
is still in: nft_counter_module_init():

...
...
...
static int __init nft_counter_module_init(void)
{
         int cpu, err;

         for_each_possible_cpu(cpu)
                 seqcount_init(per_cpu_ptr(*&nft_counter_seq*, cpu));
...
...
...


This then leads to a build failure:
#####################
In file included from ./include/linux/mm_types.h:18,
                  from ./include/linux/buildid.h:5,
                  from ./include/linux/module.h:14,
                  from net/netfilter/nft_counter.c:10:
net/netfilter/nft_counter.c: In function ‘nft_counter_module_init’:
net/netfilter/nft_counter.c:321:44: error: ‘nft_counter_seq’ undeclared 
(first use in this function); did you mean ‘nft_counter_ops’?
   321 | seqcount_init(per_cpu_ptr(&nft_counter_seq, cpu));
       |                                            ^~~~~~~~~~~~~~~
./include/linux/seqlock.h:110:43: note: in definition of macro 
‘seqcount_init’
   110 | # define seqcount_init(s) __seqcount_init(s, NULL, NULL)
       |                                           ^
./include/linux/percpu-defs.h:235:9: note: in expansion of macro 
‘__verify_pcpu_ptr’
   235 | __verify_pcpu_ptr(ptr);                                         \
       |         ^~~~~~~~~~~~~~~~~
net/netfilter/nft_counter.c:321:31: note: in expansion of macro 
‘per_cpu_ptr’
   321 | seqcount_init(per_cpu_ptr(&nft_counter_seq, cpu));
       |                               ^~~~~~~~~~~
net/netfilter/nft_counter.c:321:44: note: each undeclared identifier is 
reported only once for each function it appears in
   321 | seqcount_init(per_cpu_ptr(&nft_counter_seq, cpu));
       |                                            ^~~~~~~~~~~~~~~
./include/linux/seqlock.h:110:43: note: in definition of macro 
‘seqcount_init’
   110 | # define seqcount_init(s) __seqcount_init(s, NULL, NULL)
       |                                           ^
./include/linux/percpu-defs.h:235:9: note: in expansion of macro 
‘__verify_pcpu_ptr’
   235 | __verify_pcpu_ptr(ptr);                                         \
       |         ^~~~~~~~~~~~~~~~~
net/netfilter/nft_counter.c:321:31: note: in expansion of macro 
‘per_cpu_ptr’
   321 | seqcount_init(per_cpu_ptr(&nft_counter_seq, cpu));
       |                               ^~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:289: net/netfilter/nft_counter.o] 
Error 1
make[3]: *** [scripts/Makefile.build:552: net/netfilter] Error 2
#####################



It looks like your patch handles this in nft_counter_init_seqcount().  I 
believe I can just backport the same into in nft_counter_module_init() 
for v5.15, but I wanted to run it by you.

Thanks,

Joe







