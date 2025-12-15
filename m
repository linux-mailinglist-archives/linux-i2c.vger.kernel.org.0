Return-Path: <linux-i2c+bounces-14539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BCECBDC80
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 13:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B566D301F8F3
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Dec 2025 12:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C6B1DED4C;
	Mon, 15 Dec 2025 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="huKLr19V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0966B1A0B15;
	Mon, 15 Dec 2025 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801225; cv=fail; b=q7ShB30puhyWrQ+l6VS4DWQmmdC8QVYgUDvZgGCp/2+NYrkreu4C81/wljsT2IBfjSQayK4iTDVrcM84xpQXIeUlMDK2MaCch6RxBxBbvyefsy+pHGjKsch2BnqPwvQrtXJzmiFViiYYdldw0xfqcUXCVF60rKONzqyWkRbbCVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801225; c=relaxed/simple;
	bh=3xuzEOBw5ghNHw14q72cj+qS7f/rSZTGf0kReE2I3NY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jVHi3lj9e163h3/vP07UxGnjZRSX5rvPVCAFrDn4DAAc5+HcNndPmUeyUnpa0SlM4F389Zego9suF2fPaIE6Qz85twVGON6q2b+obkxy/bBUtnwY9YNp2BvxRm2iM0fAvQpV2hnxEL5k1HMsSvoUlCZfbWPoozUJlj4DBNcxsUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=huKLr19V; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFCF4h52838569;
	Mon, 15 Dec 2025 13:20:12 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b11bwndp0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 13:20:12 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgvmRvupGdj0C0SOGCWUkLBhTKGDbI4kAHTRU2i2ufNIP+bvqALNQcVPOUKi02aR5quJcLU1VavHMinfXBZmSTQVDYMjayTgWZb3TzfXHmjDZblhnY0OvxDUziTzmlGqWNH5i8LwSmqGhm0CM6q80UE+r0VHxbxM+cWDzxBuSiBTNhfQfMIdSM+P8ESxhwMQouhPsS5YhQR1OUBVe7VLYPpcaaGU9bh2ON6x/kyMf+UCfSk/rl434YLTsm/M6u4qpA1rRgfkiZ+gohRZ7psZw7mzCkY59wL8DK2TO6kuFYNv34NWZqBYtO2eJ7G5mmFPlRULDvJkd3MqBd9z1cFCvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AHlvooPDp6+cAG/TmzRN9ux9yQZq9SeO9nwP0hiKZY=;
 b=Yw7UliouvLo4UDflnHoUJsBNSu0Gq9AcB1fIkgOKn9wIXhb5AaPP9m0or+avOrnS6PM66m05GJAQRrUr0HqXI9DvecUFoCtLR9LklorAZ69+yW7R3GwoZA2EKVO5t6WrTdo1jRxRqusYiQ9VlkuP64IGbvDbdEDbgzXYdUMqToLSPZHCA4konLlqmB+yzIc538nUiGqObzNhAo/tthY+T0QrukHcLueU7zAbfz+9oJRuPkfHR936qdzAHmKXMy0B9khICXWOF8dkx2ZSdCPBajxx8eOcoaEClqv84ScEc9BeH/h4xNcI6Nm9PnzrcCZ99nVTvv9PppjW3VNujpNjHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AHlvooPDp6+cAG/TmzRN9ux9yQZq9SeO9nwP0hiKZY=;
 b=huKLr19V4ympKDNIkMMKjHLmunGSLqkyNVI/xr0okG3dTdp6xjr//UJx7TbAkDbujcaCBOEwvcFZjunV4z8uEP39RXbIB0489kzROxbXsGhOqMeA07WQSrPb7zQ+NJyJ1bUkBTpX3an6Mr+I9RyZ+W8WJhX0OyqBxCejTY37vy+aVOshSkeHMJMr9Sva6q+puDmlt1mFw/A4o4Idl9GnDDf0VHwnHxwlR+x/dpCjHhgi3bzaihDaknWRxkTbFKEEbV0+2eGdhxEvoPm0mIH510LxKZjWhEI+KlB49z8EA8gDNOdgRE14w9SnM8q2ZDHtOVWx5b88SwpBQps7H78mmw==
Received: from AM4PR0302CA0002.eurprd03.prod.outlook.com (2603:10a6:205:2::15)
 by AS8PR10MB6362.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:536::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 12:20:08 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:205:2:cafe::9c) by AM4PR0302CA0002.outlook.office365.com
 (2603:10a6:205:2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 12:20:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 12:20:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:50 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 13:20:06 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/5] i2c: st: add power-domains on stm32mp2x and enable
 i2c-analog-filter
