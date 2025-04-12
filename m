Return-Path: <linux-i2c+bounces-10280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443EA86ABA
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 06:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ED81166FB1
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 04:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D7D13AA3C;
	Sat, 12 Apr 2025 04:09:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2118.outbound.protection.partner.outlook.cn [139.219.17.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27C231A89;
	Sat, 12 Apr 2025 04:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744430994; cv=fail; b=K9giMl+bG2NPcDVYxeTH27zUPgN3iQ/+OzjZtCzw+1b5ui7E2M5pDPUOGIh1bG9BQ0SvF/1XE1PHdUaaxHBNjyMURilcLasc8i4N98tlqq3+I8CClODXyCIWGCvuTMYaUmt8Bfxm9cnsbvh/rXnN7jqnzLAwm/KITtVW1KSq9ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744430994; c=relaxed/simple;
	bh=WPvU+3oSdomrfY2Bx87+c8paCg4jvkPMmrQesPrTXxM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AGZ++CHFRXOSykh+F8o3LDMIbsnLKVoEA7dvehQUTKIoG0mbLWA0nLliQM7pyXh0Wj/URxR2WQaFESk+oiKAkfDEEnQ55OnPO30l7EApU98fUxO82lBd8VMh9Z/TzpiEoQ/ae69qepj40C6zepPYe48+pQCWeljU32coPMjxM+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1IWRV/ONwbuaM1TWZ/7ZbuFuyBso/JmcQX/hyDpvjjWKu0rzvjLLuDdHL9lbbdGpb3n13O88WFW0ucIvHcFKQvox1YqDTRbvoPF6ev/2Mbqn1Vtk3ogutZ1t7BDH4N5V5/yEM/w8WYc6hjlfa+ZDoRcklLFhQ9rM44mYY4aUJFmatBRpt9lcnoboRiByajXUh6IGsrtQ0uHNBmENtdfabkB8qTNmONz2DUATYix0/g+c0FdVmdfSOO3VlLm2UdQGACyZypOnyFI8BdzVZmFeWkyWzzH5qv3BZNkjdhJ0Z4iCsM17kku2fgYidL74gyL+MAmIHM1Hq8n21zlMGP7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7An5XqsvMWQ5Z7RtPeoET4czl/0Z69rdjoekG0DPtJk=;
 b=ax1OxkSHINQHEldavjX1L3OvY2LfTVDwrW58MmqZqRe7fN/VnC5vDtq8NJYyffbIFo4vTaD7PaLtnplH6LTtDgf1NWzKsOxw7aeedWgqfn/LPaXmGtf5b/lMAD6jbj3ebH6mX5B83I1hNs3B8iCx33nLieYwLvi5rjOohAanbscVhV2vBuNStiEnNcLwclOlemvQHYFJFJihTgpeJc++Jrbhl+d5OoBHcwkt8TOglDW9OyRQmR/WqXzn9JDAFGgkrWReeT6PsgU7CuoQEEL+SxZlHtE4JlhiX6JPAHAaUJJXjwUnXN5LE5FJPmhLsiVkzv4dO2uGcnrvGbBkGfhfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7) by NTZPR01MB1129.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Sat, 12 Apr
 2025 02:34:00 +0000
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5]) by NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5%5]) with mapi id 15.20.8632.025; Sat, 12 Apr 2025
 02:34:00 +0000
From: ende.tan@starfivetech.com
To: linux-i2c@vger.kernel.org
Cc: jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org,
	linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com,
	endeneer@gmail.com,
	Tan En De <ende.tan@starfivetech.com>
