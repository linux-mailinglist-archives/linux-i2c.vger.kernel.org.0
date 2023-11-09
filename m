Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81CB07E6275
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 03:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231187AbjKICzg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 21:55:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjKICzf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 21:55:35 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2134.outbound.protection.outlook.com [40.107.92.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DCB25AC;
        Wed,  8 Nov 2023 18:55:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9OOFRYu6kzYzdD62uhVSG/Gi/6bzFez2qtW7deEXs6rL/wgrjUlFrBX/OZXTz+eFbLX9qJQa3MHm3MCC3N/VBfDA7QIoFY1k754tGBfbqYYnW4s6SIOn/Qdql0DE2CDxSkeCR+qpAiHwfdgdaD6UfrkC3wsOrEIfpf6BeHnwZ1Q54TwJHW59e11mDhrLsyOoKdGbm0pHaplM/P86maCos3ainnFPjCUxHNRtrCbQGWbSTd/fobFG1SLRp1Q860m9ECnWiNPFLgqh46JmrxTgPUIfTrhe7FuqX5P6br38rQ+yY/8lMHkvGDuxBRCfVA0ke+1jHbRpP2cOJEjTqwX+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRvGpXj32m43nUxGco1SX8huZ7tg4sUt7ODR16BS97E=;
 b=emLVodVQwnR2b2vnZrEnb4PzKWfxLfFPBYVyfVSAivO/RraqnnNiCcCKITume1SLgJyrZS/NkVdjMcjZrrWFDTEZOB4WEILAtkdYziL2t2cHWLSm+bwDvA1Vd4syRU8PEa+ttTRdu21SXAXx/3hB6HXvj3tq0aNVy0FMvsW9WXF/qFuM/CZeAOStcKzGVeo/7lmXCqZw1Rzyn6Um+pZ03QCdBsKYc5UI5o01Q+w5cT79BK+2RNJkWD536R2ArPz0e3f7T6IjhFgbmZ6JqJ/+dCgdaVq9WlDY1TaprGGb+rWtNrw46QUQ4xfULKYLqLTezStuvWgSbef/qsrfzqEozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRvGpXj32m43nUxGco1SX8huZ7tg4sUt7ODR16BS97E=;
 b=M6Davt4SbuQ0Y/B73Iq4dM0hSwybWeMQeavStmLLVYJ1dSA4k6AnJLII/UeCULaALcCde1ZdYa25/AN9saI79rHYlb34L3BSc0TdU46ClEQ+nMlLL/PSfQx+97OmTm4YPz8hHI2y3uHOrBWTRKkNU58sMZJpR5iE1gfWfaRrebk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7475.prod.exchangelabs.com (2603:10b6:510:f2::9) by
 MW6PR01MB8365.prod.exchangelabs.com (2603:10b6:303:248::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.29; Thu, 9 Nov 2023 02:55:29 +0000
Received: from PH0PR01MB7475.prod.exchangelabs.com
 ([fe80::a0b7:3abe:edf1:51af]) by PH0PR01MB7475.prod.exchangelabs.com
 ([fe80::a0b7:3abe:edf1:51af%4]) with mapi id 15.20.6954.025; Thu, 9 Nov 2023
 02:55:28 +0000
From:   Jan Bottorff <janb@os.amperecomputing.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jan Bottorff <janb@os.amperecomputing.com>
Subject: [PATCH v3] i2c: designware: Fix corrupted memory seen in the ISR
Date:   Thu,  9 Nov 2023 02:55:18 +0000
Message-Id: <20231109025518.1989953-1-janb@os.amperecomputing.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0401.namprd03.prod.outlook.com
 (2603:10b6:610:11b::35) To PH0PR01MB7475.prod.exchangelabs.com
 (2603:10b6:510:f2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7475:EE_|MW6PR01MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6e732a-f80e-485c-6259-08dbe0cf54a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X9/4sv1R3Z/lZijaxloeImPjKthv5WX9OFjxVUBASTv5uWj8qXHi5+2IqZ6TA9YsOM7gR/K1fQwaJ1XBgow1VuNDIGX9FxAC0FNmOFD8H7M211ejpEhpyOlJAuhXgpltCv1AJu2ZIFJxOqpA+tU3OArv3inVuHIfAa8r9TkZ7NQIWgFvoGytCSrJCafPmIYLAJ/vQWH901imiWWYkgFWmn+3oRn5RuMy2+/LuTycJe7GHKHdmRgcT6djkLz0JGDi+7ly912GHrHMBscLakeLVjcHIDeL9G2N5ZtFR9xwtevfbnoT7ot3kySidmD9DPTkl5mB5xoXdDYsWgYOildlNo7RFMSTk0ZRAOjmZnoGDq9TxfyA3BAk03pQ5Sg3/IP+wFTIz/kTQBie/fegq7vUVtWy8xr/dS+5j1g62vNd+AyrVFz3EcAs8N9GYtJuIiLjqjGnAvcMCzK86d+24utX0jzvslzqb/shujinPdfcy0D0DvcWCUKNysMXx6VLGa4znMa6x3/mnDuZtiDe68DUgXu09sxXbMo8HCAMyUpuQ/bP9/HLA1OMqVSDnIPR7FkY3EZG6Hyhl0I4E8py9RipX50VyptXQzmZd+wewfQSluWrpdZBlr5yRtmqAnUyCjLy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7475.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39850400004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66946007)(110136005)(5660300002)(316002)(66556008)(66476007)(107886003)(26005)(1076003)(8936002)(8676002)(4326008)(83380400001)(38350700005)(2616005)(6486002)(6512007)(2906002)(478600001)(52116002)(6506007)(38100700002)(86362001)(41300700001)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jbt3pE7oPr8znO64vM47uvcpZY4wKf0KAv7+wMaLyHcJltUYOwNdl/Epoi/7?=
 =?us-ascii?Q?lg2QWK1i6u4OxyWtHMYQyWsslmGbRACRty3q44Advs3+Pu+XNpwfCilIBQkl?=
 =?us-ascii?Q?eYVqCSf75Kt8vmuFcRlIAJ3z0C/E8kPWKOcX4GCJ/ZC7D/XWU43f5qdARRjO?=
 =?us-ascii?Q?hRjOHqM2aK6mfebU7gmnikOY+BfCw0linQPYTh7InBgXc/sOSJ7NColIG4dV?=
 =?us-ascii?Q?YeJ0HMfefWte7mdKfEks01WFxhMd68yLbezcQcIuW2biv9mNVlB/J9jGwr5A?=
 =?us-ascii?Q?YDswjxeeX1axjmEDrKcprfliwRZwvDSm//G93xTwkaGLk7VewdUIQ3wWWtpI?=
 =?us-ascii?Q?X8Z+bRdj26hBtHQqxxdHqHycsayRElwruGok4pNAQNFy+W9XLb82QZnl2yy5?=
 =?us-ascii?Q?V3cjVwUpfHq56nalWy6SxDON8LpuZimUlQw6x/BsuChS5vgBtLgqX+d6cC9K?=
 =?us-ascii?Q?ogGqam53vpo+T7rt87dfQ3Zj83EeYNsxTawaLFpSHuKdmge7fCHQYKVXIvJ6?=
 =?us-ascii?Q?OqA/8ykAvk92X7mazzf3VJwOAPerlluDM78o+TMgCk6piW4Wtrr+A3TzH6sD?=
 =?us-ascii?Q?xQMGn2FEirXsm5Gshszr0Mkz8ykoXi0e30903RWOqO30oQE8JuAe9QMm5QGK?=
 =?us-ascii?Q?P1ghtpnJw9z/7Plp2TYsczAapsvfLUFeSrsmoU/kp/i27TElWJ7jzYpcjEdD?=
 =?us-ascii?Q?uGAm2z5WJTQoPGpURTxZEBdhSjnKzSX5OUXZtMl+4DdhS4xcyLIoTd3iapbe?=
 =?us-ascii?Q?0DxwmRGjRkWonHvs34SP1wMMfhy5HKqyEtb9qotzM+a5OJIszf5RwTe1r11h?=
 =?us-ascii?Q?whkv5+89qWw8zmG8jBKd4sTvqKZGazNGkMdgFZYRkLYf5Uu2RaPREfKAcoJG?=
 =?us-ascii?Q?5ftf8NYgUsMxU+Hk5pvNBjnu1RifQCZMkG3bw4Xxsv7YwlZrFY8Fp6s5X97I?=
 =?us-ascii?Q?HVHIjI51jHjC6VcZE6hGWiPKVG67mxU1+NZw4GukMCgZ8SF0laNKJuAWzWON?=
 =?us-ascii?Q?XaVZ9zQaG56iM1YEv1d9IRwBEufrrfHDIe3vgqCpzC8Y8icol8JIKMCvL74E?=
 =?us-ascii?Q?afFqyqlHqYkvvbSkiVt09YbH6SsAog4PlUbWMIMgi96oSpOTjbGdyPDgGJhv?=
 =?us-ascii?Q?jOTsTfFFWMxj51STeSe7QL4IzhuL4oYomxoU4AJkTnR5Sl+69sxWI1xujbdj?=
 =?us-ascii?Q?P0rTO0RtuAtC7Zm95zdzz3VtUAuuPqnkbuJoGZ10ksABI0MorVu1RQ6aQRqs?=
 =?us-ascii?Q?DXbkaTRaZj8FlYYOi0yCbgxnfffXHTcanoVFkMnrPzo21JV1FfJg+SeQ6l08?=
 =?us-ascii?Q?j7IK+tKPJ7h97HFz9Vhfi6Iy5zFu+xm8igkfWng38kU/V9ZbCgGn5qEpeMAy?=
 =?us-ascii?Q?QkgIjMk6ur4LEfUcuitYPiG0TyJ+4uT2uRuEL9Q7Z0YT+wvMqkDO3UtItH3l?=
 =?us-ascii?Q?bcAhNuAj5Qibo0EXA2OQmlMz0t83/NuoIf/lOHFHb2uuVZbVn/FkoNPbLs4H?=
 =?us-ascii?Q?rDXHG09y2QskxNgsX+E68NtvCLwBwz0LhLB4xiB/r5KfzNHIoTMepN/Br9PK?=
 =?us-ascii?Q?GRA3K8JrM6JSDRJb+OsgjKSVRTdnum+XWK49WL63ZlWP1uvzjZtNsEVP2y5Q?=
 =?us-ascii?Q?XBnBliAjY6mcL/ZKZODFI7I=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6e732a-f80e-485c-6259-08dbe0cf54a6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7475.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 02:55:28.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjL0ogXn0oS26x2rdcQu36PvMtAqkrZUSj8z9h7L9htqMWVvOyfieiDuVWPNPEzoilsIq0pgJvR0Q5udWELcPWcqvc3THYAd1r2yt8PfRBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR01MB8365
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When running on a many core ARM64 server, errors were
happening in the ISR that looked like corrupted memory. These
corruptions would fix themselves if small delays were inserted
in the ISR. Errors reported by the driver included "i2c_designware
APMC0D0F:00: i2c_dw_xfer_msg: invalid target address" and
"i2c_designware APMC0D0F:00:controller timed out" during
in-band IPMI SSIF stress tests.

The problem was determined to be memory writes in the driver were not
becoming visible to all cores when execution rapidly shifted between
cores, like when a register write immediately triggers an ISR.
Processors with weak memory ordering, like ARM64, make no
guarantees about the order normal memory writes become globally
visible, unless barrier instructions are used to control ordering.

To solve this, regmap accessor functions configured by this driver
were changed to use non-relaxed forms of the low-level register
access functions, which include a barrier on platforms that require
it. This assures memory writes before a controller register access are
visible to all cores. The community concluded defaulting to correct
operation outweighed defaulting to the small performance gains from
using relaxed access functions. Being a low speed device added weight to
this choice of default register access behavior.

Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index affcfb243f0f..35f762872b8a 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -63,7 +63,7 @@ static int dw_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	*val = readl_relaxed(dev->base + reg);
+	*val = readl(dev->base + reg);
 
 	return 0;
 }
@@ -72,7 +72,7 @@ static int dw_reg_write(void *context, unsigned int reg, unsigned int val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	writel_relaxed(val, dev->base + reg);
+	writel(val, dev->base + reg);
 
 	return 0;
 }
@@ -81,7 +81,7 @@ static int dw_reg_read_swab(void *context, unsigned int reg, unsigned int *val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	*val = swab32(readl_relaxed(dev->base + reg));
+	*val = swab32(readl(dev->base + reg));
 
 	return 0;
 }
@@ -90,7 +90,7 @@ static int dw_reg_write_swab(void *context, unsigned int reg, unsigned int val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	writel_relaxed(swab32(val), dev->base + reg);
+	writel(swab32(val), dev->base + reg);
 
 	return 0;
 }
@@ -99,8 +99,8 @@ static int dw_reg_read_word(void *context, unsigned int reg, unsigned int *val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	*val = readw_relaxed(dev->base + reg) |
-		(readw_relaxed(dev->base + reg + 2) << 16);
+	*val = readw(dev->base + reg) |
+		(readw(dev->base + reg + 2) << 16);
 
 	return 0;
 }
@@ -109,8 +109,8 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	writew_relaxed(val, dev->base + reg);
-	writew_relaxed(val >> 16, dev->base + reg + 2);
+	writew(val, dev->base + reg);
+	writew(val >> 16, dev->base + reg + 2);
 
 	return 0;
 }
-- 
2.34.1

