Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 445F7103687
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2019 10:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbfKTJVj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Nov 2019 04:21:39 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39500 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfKTJVj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Nov 2019 04:21:39 -0500
Received: by mail-ed1-f68.google.com with SMTP id l25so19688886edt.6;
        Wed, 20 Nov 2019 01:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T5sSfypWOVVZ1ZJ8m3Y5+bUBGIeigmAaTQDwHPC5F7E=;
        b=Lj+HRzZP3hYV+Qy9550cWBMlbxLfJnXcEKB9BMXHpToYhWhwqudIb5Dscv2x7A/yhR
         drluz+74jiOtHIuvZi4YO1/MJPO26uP41aHphsAzgRbMGWPW7rEbhjewftgzWMgCZOVh
         EFt9gKwdVuzS1wBKQzyzw7nI/4qa3RrYEzyL7hsXljZjUdG44qGx2dwUK2wXci654YRt
         iIMjGZgTrud1vGBOF6FVbqpnJq+xA3/wkFx61Wb9est4kvSBAq7rog9pucIe1CtRLiB9
         hb8QtwsZmBF1SPCSpnA9ZbF0bptkVopLiYgFeTbyDvzzrUa3a68OU9Y/87Pmnuw10K7N
         JxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T5sSfypWOVVZ1ZJ8m3Y5+bUBGIeigmAaTQDwHPC5F7E=;
        b=QfphIym5k5mUjcwjiTafcy72RwJNBb1ZoUxvIiQirXPh381tEz9e3nkL1Y3L6PclCa
         994iLwx9dvm1589S2FxZtNdBOifaIoonWrs/VC6d+ZLQlSH7GllDs2utrjOR4OVgQycb
         mZvpeOcWSNCqK8t0+jvH4BKgFe31JY9GOnPcweoFfC9uyd2JA62hoE2e7HT7TVFNCoAz
         qCZdfGT3djkcloXmCWS8WdGzNKSVJudwb1HoTGIX+e+2rFj83qrw8cdjy8xSGFsYpQ8v
         yKc6iAWnSQj179F1/rd9sPIQN0ZeZaSIOSR8Z3CeD5XTd6QswmfySeO77fnDF3tM/1IM
         BuMg==
X-Gm-Message-State: APjAAAWAA6aLlIwF/nNRlAKE0Bx2BA4oKE3StbUD8aCrP16NZg8D9DCy
        eExWoL+8fopZHAgqfKRAtbVp5W/S0um+QvVlH5xq7zwA
X-Google-Smtp-Source: APXvYqz+xEemtWxrzCDUeKezo/6GH5uF0XUb8mC/qlp6fg4t0xgIDeaXsZT0A4qccsQYG23RqZEXMyzQ+6bJYOUey74=
X-Received: by 2002:a17:907:205b:: with SMTP id pg27mr3926196ejb.144.1574241697285;
 Wed, 20 Nov 2019 01:21:37 -0800 (PST)
MIME-Version: 1.0
References: <1573719422-7414-1-git-send-email-shubhrajyoti.datta@gmail.com> <6d135b8a-cdba-e6a6-7738-cbc94cdb7ec0@axentia.se>
In-Reply-To: <6d135b8a-cdba-e6a6-7738-cbc94cdb7ec0@axentia.se>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Wed, 20 Nov 2019 14:51:25 +0530
Message-ID: <CAKfKVtE=ufzc=_EjPR2WKt4qf0sdOB=a7f-BRP-ZffMaemxGBw@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: pca954x: Disable cacheing of the last channel
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter ,
thanks for the review,

On Tue, Nov 19, 2019 at 4:35 AM Peter Rosin <peda@axentia.se> wrote:
>
> On 2019-11-14 09:17, shubhrajyoti.datta@gmail.com wrote:
> > From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> >
> > In case of multimaster configuration the last channel cached value is
> > not reliable. Basically the first processor/master does a write to the
> > mux and then to the intended slave, it caches the value.
> > Now the second processor/processor does a write to mux on another
> > channel and writes to another slave.
> > The first processor/master when it attempts to write the slave
> > skips the mux as it relies on the mux channel being the same as the
> > intended. This causes an issue.
> >
> > To fix that write always to the mux address.
>
> Thanks for your patch.
>
> However, I don't really see how this fixes anything. If you have
> multiple masters competing for the same mux, all bets are off and any
> solution not involving an out-of-band channel where the masters can
> coordinate will be racy, broken and dangerous.
> And since you need that
> extra channel anyway, it might as well also be used to coordinate when
> the cache needs to be invalidated.
>
> At the very least, all limitations needs to be carefully documented,
> but that does not mean that I will ever like it. In short, I'm extremely
> reluctant to add a glgllike this.
>
> Cheers,
> Peter

