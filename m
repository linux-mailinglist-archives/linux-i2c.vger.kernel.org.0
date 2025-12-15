Return-Path: <linux-i2c+bounces-14541-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16587CBDC95
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 13:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 657A5305FA94
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 12:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69EF2727E2;
	Mon, 15 Dec 2025 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Vsrl7sX0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC865191F92;
	Mon, 15 Dec 2025 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801226; cv=fail; b=nthLCQlrO5MkHlDabnJ0ZwLpgrX2EdaeOJztFuC4l7I7CZNDqzqAmAnfIbTnZfzH+kvoXF4n64lqDkSpzp4+jnFNmaoVnE+gJvq/THGEp3kpY8aZnwWa+b/Hefx7GYCbQRE+EvI0P/nfXZOAPw2mUsAT2MWSNdXg+05hS0kEvg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801226; c=relaxed/simple;
	bh=pWvrpkWM6zL7AUneP7xgWECHun1u6N6PhnN4X3dggT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QBXm0mzVTdhI0lc1/AUUMJDd8wQ7X+U0710srSI26/dJP0z9LQWCyNtkzlSje/goNNtG0MLgfAjKhHXZmdmv+RJjUyAqkUOnbLRSTCTWfvE+9NhAyEg6nggP4y3yBCGBjAfzHmjyL0bgJutpkgC3bTxGq1DKQMS/32qamYP+71U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Vsrl7sX0; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFC1Fx02813299;
	Mon, 15 Dec 2025 13:20:13 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b11bwndp3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 13:20:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDtCHWJYE1/WZeMRP0T+phC/wLs4YH3Y8VSTxooprS9tM4yii05fIpfY9QTo0mR/NHEvzsaRCJsmptAGkiLbXecp3aApt87W5R/Pls1jqOhFRIyRI1KL7SGB93QdEYKmKz7Vd7flc+OYy52e01BvLdx6E2ClvShgSFEVLnVajqYtKmNAhi47Q5YCzdrgL4KnZqPf5eMKN9T/38UlQwpNRcpEJ0HrkCSleNTRVL45d07jyT+PDaQq8zVPQ6BNI+siplV6GOEDqWxgZF39pT2RlQCNUux2wlhGmwuRhK5XgRF/iZVQuP2cwpfdhO2lJftW0KBhQ4Ch+JXgTvkPOTjjZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x33Jees+eYnQc+RXoJrB4K5hlVubzTrpgBVPqF41raQ=;
 b=Kbzo/wU9Vr/yN8VI0gpvbnAQJ6UTa+td2TxKHaTLRvTg76H1DSTTWTLyzKb6EJp2gWZcUqApmY5Q1wq2ttOLwowBtnb6A+nHg8tk3SxXKM9hOQWGmI9aUOcaf+poW9Ic7crCFSwEs8+OZkD3JkmJ92tNYM1cPuWWXD2vtsPmxbbyVBTazh1NbcbuIBJwo/SySvJ5QcJ7nBn0/jZ6reR10GME8nR/ystNcoAnxEk93IvfMXx8aGD561zgfAdv/CEBmSVKUObuXwfyw6N6QbkIUdm0ExIKW2MCD7+Ve3zCUn8USLyvOPGHwOvSmJrSV6UsSXpG+QjNaaL22msYIhpGzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x33Jees+eYnQc+RXoJrB4K5hlVubzTrpgBVPqF41raQ=;
 b=Vsrl7sX0+UN8P3Rju12z2LKnRVEpYVfJBSCEpFelczLO2puh7qqPHTvvgYOoFN03OOdKlp51wbcvVYwTlXL53t5KZTdhEVk4qWtQ7xcBu8+TGwBkT1UPOUiA2wJGjg/3X8KXH+f3LjyIxoj3AXrzP2JpWX/vqsi5hP7CSWSr4+VmlRfaJ5Pp9bhiZQSODlFyyZwE2mLaUCOq5gU2E9Jns23vTywiWxp8yB6BpcFBivQ301FgnDCAgOvS53vxKK3OjC3YQ3p6JvCDhDJTcJfK+fFYdnABmRyCW9DcprcA53Kpas75Ndb+XluG8fm/hnJlB3iG/09zJYTCtiSNsWtwvw==
