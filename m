Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2B7C4ECA6F
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 19:17:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344712AbiC3RSu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Mar 2022 13:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbiC3RSu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Mar 2022 13:18:50 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAAFFEEA61
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 10:17:04 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id v75so22743967oie.1
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 10:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eAeXJULyq/MQwcRKuLiGVFYxX124KzZudQH0TC9202Q=;
        b=cZ5Je/PVyYPMz1stHevd8Djc9EsA6k0zT0BMiHkdvGdJWnYjA1jt7OdP6ey0TWvITk
         WRc90Lh9/gonEJwVXUyZeeOBjG4VzOqeKMXYn8QKqm0cothEKNja5ysEeHs07/zDFl92
         QJjhFaR0fj85POseuYG8Z8366X5wXki9rwCwfB1tMtvwp+sLQMZOqoJ0BviNbIjFQUwV
         j/rBbKamj/eIsKBYbYWuiAa1+aawGHr3wo9n4MZMW0fLouMUHIpvALTYwi59HjCx24xh
         ZSzxfOj5IT/dRRYpmE/KdziT3YorjSBKmvEF8b+1D2qexMQriZHPpQgJWC3YmRNtEFyZ
         A9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eAeXJULyq/MQwcRKuLiGVFYxX124KzZudQH0TC9202Q=;
        b=kSD2xXTQGxJTbRuInGVvnIfDvD3WQiP8L248WCd6+vZBKi0LlQ8eMkdwQGscQriCLT
         RHQcsdH/EwZbDM6xZS/oS8CUKY53oZmnetTA+cbajpqEDOdrtOzkLyoNlpZDx7skM7ua
         ZBGf/0o0EYGtAPh18mNcF+/J3mN+4f6b/SUtl3JZVIuVdqfv3smsPTWfTulRp6Z9xLug
         /zjQVPaNc+F1QO/pND0a0dG3rob6+vU4qD+A59GDFnD+mXbPdrOidIIBixDO1ne78oEp
         XwMxmWGLuyRjm3TpbYAJz/bpYREACIuIg+nToVp38MtZI5WONtcQT6mr56Oso5ys8V0h
         MM+w==
X-Gm-Message-State: AOAM532ToeGezhbRb4pPBF90XZjokqh/8uQTufZ3JuwWWCQMCbLodH8G
        MeihP3ficdEhV+kSCgNNpTC76ayuRXY=
X-Google-Smtp-Source: ABdhPJy3Up4wWxTPwHJZSyMo1P8i4a01ZtQyByhpaRcdyBsbjivboO8o/DX+aqFIfQbkX0+2he/erQ==
X-Received: by 2002:a05:6808:9b9:b0:2ec:ad7e:3dd1 with SMTP id e25-20020a05680809b900b002ecad7e3dd1mr426684oig.52.1648660623745;
        Wed, 30 Mar 2022 10:17:03 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id lx20-20020a0568704b9400b000de29e1d6adsm9752331oab.16.2022.03.30.10.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 10:17:03 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     gregory.clement@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] i2c: mv64xxx: Add atomic_xfer method to driver
Date:   Wed, 30 Mar 2022 12:16:57 -0500
Message-Id: <20220330171657.9039-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add an atomic_xfer method to the driver so that it behaves correctly
when controlling a PMIC that is responsible for device shutdown.

