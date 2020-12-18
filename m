Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82482DE88C
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Dec 2020 18:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbgLRRyA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Dec 2020 12:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726152AbgLRRx7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Dec 2020 12:53:59 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C563C0617A7
        for <linux-i2c@vger.kernel.org>; Fri, 18 Dec 2020 09:53:19 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r3so3197876wrt.2
        for <linux-i2c@vger.kernel.org>; Fri, 18 Dec 2020 09:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=platinasystems-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=adVH/5jvy/v2pQEZnES4ohjLSuw1Po3Eac/Um3HvWm0=;
        b=hBSDM/a6FGaIKzbik2Z4UUU38Vf+n1GmqTFQGefcLhKV5KrtZ1N+GNM+IdzdU0CsMv
         wyyRiEhKJgMghuI0UAddWg/ljqwNs/hwK/Q//dz3k9tkMJWTY/GMuhOt8ngEbpe7RkE2
         Pz0QgKe6wpdVJL7RvlOq7pThoUmc73anbGmQ/MgLlebwJ7ZuGSjMKkGRfRl5h3EBoF2V
         /Hx0FwaP+ny2VP3Y2XUq+EO6oFPpIAfwQzfzxbU3hLN8R3yWRri7tqO/InOvHT1pwb3C
         884W72N1rcGAMbMyqTQqu5VvE2vDMfOUXnP8YlBPGqXa0xYaqqYYZB21j9UVyrB8jHUF
         5t2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=adVH/5jvy/v2pQEZnES4ohjLSuw1Po3Eac/Um3HvWm0=;
        b=hiN9OcgJZYv4PRPhhBaylzXVwjBwDMtufx5toigWdZ0K8uqLIiH1L0z3HuHunMdMo7
         iY1pjP6Vl7cjlNUjfkh9bjvV4P5p4/R4K7n9wwQo1Yzs51T3Ay3X6+hmwEwC53vug9R6
         hOBclXdG1EZiPBY+IPzVV7+ADpSOatxHjToooVgcxXV6lXpsjbzIk+4+lomKEnbHKe4Z
         wIHTRuFg/tXAZoQ65aXMuXfmVyZ2qcFIpwxuWZHf8BczJgjxehUIxLoS5/rud+Rt3XV2
         xNsWp1iXQ7XKIGL0sff8nTGIvqZHu11C73BFi7Q465YDrnN8k7iHJcaNemUCmMEWccEL
         /qfA==
X-Gm-Message-State: AOAM530lF9nnRePf/7tHcsBP1WBoRR84w+XlMmNFvj1H6i9+ru5jWF7E
        KdtoqtGhPUK5wzXZ2E4W/uUJMxJKsJ5RQVL/+k5opg==
X-Google-Smtp-Source: ABdhPJy28rtXk0nB9tPVV80zSk0vQn9bZcSx+NjM2EpRJ0o1VJ4IKO7ebd9zKZvycv2iFXAeAzrZBvTqdUShFhRvIgc=
X-Received: by 2002:a5d:6cad:: with SMTP id a13mr5604347wra.275.1608313997704;
 Fri, 18 Dec 2020 09:53:17 -0800 (PST)
MIME-Version: 1.0
From:   Kevin Herbert <kph@platinasystems.com>
Date:   Fri, 18 Dec 2020 09:53:06 -0800
Message-ID: <CABP=6zaXWU8OLxzvn0YJ-K+07Jju+LW-VE3isrnzDnAi5YN7Pw@mail.gmail.com>
Subject: [PATCH] i2c-imx.c: Synthesize end of transaction events without idle interrupts
To:     Biwen Li <biwen.li@nxp.com>, Leo Li <leoyang.li@nxp.com>,
        linux@rempel-privat.de, kernel@pengutronix.de,
        Wolfram Sang <wsa@the-dreams.de>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>, o.rempel@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiafei Pan <jiafei.pan@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Biwen Li <biwen.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From feaf638fb9b9a483c0d6090b277f34db21160885 Mon Sep 17 00:00:00 2001
From: Kevin Paul Herbert <kph@platinasystems.com>
Date: Tue, 15 Dec 2020 16:50:34 -0800
Subject: [PATCH] i2c-imx.c: Synthesize end of transaction events without idle
 interrupts

Only the Layerscape SoCs have interrupts on bus idle, which facilitate
sending events which complete slave bus transactions.

Add support for synthesizing missing events. If we see a master request,
or a newly addressed slave request, if the last event sent to the backend
was I2C_SLAVE_READ_REQUESTED, send the backend a I2C_SLAVE_READ_PROCESSED
followed by I2C_SLAVE_STOP. For all other events, send an I2C_SLAVE_STOP.

Signed-off-by: Kevin Paul Herbert <kph@platinasystems.com>
---
 drivers/i2c/busses/i2c-imx.c | 59 +++++++++++++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 7137bae770ea..7255e1dabde4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -211,6 +211,7 @@ struct imx_i2c_struct {

  struct imx_i2c_dma *dma;
  struct i2c_client *slave;
+ enum i2c_slave_event last_slave_event;
 };

 static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
