Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B55254BE76
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 01:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiFNXpn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 19:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236212AbiFNXoP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 19:44:15 -0400
X-Greylist: delayed 864 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 14 Jun 2022 16:44:14 PDT
Received: from mx0d-0054df01.pphosted.com (mx0d-0054df01.pphosted.com [67.231.150.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0328B4BFD9
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 16:44:13 -0700 (PDT)
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EIPRKj015170;
        Tue, 14 Jun 2022 19:29:40 -0400
Received: from can01-yt3-obe.outbound.protection.outlook.com (mail-yt3can01lp2172.outbound.protection.outlook.com [104.47.75.172])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3gmqy4swd9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Jun 2022 19:29:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrcLfubiljG0kjAAs1NP8oPL+9q/N93x4r1YvEh+HlNy4iCjWNp0GjVm7rJfnWSu5jSUC6+alVq3rxtSPDpaYpxz+DCAzlBst52p7HXe35KSRFYI2Eo5KaiGKCcy0f5KbpH31nhz8LioW6+L+0DUdN1COEqdABhoynhGLLcrjo91EDLDD2/UFNeVCUdAMVNO0Ztz7FLc6dbcBx+fbP/TvmGg/SPgm0fJvMa9Az2eulKG4cCuu2o+zT1ZR2Y70Mhl/TenpkIJq/5B3T9cNxDB7w4wz6raBSDXpzNDf3Jd9kvU6Fh9N46eTbBPHFdP2Ns/37DKlQOEwafjQviDkt4nqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWtHEnz8Y8VpYvS1qkSw7cDH7thSLuHwrzMdB3ocfck=;
 b=aIqxpeJ6KeWTfHTk320YOJfF/ZY27UkrlVyFcSaGCMTTPMfi0aHL/uuS3WZYtrymnk01yOBMrpqzecLuH6JEt/b4Lkv+MZaphghcWLTS3j2HelqRImYSLoxQrviSBD4IFrhu1wJurwOYriFgv9BpeL1wZ4RhRHUlYkRGKjD/HKkSv7Ea9giDSOhW53Axtnt3MTfr+UsvyDJYGbkwGEX5nf3Xv0JOwBkd0/C81HGyPoIJogtfrb4h9aVPrxTET/yjEnJYZHSmaz5ygTy+EGpRvxPLcGeKVef3bZX3NnY1YvOYcFJHvd3sBlRthYTFcIC2Du/ZHHCwODE6XrDdpHIE7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWtHEnz8Y8VpYvS1qkSw7cDH7thSLuHwrzMdB3ocfck=;
 b=gQEMJ5oLcNvDeL/RQ3fZMiK4vue5BQn3BZJBm3cJS8+WRwCQzxYpOTq667KPL2B2XLytxZ6/OSHFlA80PYEABvWrERISnmK7BN6CWWqaced+XEey781OE68YnEt9hcIjCYMYbXnITn31t1DbNHJhPpJMf6Fpk2XpvqlnewB3Ogc=
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:b9::6)
 by YQXPR01MB3782.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:4c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 23:29:38 +0000
Received: from YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::9552:28a6:f4b6:31cc]) by YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::9552:28a6:f4b6:31cc%5]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 23:29:38 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     linux-i2c@vger.kernel.org
Cc:     raviteja.narayanam@xilinx.com, michal.simek@xilinx.com,
        anurag.kumar.vulisha@xilinx.com, wsa@kernel.org,
        shubhrajyoti.datta@xilinx.com,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH] i2c: cadence: Change large transfer count reset logic to be unconditional
