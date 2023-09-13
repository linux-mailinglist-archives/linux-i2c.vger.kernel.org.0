Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66AEB79F586
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Sep 2023 01:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233172AbjIMXa7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 19:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbjIMXa4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 19:30:56 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2090.outbound.protection.outlook.com [40.107.220.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A98E6;
        Wed, 13 Sep 2023 16:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6gPCLuaCK4bul3QkrQ7yR4DkLmwOL54JXHyhcED/KMytdeTiJktbWGCzBoMGPAZh9Q6Rs0+GV8WH35Yd1OdJDGTh43MNMapAhgl2lz+rcQlv/40gt3otafG/pyEpzMzlWYnXjXqa1T25+nepn3mOoQM/RLhp3U0OseU7WWWxn7ADuFKl/eUXwlkrbNhgjtmbK8sKGMBMMv5C3MDO5ekEjWbheEJTbXxEehByVfkA+A21IuSkI8ZkUHV4/yckTer6C5CwSYU3Vblrrm69l3mVUgoR7DHuKDTUVPj0FKMJe+NrQfpe5xfUIVJCFyM+vaCahldnTYorqnp2rztWjWRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVsrI28jGvdEoHdXN0ZJVw8jUg6ZhiDWu8OnbohOE0o=;
 b=g6gJzn4aknsTUJnUZHfPGAM3ooj8GikB2T/MxEj9B1hg4sOpLiZ/YSaiQRANUB8uGVVYa4WXAfsIff4Gqg0u3mcx/rgoEshLB/pUuojKG3wB8VN59lbRwMPCseL5S5iOig3+9cq7i0zO6MOSNJuuTjrVOSinaiJfsuGctG34cvy2H9hIP4lu0ZWxfbHOuPdYRK34jFylQRZEDqklT8ep0KKdpJPj3bjcFCGJWL1Vu50v+AutE/0SjIDGLlfca/k/n+VGOhYOBHKDmkRbCqLRAJRgaB8NIRoz4rReWxEg+mXu1hPrEmm0KNd7yuNWNEhjNrLSDPNnZaq1ln2o60wZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVsrI28jGvdEoHdXN0ZJVw8jUg6ZhiDWu8OnbohOE0o=;
 b=EZid2LO7HeMnkPAeNL18u9+KUEad+FQa528MkOBoRT5p9rO/zbB+V2Oi5UzNNkwcvy2ocASX9aeSZuE5forL+Mufqq/7qlbnJOdCQ4hd87ZkBgmQv+J9+snxH3jklew7hZAi2I1eJ1GUOOWOaKE7nouNppOx+8elXgk8L+gFcx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from DM6PR01MB4044.prod.exchangelabs.com (2603:10b6:5:2c::17) by
 SA3PR01MB7985.prod.exchangelabs.com (2603:10b6:806:311::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.35; Wed, 13 Sep 2023 23:30:49 +0000
Received: from DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2]) by DM6PR01MB4044.prod.exchangelabs.com
 ([fe80::eb8:cca2:6858:a0c2%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 23:30:49 +0000
From:   Jan Bottorff <janb@os.amperecomputing.com>
To:     Jan Bottorff <janb@os.amperecomputing.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalrayinc.com>
Subject: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Date:   Wed, 13 Sep 2023 16:29:38 -0700
Message-ID: <20230913232938.420423-1-janb@os.amperecomputing.com>
X-Mailer: git-send-email 2.41.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR12CA0002.namprd12.prod.outlook.com
 (2603:10b6:610:57::12) To DM6PR01MB4044.prod.exchangelabs.com
 (2603:10b6:5:2c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB4044:EE_|SA3PR01MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b856f94-2e66-489d-4bc0-08dbb4b176aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WfZuQ8RTxQzZ4vB7EHR3Kh6D3BCXW8Uo1rpoxesPsMyVyy04SwENxqBDsk4fqkIcbVGiCPkbCwfBimwGdBn9Yzhat7APVZYljhvDYrEpzSJG9saHhwDW1nrQI3sVK3PzJ6ZWiBEU1c015RRmR2rxJhHF1MKy10mn3PBfXkfEM33hcUr0SY1mxJ5vBe2Y/YFg4y7kfdFkBDvZYo3kvXWSAVgdMOHBnFHDikWzow+thhnYBJMvhxFVp1WIZnb52BAdk7Pgk7T0bZw9NARJLn878ZB8yM1CfvSj7oU/eMO10CmV27WRlX+CmbOc9W+kTOLcmRb/H3+nFg9FSv1Dy2FNcMoXWiVgV7ee6F3nvle4ESqc9kuqXwgDyvA7l7gEeZ/nYO4JgCkM48W4BsXiueZ5ZB9jvu7+k46j8y+SYYOrjKlPN1V7ulmk8QLRZtmDIxGaEIIQfJsG+ZCLOlYNQaoxYfvM75hv8a4mVhfEme/ozyzsBwYLo++IKRApiwAHMftuZBQGQouQ9SJMqAktC3pwXQ+ItTVNSfxNzaXnNbYjcfQ0GzeIefYp0PhbOVK2M6uvu46JBSbajtGz3Z8DvvDTqqmG128L9NuuZLfms6Jxz3Lk5N+txOglPvbBLcdUlilp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR01MB4044.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39850400004)(186009)(1800799009)(451199024)(8676002)(66556008)(4326008)(5660300002)(2906002)(38100700002)(38350700002)(86362001)(6666004)(478600001)(8936002)(66476007)(83380400001)(316002)(66946007)(1076003)(41300700001)(52116002)(2616005)(6512007)(6506007)(26005)(6486002)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zllMrhLZVNj6FFi19IjJ0a7pvVdxxWOxZDnAnDGCeHqZ2CIkOXCNiXHXT4zr?=
 =?us-ascii?Q?ghBusuCLLCJyJDQ73IJnXKTjCdydsLWrQtyvdi0UfpjWV/ZEDsK86jk1yQPV?=
 =?us-ascii?Q?aPoiYszwmYdE7J4lWyOdxKm/+24AoeKNydOkFdiWfp3R3uKliA3j0RJzi1Px?=
 =?us-ascii?Q?aCaHlCh5cd57o8BFwG080vbWXyjwIZZ1pEHqRle7n0eHjlp3It7/OSCdypIv?=
 =?us-ascii?Q?6lig0VWf2ngHsNOrILcp2qh/z9j+921ZutxoHrKtjC3PnVjUtVBU3eO7uykU?=
 =?us-ascii?Q?dY5OBUELz0dXGwB1Fcj8u6WrZT2oMZpvTABOIz08X827XIjJQczg/KyWTh6j?=
 =?us-ascii?Q?bOPmK856qb9DAd7zK5e+3nOwtYD8zdIafDYYMmAbH8uy73HejKuC+28ZVGcS?=
 =?us-ascii?Q?BcqkxrJ18+hJNupZatBt5SIin95KBPLY5k3eZz54hVTa9oWgMgLBybv9QQAp?=
 =?us-ascii?Q?Vpl3PCBTszu09leEIZyFeQJHbkRgRnIb3r/p73kycgLZE95KPnJlWnr6yday?=
 =?us-ascii?Q?CGl2OfSbA2tHBiXzjRI6BYThA/uNFDZRdNHcRd7tTvm9rDsdUtWJdX/NNcEK?=
 =?us-ascii?Q?VKZTGKgj73dbjMUQWiH0yfBX4u4508s/IyL39ZToXh9FcCNHGV2lu+mfnNDH?=
 =?us-ascii?Q?k4GCxxFod8fapfVpVZtGwjfoj5PKZUPqzmUqDJdJc0Ci+oD2tVF26yfDI60O?=
 =?us-ascii?Q?gHk46UVhT8lXAld0mRhj18XplWr2Md7ycWPCZ+dvMRE9KbLq1W+DmkEfgWEf?=
 =?us-ascii?Q?wbpPQt7aoBCSirLnrmyCWDb5vsIZMJ4qTTV8toCXLHkxNgni7ixhQ0oOaqgG?=
 =?us-ascii?Q?k6/YQT08ReyJmBcT4ZAui8lNR1s6+4/cg5thUsyNfmEB+Wa4ojI2ZiNIYKut?=
 =?us-ascii?Q?H3hj4q80g93ITI6zTJ0MQoi2NmmU1puIgaOgSgzmFv9pM6waOtQ5eSVUvPS/?=
 =?us-ascii?Q?1pxVizDFYP9/PTZLwW64eiCQwrrsPpzDsK5mqv9+74HLD8Vpmy19hE9zgk0R?=
 =?us-ascii?Q?JYud418/FXWRCCqkYNhUXXiqL1aVODQrKOtPZVoFEZuNtlzySdArW9saBvZ+?=
 =?us-ascii?Q?8MuqNMZNrZs2ouUn/LYiYaL65I6VEcEZdE2AILt19DNaTS/k3Mlbsgdu7zR1?=
 =?us-ascii?Q?TRZKD2Ar+CklfHelzA3wy8jdzaPay5HKGi157eNlKLlh2FpirHWdMB/xrGZk?=
 =?us-ascii?Q?OLA8Gu/oyf1aXb40Xy221UNbJPiGmMr8I/V9Opy/5Eh0d4RMV+4YjngEfLnQ?=
 =?us-ascii?Q?M1ByDxX3MnTfGfIa6DmvsGOvIJ9YGKgCjl7/Ru+gCbakyg8POXwNRRrJNYUW?=
 =?us-ascii?Q?jun+XAbUPNGzfCsZFnHM4hDOFg8+DW+1bhhn++TzYAchtcoeth+JWnrXrKLV?=
 =?us-ascii?Q?3HUuHNR0GqkmyQ/B5l0JyfEEUJw9xqPlVSLBv9r32cTqthTxlDbTI25bFuw1?=
 =?us-ascii?Q?i7Sp2fMnaNeiLHJPSb7SUXwZOXTTWelzLjRiXp+uyXfzi+dSHUlrQsh4fHju?=
 =?us-ascii?Q?qbKK6gs1vG5XSkfyJNWiuTIr4EuRCdae26pxXfXrBkofnbMvcwCKBNBaNHB2?=
 =?us-ascii?Q?/dcvOmiwOydPKP57ar3Xvfjr1fuP0UllZO8NMqXG07TbvttwgFI65rCL0d5a?=
 =?us-ascii?Q?o3qaWuJzAs2Y40LYyG80iDM=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b856f94-2e66-489d-4bc0-08dbb4b176aa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB4044.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 23:30:49.7435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaR+/k7BOkofdaMPwr4pcZvlCJB21b4IPHR6VDpg7yTqEpqX5IzbN1WeXO5BIvjSNI0fIwPtRU6P1teO2YwPtCd7Z8+7/hMwtDisLnFXlME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB7985
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
Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
Tested-by: Yann Sionneau <ysionneau@kalrayinc.com>
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

