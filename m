Return-Path: <linux-i2c+bounces-12154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 508E4B1B122
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Aug 2025 11:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A298B17F79A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Aug 2025 09:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA9E2652AF;
	Tue,  5 Aug 2025 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="HdWbQTu+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3352673A5;
	Tue,  5 Aug 2025 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754386424; cv=fail; b=mfQ6QWgNnTNvUbVV38aq+mmESZ1WcWlstj/ny6YsKWY/TK8SwsnLM6j1dWKRORZs3+WOv7EbVqvXN94wK0XEOSK7AINERE48ClD68Qz6Jg2RPFCzYPeA4Fr/a4mkZkwlN3NiLEqYMhmUB+JgxrajKXD5LhSxiSmAZ6OMNG2Zkmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754386424; c=relaxed/simple;
	bh=tE+ET6tcAUQ+5HUm6MZ2eB0iR+uJqjWech3/BifZQwE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QWsQu2NTkW06ZPjjblaI7qTsfHTPNEy11SUXZRv0TFkaX2upPUBZlDvrPYqHYhy+OJrKebaDhgPNaPdHXQXB+Ym8A98EDtkCUo1TmSdMEaHLJ5P/SzrU77hTqKPTCpnVskXbkfPZRQ36TwWy+x/dKc37Yhm08Z3ibPBZUXokkPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=HdWbQTu+; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKDzl2q/VRMtKb7HwjlLKPU56W8FO0wKGVqmGRnixxKTwIn7Wn+BuSErXgMqxllQrhS++bZhO9XZzSCEzptDKowK9hiE0AhBJiEax0hosA7Z8ouCv5mj7LEhbVPfr20H18OVW4wZ1DMNr7xPQJahPjHLuuFnFvIiyT72HphhQiV78Bc5S3xIHhLW7bOsTgL1rhsMNnJWg66FNT/d4W9VNLXcnUudU0eZ9vKbjoRcEUEWRLwx7w0dWf3lgZQmvV6x+DguyElGT6iSRVqeHUTnDSSBP4Fi7tgx1CsFGwq82GB+Uf7bFpS2nFojHQW2hEhX910v+fPQkrBEWdD1ebU9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW0GCOPj+FfHlCmB3TzMCPgWyrr/0QMj9VLL148R4DI=;
 b=H8+eHhATObBEYO/PEH1Oj5765HEeHiK1ODztQ0dhDVyi8BC1dLuF2w5P0wrSt710EkwO3c3QbLIkvlOwALJ4PxA2UHLPLryvSpMoHY1xuXcyYO1s+LJEuLzHi0t++o0ZuOsdo4PS3Z0Z1Pj+UflWmFYExgz9Nawe13QrMhGZd2yQn2Qj8YJrBm8Bs41yxDY8bgPB13Iv1fh1ZiCdzd2nOQB8sgsix6iPyNM5vZj+gSZ9oeE+GbhTl/aNl22fmM510ZmjXIMl62xq59TR0iisMTfEiqk/CtBjXs5GNL4a7Vx0B41zvSjCbpyPyk6wWGpMAnFN+51U4fiWbtIbT3PD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW0GCOPj+FfHlCmB3TzMCPgWyrr/0QMj9VLL148R4DI=;
 b=HdWbQTu+C70O6UxRbq0sp+Be5pEN5sRcXSt3XO1W3FUFWO0X8Por+nb2PFCnaZik0a8YElieaTGs1qzHYlBSiClSRGns0Q0Offggo7NXUkuZcA1MoiftmxL1Ldx/3d/ozxy0/T9dV8HasL0R8mvjB53m17mO0XUg1novYKAdZng=
Received: from CWLP123CA0007.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::19)
 by GV1PR02MB11033.eurprd02.prod.outlook.com (2603:10a6:150:207::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 09:33:37 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:401:56:cafe::ed) by CWLP123CA0007.outlook.office365.com
 (2603:10a6:401:56::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 09:33:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 09:33:37 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 5 Aug
 2025 11:33:33 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Peter Rosin <peda@axentia.se>
CC: <kernel@axis.com>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] i2c: mux-mule: Remove error print for
 devm_add_action_or_reset()
