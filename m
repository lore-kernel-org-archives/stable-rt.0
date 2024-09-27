Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A8A61FD8
	for <stable-rt@vger.kernel.org>; Fri, 27 Sep 2024 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727463681; cv=fail; b=JO/VYeH2MF1jnJXPr5LKOIyrUKuxllKD8h5iEUy6FnfCaxAV6ONnIiY1/awb7YXKcCc93QG4vrG9+PVN3ISTK237ZgqDMzFohup+j8/T0YgPWnvsF5iFmoQdE5zqZKX8bg5qhQEBatutIw3VG9n8/MOB9amtNMRgepr84bcxwuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727463681; c=relaxed/simple;
	bh=7fkHckQEruVxpiuvvYeo7tp0JaPRvDQjgKf7ctVOHWI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U8FMerWYlr4kkMlKtpFiBglfeZ1GrdSu/jxLjgsfBVrJb4Fh5iv7Ezj2QRivufF6IBWAhFOUN5891QL0dzzaKNFnrT+qhlUw0Qa0BeLu7HDT+TLgtZOvBONC+nOCWaxwdz1jZFegTmkCslCrQiteA78oWGuJ9qsBRInPYDz/O/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EooLo4KK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UgcRFKcS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EooLo4KK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UgcRFKcS"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48RHMZ5G032151;
	Fri, 27 Sep 2024 19:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=7fkHckQEruVxpiuvvYeo7tp0JaPRvDQjgKf7ctVOHWI=; b=
	EooLo4KKH7JG3ksokLEGAiVhoVSlLvUCMyv013V1WPpNIO/anog+ymz5J+4yUtml
	2B9dDW4jCCrjbtOyh4MjxXOwd9TP+kb7uNZvCJtiSgpUaZOdMs520lRxXBPQ+a3G
	1ZuSboM4wPpkv++DAMc46OnvQSJDoHjwB7zTB28jlzzfgPuzDqEz49lELhWSDTi+
	6fwZ+vj3DR5x/FU/uoqDve3Ux7MNRnzPKumwTg9EVhrmwnsl2gKaI3T7MPnVzKTO
	KIR30TXTv42arLzSmOMgudnx41XS+wBmLysJMtDiaEg14CPuYJ4PXaV46x1ZDocv
	ly6T9qB9xEf7LpXe1kWi+g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41sp1aratr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Sep 2024 19:01:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48RI01nq031476;
	Fri, 27 Sep 2024 19:01:06 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2045.outbound.protection.outlook.com [104.47.51.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41tkcagf87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Sep 2024 19:01:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sR6qAkRjnX8dyF75kW7Sn2Dv4Ee5MEUd97crGdzMmrC8NTKtkCMh6ozaxP31rLUCYAbYYzZA8+J8zfHQ/o+vQrevvPVa8QB6Lm++f1k+vC862efPShMGpqD2QzsK+gle7uYxRxb25O26iTHwWmNtM3h5dbsr9LUW86akzxo8Kiwr95jnHNKLK8bh+grPiIF/ru/ESgfqDUyvvuTmTlP8VRJkRmDkBPs9Y874LDtehDBC/PLGxYKILPz03T5kAOXdBjvqV5UM1ZuqVyONNPkQFilgW3V5headCIX8OSlyfB/f3z0WNbkElBEzT9bRsbpXuveyheQHAEBABRVELbmteQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fkHckQEruVxpiuvvYeo7tp0JaPRvDQjgKf7ctVOHWI=;
 b=XkVg2RXBNQ9NBjSleOIaHsFGAzL18wDy90heT3OPRHY5WhXfSMyLd/3LsO0AR4znAZH6GSDZ/4QedrspDWWYitsWtev5ppV1z8Di3fmT/w2CLMM3rTrYGvOuE7gQB0Z6108YjV8ze40BEofNqN4N27uPHSrLxTacQxEkbcAxGFXenBkRXkURQgCmYs6zhvooGhxYpRux6kZlH4FwBv7+9azJp3F72iuteZaezdKUsFtNi++j/eS/lrzOg2LXNN47nX+0eSHVN6SJptaXw7TJUQxULn3tmD+P8kqss3cGAoJBwYXKKgy5nR3QP8Br1mC/UJP7hBskXGJM+zrnhhe0yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fkHckQEruVxpiuvvYeo7tp0JaPRvDQjgKf7ctVOHWI=;
 b=UgcRFKcScw41alpr8WNErIIi87nAH2mYyTgwpqvNxTrtiHFEFbyhhDfJ8KwQ15yC360OPtT1gV1U+k/k1eDsmCAJpvcrfZojuVsTdCoEePSR3D7YuI4zmdAmHq2JvKZv7ZlCcmEvuG9k+17AVq1gEBDZv7DaFvAtpncBr+umIRE=
Received: from SJ0PR10MB5597.namprd10.prod.outlook.com (2603:10b6:a03:3d4::6)
 by SN7PR10MB6452.namprd10.prod.outlook.com (2603:10b6:806:2a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Fri, 27 Sep
 2024 19:01:02 +0000
Received: from SJ0PR10MB5597.namprd10.prod.outlook.com
 ([fe80::fcce:1d5b:a4ee:9b59]) by SJ0PR10MB5597.namprd10.prod.outlook.com
 ([fe80::fcce:1d5b:a4ee:9b59%4]) with mapi id 15.20.8005.010; Fri, 27 Sep 2024
 19:01:02 +0000
Message-ID: <bab856cc-7c9f-4ee9-84f6-ab228b2648c0@oracle.com>
Date: Fri, 27 Sep 2024 15:01:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : Re: Please backport: netfilter: nft_counter: Use
 u64_stats_t for statistic.
To: Steven Rostedt <rostedt@goodmis.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: stable-rt@vger.kernel.org
References: <20240927155656.Z-s6BO9B@linutronix.de>
 <20240927144126.0dba172a@gandalf.local.home>
Content-Language: en-US
From: Joseph Salisbury <joseph.salisbury@oracle.com>
In-Reply-To: <20240927144126.0dba172a@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0094.namprd03.prod.outlook.com
 (2603:10b6:a03:333::9) To SJ0PR10MB5597.namprd10.prod.outlook.com
 (2603:10b6:a03:3d4::6)
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5597:EE_|SN7PR10MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c5ccda-8656-43c0-1341-08dcdf26bb5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmpNVjVCemYvZWY2WEd4cUZFbU5xZkZqdXZOZVE5RTdJMlEvdDdGMUFFK3Zv?=
 =?utf-8?B?c3l2aXJiZFpEZzZvT1NoeS9lRmZaTGVPdmgxOWQ3MUV2bjJRc0FkMkhsb3FE?=
 =?utf-8?B?Y25YWEdvbmpyb2lJcTFQN1phU244aHZ2akw2U2plOFpqNitFUkQvcXpmZXlN?=
 =?utf-8?B?TkFGMnNVNVlSR3FQRkhFcW5BZ2NROVBvdG9VdS92V01oTE9nN3RrKzdnd0g2?=
 =?utf-8?B?aFhpRTg2OUxoa1pIMnlBMW9xdzlQbDUySWFaNUErYnE0TWJFcWNxQkk4eHhK?=
 =?utf-8?B?blY3WFVxUDc2MDM2TW0wVWtEUjhxQWxlOVpJR1RsNEZXWGlBYlBjT2YyK0Vt?=
 =?utf-8?B?Y0F6TmpZNGFPU1ZjSzk0aWl2cEV6Y3FEckRudTJvclNxclUxRHdrRUlDRjFp?=
 =?utf-8?B?V0pyTkhkc0tLbG0vZEFkWGlsR0tieXc3Qk9hR3VsK3hBVDBCN2V1SzRMV1lv?=
 =?utf-8?B?b2FOYWlNMTFicUd0UHpwL244VVptN0xWUDVEeEt1S3p5MkhjYnlsWEYyV3Fk?=
 =?utf-8?B?eFpESXorR3NkaXVMWlIrZS9jV0dtVGFGUHh5UWlaSTJGUmlXVzVNZC9Ib3pr?=
 =?utf-8?B?b2t4ODBFa09NK3pYcE50OVV5T1Ywb0dHMitMMmYvdkJqaGRQajM4a3pJL2t6?=
 =?utf-8?B?SC81dm15YXhJeDBzRWM4NWN5Y3FRYUhwNHMwajBkSHdOMU9oNmQ1RDNId2do?=
 =?utf-8?B?VzI3Z2NLSnlrcnlRL0w1R2VjanhlY0trSExzMHg0cWlZWkhZTkFhT2kwWjRy?=
 =?utf-8?B?bzdGMXBVSHB3Tkc4aGJVMXVXcGVkZXJCRjU4dmhIVEJOK0dwVU04b1ZUREUw?=
 =?utf-8?B?Z0d5bmpXVGRZZnVvSkM4WUFEd3g2VXBKYWF3dkc4NjZqMTIyeEhSQ2NPaEg2?=
 =?utf-8?B?cU94eG81Ly9Lb0tpTnVNOEQzTm9nNFo2cTBoVTU2aFpoUyt1ZlJKaW1iZkhH?=
 =?utf-8?B?cC9QSHJvVVZUdUtqYTZidmhXeWhTSkhmNHBLUHpuTk9rWTBsY2kxNE1wb3Nu?=
 =?utf-8?B?MnZLU0R1MjFZTGlGV2NLZUp3WVJKNG9yMk9YcGRLMk9pWTZZQy9POVpIK0RF?=
 =?utf-8?B?cTROWFRlZEtvN1ZsQXVOaklYZTBoNW81OG82MVAySzFLcTI5TlZFZStvZTdz?=
 =?utf-8?B?d2ZUeTdreHRPazY0aUV3UlZXc1dHME1hUytGRDhNUmhoRmlpbThmTElrU2ZJ?=
 =?utf-8?B?RDBxbVpZbk93dVlOcUtGTWRLeCtZREVlWktubVdOeUhldHNydlE4aVNnS0ZX?=
 =?utf-8?B?REN6ekRTdFFzUWlEb2NDdXpaTHdybnRBQW9FT21jNWd2eE1JNWFVVzZZalUz?=
 =?utf-8?B?RUJzbWgweUNBQ1lrMkVJcWtaaUIyeGoyNmt2bFBLeU5STkQvWW9UU0xUQTF4?=
 =?utf-8?B?SlJ3aEcvZmNCbDJIQWxRTzZTQkIvQXRwQnY3ZDRxbk1jdEEvV0ZMV0Q1R0Vo?=
 =?utf-8?B?Ni9sd3pyQkVGQjYrZnVpUVQ0c2lLdmN4bC9wWE9WbmptZlJYRVNTNWxOd3JE?=
 =?utf-8?B?ekttRnUyS1NwalNoZlU5TUVHU05EbGUrS04xL0ozVHZnUGxoTUk1LytvbkZ4?=
 =?utf-8?B?cWRYVUtETVZoMEVDUDhhU0w2RWtnbExaTVErTDUvSDQ3alFmanRpVzEzVnJ1?=
 =?utf-8?B?NTc4c1J2ZlN1cjlmVFpFcTh4K2twOWV0QW01Mjkrb3p6MXZncU82SlBKVkx4?=
 =?utf-8?B?RUFnOGw3K1NuVm5ZcWRhZFd2SHZrZFB1RG9KM0lGWjVML3EvR3lNRUg4VERE?=
 =?utf-8?B?WG9TVnZST1lwQWhDUlZacVNSaTdPTzNFcUxlSFgxVzNMY04yeHlQcnVDbjgz?=
 =?utf-8?Q?OTqPgND4Uh8NpwQByZjHf61xIngASthk+bYN8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGhod0JGK3BFQkppZVAyQnlvMmpJZHQrRTZrUnlTSmdlU1hZT0FXcnVUb3hE?=
 =?utf-8?B?MmRjRkVucjNDdXFsRURxalV6Qk5qN2NCVkxoaDZIZVcxZ2lycXlIOG9TSURh?=
 =?utf-8?B?Nm9XVFk2T1YvYUNrS3ZybWNNWC9YdzkrbWNQaFVFWjlBZEIrZ2p0N0RyUTl4?=
 =?utf-8?B?Wk5wbDNoU2ttSUVka3I2OU51Mmljc0xFNzFGQk9WRmtLNEptRDYrZi9LN01Z?=
 =?utf-8?B?MnNUb2tlZU1jYzM4UlcxQW82bUs3dTl1MVlxa3ZlUnFuSXVrbVk5NXNMUjMv?=
 =?utf-8?B?aTJFbjZkSmtCUDYvQVRPUUpuRmttQnBKUjgwNGh5RE1TNGFMaDgrVkRvTjk3?=
 =?utf-8?B?VEJZOXlrbjBkQlN1T1Jza3ZTUTE5VFlaNXJBR3VDdmJsRVZHYWtZTkc0VWdq?=
 =?utf-8?B?QS9WOTltcUFqSEYrSlBIYUtRTTRtRWMzS2pTWk9RMk0rK3ZubW52RVdHaU5s?=
 =?utf-8?B?STd4VVY0RVRuamh1dGkzWHpiNUlpTXUwdURPcGNUTUluaFpuRzZrckR0Rmh5?=
 =?utf-8?B?ZFE2citnSU43WjFYcmx0Y1BvdmJoY29BanhldVptUnNsVVNqbUt6Q3ZXV3p0?=
 =?utf-8?B?QWhrQ1RqcENSK2RiODcwVFF4VjNhVC9FUzVBTDVrWmg4NDU0bDZyQVVybkMz?=
 =?utf-8?B?cTdnNzBOcS9TM1llT1lQM0ZpV0I5Q3g3d0RWODVhUUY2aEFrRFZ6NUU2NEhn?=
 =?utf-8?B?dlJCNklCQlJlRmNWNDBOMXF3aHA3RTlqSTczK0RqYzVhQmdhb1pscitCWksx?=
 =?utf-8?B?Wi9XSTJ0dmZJU2YvRXZqUU5URk02QlArZ0oyMXBFaFo5WCs2Z0Z3SVRaalNU?=
 =?utf-8?B?aTdpcUVsUHZKMkdPZkQwdi9ZR1Y3YlVFQ1Azb21VdTlnQ05NVmtDTy9SMzM5?=
 =?utf-8?B?Z25MQnpISDhqcEZRMHVLVDBkUi8rWG9DS0V1R2tud2hheDJkdWFFYUpHcWVy?=
 =?utf-8?B?TElTVWQzRjFFNnUxdUVTNlU0ZUJJKzc1RldYVU1QMG1uT0VpQWZMd1FvdHRu?=
 =?utf-8?B?L3N3WWRZSG9kSHJoMmt5SmZMam1LOEI5L29GNEYrV1IwbnVwNzNHb1lPQUtD?=
 =?utf-8?B?WVlJREd2bjBLK1NtZ0dsNkk4MWZFb2ozYm1DdTJvSDcyVDNNTnBrb1pnYWlX?=
 =?utf-8?B?V2c2M0p6clNZaUpod1YyNERYTnB5YlhscUFmYVNOa1Z5U3J3bm9CVzhqQmVi?=
 =?utf-8?B?cThIWi9pSzBCYm9CL2FscWVTOEF4N2ZNWmFKejZKZ3VQR2xVUlczbURrcjRt?=
 =?utf-8?B?b0laYkpueTRXSk5Ec3pSbGZ6eE8zenBrQnMrNjFpakJicnkzeUprZDZtU3dK?=
 =?utf-8?B?WFovNzljNWt6VTlaSkJ1bEYyRGVLRlZ3cmY2Tnd4ZCsyTXdETW5jL2MvQWZ2?=
 =?utf-8?B?UWRnTnEyQUtFaXhBM09NcEhUUmJmRk5hSlhoWGoxQnZ2OTd4SFFvL1R0bGZa?=
 =?utf-8?B?SEM0UVdHUFRqWFV4TDRvbWlHV1BNYjNsME9VSFhiTlBPcWY4SUtYOVpXUU9y?=
 =?utf-8?B?Qi9PV0p4Qm1kaU1tQ09mdW1sMDFCMnUwRnRNa21GTjJPZXV0NEJkNXEzM1Ew?=
 =?utf-8?B?ZFBQTW9nMEM5eUxac1JKeGpPZnhpSjFRTU9CN3pLVDlZWEdWSU93SjJSTDBS?=
 =?utf-8?B?MmlBcWR4YnUwNXpXbVdyTWZaeUQ0VGpwYzhkd20vNnZwdW16YWlIdHc0ckht?=
 =?utf-8?B?eFRsZG1VZTJSNUlQK05OempiMHRvbmhzYk5Qa2pneG82WDl6RTFOOTVrN2xT?=
 =?utf-8?B?T2JReXpEeDJSV1JyL3QyM2xPWDJTM0NDMUVRV3d3cG00KytNenFROFVRbkdh?=
 =?utf-8?B?VzcxOWdwcHBqUndmQlJhdnJtWTFoYVpBc0oyTWZDNUtsNEhrWjI4ME9xdFBU?=
 =?utf-8?B?bFRnOHJ1d2tIMGNaWktRRXlnVE11dnpuNWVISi96Nlp6UG00d3YxTUR5elZl?=
 =?utf-8?B?T3U4QXVPOTNJTDdrTFVxZi8rTHhrejN1K2tyenJRUHZiRDVYNGRtSWxJd3p5?=
 =?utf-8?B?eGhxNlpMdE9FNGVtbHc1ZGJGZzBOVEJhNFlPVmp4TU9NaW15ZkM1UTd0NlUv?=
 =?utf-8?B?OFdBb3NnTmVjWUczRTJDT2hEMEZvN0c4a1RzdEdwbloyQUg5cmVNdzVpZ280?=
 =?utf-8?B?NUQ4QXUrdmdFTk1GN3QyYmxDTWQzdHVLanQzY0pBMmNsSmlRbTVlcmJySTBD?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LR8MzzjqpZWtNXRQIeAzSQdYI2gArg26xn211ih+nVNhZislc/nz9oN2pc8KisAI+Iv2RzTNh/Cv2t0v1rCHDXmatR9Sffo/xcBIgNqA9YG6q/Yp+fw+vxObpk56ye9cPMcBLDqfYOFDzPhh2Asz49nXZZXwo7k91Qez0W+rGIQJD0UCvZAh7L2SJdJ9QR+kzKO71yg82uGsjs+56eqAAMXQ4NwStFFg42p6T0ugnUH8qnWXwEJWVsCZD+Xvhm9bMoqA2u/vbYi0dy8DiEqqDpaf65w3mM4L1il3Wi8AfwwHE+DxnYNahXk5uyoLIhTVA/7Jku7KnPgzl1QwvVuukVFvjbR2R0Os7auFM1I7ZSnFe9EaJ4nqokCXANQnGYQlMNh4WWu4zKjwGOuAjNaS3uhZgZvkMiVNKQnY2J5AM3WXy9g2qcAUBmx+WSDIa0MR+WvZjL8Ak+OT4TsJXGlgZmSbPn15JSjUgiCl2QA3/gwk/meixvOZRxTBjTJuOWqlrf8qZeeWFQo0cmmJGorErfGdzEEMK09sVf7sJV/ajE4f5ZYLHSGBdvOWOZUzT7KwAqde+uoKoDAglsVqkQnEbwi0Gc8CtdIm6GKfww0VzWE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c5ccda-8656-43c0-1341-08dcdf26bb5b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 19:01:02.6841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OpGwZdKPANGjtGDeFuOrGeuYaMW/SjeV3SiHOU3CE8DtCcHftp8DMVfk5QOcC0y4Jc7xdgSEHe81bPgVydpttAuysz7zzHzXoOxS07Cd9qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6452
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_06,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409270138
X-Proofpoint-ORIG-GUID: 3v8N8pbnlAeKC2idXEHichmhfVGIxZV-
X-Proofpoint-GUID: 3v8N8pbnlAeKC2idXEHichmhfVGIxZV-




On 9/27/24 14:41, Steven Rostedt wrote:
> On Fri, 27 Sep 2024 17:56:56 +0200
> Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
>
>> Hi,
>>
>> please backport
>>
>> 4a1d3acd6ea86 ("netfilter: nft_counter: Use u64_stats_t for statistic.")
>>
>> https://urldefense.com/v3/__https://git.kernel.org/torvalds/c/4a1d3acd6ea86__;!!ACWV5N9M2RV99hQ!NWQNsyaK0pV416_no0s4X7c0Beks46ubcANp8tCN9Us93DUX2QT-8xVvq-oUAOj4JVlQBczrsu4z7lVHY0M6004$
>>
>> Sebastian
> Let's see who reads this ;-)
>
> -- Steve
>
Is it needed in all stable release patch sets, including v5.15?