Date:   Tue, 14 Jun 2022 17:29:19 -0600
Message-Id: <20220614232919.1372621-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT3PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::22) To YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:b9::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dde7a14e-cff4-4fc8-06d1-08da4e5dbf9d
X-MS-TrafficTypeDiagnostic: YQXPR01MB3782:EE_
X-Microsoft-Antispam-PRVS: <YQXPR01MB37829F81E2DD436F87129986ECAA9@YQXPR01MB3782.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L2ywcjMlF41IOxus4RmJyu+h7cIrAeoLOiHGOHI9Z6ZdOeBUhAJ386IHOduuc5q2Y26nITFFQPNt1zVlZz+QqP80GRzAMZP0K1lLkKkCK7VLtJeSX705R6vNf7gERiIaUhXJmJgswWsdYd0Da3PVCuvM3XyAJPoK64D6keJIySmwsQeOtBTM+fh3RFJ0g9h06yRziKC2Uj/8TtzneBpRXsFV5ECJEcyv5rqZrcCymUpCKk/91aMw/JcWBY2By9iRjKdNPKyTx5rmOJUUcwHdOWEm6/uuInSM6xy2BnW26kHcRPJND8OB+aAHu986q8AtpXl+/jk3RuCTHQTfjTEnyb4ChxYNbb0KNbJQREkH/ti2XzRjDnnIixPqrOWr4x6nbNMku4U+1UL87Lrgsaa0qlj/CwgjzSJI+KU9pgGZo4bPEV3x7Rcm89Xd2WZKcWOuSAN81PnfLAfmf3/wzlnWq4CDHzEmkbfBnwGYqrKk26Ci7PG7qfS4v9y2NT0X1PyittOqqtdYk0B5H9q/+q0awxW0v5lGs9yV9/GUjGh79C7YLTKKS0n6GjHoTdSloNu65OQ8Qm6mcHY0AvuqB1+es/X3tk4cdoBJWaz1bzTcvQ+/wRuhTQco3zLMHt0toG2FjTVMiqQHxPxDdbOynTYL/JsRMeOF0CuZyzWwwexBh2/Y2TpeGngy41pphL+P9I9Km2lhSQquMmWC9j2kGZpQGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66556008)(86362001)(508600001)(8676002)(6666004)(66476007)(4326008)(6486002)(83380400001)(1076003)(6916009)(316002)(66946007)(186003)(6506007)(26005)(6512007)(2616005)(107886003)(52116002)(38100700002)(38350700002)(44832011)(8936002)(36756003)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q3U9csW2KlBYaPluyF/ZD4QQayoW85AhykdKwNiAF4HxvqaN3zt+Ty0h7UqZ?=
 =?us-ascii?Q?dtBxrBSbvLojb6K/38QOZGdUrbLL/o+Gn0LIPK6NczSMkR/dhiDI5gQgMpoy?=
 =?us-ascii?Q?DOEOzWTR+FONHWVkD27mDeoiZQWvw1lfJ4HM+IsE4vFGid2wue3aMM+N4k03?=
 =?us-ascii?Q?1hyHCIFyE0akz95XUHhorG7bWesddtKhRm3HYC7qt9Zq4WTPW9sFMvGZzzMd?=
 =?us-ascii?Q?DQwqpY8YoDw9ZtAQIyAciuzZ/8j0lD1v6Uo+XOyvZb/ueolPsFJfXp6UbpG/?=
 =?us-ascii?Q?jONiLXH/MToU/w+013hWXrsUpcNewftBXaVyLBm0AXFn2A5/9jdtqgsPzQXU?=
 =?us-ascii?Q?7A60oYAoOiHbs7IDenfcPKs5faAGry5pjI7lg9zqyF7AGsL5Dt+v3bMPHKB6?=
 =?us-ascii?Q?lx5FTSElpQQtgDLxGE6FPmSYC9ClQaA0EgmCaQIJr6/FNNsLGa+VBhmVWOsQ?=
 =?us-ascii?Q?ynumrYL1xDTUoJtzwWKemdjJXvVqTbA06lmUno/+8c/RdOsP++mZtL42WXo4?=
 =?us-ascii?Q?LBahxCozyimdTwAeV7EYUckm30AuzFm2qE95NyVw/uhUD3MgsBAn955ImBfs?=
 =?us-ascii?Q?iIPntXjrdipUK9OsuTjEZp9Ct8k5NT1NbXXjfUKWavVaOe+ei5g7VWRvSZTY?=
 =?us-ascii?Q?lprOtAYXUH3W0kDdH2ZKCg5FY2kvo36moRFa1d6b0kK2jrz39Z20gl6KsGQn?=
 =?us-ascii?Q?A1zWgkCtYZ2JOnuOSW705WzOWI/Z8r0OfOHzNIlfhzNcKhmkNwYivv+IRXOk?=
 =?us-ascii?Q?w88wLsanmfQ9ncAOjuDX+ETSKfWJ5Lx0ffgNI7m/PjaX3B6udoMubKmPqCqJ?=
 =?us-ascii?Q?sjYilClx+9CT62BYJXAzr5tffisn4jBR2D63JwdC9CuMpudAZMOFjjfuWe7q?=
 =?us-ascii?Q?RGUD0dCcRco/qrfNr4ukt9a3AnlwOYuQWw5YrQzYiGsfoDRe77LTyMjPk4oS?=
 =?us-ascii?Q?f/+XmpMfZHLkI4zgetlTVnbZ56qlhQNF0NfYkfufXW0wEP62+1U8eTmywdYe?=
 =?us-ascii?Q?hf4Cmbxd1ONgCaLKVt0t+EW8x09SJxD8A+q7EyAQ/wF7peIOy2sj2Z2jfGVU?=
 =?us-ascii?Q?q3EaR1eTuCyTtk/rkbsxHdAoiXnHFKMNHe2iH1W70PyHP7ugxKYanKUX8X4p?=
 =?us-ascii?Q?K77iN7NUwbV/X3lI/BVbtSia+JtRJI9+lpGh/aL/V6HxaQBNSkrmw8CgZDjY?=
 =?us-ascii?Q?jlhojxanZd9bFn0anfubey4htCqsY6c+iRXYs4atbapN5Glcq71c2ULvXZlF?=
 =?us-ascii?Q?PYypYhuzYpQFvFbMfem/XUzB9ZWKmklx1MtVWxpEKXPRatAAlHT5+v9m5P34?=
 =?us-ascii?Q?C2mxsON9U7weixaeUIpZwHOpxhFdqGJAzWNC5pVRUXsIpWzCboOOYFVCrAuG?=
 =?us-ascii?Q?ek82SiICavB51k+NEWanDWC1iaavv/B5Es7kIF6blQ10N2AaHkctfRGOpZ5N?=
 =?us-ascii?Q?qMAxjIKcUPCC3OU2y00GS65/CA5UY0jesiIovae6BSfX//jXPpFlVRI9b6t4?=
 =?us-ascii?Q?B1BvIEU6k1e1p3knlXX/6FU9N2l3nKaYJAI/0jGZ6heXm28PbAts35zMQcNF?=
 =?us-ascii?Q?4RloffjNmXzespcYuhcJctr+mP0ThXBTZr7sQ4fok2JWE+sGkPzepx1HV1/7?=
 =?us-ascii?Q?BAPMcS79YUzAXVsdnKYgERYICHp1H9Ie0GdH/ll4AkRbnquTpRrKAMSuTBQ6?=
 =?us-ascii?Q?qm2CLjj03iUb2qcTDdomspE7CaMp7zM4JRg4285F2036yq13S5usJWE4j05J?=
 =?us-ascii?Q?FCmEB0O4HJVVwRZbaziHhmJUjJXt5gk=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde7a14e-cff4-4fc8-06d1-08da4e5dbf9d
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB8838.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 23:29:38.0948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmgdFMYjIcnGVC6wMcE1ZD835uacM0BpeYMHo86EWZH6B4ZUO8+I2jKUAfa8PxRsXJko4F+Y035GM9dvb3jSNsVaRFFciY+gCDgg3cLWFvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB3782
X-Proofpoint-ORIG-GUID: T47DjMoX-IiUeJEgIkjnkWb3oXesZ5Ye
X-Proofpoint-GUID: T47DjMoX-IiUeJEgIkjnkWb3oXesZ5Ye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_10,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140083
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Problems were observed on the Xilinx ZynqMP platform with large I2C reads.
When a read of 277 bytes was performed, the controller NAKed the transfer
after only 252 bytes were transferred and returned an ENXIO error on the
transfer.

