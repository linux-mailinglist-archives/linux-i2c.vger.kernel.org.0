Return-Path: <linux-i2c+bounces-13381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 57866BB7896
	for <lists+linux-i2c@lfdr.de>; Fri, 03 Oct 2025 18:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 37A324ECAAA
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Oct 2025 16:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ABA12C0295;
	Fri,  3 Oct 2025 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AxRm6UIm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051842C0279;
	Fri,  3 Oct 2025 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759508835; cv=fail; b=O8Q2ZoQkp7H8IWCXonxHG+wKs/C1Ty0gAUh0iqh0We7c/nlaQppLarmaCMFntIIpaA4wmR8eGocPXWwG9iYLxEx8cfr9PFhojgljV9f7fu3ayQkBWHlhDoxKLXeuwfLP5GhPKgjQMEX7Kpwwqzyvb+gmL4RGd7ZkID9DxsD2sRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759508835; c=relaxed/simple;
	bh=9hRNmFUGkpEs79B7wIx9mgOi50lpwgOEIpOI2D5ec3w=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=BfuDQ/zIXGtSMyXsYRe3VlUKbhnlQxRM8vNUQNYDBq80TIkjzLR5jE9jwYoejokS1H8b8bzAUgw1vOLqnms7A1T7RJ+QxkeToj9IUZcgRNQwSIol7QBKeyvtOE8JYHqavRHq2TSnp81l5MM7is3Gh0fAmFD9f8yFoICf7mVOGPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AxRm6UIm; arc=fail smtp.client-ip=52.101.65.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BU86K2WfbswGUm6ioNkhRFAGNhfUzqt7TI7jJNB1qUAI1+W9rCcPWTFadxZeexyIuWxhLwtlOiBoB4q8BLzVqIIFzvUM2H/u4mFv1R6ekRnPMF3NtWyIgR1VQVlPTRDKUtSlwoHIof3AhBuNsYBy/s2A3i7gn2+QwKGO1eY6ImTazF/flK4+bBw7laKQhDeEJ3zI/IvFyHCNC1wzDjOD13ThL9EtfFh6bh+yLkT/pWt442KYbrBrIQOHB+tPpIg8EenSGRRJmq9NddRbGeKjak1bGiLrRqgXPaNC3lZXgqVaremNblYb+LFkdJgGxE8CZ8DBgHWFh03IUhS8l5Os/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrrfgGT5EAQVYB1E4afhajuECdqKu7yrYFliW3XeYXQ=;
 b=JozjzhxPrfwVqc44YSY3Otrud80U46vlHsRR8LEP1K9YwoUddu3bfLuEctC+j9dE7TnwEitbYKBZEZxfrWGfBWTLgfl4wG9odnrwuDALSE+H6Osd+czRcHas/1P5jARMHhTAm+jh8Xj6CsdZ17PNLRqM7IS5a9ykJ5eygOrJ7y3sL0WSBHfO/ohnrkPlxV6JHk1OYMaqazHuyjvKiI/wFPm4edifX+kRdUF2HMR45tkiKjOCznmL5wSyaTV3JM5we3CSpQpIOPTup2KSrRF4nM8GXx6i6JxpeSNfB5MtQ15XdKckx8hpcGWU5PHrsRxTxI0j/eIaTEqsYIh/fjEEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrrfgGT5EAQVYB1E4afhajuECdqKu7yrYFliW3XeYXQ=;
 b=AxRm6UIm7Ya87U3YlqjsENC5SScQVnUM1Q4sNfk+Ql661Eq1nRpxsHfulTft5iOAQ2rfQT/6VvKGjkTbI9O02vYUwsdAHJ0aBB+rto3x1+qN8iQQLbeRojhIU/6YZr65sSFpZYFejlmW2M4lL+biEgrrwRfCsFYDv7sAHrtyHIzt3S5LF/etcqrwqaBYIFyJY/YfmjKk03UrXgaT2v5CjKESZkv44vxPMf2ANCVZ9vbYm3egSpmME8JyC74r10+B8KQ4pq508MBQGMogwNbChMJqvy2RNSbdKYEE+GOcsLhBEWLYFB6iABbBoJEwc/huTwNaeddFQYE8Vf9Oh2gmzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV4PR04MB11331.eurprd04.prod.outlook.com (2603:10a6:150:29e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 3 Oct
 2025 16:27:05 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.013; Fri, 3 Oct 2025
 16:27:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/2] dmaengine: Add cleanup to simple code
