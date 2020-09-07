Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79FA25FAC8
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 14:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbgIGMxu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 08:53:50 -0400
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:39304
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729377AbgIGMxa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 08:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599483207;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=lH7mqjfgItPUsDA2PLbOekcGn95vJGTAWrS7CKJEon8=;
        b=YiWMvTTwdlLPWELUgb/m/kWT6jdFSL31rgsdF8oNfkGti7I23Lwzq8Rm37e0MYVn
        mU6VR+U1d+qLttty9R8YIGpaaQs3I6vA/8HpR7ZsIHl5NgCrr7bFDzJ1N0zgAWp9ikJ
        E8DfhQZX1W4+11zkhuo5Y5RRsRPToWChiEf76jL8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599483207;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=lH7mqjfgItPUsDA2PLbOekcGn95vJGTAWrS7CKJEon8=;
        b=bYyZJ8B/H5Nl3Fa9ZdpX/jfcbY9k53UYkDTMFqoedzxNbxB+wvA1mSQearXltF+k
        jf86FgANAIf5Psd80WO+ysVlspKfz8Xbus54ATcPUIE5KkvkqtUQ9JRsy4hRKj8l9BE
        gQ5ogXbZBLRjABqgQDI9ytb3INkrv7fJosWTCS5Y=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 7 Sep 2020 12:53:27 +0000
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
Subject: Re: [PATCH V2 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
In-Reply-To: <ba1935d2-9fec-cf82-ed19-bc005befcb40@codeaurora.org>
References: <20200820103522.26242-1-rojay@codeaurora.org>
 <20200820103522.26242-3-rojay@codeaurora.org>
 <ba1935d2-9fec-cf82-ed19-bc005befcb40@codeaurora.org>
Message-ID: <0101017468a0de0f-8a49e28e-dcf5-41a9-bf06-296ac6edea26-000000@us-west-2.amazonses.com>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.07-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2020-08-26 17:26, Akash Asthana wrote:
> Hi Roja,
> 
> On 8/20/2020 4:05 PM, Roja Rani Yarubandi wrote:
>> If the hardware is still accessing memory after SMMU translation
>> is disabled (as part of smmu shutdown callback), then the
>> IOVAs (I/O virtual address) which it was using will go on the bus
>> as the physical addresses which will result in unknown crashes
>> like NoC/interconnect errors.
>> 
>> So, implement shutdown callback to i2c driver to unmap DMA mappings
>> during system "reboot" or "shutdown".
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
>> Changes in V2:
>>   - As per Stephen's comments added seperate function for stop 
>> transfer,
>>     fixed minor nitpicks.
>> 
>>   drivers/i2c/busses/i2c-qcom-geni.c | 43 
>> ++++++++++++++++++++++++++++++
>>   include/linux/qcom-geni-se.h       |  5 ++++
>>   2 files changed, 48 insertions(+)
>> 
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 1fda5c7c2cfc..d07f2f33bb75 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -486,6 +486,28 @@ static int geni_i2c_xfer(struct i2c_adapter 
>> *adap,
>>   	return ret;
>>   }
>>   +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
>> +{
>> +	u32 val;
>> +	struct geni_se *se = &gi2c->se;
>> +
>> +	val = readl_relaxed(gi2c->se.base + SE_DMA_DEBUG_REG0);
>> +	if (val & DMA_TX_ACTIVE) {
>> +		geni_i2c_abort_xfer(gi2c);
>> +		gi2c->cur_wr = 0;
>> +		if (gi2c->err)
>> +			geni_i2c_tx_fsm_rst(gi2c);
>> +		geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfer_len);
>> +	}
> should be 'else if', because TX and RX can't happen parallel.
>> +	if (val & DMA_RX_ACTIVE) {
>> +		geni_i2c_abort_xfer(gi2c);
>> +		gi2c->cur_rd = 0;
>> +		if (gi2c->err)
>> +			geni_i2c_rx_fsm_rst(gi2c);
>> +		geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
>> +	}
>> +}
>> +
>>   static u32 geni_i2c_func(struct i2c_adapter *adap)
>>   {
>>   	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & 
>> ~I2C_FUNC_SMBUS_QUICK);
>> @@ -617,6 +639,26 @@ static int geni_i2c_remove(struct platform_device 
>> *pdev)
>>   	return 0;
>>   }
>>   +static void geni_i2c_shutdown(struct platform_device *pdev)
>> +{
>> +	int ret;
>> +	u32 dma;
>> +	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>> +	struct geni_se *se = &gi2c->se;
>> +
>> +	ret = pm_runtime_get_sync(gi2c->se.dev);
>> +	if (ret < 0) {
>> +		dev_err(gi2c->se.dev, "Failed to resume device: %d\n", ret);
>> +		return;
>> +	}
>> +
>> +	dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
> 
> Wrt to current issue context it may be suffice to stop just DMA mode
> transfers but why not stop all mode of active transfer during shutdown
> in a generic way.
> 
> Regards,
> 
> Akash
> 

Okay, I will include FIFO transfer case also in stop_xfer

>> +	if (dma)
>> +		geni_i2c_stop_xfer(gi2c);
>> +
>> +	pm_runtime_put_sync_suspend(gi2c->se.dev);
>> +}
>> +
>>   static int __maybe_unused geni_i2c_runtime_suspend(struct device 
>> *dev)
>>   {
>>   	int ret;
>> @@ -677,6 +719,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
>>   static struct platform_driver geni_i2c_driver = {
>>   	.probe  = geni_i2c_probe,
>>   	.remove = geni_i2c_remove,
>> +	.shutdown = geni_i2c_shutdown,
>>   	.driver = {
>>   		.name = "geni_i2c",
>>   		.pm = &geni_i2c_pm_ops,
>> diff --git a/include/linux/qcom-geni-se.h 
>> b/include/linux/qcom-geni-se.h
>> index dd464943f717..c3c016496d98 100644
>> --- a/include/linux/qcom-geni-se.h
>> +++ b/include/linux/qcom-geni-se.h
>> @@ -77,6 +77,7 @@ struct geni_se {
>>   #define SE_DMA_RX_FSM_RST		0xd58
>>   #define SE_HW_PARAM_0			0xe24
>>   #define SE_HW_PARAM_1			0xe28
>> +#define SE_DMA_DEBUG_REG0		0xe40
>>     /* GENI_FORCE_DEFAULT_REG fields */
>>   #define FORCE_DEFAULT	BIT(0)
>> @@ -207,6 +208,10 @@ struct geni_se {
>>   #define RX_GENI_CANCEL_IRQ		BIT(11)
>>   #define RX_GENI_GP_IRQ_EXT		GENMASK(13, 12)
>>   +/* SE_DMA_DEBUG_REG0 Register fields */
>> +#define DMA_TX_ACTIVE			BIT(0)
>> +#define DMA_RX_ACTIVE			BIT(1)
>> +
>>   /* SE_HW_PARAM_0 fields */
>>   #define TX_FIFO_WIDTH_MSK		GENMASK(29, 24)
>>   #define TX_FIFO_WIDTH_SHFT		24
