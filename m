Return-Path: <linux-i2c+bounces-14538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE718CBDC75
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 13:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE2F130142F3
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 12:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27471B4F09;
	Mon, 15 Dec 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ogynKE6P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF97D19DF62;
	Mon, 15 Dec 2025 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801225; cv=fail; b=nQ7lJNO2l8t7cioIWrBE47XCfcHFB1x4QSp2p07OCrn459B8NrKuoNj8TbtAqhx3LutEtL0cyJc/9BRVEQM38uodERe3JHhBq39OBNefYzp3gBXZ+7HS9/Ie5WP5y1Pib53RGHDdrfQvYhxQh4iACdfdKD15j6+QVeh86s3Ac3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801225; c=relaxed/simple;
	bh=vDz/MZop3d0fHWlxr2aNZcpsjVSUd7Eh9q2lJYHclqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tM1RiQVYDnZDVKwfEo6H/8Bx0WITbbG8euqP9Oojpl7BnpRSmotIM9gdQA41XvxcClDNeKVszF8Keqh0EcVHbhS5z7pZpxTLgR4HtU1RyXvTL99MC7bW6sj7WvnC8bOq1pfM101uYcrp9h05AE/ua/HxA/Hpa5MMdhUuXN01PCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ogynKE6P; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFCGYqj2455270;
	Mon, 15 Dec 2025 13:20:12 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b11m2ncse-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 13:20:12 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcEN7pFW64r1jwaWEdMVkHPFLYmw/LDsDjU2GQ/N4XlvNY9JEFwJSyQ6Dwp6ZoLLNNiLGV9AFmSj3251UtzPeobp6UaeEMCbbBza20BJNCAGCN5eld3HNdpfFqwBXqs43rS5HRnMLyWkXcgfAlJbWUg1FeaJni6I/7zAQKJ3CpsZVrs1YFx0Tp8vwqqrIe8w2DFR50YAnv6xOXLVw0V3PzIutl5ZcGb9j/rpK8gp9lLsYQZAqJwQ2YhrPCvd7caDSD9Gbz54g4yIepLm6si1qxBiEfbtcaqnlP8olKRBqIzcqT3kZKzxudhUovRGay06VpfjPcFCaz+0bRSeqwDgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EVn2foQOMQWubh/nmPdAKOjADEBA4Wad0h7XRflW8w=;
 b=gTx2vuDokvpVa1T0138egwewyFypvNyhbcTVRZTESPoqobLN/VdLu8pvudHz49+lWfg5jJfKrk8W7og2v12760QcGjte+uZQskpC7Aw79dn+jh8x/8WK2CWPoUiVCrETv0/ZK7evbI5OSnNITwpUzN5odEsl5R+SQ29DofsTUUTc8mk7VCGG+G3l8of/VX75T/pQx7ev6wOlsoezsZAdAo7g9CGT82T0y0ktVsDTU9P0eeGwI9GvONqNhMkhNH4KB8OG2KKSVXXBYFC8MTlf+k/Obcq20Ye38hJL5LEZK3Z0cT18TK2d3tEhQMiVhXD9nGC6Htr0yxWeCecYkMgThQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EVn2foQOMQWubh/nmPdAKOjADEBA4Wad0h7XRflW8w=;
 b=ogynKE6PAguM23mT87k8hUpAk1TbEHjMcyLgDYby4QJ1euC3Al7m3bMJ1pPrrwUOTd335GNRf9sW8uCIygCicWEq5AHnWtr1r/KVVrm86RhHrwwZLhpqES2DrFLNe24kIn9lhSR4n2gEg+fUXopcgO+DtVcr7XRYYraR4yA7nI6qrF/tmXlvrOpvsmozJ7YQZxL3qwnhhCbVwv2alEKdt8mAGXPvpzjrBJ8GvzPorsymPuDUO5jAeqPxlQfGXA43kA0ife4xcn4qNgNf+BYadNBgTN0cEmWYLetZ2MNaX85kgroW9v6nL/Pkx5y9sBCVOnbBwJnEynE7hoRIdxMLVQ==
