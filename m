Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E03254769
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Aug 2020 16:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbgH0Ot7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Aug 2020 10:49:59 -0400
Received: from mail-eopbgr70050.outbound.protection.outlook.com ([40.107.7.50]:53991
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728161AbgH0Otp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 Aug 2020 10:49:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMYcauwTozsMknftfIbrfvwvXZ4x9wWdNz6IMX5SojUQR3WY7BBGb/TU1t9iVOjaftSuHlWZTTLGRjweEO9xu9Po+m7bZrAR18HXYq7b713OP9oDHj5NcGKXCqZo737jqH1eMZe2HvtbxJR4dec/3Wwsn0zyJ9ND3yxLf4i69gtYL6w75mpj1dDEXy5CKQjrlCWgsk39JgGieJMsYcaVPcBLysTjxTMvz/FFViu7thVcgcjFiX/kfjgKOTHHRHsKKOyzVZ6RAfG/cBUZYvVqucaysyhgjAJdZLpqLcRSH0YE7tiKOpX03NfOz6u8VCjS5uyyKjaJ7T87N3oUWkj57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIwKG79wbpqDHUmVNoisbQyb4QEpE2XJ6Xqv91H97fo=;
 b=h7384sOaC8snXzjGu2ZRL6LHe3EQSLNtOW+sTUsWdqdMwui1K1yaXwBs+msngDQfJCFy9gXyYZLVOkLi6Kcsvx5fOH3kK6/un1zCWGl2XzihtNYlNnG5yoZUAW6mgr54sRA0+3qKxI/2e9qvbB0CjSaxCQpgkV53Pv/AnEinOIRrE9Rvy0wrWWTZldsPLfnZP/ffjlvhSEEU+C/R8GQTM9XgijAzNLvAfJujGvIdeX57HxV/YHGn+Fl2N3zpeTj+kdDX8oqIl/+uawy4hOkaNZBLtdnj5uyzdU4tVs2BOFMqtRjdf566sGbbjNWOd03TxrzYO6UZihOoSY8eJ+JUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIwKG79wbpqDHUmVNoisbQyb4QEpE2XJ6Xqv91H97fo=;
 b=ndgKRBcFKrb0dfiTrij3CeDtjvQX6Cfsg7BYIWQXf6dgpUzNaMipYwZo4pf+RwAggPkKc460FvN7AmdYt2GumzNQDbjfmy9X+gOj86YFfyOhjdt1dtlLopxH6JOtRFUmxkIsor/4HoB/FBHURJYmZSahdVlNiYLedHNj3JkYECU=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=vaisala.com;
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM8PR06MB6852.eurprd06.prod.outlook.com (2603:10a6:20b:1d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Thu, 27 Aug
 2020 14:49:33 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 14:49:33 +0000
From:   ext-jaakko.laine@vaisala.com
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org,
        Jaakko Laine <ext-jaakko.laine@vaisala.com>
Subject: [PATCH 1/3] i2c: xiic: Change code alignment to 1 space only
Date:   Thu, 27 Aug 2020 17:48:46 +0300
Message-Id: <20200827144848.12107-2-ext-jaakko.laine@vaisala.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
References: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33)
 To AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (193.143.230.131) by HE1P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 14:49:32 +0000
X-Mailer: git-send-email 2.19.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4050bea9-1220-4594-9c1e-08d84a9868ec
X-MS-TrafficTypeDiagnostic: AM8PR06MB6852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR06MB6852ED438E7D4AE12AC6EBA5D4550@AM8PR06MB6852.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EW+/P11a2IOFWv6Sb4o0T+CuXZs/W3M6C6CeS38xSTfkPWo5gbY1EfyWnqwBd3ICHyrtuB+H9fudBpp1JhrgS/jqXXJA3dKr24LKRWZDE/eGVHtubHmyd5M4VKoVGICrARL7kRDC9tokLHPcGii+oLbfHZqxMsPNlLPMB68xXNkXXiYxYFVdY+SkM7jC7FoX88sLawg3Dkg+SZ5PA/1q0pPc6EFY6mGFpioi4auvk1IyNd2EsrOe69PARgzdhXx8uEKFjuY7H+e2CLd7xzJZYYbTzEA/CUmbQLWoiGgeXHZpXhpk33pctrKuhv6eZ83So8dh/ZNRUMauGwvEwQ39Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(39850400004)(396003)(6666004)(5660300002)(478600001)(1076003)(66556008)(66946007)(66476007)(8676002)(86362001)(83380400001)(4326008)(316002)(6916009)(8936002)(6486002)(2906002)(6506007)(9686003)(26005)(186003)(107886003)(16526019)(956004)(6512007)(36756003)(2616005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: LWTre7+QOc5cPv6CURMhQuuEYSyIPcxgOR4oIM4Z5JqR5SYnUVMyCMYY/jbz1jZvrYj1b20Om6C+gc7G+Wmg8xuTh3kq1PrmqLX1NSB/ZlYDI+gUY12DR47y9Sttkcnx+ULlDPazZuxcVuHgkoADP6ggu/mnAMtdIA1vTq4dGhe4X4C100iATP2kqcFh11k8Xu81xVp8J17MwUtbsINCwkrLDsm1C8ATUPqfnlI1HB3q3+rupb3Ru/MuS0sjScxEQxRVFLNLr+D/XbsOH5iMMTzz0EmZmx7T8kg+F00mPWaFa+garXflukCQ2c00mrNiDQkZgN2OXXee1hIg/vjvLn8xjib6PB82hiyB9a3oXFLu2IdL9dQVHC5yAP/l2wGy40HeJy+gC1IAwgCdDhpQMZVSBGWO8LLyEJD0oa9Bm2RIjSoZ/nPGcHHdOxys8aEBKIFJ7P+RfuaM6gr68gDHcZGeHJOP5toc3Fs17ZVwhfucYJoyiEC5mflBQnRxgoYpBFBkIrUBVIht9ytuouiGLjN/SUcaOOtbHiDyiE35dmjiJniJt+BLQTkILAIlhboIZ3O8dZ/IRV6HR3p/UiUKjOmGwcQ2h32VJ1wsHi9O0nJBPt/0uFJBzuweTqNJC/7C+K2gsV2ZF1C7mbvo6AyxyQ==
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4050bea9-1220-4594-9c1e-08d84a9868ec
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB5185.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 14:49:33.0665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FmbVHCHDsoIbCqLB5Z0FmHjyOIkaswqEzGJpGZ+xdd37MvAC7CPhqM4v6SkMrDru2CSSRrCKruWglL3NlsuVpnphVaU2vCtw+ro8BVVFZ/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB6852
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jaakko Laine <ext-jaakko.laine@vaisala.com>

Alignment removed and replaced with 1 space only to
reduce need for future alignment changes affecting multiple
lines, when new variables are added.

Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
 drivers/i2c/busses/i2c-xiic.c | 48 +++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 90c1c362394d..10380531d45c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -46,33 +46,33 @@ enum xiic_endian {
 
 /**
  * struct xiic_i2c - Internal representation of the XIIC I2C bus
- * @dev:	Pointer to device structure
- * @base:	Memory base of the HW registers
- * @wait:	Wait queue for callers
- * @adap:	Kernel adapter representation
- * @tx_msg:	Messages from above to be sent
- * @lock:	Mutual exclusion
- * @tx_pos:	Current pos in TX message
- * @nmsgs:	Number of messages in tx_msg
- * @state:	See STATE_
- * @rx_msg:	Current RX message
- * @rx_pos:	Position within current RX message
+ * @dev: Pointer to device structure
+ * @base: Memory base of the HW registers
+ * @wait: Wait queue for callers
+ * @adap: Kernel adapter representation
+ * @tx_msg: Messages from above to be sent
+ * @lock: Mutual exclusion
+ * @tx_pos: Current pos in TX message
+ * @nmsgs: Number of messages in tx_msg
+ * @state: See STATE_
+ * @rx_msg: Current RX message
+ * @rx_pos: Position within current RX message
  * @endianness: big/little-endian byte order
- * @clk:	Pointer to AXI4-lite input clock
+ * @clk: Pointer to AXI4-lite input clock
  */
 struct xiic_i2c {
-	struct device		*dev;
-	void __iomem		*base;
-	wait_queue_head_t	wait;
-	struct i2c_adapter	adap;
-	struct i2c_msg		*tx_msg;
-	struct mutex		lock;
-	unsigned int		tx_pos;
-	unsigned int		nmsgs;
-	enum xilinx_i2c_state	state;
-	struct i2c_msg		*rx_msg;
-	int			rx_pos;
-	enum xiic_endian	endianness;
+	struct device *dev;
+	void __iomem *base;
+	wait_queue_head_t wait;
+	struct i2c_adapter adap;
+	struct i2c_msg *tx_msg;
+	struct mutex lock;
+	unsigned int tx_pos;
+	unsigned int nmsgs;
+	enum xilinx_i2c_state state;
+	struct i2c_msg *rx_msg;
+	int rx_pos;
+	enum xiic_endian endianness;
 	struct clk *clk;
 };
 
-- 
2.19.1

