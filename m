Return-Path: <linux-i2c+bounces-14543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC2CBDCBA
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 13:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16DE1306BD59
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 12:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C9A2C1584;
	Mon, 15 Dec 2025 12:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fGiXYVC6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DEB38DD3;
	Mon, 15 Dec 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801228; cv=fail; b=gtytVDO4bg9RhYTFzrnsu0m4suMvhIV7K7/XmDVUrXi8D3YLAiCATj2qgP7aEAnR+KRpKv+ZLnO8rWEjLe4gVM7DGXLcI4tlsglWJbGjOQoTNyfEAoqzo6vPzXJNh6wEi7HIHY5/xDT5IzzKdfdekdHiaAV4iaSnnR3bzf4dCEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801228; c=relaxed/simple;
	bh=PLJpmUGJS22U2fGlsX80vH9TGtPg2oRWoI9TUrVVGuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ikWLhmh7Ppo0f1osf9T9W59rPKy+Oq+01HJPVprokrBXIS0haRr4/nhC8VMhUYf4tVsA+YkE9s5wX6Ggr2vXe7hq8CQd+NhpAobqLOk5UmwWmNzAy15YvTUjbYn6e5hBVpDdGZ+WJsBegAYRvQBn3WbEOIw7YaHRDZD7/rWLfxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fGiXYVC6; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFC04Tf1991524;
	Mon, 15 Dec 2025 13:20:13 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b1jk5cdu1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 13:20:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6yqjYhEqz3nKp/PEhqIWdA5Gdimym+t1hRPN//5dEocYMWq4L6SjqHSr5Jod+AqMGeOaVtubkX2s8aRjTPy87Kf7MgI6uc96IfK3WR38TfDJK3EXLDJkTqHPAPt4hebH/XovxdXG/O4fUcEIZ6FV4go4H/4dD+u5PvoYX9DNeLQTxwZ9F5vA1SQeZZFSbibG4SmMQw8tnOMghIlsGykO+WQmWCSktJs/6+Ae799YsIOR5Je1gocHGLR/jJ+abzxjQoiuf62kI4in3Dp95NyiKpriOGOJHJ7J0U934Bl7of8s+Z1Qsh+wXTqP0GgxlvgaY5KI33I4RBcj3hbypPLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ON0IO/uUcpZPekGhRFaOHDdX5/6d5ekstEpQdjwoZc=;
 b=pKNU2FeTbggwEpPbltXdIhTJP9KrYPbF/g5zsO5fVZo0bKvRWPDUy4+td7wGlP8t0txmeZbqOnO694HRedjqqXjmh/F4BVI+FSRVS0+VGBti6cxfeeUQE4SqWrl+FS6gaYm9A3iw2j3xbNgHei1Xzl/Nn2s5UIfaj3ByYup25qHNhoTn1nG+pIOAOeAaiT48iFAJSuoHflocelbtf3amw/3BIlLCJUZDHYzdXScC2xVtK1EKzF8VZTXGikr2t7K5oBLs6orpiebYCnYF+LDm0OxByytR+6G9bPPKhpRpZ91rlDr84kMPLk9Kxff99cf2iNSxERTNnNF7RTvPLxDxsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ON0IO/uUcpZPekGhRFaOHDdX5/6d5ekstEpQdjwoZc=;
 b=fGiXYVC65RpcAMo0y6/zAbiuOgRsT41NrvTAcA3dowlTQAQAMZTLXN29sr5HP7xSLXxlAnTxjsMLy46yjEtmgd9lvdOiwDc8tnbGUoT5yuYTpUzVVcVYoEWLC4iZwTzmZAkMRKHqWWQovFXZmFLCSEvO4lEjnLzZhHHXsKUEQ99bChAEwR6o9ASgHWwPym9f3vAVDEt4IFpWJEaJATgokQvLmj+NKJJMQJHWKDMRyqVNG7mLn0orhmr2lNziPS0sToPj29vmwL2F1Vr8+bw3razMhZ4hbt0bk68uIBDV5kHhmXeAySXDCfQ7oywfc4qtuApusp6f0Pe4G6Xbt5unNg==