@@ -637,6 +638,36 @@ static void i2c_imx_enable_bus_idle(struct
imx_i2c_struct *i2c_imx)
  }
 }

+static void i2c_imx_slave_event(struct imx_i2c_struct *i2c_imx,
+ enum i2c_slave_event event, u8 *val)
+{
+ i2c_slave_event(i2c_imx->slave, event, val);
+ i2c_imx->last_slave_event = event;
+}
+
+static void i2c_imx_slave_finish_op(struct imx_i2c_struct *i2c_imx)
+{
+ u8 val;
+
+ while (i2c_imx->last_slave_event != I2C_SLAVE_STOP) {
+ switch (i2c_imx->last_slave_event) {
+ case I2C_SLAVE_READ_REQUESTED:
+ i2c_imx_slave_event(i2c_imx, I2C_SLAVE_READ_PROCESSED,
+     &val);
+ break;
+
+ case I2C_SLAVE_WRITE_REQUESTED:
+ case I2C_SLAVE_READ_PROCESSED:
+ case I2C_SLAVE_WRITE_RECEIVED:
+ i2c_imx_slave_event(i2c_imx, I2C_SLAVE_STOP, &val);
+ break;
+
+ case I2C_SLAVE_STOP:
+ break;
+ }
+ }
+}
+
 static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
       unsigned int status, unsigned int ctl)
 {
@@ -649,9 +680,11 @@ static irqreturn_t i2c_imx_slave_isr(struct
imx_i2c_struct *i2c_imx,
  }

  if (status & I2SR_IAAS) { /* Addressed as a slave */
+ i2c_imx_slave_finish_op(i2c_imx);
  if (status & I2SR_SRW) { /* Master wants to read from us*/
  dev_dbg(&i2c_imx->adapter.dev, "read requested");
- i2c_slave_event(i2c_imx->slave, I2C_SLAVE_READ_REQUESTED, &value);
+ i2c_imx_slave_event(i2c_imx,
+     I2C_SLAVE_READ_REQUESTED, &value);

  /* Slave transmit */
  ctl |= I2CR_MTX;
@@ -661,7 +694,8 @@ static irqreturn_t i2c_imx_slave_isr(struct
imx_i2c_struct *i2c_imx,
  imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
  } else { /* Master wants to write to us */
  dev_dbg(&i2c_imx->adapter.dev, "write requested");
- i2c_slave_event(i2c_imx->slave, I2C_SLAVE_WRITE_REQUESTED, &value);
+ i2c_imx_slave_event(i2c_imx,
+     I2C_SLAVE_WRITE_REQUESTED, &value);

  /* Slave receive */
  ctl &= ~I2CR_MTX;
@@ -672,17 +706,20 @@ static irqreturn_t i2c_imx_slave_isr(struct
imx_i2c_struct *i2c_imx,
  } else if (!(ctl & I2CR_MTX)) { /* Receive mode */
  if (status & I2SR_IBB) { /* No STOP signal detected */
  value = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
- i2c_slave_event(i2c_imx->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
+ i2c_imx_slave_event(i2c_imx,
+     I2C_SLAVE_WRITE_RECEIVED, &value);
  } else { /* STOP signal is detected */
  dev_dbg(&i2c_imx->adapter.dev,
  "STOP signal detected");
- i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
+ i2c_imx_slave_event(i2c_imx,
+     I2C_SLAVE_STOP, &value);
  }
  } else if (!(status & I2SR_RXAK)) { /* Transmit mode received ACK */
  ctl |= I2CR_MTX;
  imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);

- i2c_slave_event(i2c_imx->slave, I2C_SLAVE_READ_PROCESSED, &value);
+ i2c_imx_slave_event(i2c_imx,
+     I2C_SLAVE_READ_PROCESSED, &value);

  imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
  } else { /* Transmit mode received NAK */
@@ -723,6 +760,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
  return -EBUSY;

  i2c_imx->slave = client;
+ i2c_imx->last_slave_event = I2C_SLAVE_STOP;

  /* Resume */
  ret = pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
@@ -775,10 +813,17 @@ static irqreturn_t i2c_imx_isr(int irq, void *dev_id)

  status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
  ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+
  if (status & I2SR_IIF) {
  i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
- if (i2c_imx->slave && !(ctl & I2CR_MSTA))
- return i2c_imx_slave_isr(i2c_imx, status, ctl);
+ if (i2c_imx->slave) {
+ if (!(ctl & I2CR_MSTA)) {
+ return i2c_imx_slave_isr(i2c_imx, status, ctl);
+ } else if (i2c_imx->last_slave_event !=
+    I2C_SLAVE_STOP) {
+ i2c_imx_slave_finish_op(i2c_imx);
+ }
+ }
  return i2c_imx_master_isr(i2c_imx, status);
  }

-- 
2.25.1