There is some code in cdns_i2c_master_isr to handle this case by resetting
the transfer count in the controller before it reaches 0, to allow larger
transfers to work, but it was conditional on the CDNS_I2C_BROKEN_HOLD_BIT
quirk being set on the controller, and ZynqMP uses the r1p14 version of
the core where this quirk is not being set. The requirement to do this to
support larger reads seems like an inherently required workaround due to
the core only having an 8-bit transfer size register, so it does not
appear that this should be conditional on the broken HOLD bit quirk which
is used elsewhere in the driver.

Remove the dependency on the CDNS_I2C_BROKEN_HOLD_BIT for this transfer
size reset logic to fix this problem.

Fixes: 63cab195bf49 ("i2c: removed work arounds in i2c driver for Zynq Ultrascale+ MPSoC")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 drivers/i2c/busses/i2c-cadence.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index cb0b6cca196f..b3a589afe9f7 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -390,9 +390,9 @@ static irqreturn_t cdns_i2c_slave_isr(void *ptr)
  */
 static irqreturn_t cdns_i2c_master_isr(void *ptr)
 {
-	unsigned int isr_status, avail_bytes, updatetx;
+	unsigned int isr_status, avail_bytes;
 	unsigned int bytes_to_send;
-	bool hold_quirk;
+	bool updatetx;
 	struct cdns_i2c *id = ptr;
 	/* Signal completion only after everything is updated */
 	int done_flag = 0;
@@ -412,11 +412,7 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
 	 * Check if transfer size register needs to be updated again for a
 	 * large data receive operation.
 	 */
-	updatetx = 0;
-	if (id->recv_count > id->curr_recv_count)
-		updatetx = 1;
-
-	hold_quirk = (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT) && updatetx;
+	updatetx = id->recv_count > id->curr_recv_count;
 
 	/* When receiving, handle data interrupt and completion interrupt */
 	if (id->p_recv_buf &&
@@ -447,7 +443,7 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
 				break;
 			}
 
-			if (cdns_is_holdquirk(id, hold_quirk))
+			if (cdns_is_holdquirk(id, updatetx))
 				break;
 		}
 