Received: from AS4P192CA0022.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::20)
 by DU0PR10MB6275.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ee::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 12:20:09 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::73) by AS4P192CA0022.outlook.office365.com
 (2603:10a6:20b:5e1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 12:20:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 12:20:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:55 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:08 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 15 Dec 2025 13:19:42 +0100
Subject: [PATCH 3/5] arm64: dts: st: add power-domains in all i2c of
 stm32mp231.dtsi
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251215-stm32-i2c-mp2x-dt-updates-v1-3-2738a05a7af8@foss.st.com>
References: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
In-Reply-To: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|DU0PR10MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf755b1-1639-4b2c-ecd1-08de3bd449cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVR3cmY4QjNUcDJMQjhhN296MEp5bkpNYUtGOHFnSFBZYkpoblRYRWVVdnlv?=
 =?utf-8?B?b3lqUktPKzNJNWIvVzdhMXNyV0M3QUxTZnJ6VEhBZndhUG1WWFlBKzFicDFN?=
 =?utf-8?B?QUJRbDhwV2FtMDhmb0taQVJWTmt0ZUVFaUJZVjhSeGxnRzcyYTJhblFpMjRo?=
 =?utf-8?B?OEx2NUVlMkpjZ3J3MmdLbGtEaUY0azZ6WjhRb0RTN2lmVTVQWDViWHFqRmdN?=
 =?utf-8?B?V1NWanpMZVVpVTk0d2YyWUZXTVMvdDU4OWczNTF4SnZmYWNBR2JuWTcyOVJD?=
 =?utf-8?B?LzcyYXBQNjJLSklTZzlQa1BacXpDZlVEdGU2K1ZQSmcyZmRJaThYVnV3cTF6?=
 =?utf-8?B?VmlhUGpuWEY3UktuWU96ZDdGdjQrN2NCU2REc0hxMTdPZFNvTXRUVXFIUndR?=
 =?utf-8?B?bDNtaGJjVFRuVVNXL214WnFHM0VCR09Bd1VIaktwbEJoN0JYQ2FsVmcvQ1Mw?=
 =?utf-8?B?RlZVZzR5N1I3MVNYMnNFTVFhQ0FMWm9sNmJVYitsZEdRQjRlcVc0b0lsd0Fr?=
 =?utf-8?B?SHZmWng2WXNmQ3VISGxKd2xPZVJaMitLL28rQlhWcU9HdTRiRlB6VXdpc0lr?=
 =?utf-8?B?L1R2UzFqcVF3aXpoMnlFMi94L1VOdkZYM1JXb3Zyd1JDeGN4NFNCMnBOQmRa?=
 =?utf-8?B?b0RETlUzMVFvY1JSTVhKMTNvblNTWnpLT2VlVHN6ZWdPK0lTTlNSdUhVNkNL?=
 =?utf-8?B?eERJL1pITmJCMVFBT2thNFNTTCtxNXVpaVVwNkRXQjBCbDF5ZkVORjFKSzMy?=
 =?utf-8?B?alRqNUZsbFpiOHZpNDFxR1FzVmo4SCtxOXdYN2lEc3FJUEl4b01EbldKZVFw?=
 =?utf-8?B?SlcxWE4xS3F3RTdpSWtaOTQ4VGtXQmpWMXExS0lUVEo3RVBuTTBjU3dDdk4r?=
 =?utf-8?B?TjRaSHlKZnpUQldQU0FWOU41aDVQUmdwNWxqR1huazZLU2NmTzZMekREdVd3?=
 =?utf-8?B?Uk12Wk1OQlNHQUp5ZFFBYjl1Tk1STXZJc2U5Y0M4SW13RCtHUkUxZUhDMUNy?=
 =?utf-8?B?TXBoVnF2cm8rM2tnZzNxMmd6V3N6U1RPMkUrc2xXM1p1cjczY0RDMjUwUkt6?=
 =?utf-8?B?NVVrSkxuZ2FoZjBXbXFyUERSazNjSFdhU1BBeG53cHJnenRzN0hXdGtHM09F?=
 =?utf-8?B?TmhKdjM3UW9ITk5YVDBxZXRaUGFMSXZaY1pqaGpKQW5GclYzdExHREVFeW1M?=
 =?utf-8?B?MGxwODMyTHNOZEhKZlBTYTlxbEhKaG8zcmpOcDI3K2U0cm1MKzJMLzlKSUxR?=
 =?utf-8?B?UWFqV2MydUVFRFdMWVBXOWVMSXBQb215UDN2S1M4KzF3UVJRdy9CRmhsRHhK?=
 =?utf-8?B?c1o3N0pUMUlFYkRpUE15L1o0d2NHNnlBREF0NGpqOFI0Skc3dGNFUUtWQXIx?=
 =?utf-8?B?RXhSTUx5em5lTHE1eTRrT1M3K0JpaFByM0ltSWRRaEZqOFltVmFUSGRvNXIv?=
 =?utf-8?B?OXJoUGpFWUsyellpTUsxa3dqZzBNckRoaUs0VWlHQUJzNGZMWlhYY3ZwVkhP?=
 =?utf-8?B?LzFlYk9JWjZocEJaMFkxY1ZjdnZJdVBMUzIxeW45QjdKd0Jjb0VTeTZjV3Zz?=
 =?utf-8?B?dXhZK0IrZi9DTEg2Y0xSbm8wbFlMV1BHUHFUY1hteHV0alV1SGVGV0xDS0d5?=
 =?utf-8?B?dFRNYVFMWE8yU0VVS2dQd1FYcmlQbUtlREJDb2lOUWNFdjhlQ05aMEZ4RGQ5?=
 =?utf-8?B?MjJKQUd2Z0tGZU1RSW56YjhGakRpSENVY2xYTzlSa0tEMDAxS1prVVNnL00x?=
 =?utf-8?B?NC9iMW1MV1NQQkd6b0hkSCs1MktXeTNaMWdiRUx4Rm4wVStXOHJjMzl0c0l0?=
 =?utf-8?B?K3lPcTlTRCtuWnJhRml6SlFtWHBDQ1ZSZDlkbG1GdFU0bWtMUGF3VFJZRDNt?=
 =?utf-8?B?RExUeUtWQUdvZUpaNTc3YjEyRlNBVUVMVG94VlM1VGliSXhKRHBxZWhiRzcr?=
 =?utf-8?B?UDR1Q1hrN2oyNnlmSDVYMUVFb2FBMzVLSGpEZ2c2d2lVUkMxQzZtMTlVelZl?=
 =?utf-8?B?V0dST0tzWm8zY0FmdE1MWUdaZFhhZ0JuUnh1NlV1c2Flak9HdXVjaENFMjlj?=
 =?utf-8?B?cTExRFo0N3N6RFp2U1ZRQkw2UUlFVENpcGQ1SjJFekxoKzNBdkhCVXVjWVRS?=
 =?utf-8?Q?d4fY=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:20:08.9754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf755b1-1639-4b2c-ecd1-08de3bd449cf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6275
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNSBTYWx0ZWRfXyVJlT3lbLQVM
 pf2t26LkpAHe55jnXP+bpWuFToASQMp3G0dWu++KVIvxVyzo95YV4+6rx4yxJWKwNf6mMFzsVsV
 jlpHEVCtc8Yve/9OwelaUTHbitN3HYfyYWSPpy0ok+P4kcqSX5+osdwdttjnj4qR6M18zd49qIT
 TBxAUcVK5zdiNseiyRohL0P3F4JYPpWo5EXsxCMOR4wh2+Fe3Dl4SbS/UetSztkoin6FjxDke18
 9HQH5DSojvkCTUK0Xcr8kotKujrML6Pqvy9r1fH/MyR2YCYTta0625hynkgIV8TAS99q+UfNRJy
 E3ZFRSelc+kK95QhLKslzg/Ezv4NB6wvtzuIQYXdKwx5qcxzeoqDPo1t1SvsCcNmk8zSK3HuiZ3
 YGcJUt1d8XRovch8xFD3dUTNbtiCkw==
X-Authority-Analysis: v=2.4 cv=Jsf8bc4C c=1 sm=1 tr=0 ts=693ffcfc cx=c_pps
 a=6MW+E15Kuv/JbtoGRoEKRA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=hNtAVtyWxvtx-I5h3M0A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: mPYo33DiycHzzoWD1oM6nnYdxuxlXiUu
X-Proofpoint-GUID: mPYo33DiycHzzoWD1oM6nnYdxuxlXiUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1011 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150105

Add the power-domains property in all i2c instances available
on the stm32mp231.dtsi

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..3d2a71e0341f 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -359,6 +359,7 @@ i2c1: i2c@40120000 {
 				       <&hpdma 28 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 41>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
@@ -375,6 +376,7 @@ i2c2: i2c@40130000 {
 				       <&hpdma 31 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 42>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
@@ -391,6 +393,7 @@ i2c7: i2c@40180000 {
 				       <&hpdma 46 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 47>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
@@ -664,6 +667,7 @@ i2c8: i2c@46040000 {
 				       <&hpdma 169 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 48>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 

-- 
2.34.1