Date: Mon, 15 Dec 2025 13:19:39 +0100
Message-ID: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANv8P2kC/x3MQQqEMAxA0atI1gZsdFS8irjotBnNQi1NHQTx7
 haXb/H/BcpRWGEoLoj8F5V9yzBlAW6x28woPhuooo8h06CmtSYUcrgGOtEnPIK3iRW57prOVvb
 b9g5yHyL/5Hzf43TfD+MzidlrAAAA
X-Change-ID: 20251214-stm32-i2c-mp2x-dt-updates-e3747a0ab68c
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C712:EE_|AS8PR10MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f47170a-9b52-4197-c44e-08de3bd4489a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXFoUVNtQnBLLzdZeDgrYmQ0RE53R1RYLy9DMkJrN2pUU1hIeGJJSUJNdi9K?=
 =?utf-8?B?b240cmlyVDhTcnVRQnpHR3kwL200amRTWmFGSFlUU3NOaC9ObmVOdmc2azhO?=
 =?utf-8?B?WFQ3VjN4Z21vNloyRnFqY2VDV0Juako5QitLWXdiQS9iaEN3UEphQWxTSzVN?=
 =?utf-8?B?QXdySXVMbTdYeW5UZzVuK2FWZ3lRekdaOVkvcWFkSDc2TDhYTlJFblg1V0h6?=
 =?utf-8?B?SnZ5c0ovcldreVo0UGVXN0NsMWVpVUh3djBWNlZ0RVVaRCtCc0w3ZFE5ZDFW?=
 =?utf-8?B?UTBVcHhHTFRFdGVDNndIa3FhMkh5L1I5Z29uNEJ6RkVUMStRRjl4aGdZZTQw?=
 =?utf-8?B?UzM5QVV3aGZYcjRhalgzWUpTSDVNQm10RGdHREl3bzd0Q1EzNVJuYkxHcjdI?=
 =?utf-8?B?OXRobWZuSlpOSlVNODB2TFBnTnZZVG9zUE1sa3BOeFZMTWxCdStkd2lxdTVo?=
 =?utf-8?B?ZUJwSUQxTXNZWmIxRUowdmlKR1E0VllUL2VSNmFkSWdBaitQM20rbUpkRk9W?=
 =?utf-8?B?U2l1ZlBuYXpjV3VPWi81TTBhcDA0ekJ3bmVLblZ4aDlrZmcxMGdiQXNrTGlI?=
 =?utf-8?B?VCtUWi94RTBPMEk5Y3MwejVVL1RsVk96NDJYSUJ1QXo4bmNzZUJ3T1Rob0Jn?=
 =?utf-8?B?OXl4eUlqLzhraWdicTRNZXVnWmhnUkNZK2hscUFmRm5lc2xlU1BzckwycS9h?=
 =?utf-8?B?YmRNWW43YmtKaGRxOEMvV1R6eWpNWXBhUHJRQlNwcTliOElTakhoQWtrSWJF?=
 =?utf-8?B?T2VhNFdWc3IvT0pYM21LcXFrT05BUHFLc3FZR3ZNWEp0ZDd5UUFWb3FPWW42?=
 =?utf-8?B?b3ZjRStwRFZJMzluSjFJdnc3NDRlSjN2UE9MSUc5b1hJT2V6LzdtbitwNm1W?=
 =?utf-8?B?S3Rqb2J4citJNXN5UnRrMzBBRmJ6aGd1YmtFMTA4RG9IRWovcG9HYk1pdXZE?=
 =?utf-8?B?OGxKVDNyMDdMZFVxQlpsVktENnA0aHNzK0Y1Vks2ZDFSTnM4ZUlyOEVOSk1r?=
 =?utf-8?B?Q2p6OHNFWm1GbEd6aGpMVFdsT3d6QXZDenRsTUM4dHlmMWVzdGVVOTM4cGFX?=
 =?utf-8?B?SkpIL2JETExFMUtYWEpTZ21mZnoxTUNqRjR6c1VJbHo0SnVpcm5oWm1GblRB?=
 =?utf-8?B?WFFUVFRYTGducGlNc1VRSnhXeHU5SjVQSlg3bDBxZjRlaFBFSkgrZDVvNWZo?=
 =?utf-8?B?Qkx0SDlFL3R3eFJPRUtpaHRpZEc5ajExY2VpcXlnUy9hWTF5UG4vUy8rZmlG?=
 =?utf-8?B?eDdGTXQ5T2oxS2hXNnNmeXdlcDI0bW45c1VBQXpDMUdIejlRYUh0bnlBblUz?=
 =?utf-8?B?aXBESGRkYUN3b1pHeFljK2M5cXRYMHhSWUdHTEI1RFF0KzVBdmZneEx5enFz?=
 =?utf-8?B?L1pqQTJQdSsvSGt3VGZyamxDRnRBZDNhZ0VWUHFYeStLUlZZYnpEQ245M3R5?=
 =?utf-8?B?VkxTM3VVNFBIZWhkV01Hc2d1NEh6ME9oaGs3YWMxbVBFTG1SbFhYNmN5MEdQ?=
 =?utf-8?B?ZzgvODJycnVWbzhRbTJQNXp3SU1tQ3B3NzVmUnlWSGswcEpLTm1RcWltN0dG?=
 =?utf-8?B?RjlPWCtGekNoMUV1VTA1emJEeS82OFVzN2M3UkZ2bmdlcS9hd3I1VVQzV1Ux?=
 =?utf-8?B?OFJCNGR3VFBtcWJNc21iZTMvSlFzOGhycjFFeVc5bmxqdzc0L2NWT25wbnk5?=
 =?utf-8?B?Y3ZnYjZvWGRaRHlpZWZVV3pib0N4WTV1YUNxdGNUWTl6ZGdMbE1RSUhOcjF4?=
 =?utf-8?B?R2xLYlFVSGZCd2ZtL0dZb3VkN2FMbzE3VVVBNnJaUFNIUHhjMjNUM2hhTmNt?=
 =?utf-8?B?d3dRUkVmWHA0clE5RlNLZ1RJRmFqcUFxUURwRFBqeFJzbmp6THV2QjVlQTNi?=
 =?utf-8?B?NklZcG1XclltSDg0VXZlbko2ZUJqVityMUppdW9JTU5HazFvbTI1OXFvMzZR?=
 =?utf-8?B?cXRIdkxtU2Q4eTgyUXJaVTB6Vi95TDVteEQwNDcvek9hdFN1UGUrb3ZyRXYx?=
 =?utf-8?B?Mk40bkxPZWxhK0RCTXRlRFhiYUg2YVlFbDR1T0lzWGhOYWNuZm9vcmEyaXVl?=
 =?utf-8?B?TnMzY09XMUpURVk1Q2k4LzBYaW5rNkZuaWRnL0pMSmlWSzNkSXkrM29od2E5?=
 =?utf-8?Q?xYis=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 12:20:06.9430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f47170a-9b52-4197-c44e-08de3bd4489a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6362