Subject: [1/1] i2c: designware: Ensure runtime suspend is invoked during rapid slave unregistration and registration
Date: Sat, 12 Apr 2025 10:33:03 +0800
Message-Id: <20250412023303.378600-1-ende.tan@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::15) To NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB1018:EE_|NTZPR01MB1129:EE_
X-MS-Office365-Filtering-Correlation-Id: bf868552-4fd0-4953-1964-08dd796a7b63
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|41320700013|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	12j9vEaI+5rMlfj8hHYI3CYk8o5C+1638LZ4TBM4aExYf/NBaHACLq5fPIFFFd+8GYzdCc88wYlH1q3wI50hYFgOkL2KVir1HCCExdIz+WNFcAO/b7z1af3hSqxNgyTJGpzzZ1a/1VgUNNjtrmbddPCtueTt1rg7S7nKE5AFvAlnX8Ny79gH0zGFVk/W7V/rzBLW1G0nyMqYXx8mSKcgNrK/OLbEJZmLd68A7Hsy6lePrFOxZMLPRcmDM8EjqvMS7uY6d9geCyWqvMRwfFyGBangiBt395aJPLyalY6SsD85ShLK2XAkHA7KTd9xiZCNvyU0S0arFsatvMMWspHU87ONFbTGHWWh78IrJfSq9+b4t3NMRUp3IBkjqZCkpnn4ODEXNKeAHYsW019LXosyxHZgabf1R5xyDHXMtmv9sbq5JLOmZ1yVjcpHeHGUYIVxoq+iympqMaDLPWIDv+yE5sGzZ0fhxconRmvqLwLxZhBDm3V7HGcQ6FpTvRnIn+ZI9+xVbYcgkK6NUbqJdXd8C8NiWrJ9ew+kdCo+z4ESOQvNlqCsacnflOzrRZyjJWw7cqi4f2AS2J2J0liGGMmh8fOR2svkOfMBDWJ357cPuWM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(41320700013)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uZvYcl+GIo2Ya8A44C3RjtqhllKndjW3F7wX4lb6Z0CSLzUqat9/Mu9rDhe/?=
 =?us-ascii?Q?mM00luRHrwknOiwiMOp+FbGxENwUWfueNEte9rZ4NjSxNSGsS1lg2Ibt3JTH?=
 =?us-ascii?Q?8zqk23UvtbkzB1jZ3N3L0YWfbcbImNX8EUEtHdyfQ7pSCw+qqdlfZTrtjyCS?=
 =?us-ascii?Q?yLEW2xnB47wNM1tKX7F/rJWpNwONAD2HmqD7lEm5Al5HoNT0kSCMh6SAumU1?=
 =?us-ascii?Q?xZFtyQzuXvA0KvDcHIo9S1N+8tJnY8VMm5FR9CLFlhZBoticHw+lBPd8LLuu?=
 =?us-ascii?Q?jng4TS7vHgcpDg1ffZDWHgV795r8cZLbF6y8L6IrUWJROVs8P9znD+Y5fQee?=
 =?us-ascii?Q?/lXiF7pw2H6mxSlirb+QhwA9rUv3/ky6i6NauqyhmjdokkppmKPFUAId5m5w?=
 =?us-ascii?Q?LncHh3YZQaMN/tvv6JL0/X0DvGRF65mmk4hfN0sstdgwsKAetKXMb/PcKoO5?=
 =?us-ascii?Q?OUcshHiPjLNv2/KWT3V9TkCNUPraSr4KcFJNb7WqCP+JEUoPQ37blBT8wUpl?=
 =?us-ascii?Q?axU3lxMwZUQV+6hOHN0UWYQ75gW5OMG5e8i/QipQ4h88hZHUmXqPrE4gGK7q?=
 =?us-ascii?Q?MfDsgG4GD0f5zxEBny/tiO6IV8ik1QnYYJSBVNMy06FkXpFKNs+ztn4dSVv8?=
 =?us-ascii?Q?LkaGhAQkZQQuMMuaSqfvBxDQ+E5OT/z3gC2nCmi2aAWHfF3vrj6QQa1M/n7E?=
 =?us-ascii?Q?+5T9Elp/Vt2E6iXsaF84iF8Ah1zYRZ8tWrLXEHcfWbq6Du/dOMZKf73bq9Zp?=
 =?us-ascii?Q?oDtCrJpanv6JOK9lnnQlqb9oVx/AUTj0Aaiq6L3OkD5tmxSHEUvG6h0FmZS4?=
 =?us-ascii?Q?rhj7cKVNaQKuo2WA5AouN4+qzLcvjX6gFyrMel6XSDlr+Ef0Y0C20kNMKlwO?=
 =?us-ascii?Q?N5XjvRRWIE5n4H71JalFpwDJWoSxglfFKiIy4r6rKo+OuD4kBbL4lJHCI92d?=
 =?us-ascii?Q?gj5YixReS9UnYd9+Zlzvw74ujar+m5H4qHy5+QCQYGF3MCapdexWsufStksG?=
 =?us-ascii?Q?yfPUwQ+utkjPyXQd+JSwRFYntHJEr0Miy5H19UMq5L4KKvcvxrhso9Umxzoc?=
 =?us-ascii?Q?bXHhzhYjGcgmKCIJ8Zmmi1ApUQAAsjdDmgtwyBs+hZDO8P86wSlcWAA4//xM?=
 =?us-ascii?Q?WExYrzqzipHek6AeEMPecckSlqd0JI1aTcicLqOlXrG5/uBT25A9NtrsBMng?=
 =?us-ascii?Q?QeYsVdY2XzUEl7eeqwSLISuVvZLjlm7FIgc8AG4TslXLKjnl+ZqbiXa3FH/u?=
 =?us-ascii?Q?7FXyokxi2Hkr/2rtgrv1NJTqK8c0Bl9bY3CJUBrM5wwKCi1Js1T/s/GunzyB?=
 =?us-ascii?Q?e0VsrmccNE4G5zYPtaojy5GdjlcVOJeTPsI34e0BRJdaUOulsVcNuVtd9EW9?=
 =?us-ascii?Q?19+vRBov8LFTpe0/OfFEN+FvUHLsY4YhOWytU4FHSwSKsRZQonOlrKjZSL6I?=
 =?us-ascii?Q?aBfm9gdLjVqyjKnfcKF0dqXCCam0xGuJc3Lff8pmK7p53Ga7fKM+9+3s6+Eh?=
 =?us-ascii?Q?EBtvTLUL4FH330yCeMYE14e+z+vs1mYORql2IKEKYH7yvWp3ClzOtohsJifP?=
 =?us-ascii?Q?opwmCmZ0++7CSblYmJ2ic6Gup1wGZpoXGa7cYmBQfSmt1+1ddOgo4pYSDWYl?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf868552-4fd0-4953-1964-08dd796a7b63
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 02:34:00.2936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCvd52ha2h2bAYzpnLckkXn8Qc8oTUU1ENkw6A7XkLJETeQalLo6KGQe3uMFVcYsDrUOdr5NnY46ROlCnArddwqB8wpS07bp9ZKfHZqvJjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1129

From: Tan En De <ende.tan@starfivetech.com>

Replaced pm_runtime_put() with pm_runtime_put_sync_suspend() to ensure
the runtime suspend is invoked immediately when unregistering a slave.
This prevents a race condition where suspend was skipped when
unregistering and registering slave in quick succession.

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
---
 drivers/i2c/busses/i2c-designware-slave.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 5cd4a5f7a472..b936a240db0a 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -96,7 +96,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
 	i2c_dw_disable(dev);
 	synchronize_irq(dev->irq);
 	dev->slave = NULL;
-	pm_runtime_put(dev->dev);
+	pm_runtime_put_sync_suspend(dev->dev);
 
 	return 0;
 }
-- 
2.34.1


