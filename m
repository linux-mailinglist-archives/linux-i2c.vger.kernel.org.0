Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12BBD37EE30
	for <lists+linux-i2c@lfdr.de>; Thu, 13 May 2021 00:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239849AbhELVMY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 17:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377304AbhELTDb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 15:03:31 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AF7C061244
        for <linux-i2c@vger.kernel.org>; Wed, 12 May 2021 11:57:57 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id q7-20020a9d57870000b02902a5c2bd8c17so21502582oth.5
        for <linux-i2c@vger.kernel.org>; Wed, 12 May 2021 11:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PehLa9MGShjuTsXrSuonmCUzxBSw0r+oW/besiLAOSg=;
        b=e7QWriUulUNRPB0jJnAJKw/zMmZn8kRRBSywopzp5wcDxq2VWWf3bpHvugikCOY9W7
         a0kHkr5Jzk42OGM3+lOAtcuS0p0ieGRuKMhb2vlc8V0O/xW/q5D3pDzlFkt0uzQFmD9p
         nSwAKymo6YI0llaqDyFJQY9dDhKN070USLUjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PehLa9MGShjuTsXrSuonmCUzxBSw0r+oW/besiLAOSg=;
        b=k0TzLIr+mzkhGXS6b4PN+tUShUjUDK86NNpQTlAYXJV+W/QrlfLMop47cTHC9YQdAf
         J6zGsccC63dfR2qRAntJva8OZdxV43uJ20FpadXaFcQAbvlG9+jMkxjjCDv5BvG+bUO8
         oqlfaZA8LNoGtXIgXMTDiHBtggBKzf4nptvAksWyicZOijaGAXdjG6OXlN3hwsmgH182
         mec6zxtsOKbYuMley85WRGRUshUyQ8UVw2U++HY2QW2wzePMMmGNQ9R6vPIVxYGB8/ic
         xuWRcxUT5E8kRTCQVxYq6g7ribu8UW7bUUI8il3KE3XQQKYxM1Y+C9JU9n2WEnjQIJZP
         sbyg==
X-Gm-Message-State: AOAM530gwjNTxgtfOKC6E2SrJxUbxmYBS4X+DSpMF2mL6Wn24lVHlkO1
        rcYRNKg3PD2mcv1MmWgkbMkUbsj0LLh9w/GxfZRfvA==
X-Google-Smtp-Source: ABdhPJzBOj/82oAh5sBucFDlICY1aaY8WRL1s5yQq3y7rEs/5jiHV7d0KyTPx5JmEzraeDWWvfK+qDFF5VxaUmj9mUE=
X-Received: by 2002:a9d:1ea9:: with SMTP id n38mr32942611otn.233.1620845876668;
 Wed, 12 May 2021 11:57:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 May 2021 11:57:56 -0700
MIME-Version: 1.0
In-Reply-To: <20210512082220.7137-1-rojay@codeaurora.org>
References: <20210512082220.7137-1-rojay@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 12 May 2021 11:57:56 -0700
Message-ID: <CAE-0n52D-K1T0QgxA-S7BXxE3Qk807F9edNyR+2RL4YxRyigMg@mail.gmail.com>
Subject: Re: [PATCH V10] i2c: i2c-qcom-geni: Add shutdown callback for i2c
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