I agree does the below patch make sense.

From 0ca65420b65514594a8252d1e9eeba64bea01da6 Mon Sep 17 00:00:00 2001
From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Date: Fri, 30 Aug 2019 11:15:25 +0530
Subject: [PATCH] i2c: mux: pca954x: Disable cacheing of the last channel

In case of multimaster configuration the last channel cached value is
not reliable. To fix that write always to the mux address.
Also use the 0 channel disable to arbitrate. If disabled only then write.
Else wait for it to be disabled.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---

 .../devicetree/bindings/i2c/i2c-mux-pca954x.txt    |  1 +
 drivers/i2c/muxes/i2c-mux-pca954x.c                | 49 +++++++++++++++++++---
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c
b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 923aa3a..a7e3aa9 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -42,6 +42,7 @@
 #include <linux/i2c-mux.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -55,6 +56,8 @@

 #define PCA954X_IRQ_OFFSET 4

+#define MUX_CHAN_TIMEOUT_US 1000000
+
 enum pca_type {
  pca_9540,
  pca_9542,
@@ -85,6 +88,8 @@ struct pca954x {
  const struct chip_desc *chip;

  u8 last_chan; /* last register value */
+ u8 last_chan_unchached; /* write channel register always */
+ bool channel_sel;
  /* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
  s8 idle_state;

@@ -229,6 +234,23 @@ static int pca954x_reg_write(struct i2c_adapter *adap,
  I2C_SMBUS_BYTE, &dummy);
 }

+/*
+ * Read from chip register. Don't use i2c_transfer()/i2c_smbus_xfer()
+ * as they will try to lock adapter a second time.
+ */
+static int pca954x_reg_read(struct i2c_adapter *adap,
+     struct i2c_client *client, u8 val)
+{
+ union i2c_smbus_data data;
+ int ret;
+
+ ret = __i2c_smbus_xfer(adap, client->addr, client->flags,
+        I2C_SMBUS_READ, val,
+        I2C_SMBUS_BYTE, &data);
+
+ return ret ? ret :  data.byte;
+}
+
 static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 {
  struct pca954x *data = i2c_mux_priv(muxc);
@@ -236,6 +258,7 @@ static int pca954x_select_chan(struct i2c_mux_core
*muxc, u32 chan)
  const struct chip_desc *chip = data->chip;
  u8 regval;
  int ret = 0;
+ unsigned long timeout = jiffies + usecs_to_jiffies(MUX_CHAN_TIMEOUT_US);

  /* we make switches look like muxes, not sure how to be smarter */
  if (chip->muxtype == pca954x_ismux)
@@ -243,13 +266,26 @@ static int pca954x_select_chan(struct
i2c_mux_core *muxc, u32 chan)
  else
  regval = 1 << chan;

+ if (!data->last_chan_unchached) {
  /* Only select the channel if its different from the last channel */
- if (data->last_chan != regval) {
- ret = pca954x_reg_write(muxc->parent, client, regval);
- data->last_chan = ret < 0 ? 0 : regval;
+ if (data->last_chan != regval) {
+ ret = pca954x_reg_write(muxc->parent, client, regval);
+ data->last_chan = ret < 0 ? 0 : regval;
+ }
+ return ret;
  }

- return ret;
+ do {
+ ret = pca954x_reg_read(muxc->parent, client, 0);
+ if (ret == 0) {
+ ret = pca954x_reg_write(muxc->parent, client, regval);
+ data->channel_sel = true;
+ return ret;
+ }
+ msleep(20);
+ } while (time_is_after_eq_jiffies(timeout));
+ data->channel_sel = false;
+ return -ETIMEDOUT;
 }

 static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
@@ -259,7 +295,7 @@ static int pca954x_deselect_mux(struct
i2c_mux_core *muxc, u32 chan)
  s8 idle_state;

  idle_state = READ_ONCE(data->idle_state);
- if (idle_state >= 0)
+ if (idle_state >= 0 &&  data->channel_sel)
  /* Set the mux back to a predetermined channel */
  return pca954x_select_chan(muxc, idle_state);

@@ -479,6 +515,9 @@ static int pca954x_probe(struct i2c_client *client,
  if (idle_disconnect_dt)
  data->idle_state = MUX_IDLE_DISCONNECT;

+ data->last_chan_unchached = np &&
+ of_property_read_bool(np, "no-channel-cache");
+
  ret = pca954x_irq_setup(muxc);
  if (ret)
  goto fail_cleanup;
-- 
2.1.1
