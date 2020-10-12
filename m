Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7475F28B11E
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Oct 2020 11:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgJLJH7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Oct 2020 05:07:59 -0400
Received: from z5.mailgun.us ([104.130.96.5]:11734 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729143AbgJLJH7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Oct 2020 05:07:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602493679; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HXcfH8bow9YsdJB21VFaGzkbIhBQ3UPg17GtDKnIiwg=; b=GQhPOWnK0KRsEPwOWGLNKaG/gRpWVUPHFFW9g1tGnzksIh+8vvtlRK5FrE+1IrUeQXor+Zah
 o4IX6y/Lm1uU/mYdc+d4xLGoG82Vl8+QU14jLvsUrsvOYWyz0r8DR9so+9gVtuYmgcfFtEJ3
 C9I6z4qBr+3QYIbtxxsJB0dyY7w=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f841c5cd63768e57b36dde3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Oct 2020 09:05:32
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 61857C433CB; Mon, 12 Oct 2020 09:05:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.43.98] (unknown [47.9.68.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF35AC433C9;
        Mon, 12 Oct 2020 09:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AF35AC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH 1/3] soc: qcom: geni: More properly switch to DMA mode
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <20201008225235.2035820-1-dianders@chromium.org>
 <20201008155154.1.Ifdb1b69fa3367b81118e16e9e4e63299980ca798@changeid>
 <160229038385.310579.7502548054994849649@swboyd.mtv.corp.google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <2ccc26a0-5d54-e06c-5a73-7eb353c393d2@codeaurora.org>
Date:   Mon, 12 Oct 2020 14:35:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <160229038385.310579.7502548054994849649@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stephen,


>>   
>>   static void geni_se_select_dma_mode(struct geni_se *se)
>>   {
>> +       u32 proto = geni_se_read_proto(se);
>>          u32 val;
>>   
>>          geni_se_irq_clear(se);
>>   
>> +       val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
>> +       if (proto != GENI_SE_UART) {
> Not a problem with this patch but it would be great if there was a
> comment here (and probably in geni_se_select_fifo_mode() too) indicating
> why GENI_SE_UART is special. Is it because GENI_SE_UART doesn't use the
> main sequencer? I think that is the reason, but I forgot and reading
> this code doesn't tell me that.
>
> Splitting the driver in this way where the logic is in the geni wrapper
> and in the engine driver leads to this confusion.

GENI_SE_UART uses main sequencer for TX and secondary for RX transfers 
because it is asynchronous in nature.

That's why  RX related bits (M_RX_FIFO_WATERMARK_EN | 
M_RX_FIFO_LAST_EN)  are not enable in main sequencer for UART.

(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN) bits are controlled from UART 
driver, it's gets enabled and disabled multiple times from start_tx 
,stop_tx respectively.


Regards,

Akash

>
>> +               val &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
>> +               val &= ~(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
>> +       }
>> +       writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
>> +
>> +       val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
>> +       if (proto != GENI_SE_UART)
>> +               val &= ~S_CMD_DONE_EN;
>> +       writel_relaxed(val, se->base + SE_GENI_S_IRQ_EN);
>> +
>>          val = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
>>          val |= GENI_DMA_MODE_EN;
>>          writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

