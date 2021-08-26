Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA8F23F8D67
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Aug 2021 19:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhHZR5p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Aug 2021 13:57:45 -0400
Received: from mail.manjaro.org ([116.203.91.91]:48840 "EHLO mail.manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231648AbhHZR5p (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Aug 2021 13:57:45 -0400
X-Greylist: delayed 606 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Aug 2021 13:57:45 EDT
From:   Tobias Schramm <t.schramm@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
        t=1630000011;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=OM+uWoJWtLPFwGbhaTK2LZ3pufTaK1xDMcnN5Y5OmWI=;
        b=Qj/bDarPTwNVvlX5XGRPRE+SxV5aVJWIA68w7u0rwV/eKh2DjxQddGSNpgRHr4Wo4HwMXO
        ppqHE4uuy9tzwO69OdyPqOnSPtMC9P/V/To7bFiK6ht1SV26viJWTVzan3NFN44i8jms4E
        XHQfCw1Lmotsr498N90dY9Ijpssh0ILHs8t1Gj2u+4i8IHeNlJsOnvVYRWIY6ezzaa3iRi
        09shkENfFb25MGkuo5kGo30rlStJQGhYMN9954RvvmSumzpZLnjdYGIpPXIVO5+a+q4HW6
        FoNNd/XHNWIfBNMPcXSNItCHqi0GLCX15qGfS4cB8kSnRo9kRV4lkx4WrJGQFA==
To:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH] i2c: rk3x: disable and reenable I2C after timeouts to fix stuck low SDA
Date:   Thu, 26 Aug 2021 19:46:32 +0200
Message-Id: <20210826174632.91887-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
        auth=pass smtp.auth=t.schramm@manjaro.org smtp.mailfrom=t.schramm@manjaro.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Previously the SDA line sometimes remained stuck low after timeouts
rendering the I2C bus unusable. Testing has shown that disabling and
reenabling the I2C peripheral after sending the stop condition seems to
unstick SDA reliably.
Disable and reenable the I2C controller on timeout after sending stop
condition to unstick SDA.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 drivers/i2c/busses/i2c-rk3x.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 819ab4ee517e..fc330cc3686a 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1108,6 +1108,16 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 			val |= REG_CON_EN | REG_CON_STOP;
 			i2c_writel(i2c, val, REG_CON);
 
+			/*
+			 * Sometimes SDA remains stuck low after timeouts.
+			 * Disable and reenable the I2C peripheral to unstick
+			 * SDA.
+			 */
+			val &= ~REG_CON_EN;
+			i2c_writel(i2c, val, REG_CON);
+			val |= REG_CON_EN;
+			i2c_writel(i2c, val, REG_CON);
+
 			i2c->state = STATE_IDLE;
 
 			ret = -ETIMEDOUT;
-- 
2.31.1

