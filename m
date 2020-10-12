Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF6D28AFAC
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Oct 2020 10:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgJLIJz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Oct 2020 04:09:55 -0400
Received: from z5.mailgun.us ([104.130.96.5]:47412 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728743AbgJLIJy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Oct 2020 04:09:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602490194; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=5YXnNsXE0oYDUilxaLIpOVbD5idrWDQORor7EfH/zAk=; b=aEn3Tx/S2/qnF21U0Oha0+h74m+X7UAGpykxhHYC24DDnYGPdP4fHRl1yji/xy6FwHGPRaKU
 hrQ2MrKEy0f6/bgysEInSYf6pDvvSpi3M/vNrDdn+rD8xTo6E5tH60jH6Td5YIgjs5/gScLo
 o6eBy6rNwMd+h889wsxL/2hJR4k=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f840f51319d4e9cb50af479 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Oct 2020 08:09:53
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D88A1C433F1; Mon, 12 Oct 2020 08:09:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.98] (unknown [47.9.68.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A391C433CB;
        Mon, 12 Oct 2020 08:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7A391C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 1/3] soc: qcom: geni: More properly switch to DMA mode
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-i2c@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <20201008225235.2035820-1-dianders@chromium.org>
 <20201008155154.1.Ifdb1b69fa3367b81118e16e9e4e63299980ca798@changeid>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <698e9616-cca9-e01d-391e-ad0439c08e04@codeaurora.org>
Date:   Mon, 12 Oct 2020 13:39:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201008155154.1.Ifdb1b69fa3367b81118e16e9e4e63299980ca798@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 10/9/2020 4:22 AM, Douglas Anderson wrote:
> On geni-i2c transfers using DMA, it was seen that if you program the
> command (I2C_READ) before calling geni_se_rx_dma_prep() that it could
> cause interrupts to fire.  If we get unlucky, these interrupts can
> just keep firing (and not be handled) blocking further progress and
> hanging the system.
>
> In commit 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
> we avoided that by making sure we didn't program the command until
> after geni_se_rx_dma_prep() was called.  While that avoided the
> problems, it also turns out to be invalid.  At least in the TX case we
> started seeing sporadic corrupted transfers.  This is easily seen by
> adding an msleep() between the DMA prep and the writing of the
> command, which makes the problem worse.  That means we need to revert
> that commit and find another way to fix the bogus IRQs.
>
> Specifically, after reverting commit 02b9aec59243 ("i2c:
> i2c-qcom-geni: Fix DMA transfer race"), I put some traces in.  I found
> that the when the interrupts were firing like crazy:
> - "m_stat" had bits for M_RX_IRQ_EN, M_RX_FIFO_WATERMARK_EN set.
> - "dma" was set.
>
> Further debugging showed that I could make the problem happen more
> reliably by adding an "msleep(1)" any time after geni_se_setup_m_cmd()
> ran up until geni_se_rx_dma_prep() programmed the length.
>
> A rather simple fix is to change geni_se_select_dma_mode() so it's a
> true inverse of geni_se_select_fifo_mode() and disables all the FIFO
> related interrupts.  Now the problematic interrupts can't fire and we
> can program things in the correct order without worrying.
>
> As part of this, let's also change the writel_relaxed() in the prepare
> function to a writel() so that our DMA is guaranteed to be prepared
> now that we can't rely on geni_se_setup_m_cmd()'s writel().
>
> NOTE: the only current user of GENI_SE_DMA in mainline is i2c.
>
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Fixes: 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

