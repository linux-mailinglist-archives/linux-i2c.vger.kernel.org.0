Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 408F12DFBE4
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Dec 2020 13:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgLUMfH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Dec 2020 07:35:07 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:45434 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbgLUMfH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Dec 2020 07:35:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608554088; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=tDvl9tDLfGJ7JN2lYUJAQJ9Ss9Zsrq4uuuiex7ki2+Q=;
 b=WiAc5hhdA+tAw6IlO1Zgv5rOK8WqyKXOv1+uSzgQvaW720IgB2Sma/8r56hoMfQUn7Zq9lcf
 m3agyUIyGhH3ESRxdH9C5xicqb7IsFunporaES/gKumiG6zDncmV/3l5H8cj2VsAipzHB6OI
 XRhA2qwUxBHg/Tw8G6MdG4mPCd8=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fe09646cfe5dd67dbcda5b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 12:34:14
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8FFD3C433ED; Mon, 21 Dec 2020 12:34:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4CAD8C433C6;
        Mon, 21 Dec 2020 12:34:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Dec 2020 18:04:13 +0530
From:   rojay@codeaurora.org
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     wsa@kernel.org, swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        vkaur@codeaurora.org, pyarlaga@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Subject: Re: [RESEND PATCH V6 1/2] i2c: i2c-qcom-geni: Store DMA mapping data
 in geni_i2c_dev struct
In-Reply-To: <049c28e9-1211-377f-941d-ba169645dd24@codeaurora.org>
References: <20201203103156.32595-1-rojay@codeaurora.org>
 <20201203103156.32595-2-rojay@codeaurora.org>
 <049c28e9-1211-377f-941d-ba169645dd24@codeaurora.org>
