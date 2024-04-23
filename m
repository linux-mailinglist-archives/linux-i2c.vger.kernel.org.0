Return-Path: <linux-i2c+bounces-3049-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1268ADCC9
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 06:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C18292826DF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 04:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CC8200C1;
	Tue, 23 Apr 2024 04:23:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2090.outbound.protection.partner.outlook.cn [139.219.146.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B365020DE8;
	Tue, 23 Apr 2024 04:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713846184; cv=fail; b=rHkJqF0lCIltD/JQ4nJmqHCc3mwWkT1KSzal2KQ721B8W883FrMJ2aX09/y122NCqCjPGyrT1a1LRgXxDU+gIaP4rsj2rPn7PsVqu/8ahgGyAsgGTgttg0XvlJYyX317BaXVv13qbM1OwKtljEAOyh7Qjx1s7jmpnEAVPf0pX58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713846184; c=relaxed/simple;
	bh=l2uDVSm0DFmcrmAefMLx6c+sx0n5o8An3XKOhqf5PDA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KVtfrsJpayqA85ldfGOXh7DOqgUjpiMiryKZQeMc7CPrDepCEkL0F5xbcy95M/3KU3TeGTXsdlS90+f5Oaaj2e6d9PA1HelylUvvb92R6gt7W9qHigu0eflAG2FitsVY4RYhimOrO5n3KiPvD90dPJZ5abDT8pBJfPqmwfBjKo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5YPzWl3QK0/+Mg4Q0Mt0tJRJ6scL2UL2lZu8Nw86Io3SzzLl3BGRAMocdBuDuQY0xQdRdHiXfBRvcFmYAgmML6/QiyPG2AxIHoZr2kupSJsAsjyiOrQS4pKgNRuhZ54YLN7oujXloLSCpwDGaOfnMGnGYrDMs/UlMzc6WyFA+vyC69Vqx6YDMyWwm9d5G2kn2joqtI7DY+QpG9qGfZI1E7minFuMA0R5F6dIjCchge5Eg+rMU2CLr85f/8dTvxYTztVmZyR2jUd1+XTGDcpL8Jup9J+rpZb7NA/2KJf2Pzt+R8sSn+gTs4tbEIfSIYiFCWX/Lu3lkPcrIFX4TL1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KH8VldIWN8wRBtcaW1gtyUOrNZ2uf0SJkxkMCrOokoE=;
 b=Je3E/M3EquPC/yqFe4GNs2nyW1X/zZlXvdWGVfoWBao2Yer22MNnFJ/Cw6XoiDm4rdz7fMNMc7OIp2n/CBjix70E4BFFIzLmMppVc1zgL8a97EZN+1ERG5v5GQ9eFIiZ00g/Y/NNJ78i0qslW3DbZeCYYmsVDxkpLFiOxUulxy6BcbmxKCv+2P8oB7RT+1OVNresIOLw8k21wXYUXw2aSF0Hz1PkaDdgc+KtCQAZiRTfnK3/2JgkITcXWzXpEwhIOYpErWHngFNruW5dGEl8ki8A5nSXl9WzlLmg9l1Qe5BrzL7uxIf9uCKA9Isr/gQCx9RTyF5zEtwEQqL1PNWy2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6) by ZQ0PR01MB0983.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33; Tue, 23 Apr
 2024 02:49:16 +0000
