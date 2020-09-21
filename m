Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052AC27225D
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgIUL0M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:26:12 -0400
Received: from z5.mailgun.us ([104.130.96.5]:64868 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbgIUL0L (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 07:26:11 -0400
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 07:26:09 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600687569; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PVIsUxy0Uf9L3hCn1GrabY9F83kqfBklo/5mHcDueKE=;
 b=TwkyC8FWCW7Gz0yfuvBkWZO/90dKQs/SWsAEdSX6igebeLTbJViYlo1HKnwUsWPOqKmPYkDr
 cxINjbX3JPePlIz1WgkRh2VMnH84TCdJ+5Sj3DCBF59aNvFjN5qUKJGJuvrUPr4+b2fpzLDd
 3PKieK1PBbk1ScNXQhYx025h5/E=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f688ca14a8a578ddcf1104d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Sep 2020 11:21:05
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 85625C433C8; Mon, 21 Sep 2020 11:21:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA465C433CB;
        Mon, 21 Sep 2020 11:21:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Sep 2020 16:51:04 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        vkaur@codeaurora.org, pyarlaga@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V4] i2c: i2c-qcom-geni: Add shutdown callback for i2c
In-Reply-To: <160037421089.4188128.9425314091585708436@swboyd.mtv.corp.google.com>
References: <20200917122558.23110-1-rojay@codeaurora.org>
 <160037421089.4188128.9425314091585708436@swboyd.mtv.corp.google.com>
Message-ID: <f6cb2d7bc02dab409030ec42bf1d17c9@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stephen,

On 2020-09-18 01:53, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2020-09-17 05:25:58)
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index dead5db3315a..b0d8043c8cb2 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -86,6 +86,10 @@ struct geni_i2c_dev {
>>         u32 clk_freq_out;
>>         const struct geni_i2c_clk_fld *clk_fld;
>>         int suspended;
>> +       void *dma_buf;
>> +       size_t xfer_len;
>> +       dma_addr_t tx_dma;
>> +       dma_addr_t rx_dma;
> 
> Do we need both tx_dma and rx_dma? Seems that we use cur->flags to
> figure out if the transfer is tx or rx so we could have juat dma_buf 
> and
> dma_addr here?
> 

Okay.

>>  };
>> 
>>  struct geni_i2c_err_log {
>> @@ -307,7 +311,6 @@ static void geni_i2c_abort_xfer(struct 
>> geni_i2c_dev *gi2c)
>> 
>>         spin_lock_irqsave(&gi2c->lock, flags);
>>         geni_i2c_err(gi2c, GENI_TIMEOUT);
>> -       gi2c->cur = NULL;
> 
> This looks concerning. We're moving this out from under the spinlock.
> The irq handler in this driver seems to hold the spinlock all the time
> while processing and this function grabs it here to keep cur consistent
> when aborting the transfer due to a timeout. Otherwise it looks like 
> the
> irqhandler can race with this and try to complete the transfer while
> it's being torn down here.
> 
>>         geni_se_abort_m_cmd(&gi2c->se);
>>         spin_unlock_irqrestore(&gi2c->lock, flags);
>>         do {
>> @@ -349,10 +352,62 @@ static void geni_i2c_tx_fsm_rst(struct 
>> geni_i2c_dev *gi2c)
>>                 dev_err(gi2c->se.dev, "Timeout resetting TX_FSM\n");
>>  }
>> 
>> +static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c)
> 
> So maybe pass cur to this function?
> 

Sorry, i did not understand why to pass cur to this function?

