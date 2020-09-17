Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AF026DB48
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 14:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgIQMNi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 08:13:38 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:60312 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726773AbgIQMN1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 08:13:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600344792; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4UtZeQmJZCTmN33hwmN7PDkDrzAhWXay1mgYEYiQhVU=;
 b=kVVXpVvB7sNPFhDLMALRfCmRnGaVR1VvEW/7zKyOS5pszlmIvrMVaxLaMGNgK12PAfoIddO3
 nMcsuogcPn0dgmFx+dINrXD9+Ui/OMZ9VGqF2iX9myUNcDto23tZxAK4sl3OQJG4ivOB5hw4
 GNNpNDNw6uXtWO+jxQ45xP13pyQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f635093c4180d293b3feab7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 12:03:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8DA0DC433C8; Thu, 17 Sep 2020 12:03:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 79557C433CA;
        Thu, 17 Sep 2020 12:03:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 17:33:30 +0530
From:   rojay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [PATCH V3] i2c: i2c-qcom-geni: Add shutdown callback for i2c
In-Reply-To: <159959341894.454335.3250696075143737399@swboyd.mtv.corp.google.com>
References: <20200907130731.2607-1-rojay@codeaurora.org>
 <159959341894.454335.3250696075143737399@swboyd.mtv.corp.google.com>
Message-ID: <fdd2919bc0705b4bd54b8be92fbc9fe5@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stephen,

On 2020-09-09 01:00, Stephen Boyd wrote:
> Why is dri-devel on here? And linaro-mm-sig?
> 

Ok, I will remove these lists.

> Quoting Roja Rani Yarubandi (2020-09-07 06:07:31)
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index dead5db3315a..b3609760909f 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>  struct geni_i2c_err_log {
>> @@ -384,7 +387,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>         if (dma_buf) {
>>                 if (gi2c->err)
>>                         geni_i2c_rx_fsm_rst(gi2c);
>> -               geni_se_rx_dma_unprep(se, rx_dma, len);
>> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, len);
>> +               gi2c->rx_dma = (dma_addr_t)NULL;
>>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>>         }
>> 
>> @@ -394,12 +398,12 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>                                 u32 m_param)
>>  {
>> -       dma_addr_t tx_dma;
>>         unsigned long time_left;
>>         void *dma_buf = NULL;
>>         struct geni_se *se = &gi2c->se;
>>         size_t len = msg->len;
>> 
>> +       gi2c->xfer_len = len;
>>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>                 dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>> 
>> @@ -410,7 +414,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>> 
>>         writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
>> 
>> -       if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) 
>> {
>> +       if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, 
>> &gi2c->tx_dma)) {
>>                 geni_se_select_mode(se, GENI_SE_FIFO);
>>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>>                 dma_buf = NULL;
>> @@ -429,7 +433,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>         if (dma_buf) {
>>                 if (gi2c->err)
>>                         geni_i2c_tx_fsm_rst(gi2c);
>> -               geni_se_tx_dma_unprep(se, tx_dma, len);
>> +               geni_se_tx_dma_unprep(se, gi2c->tx_dma, len);
>> +               gi2c->tx_dma = (dma_addr_t)NULL;
>>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>>         }
>> 
>> @@ -479,6 +484,51 @@ static int geni_i2c_xfer(struct i2c_adapter 
>> *adap,
>>         return ret;
>>  }
>> 
>> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
>> +{
>> +       int ret;
>> +       u32 dma;
>> +       u32 val;
>> +       u32 geni_status;
>> +       struct geni_se *se = &gi2c->se;
>> +
>> +       ret = pm_runtime_get_sync(gi2c->se.dev);
>> +       if (ret < 0) {
>> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", 
>> ret);
> 
> Is this print really necessary? Doesn't PM core already print this sort
> of information?
> 

PM core will not print any such information.
Here we wanted to know our driver's pm runtime resume is successful.

>> +               return;
>> +       }
>> +
>> +       geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
>> +       if (geni_status & M_GENI_CMD_ACTIVE) {
> 
> Please try to de-indent all this.
> 

Okay.

> 	if (!(geni_status & M_GENI_CMD_ACTIVE))
> 		goto out;
> 
>> +               geni_i2c_abort_xfer(gi2c);
>> +               dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
>> +               if (dma) {
> 
> 	if (!dma)
> 		goto out;
> 
>> +                       val = readl_relaxed(gi2c->se.base + 
>> SE_DMA_DEBUG_REG0);
>> +                       if (val & DMA_TX_ACTIVE) {
>> +                               gi2c->cur_wr = 0;
>> +                               if (gi2c->err)
>> +                                       geni_i2c_tx_fsm_rst(gi2c);
>> +                               if (gi2c->tx_dma) {
>> +                                       geni_se_tx_dma_unprep(se,
>> +                                                gi2c->tx_dma, 
>> gi2c->xfer_len);
>> +                                       gi2c->tx_dma = 
>> (dma_addr_t)NULL;
> 
> Almost nobody does this. In fact, grep shows me one hit in the kernel.
> If nobody else is doing it something is probably wrong. When would dma
> mode be active and tx_dma not be set to something that should be
> stopped? If it really is necessary I suppose we should assign this to
> DMA_MAPPING_ERROR instead of casting NULL. Then the check above for
> tx_dma being valid can be dropped because geni_se_tx_dma_unprep()
> already checks for a valid mapping before doing anything. But really, 
> we
> should probably be tracking the dma buffer mapped to the CPU as well as
> the dma address that was used for the mapping. Not storing both is a
> problem, see below.
> 

You are correct, setting gi2c->tx_dma to NULL and check for tx_dma is
not required. Will correct this.

>> +                               }
>> +                       } else if (val & DMA_RX_ACTIVE) {
>> +                               gi2c->cur_rd = 0;
>> +                               if (gi2c->err)
>> +                                       geni_i2c_rx_fsm_rst(gi2c);
>> +                               if (gi2c->rx_dma) {
>> +                                       geni_se_rx_dma_unprep(se,
>> +                                               gi2c->rx_dma, 
>> gi2c->xfer_len);
> 
> Looking closely it seems that the geni dma wrappers shouldn't even be
> checking for an iova being non-zero. Instead they should make sure that
> it just isn't invalid with !dma_mapping_error().
> 

Yes. I will remove iova check in geni_se_rx_dma_unprep() function(also 
in tx_dma_unprep)

>> +                                       gi2c->rx_dma = 
>> (dma_addr_t)NULL;
> 
> If we're stopping some dma transaction doesn't that mean the
> 
>                  i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
> 
> code needs to run also? I fail to see where we free the buffer that has
> been mapped for DMA.
> 

Yes, this is required. I will do this cleanup.

>> +                               }
>> +                       }
>> +               }
>> +       }
>> +
> 
> out:
> 
>> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
>> +}
>> +