Received: from AM4PR0302CA0016.eurprd03.prod.outlook.com (2603:10a6:205:2::29)
 by PAVPR10MB7115.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:316::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 12:20:09 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:205:2:cafe::31) by AM4PR0302CA0016.outlook.office365.com
 (2603:10a6:205:2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 12:20:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 12:20:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:51 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:07 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 15 Dec 2025 13:19:41 +0100
Subject: [PATCH 2/5] arm64: dts: st: add power-domains in all i2c of
 stm32mp251.dtsi
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251215-stm32-i2c-mp2x-dt-updates-v1-2-2738a05a7af8@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C712:EE_|PAVPR10MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 9897f712-b21a-41ad-6f5a-08de3bd449b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnZVdzRHYU0ydVUxVnQrRmd5MGFrUitlUXZySEV6YUZpVWlUOVBrMHRvR2Jr?=
 =?utf-8?B?QTZDeVNGYXJ3SEY1d1k2TUJZSmlWUktXWHZIVExXeTdnRkNiZGhXYVE0dmJD?=
 =?utf-8?B?MjRPbFFTMDJWZzdDQjBRQVc4MVdiWVpmbmd0NkdqZ3lIWERyMXgrMmdmcFpM?=
 =?utf-8?B?YVhNdUJlSTNlNjZySlhzREkyZ0RRVFYvaTljTU1SSGJtOXpyZVRqRTBFSVRx?=
 =?utf-8?B?NjQzY1ZDTGZpRTZxYVYvbUR2b2c1L2tBRmNlb0VBc1FlbWpmL3hMaTdBMVZQ?=
 =?utf-8?B?L1JGbWFvbG84Z0NFbzBWVXlJNXo1WmFERUJtc1M5K2Q3QkV5Q2pVY1hEOUYv?=
 =?utf-8?B?dVg0OWszODVpbml2ckE5WUNoZzVVR05yTzRzQnM3UHVzYTEzZFF6d2RQRnFE?=
 =?utf-8?B?MHZIbzdvajZzdHQzSUszM0NPVGpSMDBBNENjbFlOZm8rS0Q0QWtTRE5vNlpG?=
 =?utf-8?B?dHMyR3hWYUhqdm4wY2FZdkNuNVBYR3VwbmVEeHE5cjRxcHY1aTNkdVl3NHZO?=
 =?utf-8?B?R1A1Y2lFZWJYeVFxM25la1dzM1RUa1pxUEcyejgzRmQyQ1R6Q3E3RU42RHJr?=
 =?utf-8?B?OHpDKzVUWHZnbkQ3WEp4Y2c3U3R5VG53eHpNMU9jSFFKSkZ5cERmY1A4R00y?=
 =?utf-8?B?WTJyM1hka25nbmJlSVd2a1o1YUFVL2JVQ0ZRaFpUZDRhQ01UVGdMUlUxMEZq?=
 =?utf-8?B?NWVIRVNYNTgyWjU0L2trU2FkT011Y1pBMWJvcGpsYkhEOG9aaDNNdElHcnIw?=
 =?utf-8?B?bVphYVpRZ2grV0NZc0JKa29NUExOWUpRNnc1SWNOZVYyalNqc3RWVzNvN1FU?=
 =?utf-8?B?YWNDZzJkMUQrYmxJSUd5SDFGRDBEK25KY3dRSWozWXp3WXdvSWp1U1c0dVBz?=
 =?utf-8?B?bmIxM2JQc0lTMmtMNjVoeUdLK2xBNXdab3drSExuUDhFam9XSjc1SGhuT29F?=
 =?utf-8?B?TzB1ekFjZVhIVDFhTlg5UGVLaEh2OUgvQXpJMkRNN0xnR3FwNHB3WjlNdnlP?=
 =?utf-8?B?a25VSFNKdllncGtUTk1ZVWl3bUJ5VyttTG5IaWRyQktzWm93Sm1CalFtaWZ6?=
 =?utf-8?B?UUU0VEhzUnVIWHZUdEloZEx2NlVQNXh0VHVOMGFOZlZxOUpiWkJLNVlsSUFN?=
 =?utf-8?B?SlJOSm9XYlhJeHdTWVJRSVFNTzhVbGJqell5NUtTOFRpdEVHQlhFM3ROR3FC?=
 =?utf-8?B?bTNBUEdEQ2kybnNqbVFjWVVhWnlzak5UNFJFZiszSmhYYzBSUFl2Ulh1WkNZ?=
 =?utf-8?B?dHVQVTZhZ0tDUXA0ZVJSMi80MjBBaVRIOWJyY0tPWXlucit0RndWZ05NVjZJ?=
 =?utf-8?B?ekEzRXNBeFMwZmpTeW9TSlU0bDR6cGNuMm52eWMwSC9la1QydVowRTJ0UDZr?=
 =?utf-8?B?S2RLT1NxTjhZNmNONzJycWd0aXEzNDMwUUc4TmtzRy9WRTR3bElYZzRuSDRr?=
 =?utf-8?B?U0ltamc3OS84anE5UEFSS3ZaN3I4WVFKNW5Jdk4wRnp4WGsvNTBRektZWUNs?=
 =?utf-8?B?bnEyZHVaNWQ1aEhaRXpkWllEVy9hWGNYR09DRDN6c0pvVXdmT1RDcGlYVi9x?=
 =?utf-8?B?WVZTS0t6UWl4bTJQWDYvK2dqbmpJK2o0WHQvdWV4SzIxZWpaN1ExbWc3WUN6?=
 =?utf-8?B?a3VITVBsMUFEKyt4cVNsSUhZVzRGZzZaTXIxTlBNQTVtTFF0Z0pVZ05rSU5Z?=
 =?utf-8?B?M0ZIV1docmtkdmJvTXo1NTFWRG5yWFJmTm1MQldBMFFGb0FhMVN6QlhLcFlQ?=
 =?utf-8?B?NnU1NmR4VkpqeE5uOU44Sjlja04xZXNQMytodHJxenhaaDhPK3JpckVPTWhX?=
 =?utf-8?B?TDVQeTVBc3ZoekZPTUkzanRicnhrN3Qrb0psQVQ3bCtraVNTZ0xkQXRwK0hj?=
 =?utf-8?B?b091WHZ2SmNobUJISzNpL3dGZFNFdHVYbER6OFp0Nkt0eUZJV2dIcURVVW5X?=
 =?utf-8?B?VG1QMU16UkRxUVFIcGV1ekNhOC9aV00xNHJLNUxvSmlBemlYM1p0blVCL1Nw?=
 =?utf-8?B?eUhLV1ZROUpWN3hROENTL3lEanRGWnZpKzBrcW1WemFrYUJnQ2JZbXVwV3k0?=
 =?utf-8?B?V01adHZ0dnFZTnJRQWlKR0Zld3ZVUW1rNC91UXI4em1pSEFGbHh3ZGZicmUz?=
 =?utf-8?Q?sFCE=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:20:08.8189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9897f712-b21a-41ad-6f5a-08de3bd449b7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7115
X-Proofpoint-ORIG-GUID: _7dUqvsZoYr6vg_g-3Fokojeu0Fx3ldY
X-Authority-Analysis: v=2.4 cv=HNjO14tv c=1 sm=1 tr=0 ts=693ffcfd cx=c_pps
 a=AOycmoUevleOEOAMEpukkw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=mJLvvUiAAxR-HtdJyo4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNSBTYWx0ZWRfXynTrO5xlqx1E
 yS+cz2nHx3O2ZufnZHbCQQzrngHYs8z1lk+WA0RHEToRCg70Dr0FjWYYBRqATDvk+jYz8I4AkaJ
 wz7PfapDJmT4cRLM6PgF5aUTqYOdf7bPbbJJDaQr7keNiDUZhkx/IZ91zYUFXTFiHgsxdWqI0Vw
 DYbWUh79Jepn4CHAkS+OTyOU8OYpj6irfxJXKZD3szchIdbDtUc17nCQYgidBGL/aNqsxY/BOq4
 eccJgZ2bRw1wiDm7QzwCqy7yjYBW+ld8wldBF/9MexF3G5/QA/R3CO3Bdgyh3IirP1sAeyPCZFB
 BF4DYRw8fwJcroslXC8KEyB4j5BlS61oTuL0e3jbA+WZLBaztxw8ZneAPg7rBATdHTGPPWCs83P
 nnO7G0ABjm+4hnQ5DFlS400cpqAsew==
X-Proofpoint-GUID: _7dUqvsZoYr6vg_g-3Fokojeu0Fx3ldY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150105

Add the power-domains property in all i2c instances available
on the stm32mp251.dtsi

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..4d5222698a16 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -780,6 +780,7 @@ i2c1: i2c@40120000 {
 				       <&hpdma 28 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 41>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
@@ -796,6 +797,7 @@ i2c2: i2c@40130000 {
 				       <&hpdma 31 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 42>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
@@ -812,6 +814,7 @@ i2c3: i2c@40140000 {
 				       <&hpdma 34 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 43>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
@@ -828,6 +831,7 @@ i2c4: i2c@40150000 {
 				       <&hpdma 37 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 44>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
@@ -844,6 +848,7 @@ i2c5: i2c@40160000 {
 				       <&hpdma 40 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 45>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
@@ -860,6 +865,7 @@ i2c6: i2c@40170000 {
 				       <&hpdma 43 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 46>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
@@ -876,6 +882,7 @@ i2c7: i2c@40180000 {
 				       <&hpdma 46 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 47>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
@@ -1460,6 +1467,7 @@ i2c8: i2c@46040000 {
 				       <&hpdma 169 0x20 0x3021>;
 				dma-names = "rx", "tx";
 				access-controllers = <&rifsc 48>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 

-- 
2.34.1


