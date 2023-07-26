Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E16F2762F43
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jul 2023 10:09:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjGZII7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 04:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbjGZIIP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 04:08:15 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2094.outbound.protection.outlook.com [40.107.92.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EC41FC9;
        Wed, 26 Jul 2023 01:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1e6g/Nym2aSIAFdrUEzQgS98lIeXBdN/ie5hRQP+SsVpL8ocFXHv5xly5qxHtTVMA5N1lt5ZvaaVuOkmf9eserJ5/sdTy1y8/jpdpn2R4FybjcrMSvbkx4BRTSlcWyjO5+c8To5+abyPTltCkUO53gWXYPOETUUlPJPiz3pFPBnTSJK3Hg7Z97akUkd4iQMkma/Mx/hHgE7pROPOu8IzqIyBPl/WQvmp7NC/gOia8+oBq25FEHCiGiJG+yOA/WB/4ZvXez4kmazI+mfn5HMfPsaHvORGX3wX7Cl5drmwZYiN+3+cc5IGtY3ADbnINZcAP/wDZ82neT5GheAfLfIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiXpaJ+STegM3GCLwRzoyO2t4P6/8a3dgzlhDwgZPmU=;
 b=Nm2ve+TSThdj1Kt7v9BN8XznzmSaQAMqjIT8BBWD/ByDb8tVjs7jZC2ccma6cPJ5njVbDfb9lH7a00I6DulhSWlkS/jqihPxharPQiLXn6i10lfPpkW+XmWdWmR9ixNLBNGGZ88OS1zBiaPGV35QfOiC5XvB+X1em4C9IVsEw9yLC1Pa2abiPZ8mr3cDSzSI11o5mOhW1kI2kkfzGKQlyx6fT1amETsGGDwMyThfkncoeEdQ+3dYy2BnFChxBwGbFIdM/EVDzpIge740N3MqdMdfQIo3h7D9KJDLHxARyYwwl93aHXBGcgu9sMIYZqzR1hu+RNkWNRRtBVFs1VlfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yiXpaJ+STegM3GCLwRzoyO2t4P6/8a3dgzlhDwgZPmU=;
 b=AkxWeEbUGV9NQ4EhDy74T0MUqG04GvcyODIO2tfcUNTgkTuBMh3eAXu6j8ObyQpDg3mKk8cvIDTNaX2fFTr9Z69iY7WSK278kuOlKotFjmcJG69jCNh/7AkdZwxYOmhTPUu/AdzY5leLbPMYmPqo/vr+IPvirTnckffM8RBm7DM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8) by
 SA3PR01MB7988.prod.exchangelabs.com (2603:10b6:806:304::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.25; Wed, 26 Jul 2023 08:00:33 +0000
Received: from SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::ad0:68f6:fb88:bf5a]) by SA1PR01MB8131.prod.exchangelabs.com
 ([fe80::ad0:68f6:fb88:bf5a%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 08:00:33 +0000
From:   Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, tamnguyenchi@os.amperecomputing.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        Quan Nguyen <quan@os.amperecomputing.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 1/2] i2c: designware: Correct length byte validation logic
Date:   Wed, 26 Jul 2023 15:00:00 +0700
Message-Id: <20230726080001.337353-2-tamnguyenchi@os.amperecomputing.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
References: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::26)
 To SA1PR01MB8131.prod.exchangelabs.com (2603:10b6:806:325::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR01MB8131:EE_|SA3PR01MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9fd108-d6a7-46e8-de9a-08db8dae6369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H4ySfHAqf7GU3zNi5yYyhvXpM7UIcN37PSRaCZ6AT0CExbcC264dWS4NJEVwCLuDmPRrY44EKKhF0vp0+7EOlBWFFYOlJLX61Ti2sHl4FeD48L4NNOsWZotrI1sBc+0U66JJNCahTUR3ml2CVAeIhKp+2fg5C69qQDD7ci8PXL8ump2Vx+vW9buRHrvTqYy/rgKk1B820mz2e+/wIumbNikGC+BduU8SbOuTa1y9SWBTGGxQ6qAdsYjcYALiwKxFCPFgfbTmjlz+yamUoV53aT4KAxFRwQXNFx9rTCDDUsp2zUl2ML+OnkjrAX/AC++R7pCxg3gQ/M2Qrl0ViLq7Y6Hv7ySS4VZ7o3Y9G+xfwLRCElm5ELvNbMGxrzt1KBrXJAuPhThYs4wqD2/C1qsysakMP+NU5soSWUyRpa2xvYmXzdvB8mBluP50ZtvqwFG0vwGRaLNhpoETOP0sULbMaGM1euf0whsI1U4wCq6Jlu6E9lxYK3iWBZTpWQQ01TJVaaYshH+ojdIZFqidExwIFzu6PLkEKgiCPqUQRgi2AP27uZE21LMAoa212x133d+HbswakxRm+YHIR2SWSa8iSksPsu8gEWRBTVbWd2cLfcM5ZD+UTsHy6D1SR+Ke+IDr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR01MB8131.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(396003)(346002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(86362001)(38350700002)(38100700002)(6486002)(6506007)(1076003)(41300700001)(52116002)(66476007)(66946007)(316002)(66556008)(4326008)(186003)(6666004)(26005)(6512007)(8936002)(8676002)(478600001)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NkKP70Wlryf5Wy/ysnOYiyEaQcWQxLJ7/YzX5Uv6DokiOh2Vu4n1aizf6qul?=
 =?us-ascii?Q?SkyuvIfks0t9RGd017zwOfAbtE9QVj+M377YmpnPr+ogiTC8DbVib6ZFvMzB?=
 =?us-ascii?Q?NxfB/8dkU04P5HPxk9v0vFbx+4MY8c9oZFgdB7zERHn9jsS9MWIpd/oAqooS?=
 =?us-ascii?Q?oUjugiuqIQhz2Igk+m8iDUdUgfNUIl6OEaS4fmgmR4Zy+NzhLMqEzN2TfH2m?=
 =?us-ascii?Q?MLIlWg88CwIm0432bXACpwCtL7jM/dKlfYGHW5B8nts6M4JbZQrWSDOPVofS?=
 =?us-ascii?Q?hTtIZYNt2NtMHxaYsx91IzLjsExXUdWyzpvdVR+12KHibjRIQ7qjyHmUz54G?=
 =?us-ascii?Q?LQ2AuyJYTxnwzx4gtgw83Wd+YQen7VdYlDRISOroV5LZKD79XHzPm5juJqme?=
 =?us-ascii?Q?gAcEzgRLkanSGXMRyHddfsR/nEH3ea40FVnwINAb6uPSbson/LWaVcETN+pJ?=
 =?us-ascii?Q?Z4ndyu3bWjrsOlMh2O/X8qQQhUTALum7k2tlLyemjZlPY6XkFLhIihP7VpN9?=
 =?us-ascii?Q?wFGLQUlcH2PmCwNV/y5Lgz3S+RuyQHX2oxRFsDCFAUOJLawlEn4AXJwgh9+x?=
 =?us-ascii?Q?1JXgK+WY/2KMMjYaTS+bZ46X+61nlRwbGC6ue+M0JnG5DA/4TFZ4d5oe8jy9?=
 =?us-ascii?Q?DPhZl4mgenaOaFzyE1zI5vaPBRBdbPZOLgsyKqXr4KPcMZ88G2yjYfaQI56R?=
 =?us-ascii?Q?QRM3awZFNihEBFfIr1Iw3o0YzT1xPZ/BxhxvLh30hDB8h453WccIMe6pkVss?=
 =?us-ascii?Q?362SUhALI+xS+R8QdHNCPFnJsUwU/yjUALx37Fon5vQEp8DfUayEw/Do+/YS?=
 =?us-ascii?Q?aCDkMo+U88q3Pq5ZVQ5nXmv1eXL9FbtHpcc4eDBc1YLBNwhsw8rAGjatMrXn?=
 =?us-ascii?Q?1CNhBIeMFKA9kCRaHJoyEqMbi/9vPLy4CDoLG8QSPkDkm2cVVsrHeOEf8wmi?=
 =?us-ascii?Q?o1tQsnEVFdyi8RugupA9gUrtgKQkEkJNEqV9eZ08Qa425HkpRWo0/6USbxW1?=
 =?us-ascii?Q?MUAVYYdrS4h+Odbkb99NBiX5UYb4l9CfgNiG2vIFftdKxAw7dXcG/4XfvGr2?=
 =?us-ascii?Q?WbV9r7Vu+f+/k3H95Kjbc2OSw7NiWA68YJzdU2fArOyVX5dZi5NHj72ZHgzg?=
 =?us-ascii?Q?QMEoeBetdnQ0rU8h9uQhK4jd+BLJXfNc5C1hkNs90rJBpPDdxrnLoR/2smOJ?=
 =?us-ascii?Q?YgsEC4LGhznMScnUB/AD90mALiO46SVitWYYhZqG9WKs/yjJOssqr5WOUc6V?=
 =?us-ascii?Q?C65y5Y12KSni2fsdh6sQkfqyb9ImbQVBnhJbn16ZeVpQ+YjLOJ0bOzTgtyO3?=
 =?us-ascii?Q?HFFVPl+MZwbgUtxTJYbH9k8ddfmyO6in+tPZ1oZ3hrHH16bYZp9Wx8GSsWRm?=
 =?us-ascii?Q?x0HMGFsQBe8ayoPUZLKZz9sV/Ge1Yi3R2I7E+p1trKp+pum3fbJBjk9nlAZw?=
 =?us-ascii?Q?M2F1b63Ww9LrcCqF6A2tzANKCxSMncj4z0tT6SwR8g6tLt7WoKCM1CibNsmh?=
 =?us-ascii?Q?wcuGPny3KCwz7kD07mcBrsWoplfChDrfGFiW815A8eO72AXGss9iKftLEFIh?=
 =?us-ascii?Q?gxvKYKJHHhDHcOZC+wR9hnoOQ26lpbI2aS5dnxPjxdZWFtlKGXi/nTfFNYcB?=
 =?us-ascii?Q?Rl3jwq2kC3Fx4KhTHlvq4LxZRLs27rCh20PvfU/w6Skt?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9fd108-d6a7-46e8-de9a-08db8dae6369
X-MS-Exchange-CrossTenant-AuthSource: SA1PR01MB8131.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 08:00:33.6776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmEG/McPC+GQgsrvdZzksRaBkgBt2m1zRNPc7PmFVrbaWcsZBR2ELX6ywJXSH2/KIMxzEcIPhTiwG9ZN9KITpXNDbvx/eSAWzuVX0/lfzU4gFjDWQmrwpqTWDpfn+e9v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR01MB7988
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Quan Nguyen <quan@os.amperecomputing.com>

Commit 0daede80f870 ("i2c: designware: Convert driver to using regmap API")
changes the logic to validate the whole 32-bit return value of
DW_IC_DATA_CMD register instead of 8-bit LSB without reason.

Later, commit f53f15ba5a85 ("i2c: designware: Get right data length"),
introduced partial fix but not enough because the "tmp > 0" still test
tmp as 32-bit value and is wrong in case the IC_DATA_CMD[11] is set.

Revert the logic to just before commit 0daede80f870
("i2c: designware: Convert driver to using regmap API").

Fixes: f53f15ba5a85 ("i2c: designware: Get right data length")
Fixes: 0daede80f870 ("i2c: designware: Convert driver to using regmap API")
Cc: stable@vger.kernel.org
Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 55ea91a63382..e96276d1b002 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -526,9 +526,10 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			u32 flags = msgs[dev->msg_read_idx].flags;
 
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+			tmp &= DW_IC_DATA_CMD_DAT;
 			/* Ensure length byte is a valid value */
 			if (flags & I2C_M_RECV_LEN &&
-			    (tmp & DW_IC_DATA_CMD_DAT) <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
+			    tmp <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
 				len = i2c_dw_recv_len(dev, tmp);
 			}
 			*buf++ = tmp;
-- 
2.25.1

