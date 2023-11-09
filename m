Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAF037E628B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 04:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjKIDUA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 22:20:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjKIDT7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 22:19:59 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2107.outbound.protection.outlook.com [40.107.223.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CBC1BE6;
        Wed,  8 Nov 2023 19:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mi/lqFLg/fvhRo+ZRcuLW2rexrmb77np16+9PePMR3tboM+3vs8OdvhdjLTtuip4g+4ZdZ06QNaxlumcBrxtUJGLHBd7TY0V1lTnN8iCBcUSxmNN3rUXzfQaVw3R071khzsni0gjFSHUur8OXKtgQD2+2o5x6NZ//SZ6FAHfnvR60bxtdDEK1ZBQRlC2GROFca+r1yuS++PeqCtfmdg7j0GBkX1ilfJT+2HYxpkFwnNYAuNZyLULoHUtS/6ejKMB8lS3OgPSngya7BfpdSEtXMCVMnAEbcL4/jHDchPjWmRyaRbgfSwpdmZZ2+7BGdUdliK1+xPekHrql7Q3Da9sDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqqhuO9uKYTD/GNV7DnyXbHcXyJsM6nqEDlF9eLIGD0=;
 b=QCPPuS9SIom7SuQR+l1zl2kzO68SKF7uf1cJFngC5f+kGSpDs9j4TgPr2sHLpa/7vn3hNPZW20jQKhY2tfUH7n+O/CBnw7tCcloB+CWsvgYmdHqty1eC/jr2hQr0ZJaadRVlO3JgJrfI09JM488Lgb4qyEWqTq1Wl4HFpvGKQBZrYVF6nkQ+/EHBooPRTCsAfBD0yQ/65XwNwiGaukBBd6D0/3jGmmNJMhRGeXLlDF1eOe9AE8f6RC590gjMdQ8/aTQpyqNXz3GRDTXL9lJU1bE2jrq4q3Oe5WiVrsjsk0L5QH/f+WocPjTDi7nu/E+Ur4dob0jQ8LGPy5W+cQOulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqqhuO9uKYTD/GNV7DnyXbHcXyJsM6nqEDlF9eLIGD0=;
 b=MphsdjzoY3FuxM0eU4d8xBCJgQvI/dSjNw1RpN6EEEEgBXRnSZ/wox/GtNYmgDs+KweOqcNb0GUg6GPX8YX56aoQ49YJYEfMBcGDitsrRCufgujO0HXuHMKqmFmY42hdGYm3GgbEyF5IXfNy8s0YNZnMXK0xqldMFsMbTZmNA0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7475.prod.exchangelabs.com (2603:10b6:510:f2::9) by
 SA0PR01MB6313.prod.exchangelabs.com (2603:10b6:806:e7::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.28; Thu, 9 Nov 2023 03:19:53 +0000
Received: from PH0PR01MB7475.prod.exchangelabs.com
 ([fe80::a0b7:3abe:edf1:51af]) by PH0PR01MB7475.prod.exchangelabs.com
 ([fe80::a0b7:3abe:edf1:51af%4]) with mapi id 15.20.6954.025; Thu, 9 Nov 2023
 03:19:53 +0000
From:   Jan Bottorff <janb@os.amperecomputing.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jan Bottorff <janb@os.amperecomputing.com>
Subject: [PATCH v4] i2c: designware: Fix corrupted memory seen in the ISR
Date:   Thu,  9 Nov 2023 03:19:27 +0000
Message-Id: <20231109031927.1990570-1-janb@os.amperecomputing.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:610:1ee::11) To PH0PR01MB7475.prod.exchangelabs.com
 (2603:10b6:510:f2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7475:EE_|SA0PR01MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: e34f16fc-9bba-4b0a-4722-08dbe0d2bdb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6IiQ6sTf0FyMjcloWdP0CFVNgaOxHPFtuLVGe+TdVVwMLdL9C7Dvmdmj/mXtcLO089nBsuhIMwY0jrQridw+R3ObxeegQebYtHRiVQ5lhJvdnYBwkKjgmEJsH9uCTO7pP3JuCC/LfR7mpyEcYp7fLVbm8Eju+nvgFT4BoA0/+8vMxAPNS8dBjhhs+CzXAFfl1Bdxcc/ewxdfVu+VKYfpBzQ3hj7/y5NTjt702wXed+BR4yYnAufk8Jlb9MfTaDg7oTSNVVoLIlx7ZtJK835brQ7zC1YjP/mOjkiyy0rjVEOcCykXEwFONjlSV+HZCZBsVircciLDsJBjqbtcVuzW5bqVDhA84miSWJXfPwiXxndPdUvb76piRgxMbvPVKjDe69UUc/7zPw6cDxq7Yegvfqesk4ds1BKLINVlC70DIVnZfD8t9Up/ypW+P4liGoXGNirU5zqb3EBsJGp23BoLZFY476rOAsjueHP1kXt5J/1eHWTRnL1KzZmpbvPdu+DSuViLxwZ8dhK6U1U2iY87QUi3kBxFTomWRDEqtq6dZPdL9xk1DToAybL+E1eX28hIAvNcqgEseBkJTxNBfryOHpV5kqYiS9wiQUUg62Xr7LZTFYonsF9O7RaK1bznSHIX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7475.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(39850400004)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(1076003)(107886003)(52116002)(6666004)(26005)(6512007)(41300700001)(6506007)(83380400001)(8936002)(8676002)(4326008)(2906002)(5660300002)(6486002)(478600001)(316002)(66946007)(66556008)(110136005)(66476007)(38350700005)(2616005)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eAqdJdQAohGBDfIp7syCUydScbQmnEBUDZPsNwZdT4Sa9bUCDd9B6FG0X+Ai?=
 =?us-ascii?Q?AuUxnkmsSn3LPk8xW+3ib6YbNTQigPxWZt7EtZMyyZCrcsYkh6wjD0QOyfyg?=
 =?us-ascii?Q?uKwxIwHySl2J7SuE+7/dQjwScRNvdvXNJZj/E7FY9HgaduWV1Bfe5A8xAcV4?=
 =?us-ascii?Q?XfCmbwl98Bn0mWXuNyfHatUqfvnvuCX1LPpJ88Ft+MDXwb0Kv/mBOVV5Nu+9?=
 =?us-ascii?Q?7mWqZCM8GY7Am85X9eyQxBP7RlZC43sbiw7v9TiO4bC/srkT35iBAIzrmK7v?=
 =?us-ascii?Q?LVRnxqqRUDDzEJfDwtFCPNe9lwZyAD5/64ka7wV6SNG8SC2vpUEG+oyBcV+6?=
 =?us-ascii?Q?smNuMFJiHA45Jrr1Wa2/6KYQ5ra9Ib8WLuTq6zSDRxy4YmUK90BjC7SdTXpU?=
 =?us-ascii?Q?au284jnCVGAeLl4JYp0jycCzM8JejPtZ9oE0YjqgQrM5z/bwpjM2zfbFtFcu?=
 =?us-ascii?Q?7kbmcagHl+bBJZIh5stkqFwroOARHC38rsQwp/jb+f+6wo+ZYW+zGgZPZfRB?=
 =?us-ascii?Q?7Bf30xCkw8Lw/BdRnPQapF9PrQqtrg8InZnAvlt/t0MGGwMFFjJXLy16czPU?=
 =?us-ascii?Q?IBlGsCZTerlik5JTRKYI0e831bp8mrb6Kgg46NKGsGcmuzlbhs4syrgyhWHj?=
 =?us-ascii?Q?Tz0cy+bC961CKJYtH2F4Th59ujmuPoqL/3SPac6YTwfqXCym9bUjj5Q8stgB?=
 =?us-ascii?Q?BESizMAipP8AVDexM5JSzJWTpYF9WPKbs5hYP+2bCLbQv6wr30RQNyO0TBLH?=
 =?us-ascii?Q?QTL2V8Z3xIpzVlmqoSOE7Gg2uO5VsLuPi9iajc51ru3ofzywnKMJK69DwkLt?=
 =?us-ascii?Q?M/Bm3nh5WXZPuJz3rFudcapqIOG+APGqVxTtQpJaZz5Dv2sXIeMLQKuuCaRk?=
 =?us-ascii?Q?q2Bn/Xk4Ck6rVGzNdZkwC6XDVrOPTZj99ahdWKGhowpXBDDbmwSaNZNQqOpx?=
 =?us-ascii?Q?Izmasm6JyMqPVp+57lVn2ecINe+2cLWS7F6z9KiK+0efTqCITR9tzp1+yYKn?=
 =?us-ascii?Q?IyPqp+ahS24zbzlNbA5FCaiQUFwiFEOo22M7WVQHfSCiNvD8bWzIXP2sfGGN?=
 =?us-ascii?Q?g/FxItl34nggWpc5gGWcCjGc3DBRUJAacD03kDtspcRjBPRHsUMlr+7Lsgyk?=
 =?us-ascii?Q?hWc0XBSg7motpOpJlU652dZz1GF8YfJPkJ0cme3MXccrEmVEpjac+LLiwD9B?=
 =?us-ascii?Q?Dqaq65OPxIDbcSFUoSX1C+I0tE974MskkGE2oFiXTNHWINka4DWV3IsyqQ4p?=
 =?us-ascii?Q?wheIc9S7apK6WgW00GHBL3EjQYkKY5peh/iwjhnoXgK05qDjWPbIaZWCafnB?=
 =?us-ascii?Q?fKCWwdK1C+HYEowy2nmJ+uzEVT2yIn70p6sNRJjzoIdc6cUSV6z1a+paTS2R?=
 =?us-ascii?Q?TgdVa+q8MxlxdqK/36pOF7uyrCvSLK9cN5Gjqz9pZrf2hI7lHHsxubWhf78w?=
 =?us-ascii?Q?LNtuic09WP9QhMLxrlir/dTqbxakft9umzXsRg3MOD+E//mpq9ovNsKz762E?=
 =?us-ascii?Q?dqVRj4IyWNjyM5tRZmG0ATWgVuEwhEAqRA1O1K0I5nlmtp3T3kYRVTnAgyVO?=
 =?us-ascii?Q?l077Mu5YjGFmPO2nkbCZUb88QzejpfA8FA9yvWwDgIJsc2IBtqcpNrV5TvoX?=
 =?us-ascii?Q?JvZZpD6D2pcdHDfzMsI3wuY=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34f16fc-9bba-4b0a-4722-08dbe0d2bdb7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7475.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 03:19:53.5682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c33Amjdu53azT7zG4Em05QBpyHKtsstF2aUGzPlVY3Jf9Gq2tMXlzvQqY0tlQpfG6i+0RF8Tnedo3IQQtqxz9daw2wrlERFD3WLe2n3UuqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR01MB6313
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
ChangeLog
v3->v4: add missing changelog
v2->v3: regmap accessors use non-relaxed form instead of wmb barrier
v1->v2: Commit message improvements
v1: insert wmb barrier before enabling interrupts

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