Received: from AS4P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::16)
 by GVXPR10MB8844.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 12:20:08 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::d7) by AS4P192CA0024.outlook.office365.com
 (2603:10a6:20b:5e1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 12:20:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 12:20:07 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:54 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:06 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 15 Dec 2025 13:19:40 +0100
Subject: [PATCH 1/5] dt-bindings: i2c: st,stm32-i2c: add 'power-domains'
 property
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004E:EE_|GVXPR10MB8844:EE_
X-MS-Office365-Filtering-Correlation-Id: f61721d6-b812-4c43-2fb6-08de3bd448df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGRuMTRvaU01N0RQU1VsM2R2ckpSYi9jcGMrcFI5WWsvZmloNDNVV2dOK2Zr?=
 =?utf-8?B?TnV2UkxQVENZejFyZXEvTVZVMkFkYVh4RytvMFZ6VmRqTzlYWVRITXcydTZt?=
 =?utf-8?B?TFZPdVYxMWhlQjFlU3JIVlRkTm4yNDdpWGM5dDZHQS9jQkI1QkpjZW5sRit2?=
 =?utf-8?B?dGFOdjRwajJjcm5UbnBSSC82dGhnbG9SYU9tRkJTSDBYL2dwcWtUbk9tbjFG?=
 =?utf-8?B?WUdwV0UwZjExNzh3ZEZRdXJFelNNalpseUFaNGtLa05hSWh1NGJxUmZTaWVi?=
 =?utf-8?B?TWN6UlRhWDRZSXFIS2FJRlE0ZkRpRVlnVG1QTnk5ZEdsM3ErR2hISzVSOCtY?=
 =?utf-8?B?M3RXa1l5Wlo4dHhKT29CdUpYbkxnWUxDby9KYWNZUXFBNmZ3UFdNRURUK2JB?=
 =?utf-8?B?ekRhcVYvdFIwS3BIcnNqdFBxRVlsMm1aVFBLakRmVFY0NUJmYmhmN2k2Uy9y?=
 =?utf-8?B?ZDU1SXJOK21sNHJ0N3FaNkNzNG8wVmdzZ2JJdGZZdTlpUkhrZmlISE9rS0Rr?=
 =?utf-8?B?cSt5R1RiQUpuclFralZuOWZ0QkF5YktxcUp3RE9Sb1hRWXViZkdSeHJLUFY1?=
 =?utf-8?B?M053TUtXWjJzMTZzblZ6MXI3MmVGWlRxdGlpV2VRWTc1cUFzcHByRUEwQ3ht?=
 =?utf-8?B?Zk5kSzBadS9BbE1DMGJmaUlyNVh5ZXRKNitGMmFrb3hZUXMvb2JoZTI5dmdY?=
 =?utf-8?B?cWpqS3ZpeGoxTENVS1dBUHJBYkcrci90Q25rM2V4dnM0S2V6S3hJTzRKbG1I?=
 =?utf-8?B?c3MveS91cVh2SkJKOXZjaWJqSW9yeFRkTVB0SENpZzlDMDAwY0xyNVRETW5k?=
 =?utf-8?B?SHpxQ2VNY2ZWeHNSN3E0SlR6d01ueXU0VC81T2w4WDJpdC8weFMzaGtxWlR0?=
 =?utf-8?B?NktqQldxMWtxcC9ua0ZSL244M292R3l0S21FMU9zNkZ5ZkhXb2VxSVp3bTFj?=
 =?utf-8?B?bU04NmlBd29idFRyYkprT2UzU0lNd0tTa2Q0cGZ1RjBHRnlkRmpSSXBhUmFW?=
 =?utf-8?B?MS9jUXVoK3J4ZXNqL2k4K05WbVYrNjN6UTVyL05QTDhCb1htWENFcUZNRk5x?=
 =?utf-8?B?cnNyajE4MlNiVHNnUEIyam1QUlpzMk1kVEpSY3NzVmdNS2hnNldsWjVVb0g5?=
 =?utf-8?B?U3NMclRYYXFUc2pxOWhSMnZnWXlFb2V2cWNuNTQydVFPM1JvUnNZMTdteUlY?=
 =?utf-8?B?VnFUajM5YWJLM0xrb3UzMy9DRkVaa01HeW9CMlE0d2QwT2RwUTJ4RUFmY3No?=
 =?utf-8?B?S1Q0dmpFbzh1dVVpV2IyT1Z0WklLZTZsdFVMWlhpTG8xenFCdEtURHI4SGRN?=
 =?utf-8?B?aE9JTUdZdFgxSDFFdEhKandhVHd2cHRsZ2RyM2d3MnN1ZkFxNzdQcXpPYXpp?=
 =?utf-8?B?bzlGY083UTBtc0p1RlRSU0RvNVVLTGZqUWlpWC83d1FVL0VmbWMwZ05NREM3?=
 =?utf-8?B?SVJwQVRZNWFsNGRlZnRqVkUvYVFDZUhHY2lycTZtQnRUNm1KOUF6bnh6Z2xo?=
 =?utf-8?B?WFljK2NKbUpGY3VlUmQwcmJrTWJjOGY0aSs1ODR3S0xMVll3Z3JHSDQzSlJG?=
 =?utf-8?B?UUpFOUdwQVg4ODN1MUFTUFRsV3dxRkhlUUtnTUJET1YxbnBjY29KRHFlQzdT?=
 =?utf-8?B?WXgrSGRoV1JSSmxFL3YyME9BcXpVc3k0OWhVVHBzZ2ZBSDNXcGRNUTRiK0Nh?=
 =?utf-8?B?cFRqUUZXc1crMFJJVW95TWxQRUp0VGlJdGZqNDU2WlNQRVlPYjROald6M0ZY?=
 =?utf-8?B?azBNOFJJeGo0ekdtcW1XM290dy9uempmZU00Mkp4NzlmUWVQUjREa1VYaTVM?=
 =?utf-8?B?VWRVbVYyYUpKT05qMmNoZjFrTjlPZWtjNEFzU24vOURueEExeEQ0S3JhbFdx?=
 =?utf-8?B?aysvTExubFpoUWtBUmxJeW5wdE5PRHc5eTczMWRjSkFCUU5wRkhhRlJCT2hR?=
 =?utf-8?B?ZG9GYno1aGdRQnUrcWxCVjQ0WkFzSUxSVExXaWVCQ1ZoNDliQmc2WFF5bktu?=
 =?utf-8?B?cFphT3NYYzkxdHNLWkduSWM2WHIyK3dZN2UrbnFzS3U1Y2Y3dW1sT3RLVXRS?=
 =?utf-8?B?L29FS2J4UUxRYitWOXpyalp3RXJBRWZXYlJ6bWJSS2NIK2p2TnhqVVh3Wk1q?=
 =?utf-8?Q?5wZs=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:20:07.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f61721d6-b812-4c43-2fb6-08de3bd448df
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8844
X-Proofpoint-GUID: gxK8ffA42jw-q0jZym5BuW_q1O-zN3I9
X-Authority-Analysis: v=2.4 cv=NKvYOk6g c=1 sm=1 tr=0 ts=693ffcfd cx=c_pps
 a=6EwHhcPr6SQIsPQpIcuDPA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=a0CDNonkzWpUtX3icMMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNSBTYWx0ZWRfX929XtTcwgtTL
 3RRQUTeeUEzY4SXkCMVDXaRzUYa8vhXGUz7BAFHOwtplrVmwt6onaQqAx1g/WpwQTx/fsEd43NC
 2HOwrexMhZEXecRvrbthDuTXYO/34p3+I66nhp7g6YDyoEQPcCBvbP+FBfwaoCgIdHaiPCvInyw
 FNWx1Df0s0+EuEaW7gdGK+dOuLu1DD9ubhECsceLwYB9WgzwvonHxs7vnaSNCxIwHHyhxfYVYtn
 82OUNUlZVProEL3RUcxHPyQQrPy8RhBcT9RX6WKzEUrlPkjb8dlBHHt6I21GiwMGetimHEie6/y
 i8pS/gBJKiL7mTM1fQp/QEwwfKyszQkpEdkiKC4qgMs6mNZDF65wVg0ZZ3HddsaYn7Fl39tYTaG
 uBbiVW2AFhsL254yHlLzgDJ22UfEKA==
X-Proofpoint-ORIG-GUID: gxK8ffA42jw-q0jZym5BuW_q1O-zN3I9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150105

STM32 I2C may be in a power domain which is the case for the STM32MP2x
based boards. Allow a single 'power-domains' entry for STM32 I2C.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
index 457bb0702ed9..64aaa0dfa8fa 100644
--- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
@@ -127,6 +127,9 @@ properties:
 
   wakeup-source: true
 
+  power-domains:
+    maxItems: 1
+
   access-controllers:
     minItems: 1
     maxItems: 2

-- 
2.34.1


