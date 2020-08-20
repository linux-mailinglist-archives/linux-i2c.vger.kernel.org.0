Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492B624B5FE
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 12:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbgHTKa7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 06:30:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44784 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730146AbgHTKay (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Aug 2020 06:30:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597919453; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ql6arR92ZpN3KaOepeFprHVy/tHtOfo4QUNFyLkpyYg=;
 b=Fmz+L5JihgDhg2yUua5jPETt4X/w5NZ3KqLZqIWEIq0yjmmxUGKHEle/gJa+hJ+uNaODOMso
 u33kxvO+wFekGTR+QR++CBunQUADSsBn1GieOXR4Zs3OYXiLd8sAZtGa7dOuZt7o6RjaZxtU
 8gsNIA33LxJOvxWt6BKLP1wgcp0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f3e50ca949572eafbcdf088 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 Aug 2020 10:30:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF527C43391; Thu, 20 Aug 2020 10:30:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D61CC433C6;
        Thu, 20 Aug 2020 10:30:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Aug 2020 16:00:33 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
In-Reply-To: <159780863669.334488.18038785498966010175@swboyd.mtv.corp.google.com>
References: <20200814095540.32115-1-rojay@codeaurora.org>
 <20200814095540.32115-3-rojay@codeaurora.org>
 <159780863669.334488.18038785498966010175@swboyd.mtv.corp.google.com>
Message-ID: <d4c78c0cfde0f9276c524124ca18893f@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-08-19 09:13, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2020-08-14 02:55:40)
>> If the hardware is still accessing memory after SMMU translation
>> is disabled(as part of smmu shutdown callback), then the
> 
> Put a space before (
> 

Ok.

>> IOVAs(I/O virtual address) which it was using will go on the bus
> 
> Put a space before (
> 
>> as the physical addresses which will result in unknown crashes
>> like NoC/interconnect errors.
>> 
>> So, adding shutdown callback to i2c driver to unmap DMA mappings
>> during system "reboot" or "shutdown".
>> 
> 
> Deserves a Fixes: tag if it's fixing a problem, which it looks like it
> is.
> 

It is not fixing a problem. We are anticipating a problem and 
implementing
Shutdown callback.

>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
>>  drivers/i2c/busses/i2c-qcom-geni.c | 36 
>> ++++++++++++++++++++++++++++++
>>  include/linux/qcom-geni-se.h       |  5 +++++
> 
> I'd prefer this is squashed with the previous patch. The first patch
> doesn't really stand on its own anyway.
> 

Sorry, I did not understand.
First patch can be compiled independently.

>>  2 files changed, 41 insertions(+)
>> 
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 53ca41f76080..749c225f95c4 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -613,6 +613,41 @@ static int geni_i2c_remove(struct platform_device 
>> *pdev)
>>         return 0;
>>  }
>> 
>> +static void geni_i2c_shutdown(struct platform_device *pdev)
>> +{
>> +       int ret;
>> +       struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>> +       struct geni_se *se = &gi2c->se;
>> +       u32 dma;
>> +       u32 dma_dbg_reg;
> 
> Typically this is just called 'val'.
> 

Ok.

>> +
>> +       ret = pm_runtime_get_sync(gi2c->se.dev);
>> +       if (ret < 0) {
>> +               dev_err(gi2c->se.dev, "Failed to resume device:%d\n", 
>> ret);
> 
> Maybe just write: "Failed to resume device\n"? Not sure anyone cares
> what the error code is. And if they did, it would be connected to the
> colon so it will be hard to read. Add a space after colon if you want 
> to
> keep the return value please.
> 

Ok, will add space after colon.

>> +               return;
>> +       }
>> +
>> +       dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
>> +       if (dma) {
>> +               dma_dbg_reg = readl_relaxed(gi2c->se.base + 
>> SE_DMA_DEBUG_REG0);
>> +               if (dma_dbg_reg & DMA_TX_ACTIVE) {
>> +                       geni_i2c_abort_xfer(gi2c);
>> +                       gi2c->cur_wr = 0;
>> +                       if (gi2c->err)
>> +                               geni_i2c_tx_fsm_rst(gi2c);
>> +                       geni_se_tx_dma_unprep(se, gi2c->tx_dma, 
>> gi2c->xfer_len);
>> +               }
>> +               if (dma_dbg_reg & DMA_RX_ACTIVE) {
>> +                       geni_i2c_abort_xfer(gi2c);
>> +                       gi2c->cur_rd = 0;
>> +                       if (gi2c->err)
>> +                               geni_i2c_rx_fsm_rst(gi2c);
>> +                       geni_se_rx_dma_unprep(se, gi2c->rx_dma, 
>> gi2c->xfer_len);
>> +               }
> 
> Can this be a function? It sort of seems like we should be doing the
> same sort of stuff if we're canceling a DMA transaction in flight.
> 

Ok. Will make the changes.

>> +       }
>> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
>> +}
>> +
>>  static int __maybe_unused geni_i2c_runtime_suspend(struct device 
>> *dev)
>>  {
>>         int ret;
>> diff --git a/include/linux/qcom-geni-se.h 
>> b/include/linux/qcom-geni-se.h
>> index dd464943f717..acad69be747d 100644
>> --- a/include/linux/qcom-geni-se.h
>> +++ b/include/linux/qcom-geni-se.h
>> @@ -77,6 +77,7 @@ struct geni_se {
>>  #define SE_DMA_RX_FSM_RST              0xd58
>>  #define SE_HW_PARAM_0                  0xe24
>>  #define SE_HW_PARAM_1                  0xe28
>> +#define SE_DMA_DEBUG_REG0              0xe40
>> 
>>  /* GENI_FORCE_DEFAULT_REG fields */
>>  #define FORCE_DEFAULT  BIT(0)
>> @@ -207,6 +208,10 @@ struct geni_se {
>>  #define RX_GENI_CANCEL_IRQ             BIT(11)
>>  #define RX_GENI_GP_IRQ_EXT             GENMASK(13, 12)
>> 
>> +/* DMA DEBUG Register fields */
> 
> Please follow other style, ie. SE_DMA_DEBUG_REG0 fields
> 

Ok.

>> +#define DMA_TX_ACTIVE                  BIT(0)
>> +#define DMA_RX_ACTIVE                  BIT(1)
>> +
>>  /* SE_HW_PARAM_0 fields */
>>  #define TX_FIFO_WIDTH_MSK              GENMASK(29, 24)
>>  #define TX_FIFO_WIDTH_SHFT             24