Received: from ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::d66d:c2ff:45d:cbbc]) by ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 ([fe80::d66d:c2ff:45d:cbbc%7]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 02:49:16 +0000
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eng Lee Teh <englee.teh@starfivetech.com>
Subject: [PATCH] [RESEND] i2c: cadence: Add RISCV architecture support
Date: Tue, 23 Apr 2024 10:48:06 +0800
Message-ID: <20240423024805.1915300-2-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::22) To ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::6)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1160:EE_|ZQ0PR01MB0983:EE_
X-MS-Office365-Filtering-Correlation-Id: 3380384b-37e4-4e00-97e7-08dc633ff70c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OLDQwAU6o97n972HHscnKdYGKx4pg2PsC9b5VgdW1oPb4kPQu/5pMvE1Xca/kNAAKBzFkP2m6+6jjtDsIiDNvGCL4zKIIZCqPDGTvMgjyUQmtjUKZn33Qbt7yCCvsAXjrq1ggC5dHJjhSf4ce8LV8iAfPF+6u8i8U8xinDbmgFGdg85IZVUZo4b5rOw+LtFhov3USfwaJwrVZv6khuF0ZPo2kTwFkSw4UxXLaNUfFT6dygCiIddJfBEu8SLUwawfbNmt94XzWQK4/+WdpUAcg3xIVCsXPviFAw0QHk3QeNbt/JHwNa8AeDIXuIXbTIYPn6jdX8OjyZNvlnlxuNnHXxR/eqO0t+bBTA+5faPfA2Ln94BzCNWjysLUllJ19odHRpplG1g4IJzWBTxuCYEdsBwhSPmQ2mdcHym7ofTkJYZEeoy5NenaizL6LWOTN21l2j3gP7owCWgcPxuVVJ9fRax5r7l2J/KWSXOltOZsTvoCRB5Cv1y3F3lyWreAuX2BX7jLBK3hKSRdlR8flT5gC5a0wVneHaCRYAmv4+Hk75qS7rW+1pGjFXxwfkXiOjbKZaJs89vKsNd518eQzjN+tQY/KSczoQXhVgYjHmptafMrkeVxoGU34qk4r4QPOBCN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(41320700004)(366007)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GacXGj0IAuaAe+vb3F74lXmWZ8ICtgGWX+dLij4iVuFr4Wi61NPIHyJKwgDl?=
 =?us-ascii?Q?kI9imOv3WUDViQMXAjkQGchtnKhGTdS33Lziay3C+0RQZ0u99u3kmsv6/eov?=
 =?us-ascii?Q?HLMGO3Hp2llXigina+9V1qdQudM/VCPHpxUxvYuYRVABtuEbQxQvkxjFVMt/?=
 =?us-ascii?Q?Ci1hHb184Db81gd5W36PP6oFbQSEPGnTknhQzn2RQZslM7QEhDHfeR+Wk5Fk?=
 =?us-ascii?Q?V4QT+buQ2B2+diMaZMaWiOkxG38BTyBDSRcLBWdVSbYV4PPhS/KR1UqDaRLp?=
 =?us-ascii?Q?5dIPNOLqWeUbxmV3OtQtkY19Bt9jzG4/DnGBfOJjRa8DeE6AZLgzz8JkZ4GK?=
 =?us-ascii?Q?pa36LPyXbkjpWnWsdqunzBCPTe+lQYHNhBCAy/O1cnaoG2RsjnKH0n3jxxVV?=
 =?us-ascii?Q?lqmgKbCHoTkxXBLQAXsQ6G92oNa/cADe+lPTX+1wrA0z2ELxHqyhO2C/45cF?=
 =?us-ascii?Q?jiQJ6B5jWT0qq1JzvKcHINXyfaJkJ5vDCFeWg2WZDVocZfHvvOeuJYi1RHRb?=
 =?us-ascii?Q?kR3WyTqVmB4DAAPFrTq+HZcciUqQQtjH4bUA3tLAWrFA9zk2WwhOX7OkdJ1t?=
 =?us-ascii?Q?CP2+dkKxNzdCGG1/PhcxGQLLENKTvCrjZjRlAXZKumu5VoMC/91x8j33t4Ef?=
 =?us-ascii?Q?DtJxJkMvL5w59bXDzzPP0Je56sqEz175pVOibDBKmx8T80bihzqV5+0wNWIA?=
 =?us-ascii?Q?ngH61nf/9hiKM5t4tQCjXZ9b9aYahauI7B3k4AcKXTaFzZvaSkcHklfR2Y+G?=
 =?us-ascii?Q?9fRrDSRw79/JJ2RsLCGJZ1I+GZtiT8zPRaDQm3FZz0y2SRWv7ZAGwECHbRCa?=
 =?us-ascii?Q?1rxm4h30ig5q76Woimf9ViljR/zf1bDweyNWehSOuyNscuIIbmBaVNrKLftI?=
 =?us-ascii?Q?K7ZOW1iP7bIAe06pbbRscKwaDvWlmI7H5nCFnd6c+BWZWoRtKkPBtWkdQWo1?=
 =?us-ascii?Q?KP0HeM2iS/FixiJSv7wDbeq5Q0VdZio9wIU+6BbLTjEwRTiA5rIijXPLOe2w?=
 =?us-ascii?Q?8cX5ETgLr53NUrTeXZWFGBwHKM5qAkxh0q2GAkbYPtodhC1Wcy41c3lluqr9?=
 =?us-ascii?Q?QmnSXfmp0BjGmF9x0V7QXr5RjOacu/SZpBlejRt+ZzjYRLWh23CzUHI176QZ?=
 =?us-ascii?Q?eabNNmsWnZuUgteXtC6X3TDNrz7Xm5Dkip40SLEqXiBMDF/aOgdQFi+DHBVb?=
 =?us-ascii?Q?PWaOZSJWF6BFtOHgw8e3VRkmjZ6nFwLzlkk3YmnmYW1t4Ctz3hO4dbU9xtkP?=
 =?us-ascii?Q?MtZO7nD6W9MWecyExszjvhciVR8ZPSCsOYHXmLD2fEgGYbxfXpkqdzV2bUg7?=
 =?us-ascii?Q?BIxttL8oohyX4NO/QwqSwlPBZKjCaQcx23cEWjVA/u8s2HU7EwG1dkP5TxDO?=
 =?us-ascii?Q?9pBAJExd+6nu7XYkLJKnvIKLZzuKOIlheWTxtfIcMIZN7L0LHBBsI22AbJCF?=
 =?us-ascii?Q?u5g/ZCTKe40gwZmFPxYoamZg1RURjHJLuWTOrkfi6c7W+ADgEJXa+JvmI9Re?=
 =?us-ascii?Q?/76Ro31PcXqeAoBmkdE3JPw+4uuoGU1+GNTyxltfwLgajS+4tTmH+s6PaJ/Z?=
 =?us-ascii?Q?ozHjQEltWhCJqWdW88+9o5qRfGeNE7X9VkowortJIdEJH0nhOK1cboiAhidz?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3380384b-37e4-4e00-97e7-08dc633ff70c
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1160.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 02:49:16.0880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+MMusiuoyTpLUTUb5GdAu/bToqBHjyFeY3fpNCNJHkhZTRoAQeK6qwlS7pbnNNcyIEVB4cLFMDoecYU43XQ8EL+eY+OvToelNbsaM55d4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0983

Add RISCV support to Cadence I2C Kconfig which is used in platform
such as the StarFive JH8100.

Signed-off-by: Eng Lee Teh <englee.teh@starfivetech.com>
Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 97989c914260..8461328d11d8 100644
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
2.43.2