Date: Fri, 03 Oct 2025 12:26:48 -0400
Message-Id: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEj532gC/13MQQrCMBCF4auUWRuZiVGIK+8hpbTJxGbRtCQSK
 iV3Ny24cfnP8L4NEkfPCe7NBpGzT34ONeSpATP24cXC29ogUV4JkYSd+m7/dC4yC7xo6RSispq
 hbpbIzq+H92xrjz695/g5+Ez79SfJPymTQKHs4IhuRg6kH2FdzmaeoC2lfAGPTnZxqAAAAA==
X-Change-ID: 20251001-dma_chan_free-0392f4004d9e
To: Vinod Koul <vkoul@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, carlos.song@nxp.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759508822; l=1522;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=9hRNmFUGkpEs79B7wIx9mgOi50lpwgOEIpOI2D5ec3w=;
 b=zYktNMsOlAxn5PdRaolDfF7UXGI9a8r/5dG5PzQIWfltOBSR381k9j4DQu9TJS7BElYGNX48c
 85CEmi8gm1QABBIPFgomwSy/7OYvOM1GFWl3Am8U7w41GrFT2EasO2D
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV4PR04MB11331:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa2711e-b993-43ab-dffa-08de0299b0ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVEwa2FBd3d2WVVYbWZWUm82L3VtTDZFdTAyb1pUQytZalFpUTcxdzQ5MER5?=
 =?utf-8?B?c2hlY01Dc3h5RDJiWGJoaDNhZTYyK3F5WFI5L28wUmdOM1NhaFkvUWgwY3pU?=
 =?utf-8?B?YkRPZ0VWRHFXcjNQM0pYaStZUzhvdURFZ1BhY1Q5akV4eW9jT2ovbERRb3Jn?=
 =?utf-8?B?UzMwS0ViWWx1UGRPa2FlbVNTL0h3K3B0WE94YmxKQ0VDcnR3SW1HR1RqWk1l?=
 =?utf-8?B?OEpkd1IwN3pyY1poZXh5aEJEZFpxR2NmKzFxL1Vaa1VTdFlKV1pYTVkzaldV?=
 =?utf-8?B?MnlNUk9nMDdxZy9rRFRYczdVVWVDdWNQUVdra0poSy80WVdIbFMycE9SZHhw?=
 =?utf-8?B?eWJ6ektmZ2N1Q21sQ3lQbE5SeXFHbHBHMkxhNVNNUHN5WEljTGlwSnhFVStR?=
 =?utf-8?B?amtyay8vTmRZNjhONDkxUThaWi9wN3VwZDlWQ3c1VFpZdmF2a2dIRXpDZml5?=
 =?utf-8?B?Yy9JRFkrZ0Q4NkRDaTBrTC9DaVdQNzJmY240V1UrRFFzZzNqMitSUGFhV1NQ?=
 =?utf-8?B?aXlHTEhQRTlsU25mc0o4aEYrWUYyL3pxVzQwaTJxMEF1T21GMVN1bTlkcytj?=
 =?utf-8?B?SWY0WmFGVG1PTC90a3Fqdk11VDIvY3Q0R3hJTmtIa2YxWG1kNDlTNVBSVEw3?=
 =?utf-8?B?VzlGMHpoVWpDcE0zbXNwdUExck9XTDZlaEdha3YwdW1CT2JNMHZidVVMS0Jp?=
 =?utf-8?B?eEN1cUpYaEhCTlNDTUJPdTR5djdadlJ2YU9WUGZZalpTc3FJTDZ5TkFySmRB?=
 =?utf-8?B?ME9zVk1Cd2U0N3prallVOGZPaERpRFZrWStFSzhFQVFRcUNHNllDUksxa0xK?=
 =?utf-8?B?bHZOMjZuSFJXZmo3ZTErQ2N3dnhINUNEQ1BxNVJCYkZDandTQTVscHRWbkpC?=
 =?utf-8?B?SDlZMUMvTklrY0xjWDhBbGpSY2FjcUt0LzNHSFNGZDNZb3VJSzJXRzE3d3I4?=
 =?utf-8?B?UzdFM3NCSDRNSHdKM21JN1NVTUtYRHhralFncDFGQkg5c2tpa0I1Nm1CNWJW?=
 =?utf-8?B?ZStkYWxqVyt2d3VLZ3dSVnB3bm40bXVIVmNHdkM0QkJVT3Vjb1JWUVgzUFlH?=
 =?utf-8?B?eXlIVjBOdERjS0JpN0FWMGdpcUMxalhTSUYrZnJVZkhENUZGYktMMkViaGZN?=
 =?utf-8?B?dDM4Z0NDZ2RNWlBGbUhodXN2dXM5Wk1FdzhMTW5ucGo0OFJ2QVpjaXRITXA1?=
 =?utf-8?B?dW9CcVdNTzFFWE4rTDBuSm5MMTVqZ0lENGgyTnB6ei9jOHc2ai8wVUZ2Kzc4?=
 =?utf-8?B?VlFBVmxzOElEQTA4NU1HUkc3K0ZSTzFBVW1IRVY1Wkg2UkNFOHBBV2pPTnRY?=
 =?utf-8?B?dTF6d25RdG56em81YXhJTnp3cXJGSjM2S1lMUmFBZWF0b2pqbEoxYmorQk9J?=
 =?utf-8?B?YllSWE5KQktQMDd6SWZHUU9wOEJpdFhEWjJyRURYT2FLL1R6QzZLeVYvcHhj?=
 =?utf-8?B?dE8vMkNYZXNvNnNuSlB6Y2orMm5lajdBR2FSL1htMkN2MWZiaWRkR200b09t?=
 =?utf-8?B?ZHdlb0orTXduR09iWWFkSlhDWGhXazIzWng1d3Y4ME1IK0xUeDhubGxXaHFD?=
 =?utf-8?B?TFpQQ0o2Y1BrZ0JpTFRUVFBjQXFaT0RzdC8xTGFiRTQrRTJhRXJpby9UWmw3?=
 =?utf-8?B?MjFZaGVrN2p0NkN6YXA1RVlZYlhsL2g5MkNwcFY4ZVBOTHdHWmJZaDRaOGk4?=
 =?utf-8?B?MXVKVWlFVWZhZGwvcDcxZEN6VnJ1SXMzamhBVXFGd3BKTklhdTZYMjNSMlRG?=
 =?utf-8?B?U3lEbmtZZDIwVTNOTUFpZ2JPTHFSNGFOcnBYWUdwWHFacTlOQWVSMWQ5UHhC?=
 =?utf-8?B?bm9ZU0o4dkZBc1VSZ2xhY2V3ZUZBamZqYklGZjBEcnpXMzlsbGMzZ01mUVhk?=
 =?utf-8?B?RmROUUcwNU9qeU5oaHdyUkFWTHFnSmxJU2VkQytxTmgzdFJrcm13SlFOU3Zp?=
 =?utf-8?B?ZE1YU212TnFYQkNsM0xxT3VpUG1WZzU4c0NiT0E5eDRtTDVXRTlhRXlMNDBW?=
 =?utf-8?B?cWlhQ1FQZ0ZmNzZOc0J3QkRiUGFrMHFKVDIrVlI3a0trUUNONEtjUlRLN1Rh?=
 =?utf-8?Q?bm0rDF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVFRSmc3Znc5TS9PeXYxZXM3MDlsbTJxbjF4V2RVN3NmV0JxWVBXRCtnb2w1?=
 =?utf-8?B?QTlmWTJKZTUvRkdhOVpFWWZpMVdrbHBPaFFkVS9QS1oyYVdwTXZ0K1pJaVYr?=
 =?utf-8?B?WEFPQ3RUZFlDeVozd3ZWNDc1T1RrOUkyaEU5RjgyZjNTZ3lrR2pVdnAvQkx4?=
 =?utf-8?B?NFBEVHVVZDFZQ2FWN2FVN0VrQ0tYeTFEOHBIanphZlZYa3FiSzVsVndQeEx4?=
 =?utf-8?B?UzhhejdYWEVMZUpaUTB4RGFFb2t5RjAvNjcwaGpjalJIa2JmWTRWWEV6azQw?=
 =?utf-8?B?MXNqMFE5T3hmMms5REdmL3BLSTlwUjAyZ2NlSWNMTWNPZ1ZZWmxkUnVPY01M?=
 =?utf-8?B?aXJ2WnpzTnovN3JMVVBMaWd5ekxVVnR6WlI3RUNNSEFsRExSK1JtejRPa3hN?=
 =?utf-8?B?WHcyK3FTdjQyZGU5N1dZNHF6d3NNVmswYUt0OE93VnhTSTZ3K1FxemcrUXN2?=
 =?utf-8?B?OTNBSVNuMzJiT3gxUGNjQ0FmRG1sSC85eU1iWFVFbDNVYVVESnY0a0xrbmlV?=
 =?utf-8?B?c05GVndNVnJ3VERteklORWNTKzM2KzFpa1F4VXFkQVFZUnhFTVFlNTd3ejR4?=
 =?utf-8?B?U3NQdS93Q05nM01La2QvNGxpMUs1UGJuVlh1SnA0Q2wyVm4xVnAzdk56MSsr?=
 =?utf-8?B?eUZOYm5UQnpZSWZPbkt3clFGZ0k2UVFod3l0T2tjTDBmR1h6cHlvSnF3QVln?=
 =?utf-8?B?WEJpZEN2TXA2UHkzOVl6NFo3NWp0VW1TZHZrSERQeUgwQ1JqSmM3VkVkVklE?=
 =?utf-8?B?bnhNMkR1bFh5YW1UdXVxMmdCQ0s4YUpscDVFNVZydG9YTjBvZnRMOFpNaTkw?=
 =?utf-8?B?SXBraDd5YmwrZDZzUGpNS1dlSXdxemxUYk9qZ3ZTTUFscG56ZGI5MnZ0T1dX?=
 =?utf-8?B?ZXZESWVXRHdZTDEwSTdEa0dNTzVBeW1PT1BnRnJwaFdDLzh0clBCWk94RmZx?=
 =?utf-8?B?MVhES2FmbGRmQURIUDBkNVhnYmdzM0xackJ3dHpOZG1kVUlJSStOc0hWdHN6?=
 =?utf-8?B?OG92RnlaRWxEZldDSHhmdEZ0TlpHcGdkeDJkMm1xUmtUNGRVZDhqOXFya0R4?=
 =?utf-8?B?Z3pDdDlMcktqV1JSNXlWeklIZDlQUzFneXJJMTFvbDd4YTBpbE43ZjJqUmRa?=
 =?utf-8?B?YTlrY3FKQ2FCYloxMFhlRjZBTkJmamhwd2M2Qnh5ek9vbkN5MEkwUjJQdEUx?=
 =?utf-8?B?Q0VtME9GaFViZy90SlduaWpiVTFHZWZyTU1jOVFBUk4zL0k5YzQySUtKSUFO?=
 =?utf-8?B?VFZQZENWeGc5V080UjlFWEx5bkg5Q0JsOE1seGMwaUdza2hWaTNQejIzeCtE?=
 =?utf-8?B?ZUFHd29Wbm9IMURray8rbnhTSmwrZTh0OG1yK1JFUno1MDE3V1RRWGw5dndV?=
 =?utf-8?B?SVVGbXA3ZmdFZW1aelJaLzFDdlVkRytCMW1qa0s2alpESFl1L09DQ0tZVEEv?=
 =?utf-8?B?VGtrTzBMUGVXNXVDeFFndFdHdGY1RURVYU5wODZRSE13eHNjZDVpbVcvWWtk?=
 =?utf-8?B?SUhySTdpaTcrb3VBSWFJb0xlcExZNnRiUE1JMUJpb3IxOVNhclZQU0JiSmty?=
 =?utf-8?B?SmQwS3FZZ3ZBTTdRSFY4OWNuK1dIZk1YMHlXdGw1a1YvdFhMOTF5UUlyaFR5?=
 =?utf-8?B?WlQ3SXV2QldOQ1pvbU9peDU3T3ZJeTAwVGJxTGxkdU83SjJ6SGlnZU0zNml4?=
 =?utf-8?B?ZFB4bDVGTkY3NzZZdGpMdFBUcDNmM2dwaFBHODJLRDViNlpJUnUwcS9NQ2Mz?=
 =?utf-8?B?NXl3SFB4V2FxTHgzMDZkVmFnRlUveGJ3VnpvOGFLVXN5ZU5Nckt0cm1XNmtU?=
 =?utf-8?B?M1JEb3FtWE81RGpLeTJ0dThQeVVJeGx1dEI1c2lQY0JJcjAxc3k0dFVYZ2c1?=
 =?utf-8?B?VDdJbnk5YmU5QWNFbnQ0dFRDYytCOVJoejhpeGY5end2VHhIdFJwM2QxMG1X?=
 =?utf-8?B?a2RjeGFWeDRnQnVKZUlHYjR4ekZZbDJseVFyalQ3SWpwMWhTRjEwRTR6RGxB?=
 =?utf-8?B?TUJNR2pYcEpxb3NabzVtdEp2Y0lGWVBlSzBCcEEzaDlieXMxVlJNcktwNmkx?=
 =?utf-8?B?OVV4eTR3Q1Z1Qk95VGtFQUIzKzlQZGtVSW9KZm55bUJFeEZaSU9qcXVaektu?=
 =?utf-8?Q?eLBM=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa2711e-b993-43ab-dffa-08de0299b0ce
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:27:05.4485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyO1Kt472/5WPKjW/hGh8vIZCPCEH/2DE0kjFjYt8nA/lXt5zprv63rBwhY72jlyB9m9b+qnGLnOJ2wtMJd+PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11331

