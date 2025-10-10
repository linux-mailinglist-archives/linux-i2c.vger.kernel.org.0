Return-Path: <linux-i2c+bounces-13443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EA99DBCE4A3
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 20:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6C594EBF17
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 18:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918352FE06B;
	Fri, 10 Oct 2025 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TQKBzMlo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C34A2C08B2;
	Fri, 10 Oct 2025 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122245; cv=fail; b=T7pHp96jwu8DdmMUy0Dxi7sJb9ykXPSmcjE8rrCmNnYLVohHnonOawlMJ24uJbQmhTnSR+L4eFs+SvfEtsyqqszaelnEL2LIdk8z5KbW0o7KdQYN3RC75MPEnhMrf865pVCs/2zQArM3vz2yUHCtnTYxPMSYkDUdFOndP5xy41Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122245; c=relaxed/simple;
	bh=hrf8YhKBxY1dlitoms//KC7XdyYNkT5/I1dgcbvO5uk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=El8m7FI89WY7iXqWEA+f+j5A8oftkVyg56LqCRj3Z50XhB3wgxsRKjIp1wzjMWGIzCx0CQHH1HyO3DqHZ7IF9JlbFRQC3JMTm3D80p2A/el92Vr6qcpPeu1daHJdA5Eg9oAIuxTZDYDJGHX8Je3jn3sdY4cuX34zywAb3VIpH0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TQKBzMlo; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4MN/TqRVuGFZ6P+yz1N3YHDZJhD8kHQMFX2cuuzRVmKbFVa6wwh3kBZO3xUnOcRnoHakWeafpvCTLaIrZL/3PKmSMyVgfASVtOQKPF4kRW6IoqIeXFt/mDCSVa0J34B3y+Qs9g4mZ+td8sXahxhf3oVBVvutqVsC43xY7FU2rW/yXF6qLKvEWyVCnMcIAqwYNG9zRQhHbDQYiZphERlrl9Fj+I1JnoT/ufwKNJ5t/tzKAhoa9+NgLfMEj3Of4EcxvCbrN8BRzf9P7b7TT6agPwwM2+ZP72ujIUvUKKR47byTSKD57QgxrLXCG3i5tHiMnb5eOSrN73b9vDEKUr0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sl2FlOQYKN1KEh/3uh6LwxYoy8FLGK22KnAKMtMFcM=;
 b=IGtHTkatSYhr437JtTElwYVJVKMeQYStXTCgWw4xAdwmaDFNeN+Jsf2Z0s9336dIKsL6EkK7G0WEK55U5tdPgsXpU7WeeQ+cS459ATQVV4QG55wI6yoJqo+Raj57kyzIgH01oiK6dQ+eds0HmFLbt23oAid0+L11bzxkqhMopyb+SFzF4NNuRDANnX1bC9QfL19HZnwLMxiupHIw7e9LSeSMKVmyM2UDGFJ35LJamNvISDSK2zAgGQDg2Rwq8Q9muaKlVXP5VUp5Dg68zEkY6Ei2xuFMchBfdeba2QgUbVXSsr9YDGZp99EYP4SNm17T5NvxYQoyG+yryayr6clojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sl2FlOQYKN1KEh/3uh6LwxYoy8FLGK22KnAKMtMFcM=;
 b=TQKBzMloKzvZhIc2LEyYvTIdA/uWiUEHr4vvzBuX0ZcD+gYkzlwVaFk3zUcAwFGKoPRGX2ZQRQ0DSAmq49oKpoFBMOrJx9MHP/IhfBNvoU1LGtZELlt7PO+JaBZkabXlZ48DK/iZnvguFlR5JIhCtIKpSxwBFSGXwH+JemurARCVsxRdrHWb+n5JmgstMAGOGEM//iIce/bv1D14YKGdOmCrcWgO2UDqMu7VuN4gMPnl1gSuywJIA3gxomaHr/xyqjD/sw4ZUZapkks0di+xsQ4SPZJZ2dj7Vbb9hzE6Zu5JA/pSggSLWReauaOLnKXFk0Sd+EQgz+M2bEiToOrcEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 18:50:39 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 18:50:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/3] dma_mapping: Add auto cleanup support
