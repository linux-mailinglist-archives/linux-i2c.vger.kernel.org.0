Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C613737339B
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 03:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhEEBjE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 21:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbhEEBjD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 21:39:03 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66502C061763
        for <linux-i2c@vger.kernel.org>; Tue,  4 May 2021 18:38:07 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso364587otm.4
        for <linux-i2c@vger.kernel.org>; Tue, 04 May 2021 18:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lX6vTVdP28sAUcsZAx6P7d8fEnuW4SnnYR6kFB2r4Dk=;
        b=PziAM8UzWWk2O/fAzTSdFRXR7VcbJ09nbjUox6Gj//Qu/D9P8KlV8l6Au+ElQtRw6X
         8T8bE2mwD02yOI1opc3c1rt4s5Ex9Iad+xA8TfnCoKIdoe/LnfsTFq+5m5hVVkxJGjxk
         LTm7cuzIh7Xb0zG00C464iaHUBYkOtxO/4ces=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lX6vTVdP28sAUcsZAx6P7d8fEnuW4SnnYR6kFB2r4Dk=;
        b=egc6Un7fgYkLtpmNr3PBzSSFzTbiegi9WyFG21eewgEQd9eBcBFa2+8NX6D6bfBHWw
         kkrhQ+mSbxrWwo3d+AOhkpxk4CoXyexcrJKqRkNFv/8xlRGBqvvi6t/2BQj8YDHoJsW3
         ABJbjjM2A2J2ypdSMra936LNUJSpNoo8DVfYkR5zDnizS9Vm55W97QYlXq279Txip4UE
         D2YjFCKmHv/qV3VK5/SLzBb4Qkg4Wa9isHTi6rJnBfjwYxrqHltpd+8ohW28FCLaETP5
         km9Jm+pyIxguSpZw2ueTZd6bhhPAR/3ZZiUYrOGRjPINHfWdW28TT7UTlczWODo2Wuqi
         L2lA==
X-Gm-Message-State: AOAM532bvmI8q1BVaCpbaXvvZZRtYAR63BLmTrFvtRwWviMZZqVCrRVF
        Rt5n4bQ7iwNxjbFIyEfiYmrOXCUBkzFUZAtmDIKoMLgtZz4=
X-Google-Smtp-Source: ABdhPJzro2JKCy5vcnXa+onhPlmyRkPLgrndLJM9Va0ydjoM12Zj8/ZTtsjIG2ChK4qCSQ+1i5lO2Rxulpu23l1dX20=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr22439486otn.233.1620178686562;
 Tue, 04 May 2021 18:38:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 May 2021 21:38:05 -0400