Message-ID: <585a9b7ab44e3a99eb803536af6334e5@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-12-09 18:29, Akash Asthana wrote:
> Hi Roja,
> 
> On 12/3/2020 4:01 PM, Roja Rani Yarubandi wrote:
>> Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
>> data scope. For example during shutdown callback to unmap DMA mapping,
>> this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
>> and geni_se_rx_dma_unprep functions.
>> 
>> Add two helper functions geni_i2c_rx_msg_cleanup and
>> geni_i2c_tx_msg_cleanup to unwrap the things after rx/tx FIFO/DMA
>> transfers, so that the same can be used in geni_i2c_stop_xfer()
>> function during shutdown callback.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
>> Changes in V5:
>>   - As per Stephen's comments separated this patch from shutdown
>>     callback patch, gi2c->cur = NULL is not removed from
>>     geni_i2c_abort_xfer(), and made a copy of gi2c->cur and passed
>>     to cleanup functions.
>> 
>> Changes in V6:
>>   - Added spin_lock/unlock in geni_i2c_rx_msg_cleanup() and
>>     geni_i2c_tx_msg_cleanup() functions.
>> 
>>   drivers/i2c/busses/i2c-qcom-geni.c | 69 
>> +++++++++++++++++++++++-------
>>   1 file changed, 53 insertions(+), 16 deletions(-)
>> 
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index dce75b85253c..bfbc80f65006 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -86,6 +86,9 @@ struct geni_i2c_dev {
>>   	u32 clk_freq_out;
>>   	const struct geni_i2c_clk_fld *clk_fld;
>>   	int suspended;
>> +	void *dma_buf;
>> +	size_t xfer_len;
>> +	dma_addr_t dma_addr;
>>   };
>>     struct geni_i2c_err_log {
>> @@ -348,14 +351,49 @@ static void geni_i2c_tx_fsm_rst(struct 
>> geni_i2c_dev *gi2c)
>>   		dev_err(gi2c->se.dev, "Timeout resetting TX_FSM\n");
>>   }
>>   +static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c,
>> +				     struct i2c_msg *cur)
>> +{
>> +	struct geni_se *se = &gi2c->se;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&gi2c->lock, flags);
>> +	gi2c->cur_rd = 0;
>> +	if (gi2c->dma_buf) {
>> +		if (gi2c->err)
>> +			geni_i2c_rx_fsm_rst(gi2c);
> 
> Which race we are trying to avoid here by holding spinlock?
> 

Thought that race might occur with "cur" here.

> We cannot call any sleeping API by holding spinlock,
> geni_i2c_rx_fsm_rst calls *wait-for-completion*, which is a sleeping
> call.
> 

Fixed this.

>> +		geni_se_rx_dma_unprep(se, gi2c->dma_addr, gi2c->xfer_len);
>> +		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
>> +	}
>> +	spin_unlock_irqrestore(&gi2c->lock, flags);
>> +}
>> +
>> +static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
>> +				     struct i2c_msg *cur)
>> +{
>> +	struct geni_se *se = &gi2c->se;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&gi2c->lock, flags);
>> +	gi2c->cur_wr = 0;
>> +	if (gi2c->dma_buf) {
>> +		if (gi2c->err)
>> +			geni_i2c_tx_fsm_rst(gi2c);
> 
> Same here
> 
> Regards,
> 
> Akash
> 
>> +		geni_se_tx_dma_unprep(se, gi2c->dma_addr, gi2c->xfer_len);
>> +		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
>> +	}
>> +	spin_unlock_irqrestore(&gi2c->lock, flags);
>> +}
>> +
>>   static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>   				u32 m_param)
>>   {
>> -	dma_addr_t rx_dma;
>> +	dma_addr_t rx_dma = 0;
>>   	unsigned long time_left;
>>   	void *dma_buf = NULL;
>>   	struct geni_se *se = &gi2c->se;
>>   	size_t len = msg->len;
>> +	struct i2c_msg *cur;
>>     	if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>> @@ -372,19 +410,18 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   		geni_se_select_mode(se, GENI_SE_FIFO);
>>   		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>>   		dma_buf = NULL;
>> +	} else {
>> +		gi2c->xfer_len = len;
>> +		gi2c->dma_addr = rx_dma;
>> +		gi2c->dma_buf = dma_buf;
>>   	}
>>   +	cur = gi2c->cur;
>>   	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>>   	if (!time_left)
>>   		geni_i2c_abort_xfer(gi2c);
>>   -	gi2c->cur_rd = 0;
>> -	if (dma_buf) {
>> -		if (gi2c->err)
>> -			geni_i2c_rx_fsm_rst(gi2c);
>> -		geni_se_rx_dma_unprep(se, rx_dma, len);
>> -		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>> -	}
>> +	geni_i2c_rx_msg_cleanup(gi2c, cur);
>>     	return gi2c->err;
>>   }
>> @@ -392,11 +429,12 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct 
>> i2c_msg *msg,
>>   				u32 m_param)
>>   {
>> -	dma_addr_t tx_dma;
>> +	dma_addr_t tx_dma = 0;
>>   	unsigned long time_left;
>>   	void *dma_buf = NULL;
>>   	struct geni_se *se = &gi2c->se;
>>   	size_t len = msg->len;
>> +	struct i2c_msg *cur;
>>     	if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>> @@ -413,22 +451,21 @@ static int geni_i2c_tx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   		geni_se_select_mode(se, GENI_SE_FIFO);
>>   		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>>   		dma_buf = NULL;
>> +	} else {
>> +		gi2c->xfer_len = len;
>> +		gi2c->dma_addr = tx_dma;
>> +		gi2c->dma_buf = dma_buf;
>>   	}
>>     	if (!dma_buf) /* Get FIFO IRQ */
>>   		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
>>   +	cur = gi2c->cur;
>>   	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
>>   	if (!time_left)
>>   		geni_i2c_abort_xfer(gi2c);
>>   -	gi2c->cur_wr = 0;
>> -	if (dma_buf) {
>> -		if (gi2c->err)
>> -			geni_i2c_tx_fsm_rst(gi2c);
>> -		geni_se_tx_dma_unprep(se, tx_dma, len);
>> -		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>> -	}
>> +	geni_i2c_tx_msg_cleanup(gi2c, cur);
>>     	return gi2c->err;
>>   }