X-Proofpoint-ORIG-GUID: KCvdW8gVr2SOzhFFD8weOaeDM84OvtPM
X-Authority-Analysis: v=2.4 cv=HNjO14tv c=1 sm=1 tr=0 ts=693ffcfc cx=c_pps
 a=A7HPRRGrarhIFnXEjJk9+A==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=isJpw5r3ktVn8an5pa4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNSBTYWx0ZWRfX6lwsbU/7Nq3P
 YEPlKf1yzAyDTKAOfXeK79A2WduKZn8tC9gvFdUgOaGPOWiX8VI66iye5ZdBXyyEkexehcPPCCm
 PAHjw3zCbrJhoqaT5uNvfdQ/d0I839pp4xjYV1+YDyFrF182S190CTmxffkoytoZE/6POey9kuG
 5NOQrIVjvMsiYKYqaFvAnAxZZeGJ8/duZ69JwmxMkOyxffcYn62rAJyBoDYCMrc1laTFPV+bJk/
 SRtZStEB+GL59h613mVC475enYLB/NERaeiz8k+11W5tlAS5laLHaJeyBasjqF5eSTXNXAi4o4j
 4vWiwSbT8KAnVp6bljrYE4GcFhSFUlGKqJoXZBLQ40hlduzC9qvLYd+yr4zg4I4zfsm6wZZvAUo
 JPJ0sLalr3GerDIfEkiSQcWTe9De9Q==
X-Proofpoint-GUID: KCvdW8gVr2SOzhFFD8weOaeDM84OvtPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150105

This series add the possibility to indicate a power-domains for an i2c
instance and set the related property for all i2c instances on
stm32mp2x.
It also enables by default the i2c-analog-filter on all instances on
stm32mp2x.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (5):
      dt-bindings: i2c: st,stm32-i2c: add 'power-domains' property
      arm64: dts: st: add power-domains in all i2c of stm32mp251.dtsi
      arm64: dts: st: add power-domains in all i2c of stm32mp231.dtsi
      arm64: dts: st: enable i2c analog-filter in stm32mp251.dtsi
      arm64: dts: st: enable i2c analog-filter in stm32mp231.dtsi

 Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml |  3 +++
 arch/arm64/boot/dts/st/stm32mp231.dtsi                  |  8 ++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi                  | 16 ++++++++++++++++
 3 files changed, 27 insertions(+)
---
base-commit: a6961e2ced5190c68acd78a7e372de07f565fcd6
change-id: 20251214-stm32-i2c-mp2x-dt-updates-e3747a0ab68c

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


