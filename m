Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523B43B9931
	for <stable-rt@vger.kernel.org>; Thu, 20 Aug 2026 19:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787254301; cv=fail; b=HBLHiMuHxFfpZdMXICvtvDt2iWB/MIbiOKd+5pK0insWpkzZscgm0H30gR+VgI18gsIofJkk1o6JGXEO4E97VTa70++mwQx5YT9k90atYZp0L+28tx8N18bdgvFKy9loNHfdqYHKmCRJDhHvTyKd4Q3xoxG9T6IesSJNNkBc2EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787254301; c=relaxed/simple;
	bh=bXRakpqKW99d/nkftz1Okfor5DO3zShZLlq5Ku2DeV4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTyE6B+MRwdWPJ0ooQtbwVolxyuFl3WBo04RaTaqnH+O9LV8AqNm4bPs42B5NcerPu1c6Y+VFqW8bnjcQo9T6sXcBQbS9lzYnSRDhuX7k1DnHujWeqiwkd5DmqRkXN6r+dDK3XLyfagRAzt2PwGSorLTtDn9OuDw1B6Xq0mpnEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=g0ntAN3C; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Mss8kwbw; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="g0ntAN3C";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Mss8kwbw"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67KIKGtr1218049;
	Thu, 20 Aug 2026 14:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=WrlkrgkYDGo7QvlO9O0N7VUCAAvIq99r+03LrAaG0
	LQ=; b=g0ntAN3CD0GpFUp/UEVdZ7htrO20JZq7dpjsBy4Sw241fdZVwvwzhOKSX
	9x0tN6Z44bE2DMjAco/VlSEFG0dgxpdn2kKXl15WAfrRCxADggp95w/DEIIvoT90
	2lMx2jVqP3KKd8t8wqtoNHESGkwM91REtNyelz33PzCMKS2B/V0SWgb+N4MNpuFW
	171poosXT7sl7JAQScejYeUXL9cmd/A3jl1VdQr3u8FRlaCB/6q06lgVFVYazJJS
	0cFHcS/NsfCUHzczaQ04sxGyYPHuqGZ06ZC3EH7uSYDLih64n28c2NhlOhcAVSP+
	J+FkyJNw1HgkQ0oFgZQPs7GqFuC7g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010056.outbound.protection.outlook.com [52.101.61.56])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g5rtrwgjp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 14:31:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttHOxCnPqZRlyI7RZv6KQDEdaLXx1Nro7pLfAQFpQttmccDjsG0XrE10KLUGCVSdAKB7GR743Kszdayl1E7qYVgw0rPEJitF7aku9NlSSxAppu8EXmNkO9zt1exCWQMdUhnCmyRzYSsAOKTqKvgY7jn2pV1YSjteaF/YxUUFoTCwYzVdLKVRlsxry2CZL+qcDLOZeTp4C5LIpg7ZsT4JNQZPpQQ42PC/sX3OkcBh3WuijFHQ3m/mCrbIxUdMpta1QCvmKVGIdlvseq2bXSMR7hmZ8uPMI2no7+BzGZrB64LSQ/h66SxsOdfR7a1Vnjo17XhzaxjmGIJI8Ln2jyhhlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrlkrgkYDGo7QvlO9O0N7VUCAAvIq99r+03LrAaG0LQ=;
 b=EXYaWgehm9yEzkgQisYjRLwjEBbg7aIg14ePVUX8A4qvHteM7NycK7alRZAEmiywGJktmhpQwKIvUrdaP/6XfNCxUKZElRdJPUImLrje6HLM13+WWEVnHwp8QlvYpyRgjLxmloIN5IQkZ0quwhoPkNNM0psTs++r6QeIaMYn7CnMU0B0lTDfWqG2F4VBxFFc3NBszeN9A6mYl1gPkMAOLvRNT68LluU4Npx9Rlc3qDt/735axRnU9P5Q+lefQqxSZfrJ140Y43e+B76qkh5JkH5ntAPSDYHYVm8+FGtDVh9vgGts9rgBeAM3S23GAhQkDKiOFZJZrvUj9JdtKEodiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrlkrgkYDGo7QvlO9O0N7VUCAAvIq99r+03LrAaG0LQ=;
 b=Mss8kwbwi0QxU65LzDiurSxn7YvMzLEqQbhaEckoov6XOdhmZBw2NDbJsRSK7xLEXkoyI/vjXD80GZHfm+nUq7Ye2vVMZ65Up2QzQ+v0wrmjbO7BqffChOBlzI+y4H40gOgP/ddAHrUop4oTfmoJt/+nO6pA++k+0rytQ7FVq68=
