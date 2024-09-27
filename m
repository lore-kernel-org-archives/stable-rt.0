Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3417F16FF3B
	for <stable-rt@vger.kernel.org>; Fri, 27 Sep 2024 19:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727464017; cv=fail; b=m3vR0eLd1ORDd0MAJ8fWViamwD4jxuNIGWagcaix7GVHOk6Dg7wNQYn1o4aqfQPSL+MCqJy5vasXQptwiOaNE/DCFflLQ3qSsv18013XlXABaLVz/9EaneFdnS3hy5/aunxlzXas7SVtF2DQg6NepJLI/cw4y/ZuUvddjn6T5Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727464017; c=relaxed/simple;
	bh=oK68GZcNDgIVoKtnh2B5JrkC4lMTcnqm5lfbrjBKv94=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nUIKmlU1kfv/JvAbI0Ngef1blAseXpQkEX9EwAUarcVmr0fp0KYqtIju5szEk6C2Bormm4SGVAu7hw7Ocg2jhZ50PhBMfsci3PIM0C7QvfQ8+7WfhyAuIKlSYbZxaS4RL9czYpUdUg3FmV7bTU4KEv1iwxavLAZg2PzaJRE6/zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P0IEfWni; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oR15lp4Y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P0IEfWni";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oR15lp4Y"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RHMY5t018988;
	Fri, 27 Sep 2024 19:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:from:to:cc:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=STYZnz05zUauFIw/8XaziNGCFw4Np4Uh5CxsEut/hh8=; b=
	P0IEfWniuQxLg3RncfHysqDenPL3EHYXygWud3Sb8B9RRFYgDBF+x6LauzxdsFDY
	r1hpZTBv4GQk+DIG4jLIX2NJFUApsIWt7r6XTIe2OU8v2r9FzoGY1aSSuJMXM7R2
	pxIDoHnDp4Q9WNN4VqtIWqPle7Dwm7tT/iat5v2SKcp3wqP3+iXy8/IyK4WF2Np7
	NV3bXxXj0krHsHIWOX54WnUC6WqE8FASjPgPn5BJM5CcL11HF41v9BbvtrBbqvpy
	s9J6hBM+QQWvOBpCa0eKZaREcxqoEElgBsSXHPtRtahDpb8LtAqOchMaQa4GnDM/
	OnJwcS3pkANacydrzXe9gg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41smr1gk2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Sep 2024 19:06:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48RHkphc009786;
	Fri, 27 Sep 2024 19:06:51 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41smkdn76q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Sep 2024 19:06:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsO1mrKJyGLagjcWZPKM+3emGLOl1krOo3b9nVp94526EJpiGU4dSH3mnyBKgeNOFc98zAsQHZ/th3IVPsDcB9d5DzYjSIkaKndS3QujDDcSTnN5okAxw5pVn9lPR3s92UCnPs+MQXtX6JoVvHtvCF6e5AwxoEIEv9QzVflDPf6vXWF9xtx4AOKPTY06eCTQAL7QtEtrG73GFxUtLjdULYJ5R5Fj7cZsapXLkt0lILVZDHYgBFRTzNl0aTXc2KfZiuPq9z1MNS4U9hYRh204+vfAhF9988xOTnqH6WX6hKjWgcxwl0Y5qA2UEys0pbkhlP+keYFsQTfWMNKJErM9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STYZnz05zUauFIw/8XaziNGCFw4Np4Uh5CxsEut/hh8=;
 b=bm0xmqUO6U9B5qhBqJ3vdLyQv817wEtBjVQNkirJn0v78cb5+X7awc0e2MJlZoQS/sAyTlWP3K3aJx2bs/bx65Bu2h7uUsS3Nh9inxphCNVetqyezNHZ98XwX/3U0Q8ppYAKyhsxr/+VOH9N7xT1od6pJ21ppZ3zVgnwN1eEcH02BOhBuh+6dtj4BtOQx2E0uQNhL8NLtrOfOjkylSl0hKIUe2nuaCj564hba+75yySpwPPsZD50EVbga/PlIao4TyuO0om3yub4evoF1OIwqVZfj25azuCH+yf1duyZZcOzZ3qNPdIdKzt0RNaGwODzMF4pKoOUvPSnJkVnVXlG9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STYZnz05zUauFIw/8XaziNGCFw4Np4Uh5CxsEut/hh8=;
 b=oR15lp4YqCBpR9PtlO7kWGwYdpOk2uvTi7YCNw3QuLuYA3ZkbTU48DehekbYLIBJAtxgdDjlN7JhG/OpNhG/vHRrek4UFsiihpOCe+AtVXEnEXkFFlWopAtytKmNJc+PQPd0a0GAoT2TGXDvWwPwPK2NJl+8f3At9zA5cpk/v9U=
