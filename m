Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B69644FD34
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Nov 2021 03:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhKOCwn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Nov 2021 21:52:43 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]:51366 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhKOCwj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 14 Nov 2021 21:52:39 -0500
Received: by codeconstruct.com.au (Postfix, from userid 10001)
        id DB376202AF; Mon, 15 Nov 2021 10:49:41 +0800 (AWST)
From:   Matt Johnston <matt@codeconstruct.com.au>
Cc:     Zev Weiss <zev@bewilderbeest.net>, Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        linux-i2c@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next v3 3/6] i2c: aspeed: Allow 255 byte block transfers
Date:   Mon, 15 Nov 2021 10:49:23 +0800
Message-Id: <20211115024926.205385-4-matt@codeconstruct.com.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211115024926.205385-1-matt@codeconstruct.com.au>
References: <20211115024926.205385-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

255 byte transfers have been tested on an AST2500 board

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 67e8b97c0c95..7395f3702fae 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -533,7 +533,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
 		msg->buf[bus->buf_index++] = recv_byte;
 
 		if (msg->flags & I2C_M_RECV_LEN) {
-			if (unlikely(recv_byte > I2C_SMBUS_BLOCK_MAX)) {
+			if (unlikely(recv_byte > I2C_SMBUS_V3_BLOCK_MAX)) {
 				bus->cmd_err = -EPROTO;
 				aspeed_i2c_do_stop(bus);
 				goto out_no_complete;
@@ -718,7 +718,8 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 
 static u32 aspeed_i2c_functionality(struct i2c_adapter *adap)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SMBUS_BLOCK_DATA;
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
+		I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_V3_BLOCK;
 }
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-- 
2.32.0