Date: Fri, 10 Oct 2025 14:50:23 -0400
Message-Id: <20251010-dmamap_cleanup-v1-0-ec5bc14e82c4@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG9V6WgC/x3MQQqAIBBA0avErBMmQ4quEhFDTjWQJkoRSHdPW
 r7F/xkSR+EEQ5Uh8i1JTl/Q1BUsO/mNldhi0KhNg9gr68hRmJeDyV9BWaRuRaMNtRZKFCKv8vz
 DcXrfD0v2POJgAAAA
X-Change-ID: 20251008-dmamap_cleanup-d0a7f0525a3d
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760122235; l=3179;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=hrf8YhKBxY1dlitoms//KC7XdyYNkT5/I1dgcbvO5uk=;
 b=zpWuZndjQ9h0RkBv0IMXDJZK5NtuNjnHyFaMCwMPnmm6hfTCL7WKQ3ZyUpGGNtmPRMZYkl5c1
 aJi63Tzyx/tBRxMOMjA6/p7RH06zEGU6g2cG8JtaXHCD04UhjwLJbao
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU0PR04MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f364701-8295-48fa-b07a-08de082de7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REV3Q21DL1JzRU10RzZuRFU2NVowTk5kNDh2OWhIRWpHWUx2VUJsVmlYOGF2?=
 =?utf-8?B?Rko1L1BaTzFSVitUaHhpcXFDaTFqeHVrbjF5bEpEOVo5MlU3cm1pS1ZXaEVM?=
 =?utf-8?B?aGkybERXZzhiWEhCWkhnT2hLTGI2VGJGeitJMVZmeVFlNWFsNkNJWFg1MExD?=
 =?utf-8?B?cVUrZVBWTEFhc2grLzR6SmdEY0lLNVNWbDRCMTBRa3ZUVEhNV0VRb1BmQ2Z6?=
 =?utf-8?B?bkRsNU9RUkhWQ1Z1Wkw2Rm9VQUduWUg2cGRyUURSaVJCQlh4WDB1dW9mYzkv?=
 =?utf-8?B?VXo3OWF5SUdNbGhWZWwralRQcGZCc1RMRWxIV3BwY21Hdy9vcmNqYVpxMWJ2?=
 =?utf-8?B?NFdSaUJFb2tta2JFVko2T251L21IK2w3TjFVN0c1SDZnY3JuQVZsY041UVhM?=
 =?utf-8?B?MjFFQ01WQkJSWWRlV2R5K2kwdndYU0U4d0x1aFZ4US92YjhyNmEwNVh0ZTBK?=
 =?utf-8?B?V3djOHp3UC9iYk1iMXF2cURqTm5rYWJzYk5sRHN3K0tOejZhUko0b0UzMnNN?=
 =?utf-8?B?dyttWkovdjZYaG96WXFRZy9SMzhneFpxbVVsZXFRbUxMWTZMYjBVNzVXRlBu?=
 =?utf-8?B?T1VxY254Ym93S0RJREc0b1BJUXdjYSt2aktVczZqcVRYbWgzbllRcWUvUEZ2?=
 =?utf-8?B?c2haSW9JYjkxc01yaWxKekVGM3hDalByRjEyMzZvUGltOVJsbXdhcW1UL1VS?=
 =?utf-8?B?Y3oyVmZQZE9NM2lBb1NGMUw1K2o2cXFSMjdVMEJHbTJMSlJWdzBSc3ZvdVR2?=
 =?utf-8?B?Q1N1UnNuMHVuUjh3QXdhbkljbVV6cmczOW5JT203dU96NGVZY21wcndwTDJQ?=
 =?utf-8?B?d3IwbTFwNERkcllEalJRREFrNCtQQkVaODhaalJaQ2NCUkZhWWFRbWtPUDJJ?=
 =?utf-8?B?enNnbHI5bWRPblJhWElrZDF1N21PK2NXQjlzUEloMmVnL01UVllSS040YkFR?=
 =?utf-8?B?VVBjYUJLTWcyTm4zRHVuWVpKVTBKOVRyc0pJZ2svSGNzcXA0UThoK3BNM3Ro?=
 =?utf-8?B?aUIwQkNBbWRHc3EydlBoNGJQbGR0MzE2OThzS2ZUbURNUG9NcVErc2xERTBM?=
 =?utf-8?B?MVRpaHZIK1paaEtJTTQ0UzFwNWw2amM1VjVzOTdKQkpGaVpTbVRJS2FMWmNK?=
 =?utf-8?B?STU5cU5mNWV2aExBT2pSd3cwWSsrbjl3ZStncGxZdHdYREtOSmZsQWtxc2Fm?=
 =?utf-8?B?ejJYQ1BHL05WSnBIWmJQY0ZWRHNyVXErRXNyQklkUWNHNk5tZU45V1czdVRF?=
 =?utf-8?B?SFpSNGZzOXdUeXNkbXh2U3ZJZnlTeDVIUmZaSmQvdk55UjBZM2FONDZkbjNQ?=
 =?utf-8?B?THh0YzE3Yk03Y09NUDRzUjVYc3FnV1ZMVlc3cmFWWlVncG9iWXhMWTlRUUN2?=
 =?utf-8?B?VDV6Skplcm1tQkJqWDJCQXZzNFM2S0tLZk54RTB1NGhYSkxjQ0VqdWJ2d01p?=
 =?utf-8?B?NUxZMzA0YjdCb2F2citodEl6bTRCRTkwVTFiRDY4UkpiZWFTaU1Vd1Jjc1FN?=
 =?utf-8?B?N1RmTFlSSzNWWkgrOUhyU1V5T3FoRGMyZ1ZVT1JYeFY4aFRycUV0K2d1TWg2?=
 =?utf-8?B?ODlkamZVQ0ROaUV1aEk5Nkx5RkNkdExWeXZscWF5c1RtT0kxZ2N1c1l2a29o?=
 =?utf-8?B?STB2RWEyVVlEd2R5QVMvQVFjVjE0MEk0d0NVbnBMOCtvSE00WGVTU2N6R2pM?=
 =?utf-8?B?SWxKSEZpdmFBMTZQY3JkRm14aUdvalVPbDFWZ3VYaUQ2QmdBbGhSNzY2Y3NI?=
 =?utf-8?B?RmZzdFNUaExmMU1tWm1pZjkwVzRhQ0FFNThmKzJYZEo0RUx5QThjRzUwVnpj?=
 =?utf-8?B?cU11MDV2cUtrRlBQSnl2TjhXa0tkSy90TlZtVkZwZ21aUjE4bjlUSVMvbXpJ?=
 =?utf-8?B?ZEcvTC82MytSampNTmxYODNWOGU0VWFEWGZINUNQTUxnVmZYRXVXUFBNVnQw?=
 =?utf-8?B?YUErRlFQOHBTN0ZzdWpJMTVSZ3lUSkQwRk5BSXdBZDV5RE8xTHhnMFM2QjdF?=
 =?utf-8?B?Nm1GWFQzQ0Exc0VHeXBtR1BwbUxXbGh4NVdkWE1qNW1vQnh5aFBZVVc2L3Yy?=
 =?utf-8?Q?qO9JkH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2pJNTBHVEllTU0rYkhXWU00YXpsaHZJZXZMWVJHazhqOE9ucEdicWFOUGwz?=
 =?utf-8?B?bnIwcHVuSmRvcGdlZ3libEwxdGJXUnRKU3VCVHlDcCtqMWQxYjZ6MHNiTVZR?=
 =?utf-8?B?RWFnK1lMRmlGQ3UwZENwWThLbW52Q1B6K1RZNy9pdXVINVkxUmRJM3B0aTA5?=
 =?utf-8?B?UUlWdTZpT3NtYnhHUE1JNVJmWlNHcWNZQUQ1emxjZmRwN2o0L2J4OFZtSmpN?=
 =?utf-8?B?UUFGNi9QMzR4K0ZaWjZ1NlRObDRKTXRJNW8zcnNVNzVXbjN1YlpSUVB5T3g0?=
 =?utf-8?B?UHBuRzMxaktZTWVIcEpkN1hraURHYjVuZ3h2KzB5YVZEZ2c4ZFE5WTBVRzFT?=
 =?utf-8?B?czFaWWJZWnY4akR5aXEvOEdVQ0FVYTFFSGdmOFN4MXVSNDl3QUVrVktubnYz?=
 =?utf-8?B?a1FNQzJiMWhSbGpDSmh1YWVmYW1TM2ZUa0NCWXZqdFZCdlpYc0g0RTIybkgw?=
 =?utf-8?B?QnIrY1V0ZzVsOStFZTdCM2hxcVJQZEY0Ry9WY2E4dXU0UlRwcWhEUUo5WU1L?=
 =?utf-8?B?RmtPemxnMkxTOHAxTCtRYk44blRhOW5TQjdrWnhDTE5VeWQrZ0JSZTQ5V1NB?=
 =?utf-8?B?TGFxN1JMUGx3OWFYT2l2NVcrUmlzNGFjc3k4QTdaU2hGajRpZjNTbURkbGRo?=
 =?utf-8?B?aENqY1FTNGxkU2UzSTBzQVhFdWl2QjhMTjEzd1hubzB1UXBJUlh6U3BFTnRw?=
 =?utf-8?B?MzE3MUgrMVVOdnNZRFRvUmIzRWZCZUJhdVhMclRLVXRGanJZME5zd2hEUWQw?=
 =?utf-8?B?QlZUdDlsWkZ4c2VvRXdSeGhSb2NweGJXWEVoSTljR3FaYzNiVGtOZHVUdVVt?=
 =?utf-8?B?YWwyS0tIaUcvd1BQKzlnL1J4b1BjajNLQ09ML01DVlVjMWc3VGhuTDY3bndL?=
 =?utf-8?B?NW0wWlBvRDJRNzhvQ0NuSTVxZzBPbEJHcVdIejNEMXQ1NktCbkVSeHBBZmlw?=
 =?utf-8?B?T1dCYjF4ckdvWUZCYmZScmhJNU1BODJpWVplZWMxNUFkNzNUVzd6QWF6Q0U1?=
 =?utf-8?B?Z0w2VVNNejN6amdhSlh3TmdKYks4d3JFeWNiR2lLZmtDMHJkZUxKdE5kMUNZ?=
 =?utf-8?B?ZGFnaUNsRTJzUmJVM3ZORldqS01sVXRta2lzQlI5ZXVhYlpvZGorQ3pMcE91?=
 =?utf-8?B?eG1zWSs2ZWE0TUovd1p3Qll1SFRrblQxYXBrV2hGRDMvc1NiaWhJMktPMEhO?=
 =?utf-8?B?eVFPcGpUUE9RV1JvckZUNlppZUY5cjhwMWhBTGhWTGJQTkhkK2Iyay8wWStq?=
 =?utf-8?B?YnZDU0V1TFBCdHRkQTROZllidWVISk41Nkt4bWFJbFNEeVM0eEhDUldIOUZh?=
 =?utf-8?B?WGY0enhSSnk5Q1F2eStnYmJKVTJBRDk2RFFaSVFvdW0xK2R3L2hJV3Z1bS9J?=
 =?utf-8?B?a0pWc1ZWbUxrY3luTTVUbEw1RmFmeDJPMWV6SlBaL05BclZCc21MQ0JPVnRp?=
 =?utf-8?B?RHdWNHlqakpmTkJaZCt1c0dtU0Ywazg2Z0gvcFFST0d6cUhlSE81ZG5DQXJP?=
 =?utf-8?B?eGxMcGl5dytGREo3VWpYODJhak9OWUhhT25RS0dzZHRMUHJJanRZOE5EcDZE?=
 =?utf-8?B?QldNbUQ3YWpKeGw1d25zRG1RUUtLY3lIaC82Mmc5a25iamRscXRpTlg2cDVD?=
 =?utf-8?B?Vm1ib1RSVWVwZmhNWDZWSU1lbTRScFpOYUN2OEVuTmtTL2VHaHJwUzE5eWZB?=
 =?utf-8?B?UXpwNU9kd3ZhZU5xa05BSXhBdU1aS2g0UFlXZ2FGYUQ5YnhLT1l4SGd6RnFm?=
 =?utf-8?B?Y0ptUm1Bb3cvbWswSDJ6bFk3SnhoYkhhbSttcVZiSTlDMWlKcmxicTVRaFZR?=
 =?utf-8?B?OWlsQTdTMzBMZHhFcGVwVGNiWHdId3c0WEhNWXVXWFczazczQ2ZaUnFZeDAw?=
 =?utf-8?B?RjYrS2JYem1PMzdhS25yV1FwUlNPZStjb2hqY0luWFlwTnpKTWYrNThQVkVB?=
 =?utf-8?B?dHA1MElwOGtndUZIdTlteFlwNFV2QUVLTU9oYi9rdS84VlZ1UFphNkUrV2lG?=
 =?utf-8?B?R2NYY3NuK0FaRi9nRVNkMmdSSkg3N2hRajFkSFVCaGM1aURQRXJHSWhxL0lD?=
 =?utf-8?B?NTlpaWJjNURkRm92R2FpZE5jelF2SVVnd3BpQmh3eWZFMVRTUVRJVEdPMzZ4?=
 =?utf-8?Q?gDWG6hfXYL895D+slB/EUZ4IV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f364701-8295-48fa-b07a-08de082de7dd
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 18:50:39.1169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1vKHQNKYDmT+63mTzRQ0K1wRYNfNzUs2JUx7p0mEDh0yB9gSgLiez/Re1vdkhc2L633rW9ppdS7MQNdtq4KrvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