Received: from SJ0PR10MB5597.namprd10.prod.outlook.com (2603:10b6:a03:3d4::6)
 by SJ0PR10MB4685.namprd10.prod.outlook.com (2603:10b6:a03:2df::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.9; Fri, 27 Sep
 2024 19:06:49 +0000
Received: from SJ0PR10MB5597.namprd10.prod.outlook.com
 ([fe80::fcce:1d5b:a4ee:9b59]) by SJ0PR10MB5597.namprd10.prod.outlook.com
 ([fe80::fcce:1d5b:a4ee:9b59%4]) with mapi id 15.20.8005.010; Fri, 27 Sep 2024
 19:06:49 +0000
Message-ID: <916264c4-958d-4718-974b-82ae8040a11f@oracle.com>
Date: Fri, 27 Sep 2024 15:06:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: Please backport: netfilter: nft_counter: Use
 u64_stats_t for statistic.
From: Joseph Salisbury <joseph.salisbury@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: stable-rt@vger.kernel.org
References: <20240927155656.Z-s6BO9B@linutronix.de>
 <20240927144126.0dba172a@gandalf.local.home>
 <bab856cc-7c9f-4ee9-84f6-ab228b2648c0@oracle.com>
Content-Language: en-US
In-Reply-To: <bab856cc-7c9f-4ee9-84f6-ab228b2648c0@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:217::21) To SJ0PR10MB5597.namprd10.prod.outlook.com
 (2603:10b6:a03:3d4::6)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5597:EE_|SJ0PR10MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: ed67ec29-be28-4024-360e-08dcdf2789e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NSs1SjhNN1JYLzZyY0NoeDBLT25RL1JXdmoxdFExUTByaytnR0M2MkNEVTNa?=
 =?utf-8?B?ZURHcnJVMFB5cVhNQm43dzN2MWlWUXhlOEtocm01a2FxVFc0QkVCenFONWNu?=
 =?utf-8?B?S0U1R3k1Q3JCWkZtYU5NZ3h0SzlsTENrSjFFQXFkeGViblhsN2gwUEFTSFlB?=
 =?utf-8?B?WUVBZkpkbDFJTkZscW9uU2xGU3Z4QzJ6UExtbktwbVVibmJIUkp2MWRUMlFq?=
 =?utf-8?B?RXBFeEFFZEM3dGg3VG53cDFmZGxuWXFEQ0IrYUx2Skl6ZWQzdzYzQ0Nua0Rq?=
 =?utf-8?B?Qi9Cb2ZaNUhaR0wyOHVrM2NXNUFRYTlzMWU2dnpYbzQ5LzRVRWF0OEQ5bGY0?=
 =?utf-8?B?azd5Qngzc2UrMTc3RzBFWnNtV1ArRWZPblZiLzh1czYrSDRaNzVLRm1kY3Iv?=
 =?utf-8?B?ZmtxeVA1R3FOaDBWdHNUeTNyczNoeGhUTmd2Tmx4MmFNbjZ5dmVZYS95a3Nl?=
 =?utf-8?B?RGZyZUUzNjRDZzhNSmFZMGRRQ3FJd0VSVHE3MUptU21ieXlWRUtSYi8vYzdh?=
 =?utf-8?B?aHZGNDJJYlNBeFBQRkdETDdqYklHNWRuYmh4VzVLbnZpUXJ2OStVaTkwdDRG?=
 =?utf-8?B?anF0Z3JqOVp0c3hrOEdHZU9oYmJoeDNmeEF5N0tqczdQbnh4UkpaNUtYS3dl?=
 =?utf-8?B?MmxodnI4Sm9ISXgxNlhJSDVmTnREbFViMmJ1eXpscUF5aG9wUGRGSGQ5REcr?=
 =?utf-8?B?RzJoZFlDNWRzeFNET3YrNmV6QUc2anAwZk9NcGloYmlZN0x5Uy84aHNiV0NX?=
 =?utf-8?B?T0NxWDFFSk1wUWhlcGpVckowaURoME10NEdrZE96RXU3WWhSY1lNUkFwQko3?=
 =?utf-8?B?K0hHclpFN1VrL1p0TW1vaXF4LzlDRFg2dk80b29ETi8zelJVS3ZoNnY1YmRm?=
 =?utf-8?B?LzRucmtUQU1vcUM2TTBNdWFGK1lHYUtuZkRwTWFUSTE1MUw0UVZwRDlWMFFX?=
 =?utf-8?B?cEJad05DUjJLcyt6MmMvMFhYWFozKytCUEUrUFlBVm9HZFBjN21TRklUY2xJ?=
 =?utf-8?B?SE9iNC8vekJnVGpkMytTZklIUDdBd2hDektQRWlGeTNtRVFpZVBzbXJxUGNi?=
 =?utf-8?B?ajZtUzZhOWxtQlNxNGNESlVSUlRZc2QyRlR5MVgrUitSaDZOYmF2MmNjczVn?=
 =?utf-8?B?eDRhOHg3dThHSjBEWnpMbWx3N0pWdFpRYUswVGc5ckJreGxKUGk3OWtYWG1s?=
 =?utf-8?B?TGMrRjZabFpnQ2RCL2FBZlV1WFM0bnVTS0JjTnV3VFoyd3NtQUFuRHREVEtl?=
 =?utf-8?B?c1ZuMno2VGdqK2MycGU0dFdabkV4anVzNUMvakh1endPV2toZEJOUG9RVnFQ?=
 =?utf-8?B?aUYvVlV3VVFPRWhveVY5NUNkaDhQaWt0YnhxYjRjaTV1Vm1SQ05waDViNVlo?=
 =?utf-8?B?YzQxWDhrQUZrWnQyRExFUlBUOTdYaFFhelNoNlFWTGpNRXRkKzFUdWpxNUxG?=
 =?utf-8?B?VVg4blNqRGZKSlBYdUtEZ0IzSlpmUXBqbDAzcGZrMVFLN0JDNy9kaWdDK1F2?=
 =?utf-8?B?UzZLNjM5ZVlMQjIzdGZvZ3Z3N0VKaUY5RDhhYUpaRFZ1Z3hiM09MRlozR29S?=
 =?utf-8?B?dXJBR0QyVlBWMENDMjBCeTZDc2kvU1g3MTBkaW84M1N0TjIxUHYvbWMvci83?=
 =?utf-8?B?V00wWWcyRFhoaVJiVTcwYUd6SHZYWWsyVUVzSVVmWTZpTjgzVWswd241Rm9s?=
 =?utf-8?B?dDVxK1c2VVJkQytRamhYU1d0aWd5TzhOUnZvRmd3N2E5RDkzY2Uralp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1VTWUJwRURVZjRtdGt6KzdGckc4VVNzOFpkMlQ0VldhT04rSUpJcnp4ODkv?=
 =?utf-8?B?bndVdEZSNzEvZUxLc25sOSt4RTJmMWJXK2llRG5RQlhkdlNLZi9jVTJZMHdp?=
 =?utf-8?B?ZzFwOWgxTjIrc0pTUENhNjFrNTY3MmRrVWVYSi9EZ2VTUUhTUVdMbmJpSTNL?=
 =?utf-8?B?R0Y2Vk9NT0NQbUlxcUlSSWpINU8weFpJWVQvZVFIb0d3ekJGNDZ4anhhcXJT?=
 =?utf-8?B?c1huYVMzbUNXMVh0dExNekc0L1RKNEFxbDdPNWZwaVQwbFhQQkFaWHEvQXhw?=
 =?utf-8?B?eXpJRFpBQ1l6QytEanJ0VkcrSS9Nc3p0VjNGK25QQ0lSQnVmU2FLQko4RHRC?=
 =?utf-8?B?K1F5eFFGMmNEUURkYU94ZUxiUDR1NDdQRWx2ZGRFSzN5R0lmUDBldXdUNGRs?=
 =?utf-8?B?L1Zid253eGs3MWZjM2s5R1MzUmFiTDBuYnArMjRZS2NnazJDcVhqZ3JDMERi?=
 =?utf-8?B?OW1Nd2NqMVN6UzBZQk9ZSjJjcVRZTUh0R2hPUVJ3ZHFSak1YdlZuTzFRTFNn?=
 =?utf-8?B?TEc0SEowMUtQcTZ6aFdKM3hZRjRxRkdNTSswZE9FWncwSytwMk9BMDhmekZB?=
 =?utf-8?B?dk1wVnRUQS9udTc2dU92d0xIakxTWHBDYllzYktXOWxyVm1MNmp3cUxNZ2VM?=
 =?utf-8?B?ZGJvMTE0UEFqVUUyY291STdoN1ZQMUh1RElTQmhBVEg2WFR0Y2cyam9hUnFH?=
 =?utf-8?B?Vkg3dXp6ZnlMeThiUHg5WlJkVm5GRk5RZmd5bksyVXlMZllWdWdTU0lLMFdG?=
 =?utf-8?B?VjVYdUwyekNoaEZmR0xIVkF5MEVQcmNJVnI2UWlPc1ZnQm5MZjcrWTFtWi9L?=
 =?utf-8?B?YWN0dkkzc2d0T1VNWGhIeld5d1BzTXJnNzFKYWZtUFhUN2I1bVdoVjY4amx0?=
 =?utf-8?B?cmV2bTJlY1NUaTd2TFcwdGZZK3BJSmR3YVJwK2xmMFNjaE5kajZ1akUvbUxz?=
 =?utf-8?B?eTFBWnlyMVBDMnY4SjdGcm8vY2ZlMkNYV0pvLzZBSmQxT2hiOWowTkpDUjlN?=
 =?utf-8?B?WFNsTmFlc2xZNXhlVVJuYmtaN1dHVUdwTlk0eUwrRVoyYkxkTGUxMUVSZVAy?=
 =?utf-8?B?VEd1cWd6c0pEbExEbEw4RnlheGVGRWwrRlVBVy9YOElleWpRRFdyT3BFYVQx?=
 =?utf-8?B?SHhseW9EVDF4dy9nd0c0b0lHSHY4OU1aNzRkNFNxb1MyN1pRNjNaY1I2YU9O?=
 =?utf-8?B?azcvQiswbFVXUkRXcTd4ZnRyejcwVW5ib2UvcEkydVVUQjZaL29qWEZVWlN6?=
 =?utf-8?B?UHpxYkxIaEF3ZnlPTHhnYlZIVzVNWUNUbC9kUHVVZkU1WWNCZkg3N3d2THlh?=
 =?utf-8?B?ckc0M3FHL0tzKy9rR0psa1BLTk8zNEU5U21IQmxEQndrQTJMV1ZGdHd2ZDh2?=
 =?utf-8?B?akRFTVUvT3ozUTVOL3dybGo5RkJldzJPWXBZOTZCMWRlNE51V2pKRzBBT1kz?=
 =?utf-8?B?a1h5R20rMS83MUxiM0U0ZUZtbG5WOUM1Q2ZxekxQWmV0bXlPbjkvckhVR3VZ?=
 =?utf-8?B?VjBXdVVTaEx5a3FrYnZZb2p5ZFFDekgzcW1pRGxpbGNrREFnMVFUdW1ZaDdS?=
 =?utf-8?B?TW1jaG82RmFZcXkvRHQ1T1c0NGQ2TitQVFdHQUQySWIzSjlsbHZjQWZLUUl5?=
 =?utf-8?B?bzNNM2x0dVlyOURnMjdJWmp2QzBzUjNrSGw5bVVrNWhOa01BS0VRUExiWERp?=
 =?utf-8?B?dVQxVmN4K2h0SG1TeXoyQWZjRFAzZ21JNG5xOTZqVDRMNFV3SHNBSnFUYnFz?=
 =?utf-8?B?UFpFeWoycnVaQUhhV1o5TnNaN3NIVlFhQlhISDVRZzJYWmJVVllSS3JwUjlC?=
 =?utf-8?B?TjBjYVQzTzdQRzRmSWlBRFR4S0t4L3BNS211ZENwWHZXMGNmbUxzNHVLTWd2?=
 =?utf-8?B?TlJxRS8wT2cwaVhZLzNRU1MrbVBuVHM1OXJjTjhXRCswNE1lRHhwMjZKTTY2?=
 =?utf-8?B?MENua21LK3ZpZnRxNlViaTdMQ3UzZDFkTko1V3hqTHRSWTlLM3Y2Sm9DN2pZ?=
 =?utf-8?B?K1pTekZXL3B0Sk1tNUFhVGFYVWNZbHhpeEUwcHRBT1RBS2pCOVFpUnN4Q3dY?=
 =?utf-8?B?anZBNkFLbjNORkVuZUN4a0w1cEhSQ3c4WUVLWElLbnhhYmhxYVhaYjdxUWd3?=
 =?utf-8?B?d2tVdEUyNzBwVWFmbXZ1T1R4d3Y5SWZoWUowUEJjZkp1OHpLL0MwQVc5UXRa?=
 =?utf-8?B?ZFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EcyLdmYcEf8BWH0WGCTnkD4ghhVRqoVvjSp1WYShC+zogrGmOgz0+tMOc9uu6RB9ScvBpLAvaX5nFPYEF7d7O4uUkp/Wbot9bUia9sHl63mJBTa3OafPMiBJXoelR8DCSl2iyhsFOlmS9761cdPz+3ONarXavTANyPEe3xcJws+VQgkSdbnX1/trUBnBrTGGE2uXqnxjHJr63ErgJIARIV4MVR2VfQ+/R72SAH3nHTuOdfXUvZjy9WRwtKdEm3ZqEmZQZ8cR5G5W4RrHbq8lB6pI3ioRerN1p5Alc/N2JRhz0FP1Gy2B0Rg4ZEcOcI15le9O8sbYgsROuVA4wPW2g03YPvc+ZVZmdDb52GEEKTsKenEFt7Oijn0BHdtIqebIXgMooIl3DxRlTnaXAdXQsxhDIyGwIZEC2vevSlFfpYVJf7YNGLY6eJ+G/avYDlTlqjOqtkQ7oSk+fPQoop5WfnLRksbmbiP2N2WIjcJKm0L5yp5u6+fzb9myYOMuB7lU89poSmixRs3Xzo+uzSXyCXg42+E1htMZLeYGjml0dGW0nslR42VJOPsiCU0QJDoqHMOCiU+/CacodYLSgi3dMlnjb0TDtia5pxODyFCm9Es=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed67ec29-be28-4024-360e-08dcdf2789e5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 19:06:49.1654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cK4F6uTAZ3o9gAIxEgnuATMwWNmjhpWi2mg4jaK2Vua7Cn+7EwBOp570HYH3HWyYFQtJ991FFTqLW5N93NHsWKqZlKqqPpiP6aBJ1YQ8lsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4685
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_06,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409270139
X-Proofpoint-ORIG-GUID: uBY7N6IBBy47d_m0zrATCYsP7RZMCd3w
X-Proofpoint-GUID: uBY7N6IBBy47d_m0zrATCYsP7RZMCd3w




On 9/27/24 15:01, Joseph Salisbury wrote:
>
>
>
> On 9/27/24 14:41, Steven Rostedt wrote:
>> On Fri, 27 Sep 2024 17:56:56 +0200
>> Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
>>
>>> Hi,
>>>
>>> please backport
>>>
>>> 4a1d3acd6ea86 ("netfilter: nft_counter: Use u64_stats_t for 
>>> statistic.")
>>>
>>> https://urldefense.com/v3/__https://git.kernel.org/torvalds/c/4a1d3acd6ea86__;!!ACWV5N9M2RV99hQ!NWQNsyaK0pV416_no0s4X7c0Beks46ubcANp8tCN9Us93DUX2QT-8xVvq-oUAOj4JVlQBczrsu4z7lVHY0M6004$ 
>>>
>>>
>>> Sebastian
>> Let's see who reads this ;-)
>>
>> -- Steve
>>
> Is it needed in all stable release patch sets, including v5.15?
>
Just showing that I read this, but not the link yet :-)