User-Agent: a.out
Date: Tue, 5 Aug 2025 11:33:33 +0200
Message-ID: <pndh5ymm7te.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|GV1PR02MB11033:EE_
X-MS-Office365-Filtering-Correlation-Id: 3641344a-b0f4-4e33-4f1c-08ddd40327a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?45jH0LSikEfI6rm4e7Rl/kSWQZUX/sGrWt9XRJ9yJhYB+bI3Dq7/rZAY5cOk?=
 =?us-ascii?Q?0O0d2N/Zw1BQ83x0sat9LiELu80G8j874tC8+ZV53Judhdyx5609GAq3gTdP?=
 =?us-ascii?Q?t+boTYwzZah0gteb2voKBMxKh/YFcrfdQtIuWX60vGr77xi9EHBKHl34955n?=
 =?us-ascii?Q?nXft6ex6dCz6BsN97NYRhh76j2Y7oyDtzQ5C8tQwwKdzBFBG9A0afqRWxh4P?=
 =?us-ascii?Q?x7Q2xRiQEYaaxibmWzObEC1uJD4We9DKbOmE9aq6XXIqN4qno3L4sYkQk1X/?=
 =?us-ascii?Q?Ip58wxK5LItRfHzTZLDqX8NMBDtArpyVo4p8OqUPAmGNByiKP3nVqpYjyF2G?=
 =?us-ascii?Q?8ncykIBOwpvzwhlPIP+QBK8hr82uXuOx9b6QjRlu4SiMT3Q8rF47ihEzMqeC?=
 =?us-ascii?Q?SY8+hmB+Qio+oKYZR5YDsxe2xEGsxlyq6oFAXnS0Ox+3sobtR77IePhPChbU?=
 =?us-ascii?Q?gWNtpv5TI3fedSZuhM8w1op+6Ur0krUkK9UIuApirz+94pO1uaqBqa4ZHaBb?=
 =?us-ascii?Q?0RvBrd/ZYvNrcPzS3rqBG1SRN47UZtuuf8H/XBLcoP/kRPxHPMg2ksEEJ5tx?=
 =?us-ascii?Q?gGNhU8NbqHad/GgnUq/FSoquOVQCk59n8HwcitkjqHgob3W5E9kzmiWMScFb?=
 =?us-ascii?Q?OAliVB66ic9lSbZK2allm691HoA4ccFjPep6NduvL3dH6VF79S8F255iKWQ0?=
 =?us-ascii?Q?cSyqbcr33e07QJplxYmUNdBXafUdkpw154kNS00jqbdCKaeDnN3RYLos+qwB?=
 =?us-ascii?Q?gt9PYSGdxBHUQ8gwD/Y+y3IX+Hcoy0O1bMr3ObGdNWBPNXBAR9pCI5IvDVMd?=
 =?us-ascii?Q?xVJLgnraDcGnav9mziY2fMeuk02eWVChQ9nN5Dme58Wdt4di8OG6uiJnjCVP?=
 =?us-ascii?Q?iXkTkNnfw8xqGMeodK5iJk+hXqt/sey2w/v/KhLQyqU+cEfhbNfFEMcVFiIH?=
 =?us-ascii?Q?r1/M4DEltszdHT0qudt6lL+j0whjGW1+jV5az2ffE+9pwAqewoX0MxdV4vUG?=
 =?us-ascii?Q?LNOAo3pCK9TnEZximZQ1WrAwfZ3HRil4M9dMEQBxN+3BAaDF+zGWH/ZgSdUZ?=
 =?us-ascii?Q?nMSxib//xS204r/5M83efJCoTUtDP/AEjj3OOQA98Pgw506KgRZlm6ehWbDH?=
 =?us-ascii?Q?jITbwznmyRCEeB/qKYSePP40D3ijqQdxGJ+rXLi/HbZX3lJ1Rg73rrwfbavA?=
 =?us-ascii?Q?K5JAuLdFR+5Z6FO7Qs9LZdVwxNVMvhN4/lVMHd1INtuKMjWFiRmV172ayxF9?=
 =?us-ascii?Q?NEtz3STbo8ibGtTJEtMeuTEaQzyW6P4ZPDq4p2SoTl92xRCyf7zrZ55TFHJ0?=
 =?us-ascii?Q?SzaapCryJNSx3qdoNF5DrQCLGir5JWV9KIuPIaU4+lzFN8aCOB/EclmZ6fqq?=
 =?us-ascii?Q?NiZIC2y88WAgk6ZBhuCfi3JMqYs9xm24pUFkdm556W9I03rJPhrLsQpG/pHi?=
 =?us-ascii?Q?TPXiNT+wC81QY0ooDQpXGlEYR/1mZeGhssL0R3C2HRhNFiX8JQFjtUL9UfvG?=
 =?us-ascii?Q?r0q31vbc88pPfkpbHzvVBEzKTAi+xet1v/bL?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:33:37.1259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3641344a-b0f4-4e33-4f1c-08ddd40327a6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB11033

When `devm_add_action_or_reset()` fails, it is due to a failed memory
allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
anything when error is `-ENOMEM`. Therefore, remove the useless call to
`dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
return the value instead.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
Changes in v2:

* Split the patch to one seperate patch for each sub-system.

Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/

 drivers/i2c/muxes/i2c-mux-mule.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
index 284ff4afeeac..617ca058d2c9 100644
--- a/drivers/i2c/muxes/i2c-mux-mule.c
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -91,8 +91,7 @@ static int mule_i2c_mux_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(mux_dev, mule_i2c_mux_remove, muxc);
 	if (ret)
-		return dev_err_probe(mux_dev, ret,
-				     "Failed to register mux remove\n");
+		return ret;
 
 	/* Create device adapters */
 	for_each_child_of_node(mux_dev->of_node, dev) {

base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.39.5


