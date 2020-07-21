Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F21227D98
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 12:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbgGUKtH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 06:49:07 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:31403 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729208AbgGUKtH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jul 2020 06:49:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595328546; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=hWSCkjwa6XTH8wbP9rLLbwZRQrSZSARhWd3jpGdV9Qs=; b=tSixA6rCu0T6/F72ixcEUL3ye5dmw03GVJVC+ITdqzSz4EklzE2slLFZmjHNmcKrUceB98bO
 czc4d2YHbWiabv86LTy5BL60Lh7iXiLSAwM/RozDuK1DHK8uqUJVcNgc66f7jAOEazXx+JZH
 VLhewdms1f4SzLmWAba6bsQ0xcw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5f16c805427cd557667500de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 10:48:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 42CD6C433A0; Tue, 21 Jul 2020 10:48:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.98] (unknown [157.48.50.75])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 20993C433CA;
        Tue, 21 Jul 2020 10:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 20993C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Fix DMA transfer race
To:     Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <fc39751a-c730-0181-6904-cca34ff0f62c@codeaurora.org>
Date:   Tue, 21 Jul 2020 16:18:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 7/21/2020 5:54 AM, Douglas Anderson wrote:
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
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