Received: from CH2PR14CA0027.namprd14.prod.outlook.com (2603:10b6:610:60::37)
 by PH8PR10MB6575.namprd10.prod.outlook.com (2603:10b6:510:225::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 19:31:05 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::af) by CH2PR14CA0027.outlook.office365.com
 (2603:10b6:610:60::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.9 via Frontend Transport; Thu, 20
 Aug 2026 19:31:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 19:31:02 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:31:02 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 14:31:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 14:31:02 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KJV2NU742017;
	Thu, 20 Aug 2026 14:31:02 -0500
Date: Thu, 20 Aug 2026 14:31:02 -0500
From: Bryan Brattlof <bb@ti.com>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Steven Rostedt
	<rostedt@goodmis.org>,
        Stable RT List <stable-rt@vger.kernel.org>,
        "Praneeth
 Bajjuri" <praneeth@ti.com>
Subject: Re: Question about the maintenance of OOT RT patches for LTS
 releases (v12.x and v18.x)
Message-ID: <20260820193102.xi5qxz3yaxwcnlti@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <ajlez0ZNV3PJ26iz@redhat.com>
 <20260624064944.Lt3vOksN@linutronix.de>
 <aju8K3aPXCWr7v7z@redhat.com>
 <20260625-afar-trailside-f84c5025dc57@thorsis.com>
 <20260625080227.WCsryMw4@linutronix.de>
 <20260819163011.v7uqv6zbavgbebq5@bryanbrattlof.com>
 <20260820142314.OrEinRQt@linutronix.de>
 <aocj-6A2vEPw-5-O@redhat.com>
Precedence: bulk
X-Mailing-List: stable-rt@vger.kernel.org
List-Id: <stable-rt.vger.kernel.org>
List-Subscribe: <mailto:stable-rt+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:stable-rt+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aocj-6A2vEPw-5-O@redhat.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|PH8PR10MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b2b4553-5680-44fb-c417-08defef1924d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|22082099003|56012099006|18002099003|5023799004|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	+Wgyqsd/7w9YMqj7ZR3vNmK66UkbVRX8CG+rmDgqvddrrSXWBep54fi9HPRj6Q1jvixiorEqI//VwA10gUSf1C/EDfKaE1L5V6Hx2MUBxTUGpL0WM8kBj3teQYNMDRu5A6rxB+BzlSp1tux5ZFz6LJHPwszhxyAC8fuZlKKI2yapTrE1WnZVskZpYvytNIZAhXo2FDB3n7/SA7h73sT78/UCFCgRB3r6qCYun+G6b9Z406xZhnhAx4c9smW0UCHYNg81Wy0RfZTIQe6yIwR6aP1KGUZ3rZ4FrRvGW7jd/cCssxlDcr4/zr5hOrzKuT6bV/nZG9E+DfxC1EWgO8CbtBD4y6ZWETP8yBVO0MHdkoAXbYBRvnjTgYZ2Oehb8kTBDdb+6ICCGMJ5PxLssEQs4yb36po7UnEN8e7nmeCtZr6i1DJb87qTP6HB4zfCVdxY4lFUjDuOo+cABqIUL3k0yHk0J+eJ4fzlLvjGgeRqazYcbqvz69jE+nuhUAuKy7zPdx+UI9MCgwhnaTCFSDvzgNhHxSclJ0RfTNyqt/VvJ4QbtULsG9jN24V07fO0fxGlbEbzY8Lti0orV37yk4hFX1XtDcrYvMwgAPFhFQ7xvkNKR9wjr+UfW65A9nS1P7pHhYEqsfkEf2RXAgP0FgeAhIndQOVYri5tdSguSUTkK5JVutxXxzlEvYfgeKBO1fDsWdW13a+Z3UYvW9Kjo+tYlQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(56012099006)(18002099003)(5023799004)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WGnqFw5Otv6RHKQ2s1PKmgZ0/+lFJz4XA7uHlb5TGT+xgokn3ApD9oNJZWgkUrzKrjitHknQsXoRC4Dl33/ZWtgHCNftV3DUSFm6pn3DoDLvPBRd7ROvXF27Ob2s1FR3i/xx8FImCrskfImI1UyAb8oB3Wp74orY5hsi2TUyqEHWEXgjWhQGnXRs+H3ji9zuLyvn4aqLpmR08EqKEAqHQd9zuMmM0qEEgru/X1nvQKIefimG8Q6BhmPQ8r7TSSpyHUy+e858T3HpDu54FKgt5zhqJzjROLDyWRRVfL1aqmyQN/aYkUjkKgM1x8Zj2u1OiTYWZoi6d9rwmRau7GN4EzbxX4GkZG0HiF5sk479SaLaZo1HM661j7NVKdrEj2+hcntWfphKcsVTYYTiMkPtRKrVCCL6NQduDAa3q1YsSnLbY6Y2v/3vC8s0I+Xh628+
X-Exchange-RoutingPolicyChecked:
	DADAyBhv6JxGH/kNKziE4WC0MJr/Q0aJYaRCyMbZ8gXvRPKjnalJV2W4NLq8uB0un7/sILA+zqg5WspKpOG6W6gqYQxEU49wRuCm5yuA2ZjfT8AsqVVJEwkR9SMkVkJV/B5pT9lDcg/QAN3bXtB4n+Rc98KLzD+Xf46Fl4yEl4WexmxpU964VmnH9OSRFXCpNlYy9AAjs2olZGnKXHbVrVpmlbjXUCUESduC0Xx2+UlnV3oNROWGQkfjsG2jEjqXiLa6nbwgV7K6Q/a2jJ/1wCa2GlegUSr18Ln42hgb9rCKlyliG2qD9l/3e8o0ZoRJU/1ywceXOtYBeMC4wVsgKg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 19:31:02.7302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b2b4553-5680-44fb-c417-08defef1924d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6575
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0NiBTYWx0ZWRfX7BH8Nr6drRzC
 6WUe1jGlXSwcvjfO+OMLpIw1gla3d9dXcZVkTdEHC5v13+izc9kjeX+W3qWI3M0TqN+WqI8urkF
 0ZU3n2u/4gv/LfEwYaMGV2heVUHb4ys=
X-Proofpoint-GUID: fpy3upwJUBaRXMMWsF8RqdUAoGNQ4Way
X-Authority-Analysis: v=2.4 cv=KO5qylFo c=1 sm=1 tr=0 ts=6a8755fe cx=c_pps
 a=PxsVn2hUj41VgPYomOKOQg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=d_v4vWkb5PnHgcTM:21 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=_i-EaJ8fizxThV8jBKkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0NiBTYWx0ZWRfX+F1VE3jYFUJB
 HU5kRQPPMbmaonBkwrvBJXjf4Sm46D/1Fir2C9B5hgOXCRgGycrjJAoHw1x/OyEB08+XMB5rUp5
 vRwc4RlGX3SS9aE0u9IsBqNdZCavJos1meKJn9vMeVdSxdxT0cSU8jNTqCk4LQ6t5AjGpm5nSgA
 V1guLHaGRAotJOqhcw3bCaCdpVBJJkOgcO4nimEWaUFhUcY1Vvfw6gRvPQvu2+V+o74Xtr6b8oH
 gQHyNvd41JeTQu+IMgFyMd0DFp/klPf85Lj7Z6WpyPMf8FieitObiM1GF70UqIKblAjwedrHR1J
 qn6UZdtC3GzYteBHX7cLnWYYt8D74ge/25JL7p4TmRv76XaN9Tc+6C7ivk3ms8ciFL3aVN4rKEi
 UvV3t5FRZk/KUCKMWgmpoKqCmgIBhfxyaZvNGRBUgzVps5kAFOB0PJwL+5gofJspl/b4lbAQ0W6
 DymrwMrvauzx1ekouOQ==
X-Proofpoint-ORIG-GUID: fpy3upwJUBaRXMMWsF8RqdUAoGNQ4Way
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200146

Hey Luis!

On August 20, 2026 thus sayeth Luis Claudio R. Goncalves:
> On Thu, Aug 20, 2026 at 04:23:14PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2026-08-19 11:30:11 [-0500], Bryan Brattlof wrote:
> > > > I did assume we have v6.18 in maintenance but somehow it skipped. *I*
> > > > usually skip updates if there are no clashes and nothing changes.
> > > 
> > > Did we decide to skip v6.18 ? There are a few people internally asking 
> > > me for a roadmap again with some guidance on the lifetime of the branch.
> > 
> > As of v6.18.45 the v6.18.37-rt6 applies as-is. Winthin the git tree, the
> > stable tree tag can be merged. Does this work?
> 
> There seems to be a conflict when applying the 8250 nbcon patches. IIRC you
> fixed that conflict (or something quite close to that) on v7.1-rc.
> 
> The conflict:
> 
> $ git checkout -b test01 v6.18.37-rt6
> $ git rebase -v v6.18.45
>   Changes from 0c503cf3dde2e53614f05261ece12f9d3d4c3c20 to bf3be28f6721e24961992ebb9e61c0cf21a56806:
>   ...
>   Rebasing (1/29)
>   dropping bea58d7ab5ba4367a3208ecd1854a74b66b21f51 net: gro_cells: fix lock imbalance in gro_cells_receive() -- patch contents already upstream
>   Rebasing (2/29)
>   Auto-merging drivers/tty/serial/8250/8250_port.c
>   CONFLICT (content): Merge conflict in drivers/tty/serial/8250/8250_port.c
>   Auto-merging include/linux/serial_8250.h
>   error: could not apply 0b053910fa95... Reapply "serial: 8250: Switch to nbcon console"
> 
> Bryan, is this the problem you are seeing?
> 

Yep that exactly what I saw as well. Though it looks like our teams are 
able to merge v6.18.37-rt6 into their tree[0]. My guess is because 
they're also merging Greg's stable syncs everything worked out? ¯\(ツ)/¯

Thank you again Luis and Sebastian

~Bryan

[0] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=ti-rt-linux-6.18.y-arm32-cicd

