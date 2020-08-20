Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C46724B5F9
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Aug 2020 12:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730691AbgHTKao (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 06:30:44 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:22603 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727770AbgHTKaV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Aug 2020 06:30:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597919416; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=km9nW3C7eCummePhEdybTk2b7eYw/T0nXcPSw02yQc8=;
 b=VsLkTNUNIyIABlv89q31kUnu2zACW8AJfsI/Y74WFOXIXQrOABzIKDTJe23eeVXN3CO9u3+W
 vG6Y0UHmr+gKU9FwleWZuwd6b8xIf9czw3FK5tieSYEfL/TumNEHuK8Qf3HjwiiQ9JbBDwB6
 vnE28YaVWkihawINGG0Jbu8ocD0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f3e50a5f37da9fb0ef5cceb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 Aug 2020 10:29:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 427F8C433A0; Thu, 20 Aug 2020 10:29:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 099F2C433CA;
        Thu, 20 Aug 2020 10:29:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Aug 2020 15:59:54 +0530
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
Subject: Re: [PATCH 1/2] i2c: i2c-qcom-geni: Add tx_dma, rx_dma and xfer_len
 to geni_i2c_dev struct
In-Reply-To: <159780835380.334488.10270114810481187992@swboyd.mtv.corp.google.com>
References: <20200814095540.32115-1-rojay@codeaurora.org>
 <20200814095540.32115-2-rojay@codeaurora.org>
 <159780835380.334488.10270114810481187992@swboyd.mtv.corp.google.com>
Message-ID: <872641764c4a03b92c8f2dafe6f2764a@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Stephen,

Thanks for reviewing the patches.

On 2020-08-19 09:09, Stephen Boyd wrote:
> Quoting Roja Rani Yarubandi (2020-08-14 02:55:39)
>> Adding tx_dma, rx_dma and xfer length in geni_i2c_dev struct to
>> store DMA mapping data to enhance its scope. For example during
>> shutdown callback to unmap DMA mapping, these new struct members
>> can be used as part of geni_se_tx_dma_unprep and
>> geni_se_rx_dma_unprep calls.
> 
> Please read about how to write commit text from kernel docs[1]. Hint,
> use imperative mood.
> 

Ok, will update the commit text.

>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
>>  drivers/i2c/busses/i2c-qcom-geni.c | 23 +++++++++++++----------
>>  1 file changed, 13 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 7f130829bf01..53ca41f76080 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -86,6 +86,9 @@ struct geni_i2c_dev {
>>         u32 clk_freq_out;
>>         const struct geni_i2c_clk_fld *clk_fld;
>>         int suspended;
>> +       dma_addr_t tx_dma;
>> +       dma_addr_t rx_dma;
>> +       u32 xfer_len;
> 
> Why not size_t?
> 

Will change it to size_t.

>>  };
>> 
>>  struct geni_i2c_err_log {
>> @@ -352,12 +355,11 @@ static void geni_i2c_tx_fsm_rst(struct 
>> geni_i2c_dev *gi2c)
>>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>                                 u32 m_param)
>>  {
>> -       dma_addr_t rx_dma;
>>         unsigned long time_left;
>>         void *dma_buf = NULL;
>>         struct geni_se *se = &gi2c->se;
>> -       size_t len = msg->len;
>> 
>> +       gi2c->xfer_len = msg->len;
> 
> I'd prefer to keep the local variable and then have
> 
> 	len = gi2c->xfer_len = msg->len;
> 

Ok, will keep the local variable.

>>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>                 dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>> 
>> @@ -366,9 +368,10 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>         else
>>                 geni_se_select_mode(se, GENI_SE_FIFO);
>> 
>> -       writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
>> +       writel_relaxed(gi2c->xfer_len, se->base + 
>> SE_I2C_RX_TRANS_LEN);
> 
> So that all this doesn't have to change.
> 
>> 
>> -       if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) 
>> {
>> +       if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, 
>> gi2c->xfer_len,
>> +                                          &gi2c->rx_dma)) {
>>                 geni_se_select_mode(se, GENI_SE_FIFO);
>>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>>                 dma_buf = NULL;
>> @@ -384,7 +387,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>         if (dma_buf) {
>>                 if (gi2c->err)
>>                         geni_i2c_rx_fsm_rst(gi2c);
>> -               geni_se_rx_dma_unprep(se, rx_dma, len);
>> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, 
>> gi2c->xfer_len);
>>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>>         }
>> 
>> @@ -394,12 +397,11 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>                                 u32 m_param)
>>  {
>> -       dma_addr_t tx_dma;
>>         unsigned long time_left;
>>         void *dma_buf = NULL;
>>         struct geni_se *se = &gi2c->se;
>> -       size_t len = msg->len;
>> 
>> +       gi2c->xfer_len = msg->len;
> 
> Same comment.
> 

Ok.

>>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>                 dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>> 
> 
> [1]
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Thanks,
Roja