Quoting Roja Rani Yarubandi (2021-05-12 01:22:20)
> If the hardware is still accessing memory after SMMU translation
> is disabled (as part of smmu shutdown callback), then the
> IOVAs (I/O virtual address) which it was using will go on the bus
> as the physical addresses which will result in unknown crashes
> like NoC/interconnect errors.
>
> So, implement shutdown callback for i2c driver to suspend the bus
> during system "reboot" or "shutdown".
>
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
> Changes in V2:
>  - As per Stephen's comments added seperate function for stop transfer,
>    fixed minor nitpicks.
>  - As per Stephen's comments, changed commit text.
>
> Changes in V3:
>  - As per Stephen's comments, squashed patch 1 into patch 2, added Fixes tag.
>  - As per Akash's comments, included FIFO case in stop_xfer, fixed minor nitpicks.
>
> Changes in V4:
>  - As per Stephen's comments cleaned up geni_i2c_stop_xfer function,
>    added dma_buf in geni_i2c_dev struct to call i2c_put_dma_safe_msg_buf()
>    from other functions, removed "iova" check in geni_se_rx_dma_unprep()
>    and geni_se_tx_dma_unprep() functions.
>  - Added two helper functions geni_i2c_rx_one_msg_done() and
>    geni_i2c_tx_one_msg_done() to unwrap the things after rx/tx FIFO/DMA
>    transfers, so that the same can be used in geni_i2c_stop_xfer() function
>    during shutdown callback. Updated commit text accordingly.
>  - Checking whether it is tx/rx transfer using I2C_M_RD which is valid for both
>    FIFO and DMA cases, so dropped DMA_RX_ACTIVE and DMA_TX_ACTIVE bit checking
>
> Changes in V5:
>  - As per Stephen's comments, added spin_lock_irqsave & spin_unlock_irqsave in
>    geni_i2c_stop_xfer() function.
>
> Changes in V6:
>  - As per Stephen's comments, taken care of unsafe lock order in
>    geni_i2c_stop_xfer().
>  - Moved spin_lock/unlock to geni_i2c_rx_msg_cleanup() and
>    geni_i2c_tx_msg_cleanup() functions.
>
> Changes in V7:
>  - No changes
>
> Changes in V8:
>  - As per Wolfram Sang comment, removed goto and modified geni_i2c_stop_xfer()
>    accordingly.
>
> Changes in V9:
>  - Fixed possbile race by protecting gi2c->cur and calling geni_i2c_abort_xfer()
>    with adding another parameter to differentiate from which sequence is the
>    geni_i2c_abort_xfer() called and handle the spin_lock/spin_unlock accordingly
>    inside geni_i2c_abort_xfer(). For this added two macros ABORT_XFER and
>    STOP_AND_ABORT_XFER.
>  - Added a bool variable "stop_xfer" in geni_i2c_dev struct, used to put stop
>    to upcoming geni_i2c_rx_one_msg() and geni_i2c_tx_one_msg() calls once we
>    recieve the shutdown call.
>  - Added gi2c->cur == NULL check in geni_i2c_irq() to not to process the irq
>    even if any transfer is queued and shutdown to HW received.
>
> Changes in V10:
>  - As per Stephen's comments, removed ongoing transfers flush and only
>    suspending i2c bus in shutdown callback.
>  - Also removed all other changes which have been made for ongoing transfers
>    flush, handling race issues etc., during shutdown callback.
>  - Updated commit text accordingly.
>
>  drivers/i2c/busses/i2c-qcom-geni.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 214b4c913a13..277ab7e7dd51 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -650,6 +650,14 @@ static int geni_i2c_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static void geni_i2c_shutdown(struct platform_device *pdev)
> +{
> +       struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
> +
> +       if (!pm_runtime_status_suspended(gi2c->se.dev))
> +               pm_runtime_set_suspended(gi2c->se.dev);

What was wrong with my suggested approach of telling i2c core that the
bus is suspended? This looks to do a bunch of work right before we're
shutting down, when it would be simpler to just mark the bus as
suspended and have it block future transactions and spit out a warning.

I do see that we should be marking it suspended/resumed during runtime
suspend/resume. I'm also confused if during system wide suspend/resume
we actually do anything in this driver. Is runtime suspend called for
system wide suspend?

----8<----
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c
b/drivers/i2c/busses/i2c-qcom-geni.c
index 214b4c913a13..ca12d348336b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -656,6 +656,7 @@ static int __maybe_unused
geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);

 	disable_irq(gi2c->irq);
+	i2c_mark_adapter_suspended(&gi2c->adap);
 	ret = geni_se_resources_off(&gi2c->se);
 	if (ret) {
 		enable_irq(gi2c->irq);
@@ -682,6 +683,7 @@ static int __maybe_unused
geni_i2c_runtime_resume(struct device *dev)
 		return ret;

 	enable_irq(gi2c->irq);
+	i2c_mark_adapter_resumed(&gi2c->adap);
 	gi2c->suspended = 0;
 	return 0;
 }