>> +{
>> +       struct geni_se *se = &gi2c->se;
>> +
>> +       gi2c->cur_rd = 0;
>> +       if (gi2c->dma_buf) {
>> +               if (gi2c->err)
>> +                       geni_i2c_rx_fsm_rst(gi2c);
>> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, 
>> gi2c->xfer_len);
>> +               i2c_put_dma_safe_msg_buf(gi2c->dma_buf, gi2c->cur, 
>> !gi2c->err);
>> +       }
>> +}
>> +
>> +static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c)
> 
> And this one?
> 
>> +{
>> +       struct geni_se *se = &gi2c->se;
>> +
>> +       gi2c->cur_wr = 0;
>> +       if (gi2c->dma_buf) {
>> +               if (gi2c->err)
>> +                       geni_i2c_tx_fsm_rst(gi2c);
>> +               geni_se_tx_dma_unprep(se, gi2c->tx_dma, 
>> gi2c->xfer_len);
>> +               i2c_put_dma_safe_msg_buf(gi2c->dma_buf, gi2c->cur, 
>> !gi2c->err);
>> +       }
>> +}
>> +
>> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
>> +{
>> +       int ret;
>> +       u32 geni_status;
>> +
>> +       /* Resume device, as runtime suspend can happen anytime during 
>> transfer */
>> +       ret = pm_runtime_get_sync(gi2c->se.dev);
>> +       if (ret < 0) {
>> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", 
>> ret);
>> +               return;
>> +       }
>> +
>> +       geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
> 
> And this probably needs to hold the lock?
> 
>> +       if (!(geni_status & M_GENI_CMD_ACTIVE))
>> +               goto out;
>> +
>> +       geni_i2c_abort_xfer(gi2c);
>> +       if (gi2c->cur->flags & I2C_M_RD)
>> +               geni_i2c_rx_msg_cleanup(gi2c);
>> +       else
>> +               geni_i2c_tx_msg_cleanup(gi2c);
>> +       gi2c->cur = NULL;
> 
> until here?
> 

Okay.

>> +out:
>> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
>> +}
>> +
>>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>                                 u32 m_param)
>>  {
>> -       dma_addr_t rx_dma;
>> +       dma_addr_t rx_dma = 0;
>>         unsigned long time_left;
>>         void *dma_buf = NULL;
>>         struct geni_se *se = &gi2c->se;
>> @@ -372,6 +427,10 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>                 geni_se_select_mode(se, GENI_SE_FIFO);
>>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>>                 dma_buf = NULL;
>> +       } else {
>> +               gi2c->xfer_len = len;
>> +               gi2c->rx_dma = rx_dma;
>> +               gi2c->dma_buf = dma_buf;
>>         }
>> 
>>         geni_se_setup_m_cmd(se, I2C_READ, m_param);
>> @@ -380,13 +439,7 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>         if (!time_left)
>>                 geni_i2c_abort_xfer(gi2c);
>> 
>> -       gi2c->cur_rd = 0;
>> -       if (dma_buf) {
>> -               if (gi2c->err)
>> -                       geni_i2c_rx_fsm_rst(gi2c);
>> -               geni_se_rx_dma_unprep(se, rx_dma, len);
>> -               i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>> -       }
>> +       geni_i2c_rx_msg_cleanup(gi2c);
>> 
>>         return gi2c->err;
>>  }
> 
> It may make sense to extract the cleanup stuff into another patch. Then
> have a patch after that which does the shutdown hook. So three patches
> total.
> 

Okay, I will make separate patches, one for cleanup and another for 
shutdown hook.

>> diff --git a/drivers/soc/qcom/qcom-geni-se.c 
>> b/drivers/soc/qcom/qcom-geni-se.c
>> index d0e4f520cff8..0216b38c1e9a 100644
>> --- a/drivers/soc/qcom/qcom-geni-se.c
>> +++ b/drivers/soc/qcom/qcom-geni-se.c
>> @@ -705,7 +705,7 @@ void geni_se_tx_dma_unprep(struct geni_se *se, 
>> dma_addr_t iova, size_t len)
>>  {
>>         struct geni_wrapper *wrapper = se->wrapper;
>> 
>> -       if (iova && !dma_mapping_error(wrapper->dev, iova))
>> +       if (!dma_mapping_error(wrapper->dev, iova))
>>                 dma_unmap_single(wrapper->dev, iova, len, 
>> DMA_TO_DEVICE);
>>  }
>>  EXPORT_SYMBOL(geni_se_tx_dma_unprep);
>> @@ -722,7 +722,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, 
>> dma_addr_t iova, size_t len)
>>  {
>>         struct geni_wrapper *wrapper = se->wrapper;
>> 
>> -       if (iova && !dma_mapping_error(wrapper->dev, iova))
>> +       if (!dma_mapping_error(wrapper->dev, iova))
>>                 dma_unmap_single(wrapper->dev, iova, len, 
>> DMA_FROM_DEVICE);
>>  }
>>  EXPORT_SYMBOL(geni_se_rx_dma_unprep);
> 
> I'd make this a different patch. Nothing depends on this change, right?

Yes this is independent patch. I will make this as separate patch which 
will be the third one.

Thanks,
Roja
