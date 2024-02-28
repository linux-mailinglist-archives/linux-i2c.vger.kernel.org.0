Return-Path: <linux-i2c+bounces-2044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAAA86AB52
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 10:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FF9128734F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 09:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31353307B;
	Wed, 28 Feb 2024 09:32:43 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2123.outbound.protection.partner.outlook.cn [139.219.17.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9831A82;
	Wed, 28 Feb 2024 09:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709112763; cv=fail; b=EiQ8yiz0iHQhP0BBNfeVZS2iw4tEoM39wrCPuTJnN3OSdQsHqMEgCafOCcQTX5FFILHsv1Eb9YceJxfefobqfpvDMSqNnnRaXwfc9drY4mltZiYHP8R1dhEUWF/c6w7B1KCBREv4IJT8oiZczQfVz2SjbcElcMz8PvnV1qp9BPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709112763; c=relaxed/simple;
	bh=Ktp6i+vzAGi9KMS7ElSt/5gi1mSyxkmW6NMcocHoMho=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IUqOUIwCTQfAC1htuiNME+06JSnPA3DdZucggQiynKp5Q9TkQiAKzqzxtIQEEQjc4NTJCaH1aiHnzC8qqTqPrqYsfH9F6WnLD1Br4p2yZ+LS5GgVZH3jrjUPgAYB9LFx3r5MiQetrWR6psD4s+7XNe+V2Vy/XuF+K+a7nbWLVSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bznelYdTdVO28lKKdHuysGOm8NnHec3ntixHIv4sGccnX9curlYJLKGeBm+3gKUroVn3S30gB+rmj0L76YlvPfRuJZQbNYlkp9kJpc980teKQtGFVMx+4y/9o3HOr6hmT6qTihC6687cKg2B13rIjs+MJ5VxKHnPiskEzZOEJQVSIruergN7bTFOU+NasiPAsyX1hgzqh8+MHIAxvopqsNpavsXOLvhIppGBdW5kWJ46+CPZZwFUR3/5/ZNWR/V3xmcQU40U4HF6tri5H7rrCRk2Hy1uv3DYNJKUNomx1Bqqy8qoLZGGW7PwJmgkIM1kDUjC1d+dgP0FK9QIxZP+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8p0EvvubVnMbFoSdHvAeJxsEmdSrtjrVA1r0BbscUjE=;
 b=mzNnAovUVEQ5XKfMX8XEHI5yxiWN8awqpWmlZcNKv3pBu8Sd4PxiGrDy2xSuG4H2Crb/hsoVCWiCokK6YJF3e/A5oPQNLVGHBraAro5WR4GNQk4eKFy3TL3iOm35g9TPr/54cfcr7XiLs1/bKxyNuQ6vSXiNWt0K6SCdZVtyx8+9Y1RYoEH6Nae8JJ/P5wvTrbB8lZvMZ7TvUNS0LSBBe2XDTXn0GRV2J/bRhiG6+ZmzxN1patCn9Azd0Qx0WnjOzDwMQ33kNUYPepBAy6Z0Y4tMiyJsqyj/cm7gFiLPMBK68oJkI857HuH6Oz3cDTLHe5NgTSfc0GVDC20hfNYl6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB1158.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.47; Wed, 28 Feb
 2024 08:58:36 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::d0fb:daf7:3f8b:868c]) by
 ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn ([fe80::d0fb:daf7:3f8b:868c%3])
 with mapi id 15.20.7270.047; Wed, 28 Feb 2024 08:58:36 +0000
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eng Lee Teh <englee.teh@starfivetech.com>
Subject: [PATCH] i2c: cadence: Add RISCV architecture support
Date: Wed, 28 Feb 2024 16:56:13 +0800
Message-ID: <20240228085613.3935476-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0011.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::20) To ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB1158:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c8eac7-3e79-4308-6228-08dc383b730a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WfLYuLluDrdPc1+t0okHBLwtIv2/xs87APQj2pbj63TM/b8Vkyl9g5YWk/QLjFz7EvanQ0Kg9Lz2WtwqU4v3Wx1y8cKxglUpJPPWpFScUPzgIwLpIYBlOaQfcj+jrOr+wck4M2ZGcyiCqgsqyIeEzv6FZIbMwm5RATgEE6s7COp/ESH1eekBtjKork4Gg72J+Gd7voLcTvNa4UD3IowXDcggiyPIiOtBhjZy9c99jVhh6JpxjCN5aIrHLjhoK2M/ROEz1GZlYe4xkp4BxX7phHXvmPHsa4MvEibhAuvASLnFGqNUvZN21rdnKfWK8VrDvSXa+ZrmS3kDHafSbAPdVtPoJ2+JTgRW+hutTVEmsjh5Uf6QRVrcC5qFlLEXWPB6Xzam4bpVRak73UKY8xu7so99l747nnmQqIy9zzUfR55HQlU9MVVWeUNqZYkaj0WZs3Md++GZIWwOEeYM+H4neWcU0Rj/o36Tz/ClxQYcP1Ny5XpbWwTe7Ii8vuDF0ufMW+KaWHit96KluLgOC5qwgyg/qBukDFjXIaVP0NGTkPKMZO5qTQU2s9IWEYVpLPAJ/0jJZIfMP6Wb6f3EvNUi4DoX2Fbr4AYlHpp6PeXdVK50r0/2vp9WrfdWLpaGGMB8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2cQZGHsie/yf/nGIZka0gokeIuWnUAoSZhVLpfDErrnpoon3eaXXedq3gAfT?=
 =?us-ascii?Q?BurDadtf4pF6IrFRoqNkaCSr2m3Nkz/YjYYHo3YGg/qn5wOD5QvXQo1W3YL+?=
 =?us-ascii?Q?iAPN28c+ZRPmpXdJyu8IFlSxF0spcgAuoB7LHH220Q8h6EXdmCnQuktKk/pr?=
 =?us-ascii?Q?rhpOpGFpxVjbHejueT9bqLB+fBH6Bapp63ulaH65e/LSwVCFLF8H28HOChJ2?=
 =?us-ascii?Q?FHtuKetSByZoHnnqdK9li4TuyW59dhySDbuRm9c1zLBG6E3o62V5g4Rd0pVQ?=
 =?us-ascii?Q?f42DBp/Ocz5prdMnBCFLdcMTHsT9CaJtp/HlCfeMdT/4Jbkr/noWhjAStbas?=
 =?us-ascii?Q?wZ4uhHOkN3hH25IBEvBpaOYwZMa8CFzzFDiyQNF+sMRY26dzkhJUzSOngq0E?=
 =?us-ascii?Q?aTSt7ZeuDy4Vor1oGaL7h9LuSYLPiF2J4Kt+shqZ6ksVtPPT/zvdX7Q1EMA6?=
 =?us-ascii?Q?n129kjNLAuwJU3V9hbO8nL25fYsW0qivHLtBoCFSuR3wPb7yxlBETnJybguN?=
 =?us-ascii?Q?wuaGsztbPew0QnuIkI1uKsfWp7BSeG0TkgK28RoPzP9eRyaO8g1EbvRy3bqk?=
 =?us-ascii?Q?RMEB3aPVzCXFTQQO5+ZJUOOnmJGrGc9Kiew79/4RCqusOr3waFhUX/GzZdoS?=
 =?us-ascii?Q?QruVnmFu0B+X1FcKoW+YDwuDTZN/5EogUQhzIa4Ie157boUK4dc3Y5hL5ncH?=
 =?us-ascii?Q?QjJn/H0sQBmQqEzaHh0NwJRMUO73fnPBI+7rLu41rahfdimYMEoYg6czqvIc?=
 =?us-ascii?Q?TpP5RCl4B3KoN9R6rx2fVFMPn9dwkU3bfU8lz+iA4KafBTC45QJvMkSWr9IX?=
 =?us-ascii?Q?4bDZ38PyYwQ0syfZn5eTGIbKhtWYUCA1Lu0qMlvz1fMEYp7j+HvdYGrpdVv0?=
 =?us-ascii?Q?hvPKrNilJbMem9dvyyv4naZH8Zpjnu8b7hKJ/witr6wOouWe+3isRDCG2JA2?=
 =?us-ascii?Q?SIn1Iz9j1LrNYEs4fXTNIPXOnADZBSGQ4YmFiblmv2v+JPzA1b3E/NIjOxls?=
 =?us-ascii?Q?V+j3vyQqyPkZofKWKx/olg3hKSbgM4R9vTd9Tn3EucpOwi6pdrHNEG0rGNW8?=
 =?us-ascii?Q?AzbujQ/esgGSXF04RbVG174f/I7sDgAmhEGD7VaqRMy7WE8PD/Nk5mIsMXHu?=
 =?us-ascii?Q?YpcrQWWCISv2rnhLi0l6YRSRCEsQcvHcYiRyXnqMpHkBPn83yJQxLf0hRBbL?=
 =?us-ascii?Q?c4JUCo2pSvPLmWnlrSkRh2zs5/5bK36tXjF6rJmHwesE8GLFV+lmvb+isNY5?=
 =?us-ascii?Q?woubT6IEaiOIQxqWE7Ukd99gZDu0pbHWbipo66LIwzXEoEKgbr2bmfBLDVzI?=
 =?us-ascii?Q?W4Ghe8Wi7o09vjJnQARo9MX9GekrhLQSubpy/phyxlqLBquRPlQO1aaHZdSX?=
 =?us-ascii?Q?pJbU+gxf4t9/Apruh7J1BIPxkTTRexBk6nWksC4CR0LG0d7iBOCZmkQzG+Ae?=
 =?us-ascii?Q?soAkpUechSEk4x6qFtWQpmGSmVysCRD9UkkC/dX/FA0y2CKE6XvC1LbbA8od?=
 =?us-ascii?Q?cVXVMHUz2q0nh7OgyAkPpGTFOTz6t2N+75lLW3WIH43eF+cbEPKRYhBGQic+?=
 =?us-ascii?Q?mDrZtO11ajMjF4lUqi7Ft/u4T2dLqsOvoRtoUveTbi7S8GqM75alfH5OlJah?=
 =?us-ascii?Q?uA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c8eac7-3e79-4308-6228-08dc383b730a
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 08:58:36.6217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6jQkzNpSinx3FmQzWKhD/CIN3Q2K3+C2SEQtBDd2CJY85/050vVOAmGpK5M+u6cmmC5e14BJ6RX+Sh5qoYqPjAGrImbgWRwRDx9wg+dXNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1158

Add RISCV support to Cadence I2C Kconfig which is used in platform
such as the StarFive JH8100.

Signed-off-by: Eng Lee Teh <englee.teh@starfivetech.com>
Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 28eb48dd5b32..0f47413ce7b7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -500,7 +500,7 @@ config I2C_BRCMSTB
 
 config I2C_CADENCE
 	tristate "Cadence I2C Controller"
-	depends on ARCH_ZYNQ || ARM64 || XTENSA || COMPILE_TEST
+	depends on ARCH_ZYNQ || ARM64 || XTENSA || RISCV || COMPILE_TEST
 	help
 	  Say yes here to select Cadence I2C Host Controller. This controller is
 	  e.g. used by Xilinx Zynq.
-- 
2.43.0


