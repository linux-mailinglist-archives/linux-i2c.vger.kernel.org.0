Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25A0E70D749
	for <lists+linux-i2c@lfdr.de>; Tue, 23 May 2023 10:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbjEWIZS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 May 2023 04:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbjEWIYO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 May 2023 04:24:14 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2071d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::71d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3AB71BFC;
        Tue, 23 May 2023 01:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sujosp95LQnO1SrlLw30IofG9xbLpdrgY/0tu3SOtluLTaF5iSv2GWBcCSf2BTqO3aa7p4BloxEG38iL1otBPBFzqHG0UlwYnqQxm6qRrLwfGF4HoBHjXKAFQ6ShwPVC9QOLFgrSsYX4qXSSnEJgjVWWtkxLwTgofVUwT3UaAiNLenhmX/UPYJqjylLIOJdPGTizF/Rq+6xm8PCTSxTAMxZstwAH/4IFnmJJy+eRtwJ728vbDusPqQMOa92nwhHzCJXHUjy0r4bjAa+PIbEyqAVMd33vVQi9t0u9uUEG4w08/hlvowaKtV6HC6lknG0CSdUafqpN7o/BkVHIEL2MRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7e4gv9TX1tZn2bC1wJlHhiyYh78hy+Z65tRLZ6+ULPw=;
 b=mB/uy+QshfBx0RpD3i2V/OHKHcF4Utski04gr0WlL+ezuCe6yjZqCoSm0HmoHTPFPbAJLKUVsyKEeBzpycO5YtF4WqL8msxpJJ+9a7p90lY5y5tbEHqr/QnF7bkohmijezHxup6sEUGlWf4TfFEp+R9NHW94AiARF/nTdBXKBICEMbaG4LUe+I0hov/AsyJovRGUPymDwRc3H8dB3WKgnYYbBDbQU8SKifvIdkN8WDRAsbAvZOupeVfk0wxHsv5+iVY3R+b7tln/2WtcVdCwuKODfij8gQiRXHkLJP/cZU+/HfJ6q/4D/S/GtIMi8HSzOquwswaZVCSlF7MRzskdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7e4gv9TX1tZn2bC1wJlHhiyYh78hy+Z65tRLZ6+ULPw=;
 b=vBT6C25fa5fUD+RHynMngxV3NdJYIgwK/gBr1TKDdCgvP3K8mbqTHjjLBRfJyc2WVgulmj3KWyxz6c5rxejWcIDCQmYzssCh/GPmk1IxxSAIHj1LslfmogWto5AWuGa3E3d/1M5E4AkngDi8cUF24ct2vnD2sWveFwGKSf3Jvpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CY4PR01MB2840.prod.exchangelabs.com (2603:10b6:903:eb::13) by
 BL1PR01MB7817.prod.exchangelabs.com (2603:10b6:208:399::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Tue, 23 May 2023 08:21:41 +0000
Received: from CY4PR01MB2840.prod.exchangelabs.com
 ([fe80::6be9:32d4:b518:8b54]) by CY4PR01MB2840.prod.exchangelabs.com
 ([fe80::6be9:32d4:b518:8b54%12]) with mapi id 15.20.6411.019; Tue, 23 May
 2023 08:21:41 +0000
From:   Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, tamnguyenchi@os.amperecomputing.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
Subject: [PATCH v1] i2c: designware: Handle invalid SMBus block data response length
Date:   Tue, 23 May 2023 15:21:18 +0700
Message-Id: <20230523082118.10935-1-tamnguyenchi@os.amperecomputing.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::20)
 To CY4PR01MB2840.prod.exchangelabs.com (2603:10b6:903:eb::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PR01MB2840:EE_|BL1PR01MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 29359652-ed57-4869-c79e-08db5b66bc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3q2atTDTildJzmtl/jJ9W3OLzCdREYBsfPwz7ZsG7ktzEtPakRVs4aR6EsQEvF8PM3iyGzA1DGQRfUQQ3nA+RLY3DOxGZMyZTZpIxYTSsdKQnrn1QZvTo5T9QwcePoGxo/EoLBciUXJ47lmp/RquP3ODePGJWVO0tELHiJQH9y5jPvJ1gyvx7sJssTudFVxfZan1ILpCqi5YNe4TAo9fv6kQnjF61wTc05sYHWldTg413q8PWaHso4MTJvUDD5ax9cRmBCR7/ajj3X2SQ7Qc6RA/Q8fHsKhJldsEU7spcciEXWGx+vo/MqkhHjR/riGEaDchl1bupbHT+1n29b8GNqG7XeJ43mkxr9x86D18qzqdBoQ7eDLwvXnXbr6QEnfFQkOWLfazzQMLVTloYPG8m7Ao763PBzp9boTFZLm6gDlkwLeHdlF/61iXckrlbtaA7DOkRzB9wSoZx3lSM+jk1qzYc0yVwDg3tu7N+CUczD7I0YQLmEEZNBXtKLzP4Zjlr7/pSEYeK0Zee//tuWWCNSJuywDiE8ylhFW6/rmKZRKKbqoc2G1gu0TyndnBXOWg+nCTyi/EpEQVuKKjmh9wqNAqox/JqsqwfO65pXGZ5c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR01MB2840.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(39850400004)(366004)(396003)(451199021)(41300700001)(2616005)(83380400001)(186003)(2906002)(4326008)(66946007)(66556008)(66476007)(6486002)(316002)(6666004)(478600001)(5660300002)(1076003)(6512007)(26005)(6506007)(52116002)(8676002)(8936002)(38100700002)(38350700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VU9zuXL3XNm5u4PYM6R1Zo8A6AzsJ48VBdetys4iRejXFzSWpDGUVeYPNsV/?=
 =?us-ascii?Q?613nZJ64pfGHaJQ1Lo+szEsKbWvf9KWNPXZ9nqi4tZaH9ebJ2HXzGu/1Jgmo?=
 =?us-ascii?Q?YwthHpLM5k78k5wh0sdC9xIVgZ1v/AmAdkUiOgDrgzyTDT1kYtV6LzCaPFQA?=
 =?us-ascii?Q?YbzO1Gc+41TwO+1d/b0kbecNpIhMOVn6JcS0RaYGKIuqgqGIP0/6JC1ijssn?=
 =?us-ascii?Q?Bb3OtKSSRRQCBZK9XWb0HrKKexCntl2YQceG4d1ExB5iaymU5Tya23YUVbXl?=
 =?us-ascii?Q?de8EYcYTCljE5A2SSbKWaMDf9YFAm5ih1kWbtLDWdlOzLRLD1ZjVc9eZo7HR?=
 =?us-ascii?Q?dhTSbTHPXm4hnC7GTEIVQLqw2mzAy1MAFdA+XDNk3V+NkYm4fpaggOsbIM8v?=
 =?us-ascii?Q?uk3hPYP2rDevIPuiarsMCgukLNQFGXreVgy3LLiqI4ZJOShISiG6EI5FjLJ5?=
 =?us-ascii?Q?ybMw7sPptnnGO17iYAhQOreplgkrOaVzAWp/VhP4Je0/AxsUG6onj8WvdAeF?=
 =?us-ascii?Q?ye/NBOlqmGaWJdzhxrZv7oNYfZTY8uYpmmOccXLPsXs6JXbaSAGI1PMY23Le?=
 =?us-ascii?Q?K05WbUxusfaqj8zJBrjdpWo1NqGQ6EDBpXo5T0RzCOxl1TUGWWi8ByCJvmVU?=
 =?us-ascii?Q?59KaFPbFj94ag+z0oA7SqGDwY2eMFIrJy5lIc5yc9aVk4H56qA5dpoojYKrc?=
 =?us-ascii?Q?2V7lEnPFJ0O71mNZ80pP4c+pSq0jXFqxLzo0GCZb/sqcbRZSyoZqdkAMxvlf?=
 =?us-ascii?Q?z3fBfHadr89rTIabf7tTUU1xKCeN6gMcLth5hnCpZ0yMJ4BjL1R0qlHOOfNi?=
 =?us-ascii?Q?BFMwNgy1WzDynMwRggrYClFjNkn1EJzBFLGzoU6+fb7R/Q2kJuhphCbuox8f?=
 =?us-ascii?Q?r8eDFH+2xX0xngIUyZkX5Owi9nvcF4Ysx6102Fx7ozd7/zl55P1XBYSeNv4L?=
 =?us-ascii?Q?v9qoxaag1NwZ+ZYJRvj7+uU6b8OAb810UBHb4RTbXgLtEH1JNokj7+f3i7wg?=
 =?us-ascii?Q?BPEl2RlctFkvRA8/Lj99VSyaeBhTtNgjyhuS220TucNSZO4O7huL5vnggmOn?=
 =?us-ascii?Q?LO2FcNXMA506lQbBW2uXPso6fC25axTHq1u2UYjxRz/TYQgGnLzZ8K7nVPvm?=
 =?us-ascii?Q?7amGLRmcSq1Tl4thJ1YT7h0ZpkUL2ZSKOtAfD3sfKke495HTGSvZt6Jm5/KD?=
 =?us-ascii?Q?gN9b3XonBaez7psrCXh12bMei1YEwpH09FwyPd77I6NfZiEzQN5n5D7UnUgk?=
 =?us-ascii?Q?fEVc78x4tgzfRE/pEuuwCoY4qrykkhi32zq2cYqr3G5Na4hVtlKuPV13CCAC?=
 =?us-ascii?Q?LG0Qw3MYqLTuIvXH4Zh2jEueQ5Gr1QW93XeOHpmC1FDPgkYmVM517DC26fi0?=
 =?us-ascii?Q?RutJcz6nwLffmbJw6YmJW7XRCOYop1ZZM2OsK9jnGH4oUDjGYZCUrf0CqcE9?=
 =?us-ascii?Q?RSjQBdDdw0g3O6k7WZDUDcB8llp+3Y4dmLyrOnWeMTAYiitBxOIJr07DPMvd?=
 =?us-ascii?Q?F8kciQIZExv9EbSGpGitUA2ERY+B4rGcAqFZVeIeypSuWofRsCugcs45LQKo?=
 =?us-ascii?Q?tFfXcPDZF39OhhghEkVfJ8gqxvyw2/ddGZlQiq6+uRzJo5D3VkNXJWO0qIPZ?=
 =?us-ascii?Q?KKjqFQHSKlXp6oO0lpw9YjSD0KaxIps2zSa6Ec8ZBaXc?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29359652-ed57-4869-c79e-08db5b66bc2f
X-MS-Exchange-CrossTenant-AuthSource: CY4PR01MB2840.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 08:21:41.2153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWCk9ELbbN6QqNZU8fkT2gyPG1YxsUklZ+eT/nYDJnVg7Qsgm+RxUXXX+W3CvXDouMbr84vWbEyycAy03vlJZ0RzVcI4Bl1ASdueJuOiIFlwSpGbQtZLzGm5Cy/tH2iY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB7817
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In I2C_FUNC_SMBUS_BLOCK_DATA case, the I2C Designware driver does not
handle correctly when it receives the length of SMBus block data
response from SMBus slave device, which is outside the range 1-32 bytes.
Consequently, the I2C Designware bus is stuck and cannot recover.
Because if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which cannot be detected
from the registers, the controller can be disabled if the STOP bit is set.
But it is only set after receiving block data response length.

Hence, to prevent the bus from stuck condition, after receiving the
invalid block data response length, the driver will read another byte
with STOP bit set.

Cc: stable@vger.kernel.org
Signed-off-by: Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 55ea91a63382..94dadd785ed0 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -527,8 +527,19 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
 			/* Ensure length byte is a valid value */
-			if (flags & I2C_M_RECV_LEN &&
-			    (tmp & DW_IC_DATA_CMD_DAT) <= I2C_SMBUS_BLOCK_MAX && tmp > 0) {
+			if (flags & I2C_M_RECV_LEN) {
+				/*
+				 * if IC_EMPTYFIFO_HOLD_MASTER_EN is set, which cannot be
+				 * detected from the registers, the controller can be
+				 * disabled if the STOP bit is set. But it is only set
+				 * after receiving block data response length in
+				 * I2C_FUNC_SMBUS_BLOCK_DATA case. That needs to read
+				 * another byte with STOP bit set when the block data
+				 * response length is invalid to complete the transaction.
+				 */
+				if ((tmp & DW_IC_DATA_CMD_DAT) > I2C_SMBUS_BLOCK_MAX || tmp == 0)
+					tmp = 1;
+
 				len = i2c_dw_recv_len(dev, tmp);
 			}
 			*buf++ = tmp;
-- 
2.25.1