The atomic_xfer method added is similar to the one from the i2c-rk3x
driver. When running an atomic_xfer a bool flag in the driver data is
set, the interrupt is not unmasked on transfer start, and the IRQ
handler is manually invoked while waiting for pending transfers to
complete.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 52 ++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 5c8e94b6cdb5..9c66904eebe9 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -150,6 +150,7 @@ struct mv64xxx_i2c_data {
 	/* Clk div is 2 to the power n, not 2 to the power n + 1 */
 	bool			clk_n_base_0;
 	struct i2c_bus_recovery_info	rinfo;
+	bool			atomic;
 };
 
 static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx = {
@@ -179,7 +180,10 @@ mv64xxx_i2c_prepare_for_io(struct mv64xxx_i2c_data *drv_data,
 	u32	dir = 0;
 
 	drv_data->cntl_bits = MV64XXX_I2C_REG_CONTROL_ACK |
-		MV64XXX_I2C_REG_CONTROL_INTEN | MV64XXX_I2C_REG_CONTROL_TWSIEN;
+			      MV64XXX_I2C_REG_CONTROL_TWSIEN;
+
+	if (!drv_data->atomic)
+		drv_data->cntl_bits |= MV64XXX_I2C_REG_CONTROL_INTEN;
 
 	if (msg->flags & I2C_M_RD)
 		dir = 1;
@@ -409,7 +413,8 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 	case MV64XXX_I2C_ACTION_RCV_DATA_STOP:
 		drv_data->msg->buf[drv_data->byte_posn++] =
 			readl(drv_data->reg_base + drv_data->reg_offsets.data);
-		drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
+		if (!drv_data->atomic)
+			drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
 		writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
 			drv_data->reg_base + drv_data->reg_offsets.control);
 		drv_data->block = 0;
@@ -427,7 +432,8 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
 		drv_data->rc = -EIO;
 		fallthrough;
 	case MV64XXX_I2C_ACTION_SEND_STOP:
-		drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
+		if (!drv_data->atomic)
+			drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_INTEN;
 		writel(drv_data->cntl_bits | MV64XXX_I2C_REG_CONTROL_STOP,
 			drv_data->reg_base + drv_data->reg_offsets.control);
 		drv_data->block = 0;
@@ -575,6 +581,17 @@ mv64xxx_i2c_wait_for_completion(struct mv64xxx_i2c_data *drv_data)
 		spin_unlock_irqrestore(&drv_data->lock, flags);
 }
 
+static void mv64xxx_i2c_wait_polling(struct mv64xxx_i2c_data *drv_data)
+{
+	ktime_t timeout = ktime_add_ms(ktime_get(), drv_data->adapter.timeout);
+
+	while (READ_ONCE(drv_data->block) &&
+	       ktime_compare(ktime_get(), timeout) < 0) {
+		udelay(5);
+		mv64xxx_i2c_intr(0, drv_data);
+	}
+}
+
 static int
 mv64xxx_i2c_execute_msg(struct mv64xxx_i2c_data *drv_data, struct i2c_msg *msg,
 				int is_last)
@@ -590,7 +607,11 @@ mv64xxx_i2c_execute_msg(struct mv64xxx_i2c_data *drv_data, struct i2c_msg *msg,
 	mv64xxx_i2c_send_start(drv_data);
 	spin_unlock_irqrestore(&drv_data->lock, flags);
 
-	mv64xxx_i2c_wait_for_completion(drv_data);
+	if (!drv_data->atomic)
+		mv64xxx_i2c_wait_for_completion(drv_data);
+	else
+		mv64xxx_i2c_wait_polling(drv_data);
+
 	return drv_data->rc;
 }
 
@@ -717,7 +738,7 @@ mv64xxx_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static int
-mv64xxx_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 {
 	struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
 	int rc, ret = num;
@@ -730,7 +751,7 @@ mv64xxx_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	drv_data->msgs = msgs;
 	drv_data->num_msgs = num;
 
-	if (mv64xxx_i2c_can_offload(drv_data))
+	if (mv64xxx_i2c_can_offload(drv_data) && !drv_data->atomic)
 		rc = mv64xxx_i2c_offload_xfer(drv_data);
 	else
 		rc = mv64xxx_i2c_execute_msg(drv_data, &msgs[0], num == 1);
@@ -747,8 +768,27 @@ mv64xxx_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	return ret;
 }
 
+static int
+mv64xxx_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+{
+	struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
+
+	drv_data->atomic = 0;
+	return mv64xxx_i2c_xfer_core(adap, msgs, num);
+}
+
+static int mv64xxx_i2c_xfer_atomic(struct i2c_adapter *adap,
+				   struct i2c_msg msgs[], int num)
+{
+	struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
+
+	drv_data->atomic = 1;
+	return mv64xxx_i2c_xfer_core(adap, msgs, num);
+}
+
 static const struct i2c_algorithm mv64xxx_i2c_algo = {
 	.master_xfer = mv64xxx_i2c_xfer,
+	.master_xfer_atomic = mv64xxx_i2c_xfer_atomic,
 	.functionality = mv64xxx_i2c_functionality,
 };
 
-- 
2.25.1