start_dma()
{
        struct dma_async_tx_descriptor *rx_cmd_desc __free(dma_async_tx_descriptor) = NULL;
        ...
        cookie = dmaengine_submit(rx_cmd_desc);
        if (dma_submit_error(cookie))
                return dma_submit_error(cookie);
        ...
        retain_and_null_ptr(rx_cmd_desc);

        return 0;
}

To: Vinod Koul <vkoul@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: carlos.song@nxp.com

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- fix reduntant empty line remove
- fix goto branch in i2c
- Link to v1: https://lore.kernel.org/r/20251002-dma_chan_free-v1-0-4dbf116c2b19@nxp.com

---
Frank Li (2):
      dmaengine: Add cleanup FREE defines for dma_async_tx_descriptor
      i2c: lpi2c: Use cleanup helper for dma_async_tx_descriptor error handling

 drivers/i2c/busses/i2c-imx-lpi2c.c | 11 +++--------
 include/linux/dmaengine.h          |  3 +++
 2 files changed, 6 insertions(+), 8 deletions(-)
---
base-commit: 019ffdd87705bcef1ca5cf9bfdd2b358ce190ab5
change-id: 20251001-dma_chan_free-0392f4004d9e

Best regards,
--
Frank Li <Frank.Li@nxp.com>


