Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F9A22783C
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 07:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgGUFhi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 01:37:38 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:42551 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725774AbgGUFhh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jul 2020 01:37:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595309857; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NXt+TZKuzaP13BN1vGN/nLEzofdcagbMmJ6KBhp3XA0=;
 b=sd155qBuvN4pwxnO1Cmi+j7/rDW6QZBFcrcLGKlMgEjeND61dkZAd/oBNwvWwB/0NhxKp1kt
 nXOuWNyszIp5/lDYvhQuBBZSSgjSwORewL/u2HPEXRFKMrjpzWneuwnGNE3m/G3ukTfbZ5HS
 ZP6uVjH7whPMt6M5ZYoAGg6o/kg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5f167f1b5b75bcda60069954 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 05:37:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BBD42C43395; Tue, 21 Jul 2020 05:37:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F0A1AC433C6;
        Tue, 21 Jul 2020 05:37:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Jul 2020 11:07:29 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        Akash Asthana <akashast@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Fix DMA transfer race
In-Reply-To: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
References: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
Message-ID: <76940ce4659232e9adc073b4065d0e9b@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-07-21 05:54, Douglas Anderson wrote:
> When I have KASAN enabled on my kernel and I start stressing the
> touchscreen my system tends to hang.  The touchscreen is one of the
> only things that does a lot of big i2c transfers and ends up hitting
> the DMA paths in the geni i2c driver.  It appears that KASAN adds
> enough delay in my system to tickle a race condition in the DMA setup
> code.
> 
> When the system hangs, I found that it was running the geni_i2c_irq()
> over and over again.  It had these:
> 
> m_stat   = 0x04000080
> rx_st    = 0x30000011
> dm_tx_st = 0x00000000
> dm_rx_st = 0x00000000
> dma      = 0x00000001
> 
> Notably we're in DMA mode but are getting M_RX_IRQ_EN and
> M_RX_FIFO_WATERMARK_EN over and over again.
> 
> Putting some traces in geni_i2c_rx_one_msg() showed that when we
> failed we were getting to the start of geni_i2c_rx_one_msg() but were
> never executing geni_se_rx_dma_prep().
> 
> I believe that the problem here is that we are writing the transfer
> length and setting up the geni command before we run
> geni_se_rx_dma_prep().  If a transfer makes it far enough before we do
> that then we get into the state I have observed.  Let's change the
> order, which seems to work fine.
> 
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the
> Qualcomm GENI I2C controller")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c
> b/drivers/i2c/busses/i2c-qcom-geni.c
> index 18d1e4fd4cf3..21e27f10510a 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -366,15 +366,15 @@ static int geni_i2c_rx_one_msg(struct
> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>  	else
>  		geni_se_select_mode(se, GENI_SE_FIFO);
> 
> -	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> -	geni_se_setup_m_cmd(se, I2C_READ, m_param);
> -
>  	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
>  		geni_se_select_mode(se, GENI_SE_FIFO);
>  		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>  		dma_buf = NULL;
>  	}
> 
> +	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> +	geni_se_setup_m_cmd(se, I2C_READ, m_param);
> +
>  	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>  	if (!time_left)
>  		geni_i2c_abort_xfer(gi2c);

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
