Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843C422E7EC
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 10:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgG0Igq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 04:36:46 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60795 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727071AbgG0Igp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jul 2020 04:36:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595839005; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JqWfd/1AwzywENu929p5CV6pTKTw5ZyiTiaOJDpxEvU=; b=OWqkBeyh5Wk/nfrKGN2hybyHkqGP5cZYqOEwtqoD+nciRTBFxSCqjB/zb4sP9cpv7g8Sk0HL
 fVYRiy7TLzGmIZ08+nurkQrWWA+kiONB1A31k8C7EI5I8eOyyMMHGIuTg8bZMiXQsk9YpyXF
 EhBxMs/ieMEtALgcg2H5L7Cvr8w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5f1e921cc7e7bf09e0ce2347 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 08:36:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3B4E6C4339C; Mon, 27 Jul 2020 08:36:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B086C433C9;
        Mon, 27 Jul 2020 08:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B086C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Fix DMA transfer race
To:     Wolfram Sang <wsa@the-dreams.de>,
        Douglas Anderson <dianders@chromium.org>
Cc:     swboyd@chromium.org, msavaliy@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200722145948.v2.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
 <20200723195634.GA908@ninjato> <20200726124747.GA16169@ninjato>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <ed066f01-0c3a-a14b-5616-cbdfd074bfeb@codeaurora.org>
Date:   Mon, 27 Jul 2020 14:06:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200726124747.GA16169@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/26/2020 6:17 PM, Wolfram Sang wrote:
> On Thu, Jul 23, 2020 at 09:56:34PM +0200, Wolfram Sang wrote:
>> On Wed, Jul 22, 2020 at 03:00:21PM -0700, Douglas Anderson wrote:
>>> When I have KASAN enabled on my kernel and I start stressing the
>>> touchscreen my system tends to hang.  The touchscreen is one of the
>>> only things that does a lot of big i2c transfers and ends up hitting
>>> the DMA paths in the geni i2c driver.  It appears that KASAN adds
>>> enough delay in my system to tickle a race condition in the DMA setup
>>> code.
>>>
>>> When the system hangs, I found that it was running the geni_i2c_irq()
>>> over and over again.  It had these:
>>>
>>> m_stat   = 0x04000080
>>> rx_st    = 0x30000011
>>> dm_tx_st = 0x00000000
>>> dm_rx_st = 0x00000000
>>> dma      = 0x00000001
>>>
>>> Notably we're in DMA mode but are getting M_RX_IRQ_EN and
>>> M_RX_FIFO_WATERMARK_EN over and over again.
>>>
>>> Putting some traces in geni_i2c_rx_one_msg() showed that when we
>>> failed we were getting to the start of geni_i2c_rx_one_msg() but were
>>> never executing geni_se_rx_dma_prep().
>>>
>>> I believe that the problem here is that we are starting the geni
>>> command before we run geni_se_rx_dma_prep().  If a transfer makes it
>>> far enough before we do that then we get into the state I have
>>> observed.  Let's change the order, which seems to work fine.
>>>
>>> Although problems were seen on the RX path, code inspection suggests
>>> that the TX should be changed too.  Change it as well.
>>>
>>> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
>> Applied to for-current, thanks!
> Glad we got this sorted. I just wondered that Alok wasn't part of the
> discussion. Is he still interested in maintaining the driver? Also
> because there is an unprocessed patch left for this driver:
>
> http://patchwork.ozlabs.org/project/linux-i2c/patch/20191103212204.13606-1-colin.king@canonical.com/

Alok has moved out of GENI team, he no longer supports GENI I2C drivers.

I have posted a patch to update maintainers list. Patch: 
https://patchwork.kernel.org/patch/11686541/ [MAINTAINERS: Update Geni 
I2C maintainers list]

Also, Girish Mahadevan, Sagar Dharia and Karthikeyan Ramasubramanian  no 
longer supports GENI drivers.

Regards,

Akash

>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

