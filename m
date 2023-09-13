Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0933179F52C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 00:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjIMWrl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 18:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjIMWrl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 18:47:41 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2124.outbound.protection.outlook.com [40.107.220.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 359EC1BCB;
        Wed, 13 Sep 2023 15:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJIivye3r117JSbaSGbf4zNpbUWwrOeJF7c1I/DUWIqI8K+5vUI7uHL6u10XxnkU67Pqm1yVg6eX5tTyF3d9DK7kebrxOqeb9yW5eBO8Pbqrd4UAaiGMv3k2YYode0MgQ0QjlGJ1DZ44jUhqZ4xZbeaI1rcmXs+Y6dJijl6W+cXXzjDE8Jd2KFBafLyPur/BJWRIQzF3NgF6nkB/lRMAFe/zA6Vra7he6UVgq/ZzyPOewgrk6vE/LNkz0WkjgQpr/a4AX7yT+8xjCZF33tvneRyuTdoq9mQe8MrLxr1RouvESgl43Dw4GW8H7G9qfsUSprsqTUPUWmnnu0c6UmZBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FvacNeVeaRPoHFAcj+5cm0qk9nHbrpLOHPr5pfLJ8o=;
 b=hcCZnIONmK1zZ4p5YiDbNFfGcadkodJC6j1ClFIRUZpOUCohEeby2RpzcMwXo/ga9DOxNVGgSuVYInB6MRbZ1g3ThGAlw/Qs3w1Dtg7195WDTcA1hqgkJGbnkuJt2owRbXOyRQZKDT69PBn0SqJRZWrrLWRXesVBRKzk71n8XraS4tz3q4Mb9i6WgggdUXUV1mHYAylfcxYND0uHzkw5H2bKfRvubPx5uXok6Z5SG0oCz1HSQG4V+Le7ROHp8aCrc+qJlsPm5tn2LmoaeaSXoC/jmusL59s5zJWOMnhTRO56J14oyd839RR/hL0vizMCpYNCT6eGJNrt1WplOPPVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FvacNeVeaRPoHFAcj+5cm0qk9nHbrpLOHPr5pfLJ8o=;
 b=CpL3YQtyc5GudK2Z2SU05/b2V5qoTU+blv2E2YORjxk2jseNBVHXbXyAmyqkWHpdyCO5rnZSf/pFbgRzkPpqgzio91CZm9ef1nrnSLdR+Lt7QG3Y3lMVoyo5XqOnS5XJpVCqAR9f0sSSU9QuErSDyf96M0WiG3UqIRTaEbJhIOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 PH7PR01MB8417.prod.exchangelabs.com (2603:10b6:510:2f9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.34; Wed, 13 Sep 2023 22:47:29 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 22:47:28 +0000
From:   Jan Bottorff <janb@os.amperecomputing.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] i2c: designware: Fix corrupted memory seen in the ISR
Date:   Wed, 13 Sep 2023 15:46:02 -0700
Message-ID: <20230913224602.420279-1-janb@os.amperecomputing.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:610:11a::16) To DM6PR01MB4044.prod.exchangelabs.com
 (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|PH7PR01MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: ed5083e0-0004-4e84-82d6-08dbb4ab6729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzoGhNn9Dx/FXvrKG7FIknuqwz0IIKDotFFjUM4Ck++tl58svMKFxcEDFZoVpS7RNxnf2iugkrqsvx1MvZYAeON7oldxDIgCO6S6l2IemdlOF7hxi07w44G3c+PGO52QYtyQdK8m0beV9bYC5LumdGA8AjVgey3ubaVE4S7npWRijDopcTQglXTix1qEOYiYybd60mWUDAJpSzu5x6Kn8wmI9jmHw1fnYNJBLpMRAv/7AhBt0OF4XExr2RISQiITbjXJqyBZZuw40EAe45lH94/T5vcYGfp0jhUA6T5RxHQTjsGnB9J0weZfuM+1OnDEiLFeNRT0bC5stD7Ki2Vw9W15EBMFqZxn9CGqgeQfY74KKOg4VgjHSl2z5+Rn6L/fI5yRTNwlvRXdiDf69rH/5PqpTtKnG3gaQWNJ6ugtq2/u9AQlz/RWw6KdS7zRHFmfaFQ5H6jjC0RVHGiEqMM/XfzgV24VCOHRlpIhDnCT/kgz0WlifXy+OgesDaua/zDbB5/DEiAsoh3Tdd60epg0fbWcISifoidC9FOyrZku9Rg9F+5V9GDApOrO9FAkAYs7BhDJnaiHY6uUEzsr2I6Jrno2z+Tf2VGKOJHsCN65X9T8kD6J7x5VKZPcENMD0Zqq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(366004)(396003)(136003)(346002)(1800799009)(451199024)(186009)(110136005)(83380400001)(6666004)(52116002)(6506007)(6486002)(478600001)(2906002)(5660300002)(6512007)(41300700001)(66946007)(66556008)(66476007)(316002)(4326008)(8676002)(8936002)(2616005)(26005)(38350700002)(38100700002)(86362001)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T8fHG49BknA7dQwg8VXrv2+n5C5ZHA/B6OoN5gZMHu96hZzdBJsGsAS7juZa?=
 =?us-ascii?Q?IRnqHewvRPYp+TCgrQjC2U4QVcceYLTqERS08/HVsjnWKYvfEPxeMzLgTOjJ?=
 =?us-ascii?Q?hB5pwpkx0NlhUEaseZw3dQoR+447RHHg9f9GGYy3OmaXPYJtQNBn+0yTbEu4?=
 =?us-ascii?Q?aPETNnD5Mr07YOkJ12X3o2C9g5bUlvggaUzEaKq4/ZSx7jRW2GUuZQv3/0mz?=
 =?us-ascii?Q?oT1UCL3DKnmZyblx+jthpa6CSbmZvZ2M34eNQzqSBaKVKGPGZfjtBV/kaZB2?=
 =?us-ascii?Q?U9fWrvcrVXZFp9xEpdQE6VQTnYhwhxiMl1zlB0WaEZTiCDXkLk/1PUG00pZF?=
 =?us-ascii?Q?wfWfKn+goEuaFEEfgn2OPWeTySsvYcNXU0PaHAaSU32vcPzpD0+T+rUG1AZi?=
 =?us-ascii?Q?TVR57WuBlGQc4oNmpTFeBypqyYovuzo9yYQth4YZ8CiuQtc00pEfP+jap4Vg?=
 =?us-ascii?Q?JfLNOLQhJc1Ku0oG2bbOemIfT3tZ3K3F3rAhkRj5B21ZLTMpx1xsEIlifb5C?=
 =?us-ascii?Q?PF23LkPQXVlX8R8Af45YG5dj74nXREb/R/dxnuG3vDJj/fR3mVzdl0m/IEw6?=
 =?us-ascii?Q?iFlRqN9fw7qa9aBNJiz5jpCEWl2xvh4JomLmRXdUFacVwZ7H0xfcY02J1/tf?=
 =?us-ascii?Q?MWnek8OOZQj7D9oJlPpIXhsU+Qi0blGUYCrMbyua5+M+QhfIBEwrGoQwtdMn?=
 =?us-ascii?Q?a7FWcn+dWFvfuzVA/AXBMxpBLv9QNslx9wGZWqiq8PTVrYBFOmDusIViaibr?=
 =?us-ascii?Q?B0LsWbRf7Nfu0M2ROGn6QRiQyHNkaSQ1G7lZRFgnpUgHS/uvFpW0Zydxe1ui?=
 =?us-ascii?Q?VIQ1n/1KJDty1So5kQQCrCKFnF2s5BLrnzQXk3V6A0IPb0OxeLZCmanwr5mH?=
 =?us-ascii?Q?82WqTt03SVQZ4M6b0lFFI3m7d8KI4jWdimolPpUTQ0hJUUBFQ5svZfQ+Cr5z?=
 =?us-ascii?Q?VGUYadYxIuDQ3sY8g7Ew3lYqfj5TEBIXkWMJQ0XquWshSrT6MeWavI0QIn+d?=
 =?us-ascii?Q?7krK4qBtIyZuy8xCdLpiFBSvmurNPXHQGc8FWpgv0ujluljHXfoy9vilQZjy?=
 =?us-ascii?Q?bgz/WhD1I1y1OtLgjjFnbp5UOZYbp2GMtxc+va2oLq81k4ltsP+MpNzaN209?=
 =?us-ascii?Q?FF8KeLAurai6PaUIaHKETF3dOdf6btPdx76x2wt5Z5AGXiLuqn5ToVlFPiq3?=
 =?us-ascii?Q?gLIi/ku61RK72d0bd585jIVxG9N4Kqp3ccXrbsUOd9LyMKAUrseX1dIKmohS?=
 =?us-ascii?Q?8J0BUVg/jTdBBf0Zr/Idp3Xjb0DeN5AWVsAx3ztCMB/2Ed1w5sHQYYN+9e9l?=
 =?us-ascii?Q?42acTPVoYDfah3mGl2jkrtRR7TDN//WAoxysgfJyw7J98Cgu2SXI/MFIlCFx?=
 =?us-ascii?Q?o3pFoXcImmKm6yp+JqhKhR7wm9JQg9d3STFf+9MfRwn2/kU+mtzYTpqoaz9l?=
 =?us-ascii?Q?24aqWSeWbl9YNoD+WK2gh4NQ+TmMZsvfscliHC56iAsZlseumBXTuNR3R8eL?=
 =?us-ascii?Q?1Ey2zapWMRbwjJrqDdxwlW/j4TVkK8ouU8F5jW/O1eNw3s26M/0eqXOvi422?=
 =?us-ascii?Q?XjhyBGwKIVZUiFzV1b7PSVq/kTblYew/1+zdgexws9GQ3N23kcQPygVqfz+k?=
 =?us-ascii?Q?/80k20KfAk+FrrQCAOhvjs8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5083e0-0004-4e84-82d6-08dbb4ab6729
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 22:47:28.4046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXnuf2Qv70LG4EnyjWqpOJzESkR+42Cj0wfrWcMv57YFudstYR9Yo0vzNIAnpy+cbN/7v7pB0X9SJEfuR7Eztz3MnIS9uGwBgvkdj8vdO9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR01MB8417
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Errors were happening in the ISR that looked like corrupted
memory. This was because memory writes from the core enabling
interrupts were not yet visible to the core running the ISR. The
kernel log would get the message "i2c_designware APMC0D0F:00:
controller timed out" during in-band IPMI SSIF stress tests.

Add a write barrier before enabling interrupts to assure data written
by the current core is visible to all cores before the interrupt fires.

The ARM Barrier Litmus Tests and Cookbook has an example under
Sending Interrupts and Barriers that matches the usage in this
driver. That document says a DSB barrier is required.

Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index ca1035e010c7..1694ac6bb592 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -248,6 +248,14 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 	/* Dummy read to avoid the register getting stuck on Bay Trail */
 	regmap_read(dev->map, DW_IC_ENABLE_STATUS, &dummy);
 
+	/*
+	 * To guarantee data written by the current core is visible to
+	 * all cores, a write barrier is required. This needs to be
+	 * before an interrupt causes execution on another core.
+	 * For ARM processors, this needs to be a DSB barrier.
+	 */
+	wmb();
+
 	/* Clear and enable interrupts */
 	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
 	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK);
-- 
2.41.0

