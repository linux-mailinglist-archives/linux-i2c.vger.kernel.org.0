Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A90F24B93F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 13:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729679AbgHTLlg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 07:41:36 -0400
Received: from mail-eopbgr150081.outbound.protection.outlook.com ([40.107.15.81]:58113
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728228AbgHTKEl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Aug 2020 06:04:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZZ413NdsyYIo0B+KX4mdkVgv37m8MyEIOXcWxozCN5K3XH3pmZWETgKtLcdg/yS/QnN3xvxh/vv34FypYXYoVSwxcOYhrELKzbNLs39EwJulSPLY5vHt6fqhV1E3yagvM4U7YWgwaiJqb3HetQ8N0NP/mWWlMGpjFoF54oorjMRwx4gRrtsRfpsya0VDcWXL7gerDiPunzFHlPHYYXkjTnwiWD3EcgkSYidr91K5Ya7r51re2XvO5tyvBxEEyJED34Fagkb1ZIBnl5Wuczx6AbhJU3f9himoxE6ZjtB4u9VOlbL8W9u3Yg04iPwzc0oMXrg4thjdiu+Cu5COF+vVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1Fge4G41cQQqOij931HiKpgQClpuzEl6diGABWhjZI=;
 b=HpFAONpeakkLBBr9gASYQIOxH6JEM6y6rBRu7BCZ0kpFMO/+X4QjMUueE7MxW4zjXtBcxnpCHZriYITkRFgN1NqHmIzLW55aLeKGyVtl+uMiKp1yYBOcxE28Cp+ukBseYSdWdysiLr2KRZL+rKagapwAYt+9zutLqpLuJR48BS8Nx+W9votbrWCgWS302pliDaTlQ7u1teiVXv4OywakU3fFGIkzTvOu9HmyXHh2/aY18fUPAFlolrGEmcaMbBUurDmS5mSmIiL4jaYUenTG9RY3Z0kZsSWDRQBYG6brh3mlPyseOoDuOmwQkg1M9DW5Xcz18LnGIxKDsVInv1qE+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1Fge4G41cQQqOij931HiKpgQClpuzEl6diGABWhjZI=;
 b=CSa/UiDSpH32tew6fPs3NFAwPqKxWKeIrd3/IDsF5RKCUxKnY5WNzRnxxwcTwAZ/aky0eRdR3gAgyjaWRYNiLBgKHUIFzK3/cTxgOI7so8+L8f7WeP0stEEYdsuL6xdc+0S10LyUT02WWEcb04tAhDRfdw7LAX35dYdGRa4Qjgg=
Authentication-Results: the-dreams.de; dkim=none (message not signed)
 header.d=none;the-dreams.de; dmarc=none action=none header.from=vaisala.com;
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com (2603:10a6:208:107::25)
 by AM0PR0602MB3554.eurprd06.prod.outlook.com (2603:10a6:208:1c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 10:03:55 +0000
Received: from AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d]) by AM0PR06MB5185.eurprd06.prod.outlook.com
 ([fe80::3138:abae:774c:ae7d%7]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 10:03:55 +0000
From:   Jaakko Laine <ext-jaakko.laine@vaisala.com>
To:     wsa@the-dreams.de
Cc:     shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        Jaakko Laine <ext-jaakko.laine@vaisala.com>
Subject: [PATCH v2 2/2] i2c: xiic: Support forcing single-master in DT
Date:   Thu, 20 Aug 2020 13:02:41 +0300
Message-Id: <20200820100241.96866-3-ext-jaakko.laine@vaisala.com>
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
Received: from ubuntu.localdomain (193.143.230.131) by HE1PR0202CA0037.eurprd02.prod.outlook.com (2603:10a6:3:e4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Thu, 20 Aug 2020 10:03:55 +0000
X-Mailer: git-send-email 2.19.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e8ba4be-349c-489b-28f6-08d844f0594b
X-MS-TrafficTypeDiagnostic: AM0PR0602MB3554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0602MB3554C053023232424A53236BD45A0@AM0PR0602MB3554.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8qEoINdEa5ViS3qIwjUTVEWe+7Br94A9qlg8E18kZBRk9FAEqf6C//c30qXBynkhVo9c30cU3d+ErJjT+vDqNdBmB7epjhUFCST/ri9DFZhYLdqNYo+3NJ7D39OgDO+cKaiZKz9huFIo95VaWHLiYmfaOXir7dzQ+LUEL2JeUr++p5x98Y2JzzIF5jLHi3/vuRsz2Kw+onqwr2vUYpyD+la29AeRoOqyw+dR3ip7d5bwpsiaZIg6dJXJgp9JNLhKrXjePSi6/j1o4iK7aqEhUDUe/GBBspu9ShK6O1+4MGHplU4SXkHHwuz3KSpr5W6ziYDGPs/gS1/dfzYv0Q2WGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR06MB5185.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39850400004)(366004)(376002)(6666004)(66556008)(8676002)(66946007)(66476007)(107886003)(1076003)(2616005)(956004)(186003)(6506007)(16526019)(6512007)(6486002)(86362001)(5660300002)(2906002)(52116002)(316002)(8936002)(26005)(478600001)(83380400001)(4326008)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: CxAGkysTpTRKFZ70P5mgGHv6cHOsMvpV7Ek+hH6wW4gk78zoCm0vC9yLbBb5+/Phlvivln/lVIv09+otbnVwe1E4IrgyTlp87zQc9uIYiKWUUYosZJY1rNk9NYKKMfo1H/h75Xqno7Juq7VgkGjIklZoibYXa0L7iIzuICobckocEJHKjiEb25+MdDlu2liZPJ2+fza0VPwpK6imqOmYFO9zVjPwqhL8ZG/Mdzq1G3SNnghI8DYzfXcFSteg5DebYIUwjGQ1SprZ7ncjsytbMrhmyOQyt+N+VgGYs5OB46C0hnIHFWseaIm3KSyru4dfAX26Kq0BlB1il5z3Vgsc0G9n23bB1N6/QZEDbp1vFJMJH2OlR5HlguhaGVQ7dhLNmG+gwrKz7mBYwfhpPHzNTm75viywNqCGcqKVCoxjliYmR3s+A65+xgLrRrX4DEzAwjBnmVy07mFS33w+ZYS1xHCTzkZtEsrH2dI0zrgnzBzcT4hrjP4tPrVQWnD8TZg/jywNEfNRjPYliR8TLLSkNIW8rpDAQou0R9sBczVyBW+nMfujYKY1CXM5bxhilQTWvzdSE+fr8x7DdDtosvpr+x30zV25rmNlBo/QkvAWLDuFsgoXz3uQUtSqYpDn/4sP6gA/7kIfvBMFkK5nfLtmAA==
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8ba4be-349c-489b-28f6-08d844f0594b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR06MB5185.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 10:03:55.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBBS/gVxIW2s8Qo4quGAOywGB0TRn8mUazg6J0SPOZcstRBIVqu199Po04fib88/7U36qmaFRhqaSbV0utyXn9VNnqZOvh9nmWXeU0EF1c4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0602MB3554
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I2C master operating in multimaster mode can get stuck
indefinitely if I2C start is detected on bus, but no master
has a transaction going.

This is a weakness in I2C standard, which defines no way
to recover, since all masters are indefinitely disallowed
from interrupting the currently operating master. A start
condition can be created for example by an electromagnetic
discharge applied near physical I2C lines. Or a already
operating master could get reset immediately after sending
a start.

If it is known during device tree creation that only a single
I2C master will be present on the bus, this deadlock of the
I2C bus could be avoided in the driver by ignoring the
bus_is_busy register of the xiic, since bus can never be
reserved by any other master.

This patch adds this support for detecting single-master flag
in device tree and when provided, improves I2C reliability by
ignoring the therefore unnecessary xiic bus_is_busy register.

Error can be reproduced by pulling I2C SDA -line temporarily low
by shorting it to ground, while linux I2C master is operating on
it using the xiic driver. The application using the bus will
start receiving linux error code 16: "Device or resource busy"
indefinitely:

kernel: pca953x 0-0020: failed writing register
app: Error writing file, error: 16

With multi-master disabled device will instead receive error
code 5: "I/O error" while SDA is grounded, but recover normal
operation once short is removed.

kernel: pca953x 0-0020: failed reading register
app: Error reading file, error: 5

Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>
---
 drivers/i2c/busses/i2c-xiic.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 10380531d45c..5d06e6cc5d5c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -58,6 +58,7 @@ enum xiic_endian {
  * @rx_msg: Current RX message
  * @rx_pos: Position within current RX message
  * @endianness: big/little-endian byte order
+ * @singlemaster: Indicates bus is single master
  * @clk: Pointer to AXI4-lite input clock
  */
 struct xiic_i2c {
@@ -73,6 +74,7 @@ struct xiic_i2c {
 	struct i2c_msg *rx_msg;
 	int rx_pos;
 	enum xiic_endian endianness;
+	bool singlemaster;
 	struct clk *clk;
 };
 
@@ -521,19 +523,26 @@ static int xiic_bus_busy(struct xiic_i2c *i2c)
 static int xiic_busy(struct xiic_i2c *i2c)
 {
 	int tries = 3;
-	int err;
+	int err = 0;
 
 	if (i2c->tx_msg)
 		return -EBUSY;
 
-	/* for instance if previous transfer was terminated due to TX error
-	 * it might be that the bus is on it's way to become available
-	 * give it at most 3 ms to wake
+	/* In single master mode bus can only be busy, when in use by this
+	 * driver. If the register indicates bus being busy for some reason we
+	 * should ignore it, since bus will never be released and i2c will be
+	 * stuck forever.
 	 */
-	err = xiic_bus_busy(i2c);
-	while (err && tries--) {
-		msleep(1);
+	if (!i2c->singlemaster) {
+		/* for instance if previous transfer was terminated due to TX
+		 * error it might be that the bus is on it's way to become
+		 * available give it at most 3 ms to wake
+		 */
 		err = xiic_bus_busy(i2c);
+		while (err && tries--) {
+			msleep(1);
+			err = xiic_bus_busy(i2c);
+		}
 	}
 
 	return err;
@@ -811,6 +820,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		goto err_clk_dis;
 	}
 
+	i2c->singlemaster =
+		of_property_read_bool(pdev->dev.of_node, "single-master");
+
 	/*
 	 * Detect endianness
 	 * Try to reset the TX FIFO. Then check the EMPTY flag. If it is not
-- 
2.19.1