@@ -458,7 +454,7 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
 		 * maintain transfer size non-zero while performing a large
 		 * receive operation.
 		 */
-		if (cdns_is_holdquirk(id, hold_quirk)) {
+		if (cdns_is_holdquirk(id, updatetx)) {
 			/* wait while fifo is full */
 			while (cdns_i2c_readreg(CDNS_I2C_XFER_SIZE_OFFSET) !=
 			       (id->curr_recv_count - CDNS_I2C_FIFO_DEPTH))
@@ -480,22 +476,6 @@ static irqreturn_t cdns_i2c_master_isr(void *ptr)
 						  CDNS_I2C_XFER_SIZE_OFFSET);
 				id->curr_recv_count = id->recv_count;
 			}
-		} else if (id->recv_count && !hold_quirk &&
-						!id->curr_recv_count) {
-
-			/* Set the slave address in address register*/
-			cdns_i2c_writereg(id->p_msg->addr & CDNS_I2C_ADDR_MASK,
-						CDNS_I2C_ADDR_OFFSET);
-
-			if (id->recv_count > CDNS_I2C_TRANSFER_SIZE) {
-				cdns_i2c_writereg(CDNS_I2C_TRANSFER_SIZE,
-						CDNS_I2C_XFER_SIZE_OFFSET);
-				id->curr_recv_count = CDNS_I2C_TRANSFER_SIZE;
-			} else {
-				cdns_i2c_writereg(id->recv_count,
-						CDNS_I2C_XFER_SIZE_OFFSET);
-				id->curr_recv_count = id->recv_count;
-			}
 		}
 
 		/* Clear hold (if not repeated start) and signal completion */
-- 
2.31.1