There are many below pattern

	fun()
	{
		...
		dma_map_single();
		if (dma_mapping_error)
			goto err1;

		dmaengine_prep_slave_single()
		if (...)
			goto err2

		dmaengine_submit()
		if (...)
			goto err3

		wait_for_completion_timeout()
		if (...)
			goto err4

	err4:
	err3:
	err2:
		dma_umap_single();
	err1:
	}

Use cleanup can simple error handle like guard(), such as guard(mutex).
or __free(kfree) = kmalloc.

But dma_umap_single() need more argurements. So situation below complex.

It need pack argurments list into structure.

	#define __DEFINE_GUARD_CLASS(_name, _return_type, _list_class_fields)   \
	typedef struct {                                                \
	       	 _return_type ret;                                       \
	        bool    okay;                                           \
	        struct  {                                               \
	                __REMOVE(_list_class_fields);                   \
	        } args;                                                 \
	} class_##_name##_t;

So save all arugments to it.

__DEFINE_GUARD_CLASS(dma_map_single, dma_addr_t, (struct device *dev; void *ptr; size_t size; enum dma_data_direction dir)
will expand to

	struct {
		dma_addr_t ret;
		bool	okay;
		struct {
			struct device *dev;
			void *ptr;
			size_t size;
			enum dma_data_direction dir;
		}
	}

So cleanup function can use saved argurement.

The above fun will be

	fun()
	{
		CLASS(dma_map_single, dma)(dev, ...);

		...
		if (...)
			return err;
	}

if funtion return, which need keep map,

	submit()
	{
		dma_map_single();
		...
		dmaengine_submit();
		if (...)
			goto err1
		return;

	goto err1:
		dma_umap_single();
	}

Macro retain_and_empty() will clean varible to avoid unmap.

        ({                                  \
                __auto_type __ptr = &(t); typeof(t) empty= {};   \
                __auto_type __val = *__ptr; \
                __ptr->okay = 0;        \
                __val.ret;              \
        })

So

	submit()
	{
       		CLASS(dma_map_single, dma)(dev,...;

	        ...
	        dmaengine_submit();
		if (...)
			return err;

		//before return;

		retain_and_empty(dma)
	}

This series just show how to hanndle many agurement at resource alloc/free
functions. Only show dma_map_single. If the over all method is acceptable.
I will more define for dma mapping functions.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (3):
      cleanup: Add DEFINE_GUARD_ARGS_CLASS macro for resource alloc/free functions with multiple arguments
      dma-mapping: Add auto cleanup support dma_map_single()
      i2c: lpi2c: Use auto cleanup for dma_map_single()

 drivers/i2c/busses/i2c-imx-lpi2c.c | 13 ++++---
 include/linux/cleanup.h            | 73 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-mapping.h        |  8 +++++
 3 files changed, 87 insertions(+), 7 deletions(-)
---
base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
change-id: 20251008-dmamap_cleanup-d0a7f0525a3d

Best regards,
--
Frank Li <Frank.Li@nxp.com>


