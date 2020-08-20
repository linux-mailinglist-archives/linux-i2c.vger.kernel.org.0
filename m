Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D764924B947
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 13:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730746AbgHTLly (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 07:41:54 -0400
Received: from mail-eopbgr150053.outbound.protection.outlook.com ([40.107.15.53]:65142
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729858AbgHTKEZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Aug 2020 06:04:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOb92huwzaFY2abAQxNLAv0CaMeCmVX426nlpzjti2chibknddPwud+o/GV4GCBZIVBdRzmbUjI0pCK6NSzYBigwgniellQnM1rVNq3f5cnsRKwTzrIyrRloZMa/a2vh2BcC/Lr+7SKzhw3RMWmEc5qiuaU1GiVg/LLZu0W+0HIdiEgGG55JXSkl7+o/fuSSxdW6OBpwdJz/mI4ip1qp1YwvcLHiM23j3+Bm1CBStnPFtmjsE5k0bBbDangqGV5LlrYFi+psPKfNJheq0kxJH63yR9MK2GPR3xZtUPw6GcVaBT+vCPxFWoE50mSsn9iyHfVQ/bU0J0l8FHY5KBL6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmfFecyFkFQWCOSnk5w5/Qr/TPga8ClNGALNyF0zhAg=;
 b=lHId85tnL6kQpHVDjjGdmQuZ4g3UpMBtqHuRI9YlzymuPNrK6xGhcdG+SL5f5+mxywwHLC8B6o+BrvBuaD7IufiEUTU0nHZaj+N4LqZcALWzdBl5nkp/ySmxIuUrawqavpCbM50rBUk6A8Oa9GC9BipL0VIXLuJWPkGK4ImJiULRFzOi9vvk/lbEi1wJMhchAukdo2yEz28BrHm7CGd4nJBZaHX24y43pjqqJReysndq0nJKl/WnZBs0JYRThcpDOujDpmSCS/1yJ+opyegVYu7BNCJr3CbbvPYmIw86EMh/B/5ZoKjps+nm7uaaKqKWJs6pAkUTicJOuVbxDRjeRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmfFecyFkFQWCOSnk5w5/Qr/TPga8ClNGALNyF0zhAg=;
 b=AtLJhucAaoEpqjXnJoTIFA8G1jGSoZZeMjhnWtsyzCQeqYm7XcvT63lOGeYTBirAZ8wA0jU2lQ/zUBIcdVzPHUsigvVnLq2UUEKhNfy29TSUoJQZgdy6LX4elKSz8sZGLdnTqa2tJ9POp9x8AzwyJCSZuZNq1cSeYpJ/wZhGtIE=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=vaisala.com;
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM0PR0602MB3554.eurprd06.prod.outlook.com (2603:10a6:208:1c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 10:03:49 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 10:03:49 +0000
From:   Jaakko Laine <ext-jaakko.laine@vaisala.com>
To:     wsa@the-dreams.de
Cc:     shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        Jaakko Laine <ext-jaakko.laine@vaisala.com>
Subject: [PATCH v2 1/2] i2c: xiic: Change code alignment to 1 space only
Date:   Thu, 20 Aug 2020 13:02:40 +0300
Message-Id: <20200820100241.96866-2-ext-jaakko.laine@vaisala.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200820100241.96866-1-ext-jaakko.laine@vaisala.com>
References: <20200820100241.96866-1-ext-jaakko.laine@vaisala.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0202CA0037.eurprd02.prod.outlook.com
 (2603:10a6:3:e4::23) To AM0PR06MB5185.eurprd06.prod.outlook.com
 (2603:10a6:208:107::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (193.143.230.131) by HE1PR0202CA0037.eurprd02.prod.outlook.com (2603:10a6:3:e4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Thu, 20 Aug 2020 10:03:48 +0000
X-Mailer: git-send-email 2.19.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4b995b2-b554-452d-deda-08d844f0559a
X-MS-TrafficTypeDiagnostic: AM0PR0602MB3554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0602MB3554D1696BF0B420321371C0D45A0@AM0PR0602MB3554.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RUUKlliknvuB8xjC3JqzuZhtBpw8IQW9lpYliHWvNK1vF9iHpg8kAB4TWaNGih2j8alfKCsJhIyzCrTbZTefGEfpcOdGram4oaaOWi1UZKxmqOUcqm80KWtv2cD50xgqRDI5EqsWCp1bVzQLjAkYUoMIOmQlRzEe9qMGG/8E67ylGXCtggytkCBPAo+NtaJS/1qP1640Ac8bM5GdaBF73B0waNfS2Q2WTjUp1V1F0Pn02rWVJo6Aa/vnPPb62KCRZzdmu8Fp/OzSQmxTMKeOg1GISIded0335pGLSLWVGlpOsHumkfxbQZHRN5xU3IBlmUt7CCcXv/Zf/glJf/azA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39850400004)(366004)(376002)(6666004)(66556008)(8676002)(66946007)(66476007)(107886003)(1076003)(2616005)(956004)(186003)(6506007)(16526019)(6512007)(6486002)(86362001)(5660300002)(2906002)(52116002)(316002)(8936002)(26005)(478600001)(83380400001)(4326008)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Qa57NybAcDGYdx7xRnN6D0Es6AxPqfuuOS8bRTKZMBe4oCHI6HxGFPQvqBnXfk+t+yzBk4EiH30IDZlR2FWhWeBlOieeXgaKCDZEglRwVPkMfPiCYs053N5hs1tsUdCjXXuQjMpiW5/QEJhS1j60ZURSVmi+IMDQabiiVE7y6pd1OmAyRiLGlDZPxFKVmcMANay3STvvzwZ/Zuo2JuQ2gd+O7+Mx9yL+R1ejTzE+Z6Ys+CfpNQ7QVrVU1kdnr+lhIEAiQ4zJhJv9Cpe747tNCZQJ8dJClyzljhrw0I+GxKQQJh7hreT55yt4nnuktY0LaEQY3UcRymdvRMgdENb88YeqNML2sNR+8C74eTdHcnD62zJHNN8oYs3K7OHZb9IrQuQhimuCkNbmh0fd1e8v0c/ZNo0YEs4ZQcRPgJBNYm5qohqzz78PYq78n/dYtv2eYUF8tdRCQkCbalEHdRb/tFnTwgd0OqhKz3vIexzqcWXJrvEeKTBh/CsUC3XTVt6aO7NwcRB2ox4z0dzIoOU4c+zuBYBy+1pww32v88lLLJEHHuu7rTprkfbwW3zad/oKqo6OteYg7CsXIzpvXQO4wUPVuzxlkph1N8T1cmRWsaOkCmBXcNJ4xwAzUkPw96sJqejhTgpsz1pId5yjgSnx0Q==
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b995b2-b554-452d-deda-08d844f0559a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB5185.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 10:03:49.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3J0gf+e+JlMut0RIfHqId7AArJZcIkBF281LtSeq/cUgVhCk3SVQx6ylgowNLqS6woZ3KeN/SULKjtLwYGyxFQvSP6+tww8GjYSMQi6pto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0602MB3554
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Alignment removed and replaced with 1 space only for to
reduce need for future alignment changes affecting multiple
lines, when new variables are added.

Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>
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

