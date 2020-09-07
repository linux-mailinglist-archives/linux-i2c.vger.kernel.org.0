Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E92125FAE8
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 15:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbgIGMvh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 08:51:37 -0400
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:59036
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729339AbgIGMvX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 08:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599483067;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=ui1fKpiCptH0S6+EMGetZQ1ytRLWPuhfc4/2yA0rrYU=;
        b=dqIBHsA1fMmANHggaNieBuPOabNMb5Vd90KOYGbyLIEG860dLSt03Im9Dba7s834
        qP4SaKB0dw8Aoj5vpwr5RP1+9HkbstPYiXsGJFBuHf5ZnEZBEu0+sfDF49d1uqZJNgg
        pOQ1T2zobv3KVhPkmZaGpYzxL08gkBqLPRIPRc7I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599483067;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=ui1fKpiCptH0S6+EMGetZQ1ytRLWPuhfc4/2yA0rrYU=;
        b=XlrHe4x7RwAo0o2Dk8TJCfkWKSexEGx/MZpL8yFcyYK7mk4jwi/o4B1LOYy9u+IY
        iHoxX3a4DEPRSJsyIZyYgtWbof/jTqoBoaaNCzz8+CYJ6mi+gA4GT0kik/sW0iw2eQ6
        SY6pNJCGPWVXZVFnnCCPNcIKbIStbYVuDK5vap60=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 7 Sep 2020 12:51:07 +0000
From:   rojay@codeaurora.org
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     wsa@kernel.org, swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH V2 1/2] i2c: i2c-qcom-geni: Store DMA mapping data in
 geni_i2c_dev struct
In-Reply-To: <c09a6bb3-6a7d-bcf8-42ad-cc8dc971c705@codeaurora.org>
References: <20200820103522.26242-1-rojay@codeaurora.org>
 <20200820103522.26242-2-rojay@codeaurora.org>
 <c09a6bb3-6a7d-bcf8-42ad-cc8dc971c705@codeaurora.org>
Message-ID: <01010174689ebbd5-8447b255-ce45-49e0-a6ef-ee35e183953d-000000@us-west-2.amazonses.com>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.07-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-08-26 17:25, Akash Asthana wrote:
> Hi Roja,
> 
> On 8/20/2020 4:05 PM, Roja Rani Yarubandi wrote:
>> Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
>> data scope. For example during shutdown callback to unmap DMA mapping,
>> this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
>> and geni_se_rx_dma_unprep functions.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
>> Changes in V2:
>>   - As per Stephen's comments, changed commit text, fixed minor 
>> nitpicks.
>> 
>>   drivers/i2c/busses/i2c-qcom-geni.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>> 
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 7f130829bf01..1fda5c7c2cfc 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -86,6 +86,9 @@ struct geni_i2c_dev {
>>   	u32 clk_freq_out;
>>   	const struct geni_i2c_clk_fld *clk_fld;
>>   	int suspended;
>> +	dma_addr_t tx_dma;
>> +	dma_addr_t rx_dma;
>> +	size_t xfer_len;
>>   };
>>     struct geni_i2c_err_log {
>> @@ -358,6 +361,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>   	struct geni_se *se = &gi2c->se;
>>   	size_t len = msg->len;
>>   +	gi2c->xfer_len = msg->len;
> 
> nit: gi2c->xfer = len, for tx_one_msg as well.
> 
> Regards,
> 
> Akash
> 

Okay

>>   	if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>>   @@ -384,6 +388,7 @@ static int geni_i2c_rx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	if (dma_buf) {
>>   		if (gi2c->err)
>>   			geni_i2c_rx_fsm_rst(gi2c);
>> +		gi2c->rx_dma = rx_dma;
>>   		geni_se_rx_dma_unprep(se, rx_dma, len);
>>   		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>>   	}
>> @@ -400,6 +405,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev 
>> *gi2c, struct i2c_msg *msg,
>>   	struct geni_se *se = &gi2c->se;
>>   	size_t len = msg->len;
>>   +	gi2c->xfer_len = msg->len;
>>   	if (!of_machine_is_compatible("lenovo,yoga-c630"))
>>   		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>>   @@ -429,6 +435,7 @@ static int geni_i2c_tx_one_msg(struct 
>> geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	if (dma_buf) {
>>   		if (gi2c->err)
>>   			geni_i2c_tx_fsm_rst(gi2c);
>> +		gi2c->tx_dma = tx_dma;
>>   		geni_se_tx_dma_unprep(se, tx_dma, len);
>>   		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>>   	}