MIME-Version: 1.0
In-Reply-To: <20210420111355.18462-1-rojay@codeaurora.org>
References: <20210420111355.18462-1-rojay@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 4 May 2021 21:38:05 -0400
Message-ID: <CAE-0n51iyNgVW4Vra2C_4FAqQECU-aqAHLWZ+kB2Xv3i-inxiQ@mail.gmail.com>
Subject: Re: [PATCH V9] i2c: i2c-qcom-geni: Add shutdown callback for i2c
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Cc:     dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        skananth@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Roja Rani Yarubandi (2021-04-20 04:13:55)
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 214b4c913a13..8ae17ccad99e 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -71,6 +71,8 @@ enum geni_i2c_err_code {
>  #define ABORT_TIMEOUT          HZ
>  #define XFER_TIMEOUT           HZ
>  #define RST_TIMEOUT            HZ
> +#define ABORT_XFER             0
> +#define STOP_AND_ABORT_XFER    1

These should be an enum.

>
>  struct geni_i2c_dev {
>         struct geni_se se;
> @@ -89,6 +91,7 @@ struct geni_i2c_dev {
>         void *dma_buf;
>         size_t xfer_len;
>         dma_addr_t dma_addr;
> +       bool stop_xfer;
>  };
>
>  struct geni_i2c_err_log {
> @@ -215,6 +218,11 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
>         struct i2c_msg *cur;
>
>         spin_lock(&gi2c->lock);
> +       if (!gi2c->cur) {
> +               dev_err(gi2c->se.dev, "Can't process irq, gi2c->cur is NULL\n");

This error message is worthless. The user won't know what to do and then
we return IRQ_HANDLED? If the device is misbehaving we should return
IRQ_NONE and shut down the irq storm that will soon be upon us, not
print an error message and hope for the best.

> +               spin_unlock(&gi2c->lock);
> +               return IRQ_HANDLED;
> +       }
>         m_stat = readl_relaxed(base + SE_GENI_M_IRQ_STATUS);
>         rx_st = readl_relaxed(base + SE_GENI_RX_FIFO_STATUS);
>         dm_tx_st = readl_relaxed(base + SE_DMA_TX_IRQ_STAT);
> @@ -222,8 +230,7 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
>         dma = readl_relaxed(base + SE_GENI_DMA_MODE_EN);
>         cur = gi2c->cur;
>
> -       if (!cur ||
> -           m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
> +       if (m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
>             dm_rx_st & (DM_I2C_CB_ERR)) {
>                 if (m_stat & M_GP_IRQ_1_EN)
>                         geni_i2c_err(gi2c, NACK);
> @@ -301,17 +308,19 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
>         return IRQ_HANDLED;
>  }
>
> -static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
> +static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c, bool is_stop_xfer)

The bool should be an enum, but a better approach would be to have a
locked and unlocked version of this function.

>  {
>         u32 val;
>         unsigned long time_left = ABORT_TIMEOUT;
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gi2c->lock, flags);
> +       if (!is_stop_xfer)
> +               spin_lock_irqsave(&gi2c->lock, flags);
>         geni_i2c_err(gi2c, GENI_TIMEOUT);
>         gi2c->cur = NULL;
>         geni_se_abort_m_cmd(&gi2c->se);
> -       spin_unlock_irqrestore(&gi2c->lock, flags);
> +       if (!is_stop_xfer)
> +               spin_unlock_irqrestore(&gi2c->lock, flags);

Please no conditional locking. It's too hard to reason about.

>         do {
>                 time_left = wait_for_completion_timeout(&gi2c->done, time_left);
>                 val = readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATUS);
> @@ -375,6 +384,38 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
>         }
>  }
>
> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
> +{
> +       int ret;
> +       u32 geni_status;
> +       struct i2c_msg *cur;
> +       unsigned long flags;
> +
> +       /* Resume device, as runtime suspend can happen anytime during transfer */

This comment doesn't make any sense. Hopefully a suspend can't happen
during a transfer, but only before or after a transfer. Otherwise, the
transfer code is broken and isn't properly keeping the device runtime
resumed during the transfer.

> +       ret = pm_runtime_get_sync(gi2c->se.dev);
> +       if (ret < 0) {
> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", ret);
> +               return;
> +       }
> +
> +       spin_lock_irqsave(&gi2c->lock, flags);
> +       gi2c->stop_xfer = 1;
> +       geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
> +       if (geni_status & M_GENI_CMD_ACTIVE) {
> +               cur = gi2c->cur;
> +               geni_i2c_abort_xfer(gi2c, STOP_AND_ABORT_XFER);
> +               spin_unlock_irqrestore(&gi2c->lock, flags);
> +               if (cur->flags & I2C_M_RD)
> +                       geni_i2c_rx_msg_cleanup(gi2c, cur);
> +               else
> +                       geni_i2c_tx_msg_cleanup(gi2c, cur);
> +       } else {
> +               spin_unlock_irqrestore(&gi2c->lock, flags);
> +       }

Please unlock outside of an if condition. A local variable can be used
outside of the unlock, but then the code is easier to follow

	spin_lock_irqsave(&gi2c->lock, flags);
	if (geni_status & M_GENI_CMD_ACTIVE) {
		cur = gic2->cur;
		geni_i2c_abort_xfer(....);
	}
	spin_unlock_irqrestore(gi2c->lock, flags);

	if (cur) {
		if (cur->flags & I2C_M_RD)
			...
		else
			...
	}

And then I don't really know if grabbing 'cur' out of the struct and
then messing with it outside the lock is correct.

> +
> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>                                 u32 m_param)
>  {
> @@ -407,7 +448,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>         cur = gi2c->cur;
>         time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>         if (!time_left)
> -               geni_i2c_abort_xfer(gi2c);
> +               geni_i2c_abort_xfer(gi2c, ABORT_XFER);

So this would say geni_i2c_abort_xfer() but the one above would say
geni_i2c_abort_xfer_locked() because the lock is already held.

>
>         geni_i2c_rx_msg_cleanup(gi2c, cur);
>
> @@ -449,7 +490,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>         cur = gi2c->cur;
>         time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>         if (!time_left)
> -               geni_i2c_abort_xfer(gi2c);
> +               geni_i2c_abort_xfer(gi2c, ABORT_XFER);
>
>         geni_i2c_tx_msg_cleanup(gi2c, cur);
>
> @@ -462,6 +503,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  {
>         struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
>         int i, ret;
> +       unsigned long flags;
>
>         gi2c->err = 0;
>         reinit_completion(&gi2c->done);
> @@ -480,7 +522,13 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>
>                 m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
>
> +               spin_lock_irqsave(&gi2c->lock, flags);
> +               if (gi2c->stop_xfer) {
> +                       spin_unlock_irqrestore(&gi2c->lock, flags);
> +                       break;
> +               }
>                 gi2c->cur = &msgs[i];
> +               spin_unlock_irqrestore(&gi2c->lock, flags);

Is this to jump into the transfer real fast and break out if we're in
the middle of a transfer?

>                 if (msgs[i].flags & I2C_M_RD)
>                         ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
>                 else
> @@ -624,6 +672,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>         dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>
>         gi2c->suspended = 1;
> +       gi2c->stop_xfer = 0;
>         pm_runtime_set_suspended(gi2c->se.dev);
>         pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
>         pm_runtime_use_autosuspend(gi2c->se.dev);
> @@ -650,6 +699,13 @@ static int geni_i2c_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static void  geni_i2c_shutdown(struct platform_device *pdev)
> +{
> +       struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
> +
> +       geni_i2c_stop_xfer(gi2c);

It would read better as

	geni_i2c_plug_xfer(gi2c);

or

	geni_i2c_flush_and_teardown(gi2c);

or

	geni_i2c_teardown_tx_rx(gi2c);

Something that says we're waiting for any transfer to complete, and then
plugging the queue and removing the i2c bus entirely.

In fact, where is that code? I'd expect to see i2c_del_adapter() in here
so we know the adapter can't accept transfers anymore. Maybe
i2c_del_adapter() could be called, and then there's nothing to do after
that? This whole patch is trying to rip the adapter out from under the
i2c core framework, when we should take the opposite approach and remove
it from the core framework so that it can't transfer anything anymore
and thus the IOMMU can remove the mapping.

> +}
> +
>  static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  {
>         int ret;
