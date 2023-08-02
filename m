Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89A376CA7C
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 12:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjHBKHy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 06:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbjHBKHx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 06:07:53 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A332695;
        Wed,  2 Aug 2023 03:07:36 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3728PS91017132;
        Wed, 2 Aug 2023 12:07:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=selector1; bh=L4OO3agpRBQvZHdfoJbIi
        iJ6dTyGpxpJu47B+JCymZU=; b=CvkzOvxqQjZ9Cid1sFi+XqDoXizAlWvhVShzB
        szwEDsETHbeAxrFlEHveqUxx2rgG8YIAT+lVpgErtFzuSt0WGBb/iQe3VKvnM+Jg
        9mbIYhkQeF0FGo8HrloNrfkVUDI+t+wu88uWS67A3Vy9t0XAaMXNV0cjAWVX/fU7
        DSAG36AhXz6PW627wB55NftP5X8lvV1tseP+i9v989sPy9iuGHHioah+MtKt8C6Q
        BMjB33e2jp5mBFEVZxA7Nec4AEPuVRmNx6eJN9dsSxm4KEsBY+Wlz2iumtkEjuR+
        WHQ0MN+asN4r9JXMGTlqLZewkzWtO/p/hPwEmqIog47itGQdQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s7kmd8pu4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Aug 2023 12:07:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A584A100084;
        Wed,  2 Aug 2023 12:07:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 962AB23D402;
        Wed,  2 Aug 2023 12:07:10 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 2 Aug
 2023 12:07:10 +0200
Date:   Wed, 2 Aug 2023 12:07:09 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Sean Nyekjaer <sean@geanix.com>
CC:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: stm32f7: Add atomic_xfer method to driver
Message-ID: <20230802100709.GB2156918@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Sean Nyekjaer <sean@geanix.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230718105435.2641207-1-sean@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230718105435.2641207-1-sean@geanix.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_05,2023-08-01_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sean,

sorry for the delay for this review.  Thank you Andi for
the review as well.

Few other comments in addition to what Andi already mentioned.

On Tue, Jul 18, 2023 at 12:54:35PM +0200, Sean Nyekjaer wrote:
> Add an atomic_xfer method to the driver so that it behaves correctly
> when controlling a PMIC that is responsible for device shutdown.
> 
> The atomic_xfer method added is similar to the one from the i2c-mv64xxx
> driver. When running an atomic_xfer a bool flag in the driver data is
> set, the interrupt is not unmasked on transfer start, and the IRQ
> handler is manually invoked while waiting for pending transfers to
> complete.
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> Changes since v1:
>  - Removed dma in atomic
> 
>  drivers/i2c/busses/i2c-stm32f7.c | 111 ++++++++++++++++++++++---------
>  1 file changed, 78 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e897d9101434..d944b8f85d1c 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
>  	u32 dnf_dt;
>  	u32 dnf;
>  	struct stm32f7_i2c_alert *alert;
> +	bool atomic;

I am wondering if this atomic really needs to be within the struct.
It could well be given as last arg of stm32f7_i2c_xfer_core and
stm32f7_i2c_xfer functions.


>  };
>  
>  /*
> @@ -905,38 +906,43 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
>  		cr2 |= STM32F7_I2C_CR2_NBYTES(f7_msg->count);
>  	}
>  
> -	/* Enable NACK, STOP, error and transfer complete interrupts */
> -	cr1 |= STM32F7_I2C_CR1_ERRIE | STM32F7_I2C_CR1_TCIE |
> -		STM32F7_I2C_CR1_STOPIE | STM32F7_I2C_CR1_NACKIE;
> -
> -	/* Clear DMA req and TX/RX interrupt */
> -	cr1 &= ~(STM32F7_I2C_CR1_RXIE | STM32F7_I2C_CR1_TXIE |
> -			STM32F7_I2C_CR1_RXDMAEN | STM32F7_I2C_CR1_TXDMAEN);
> -
> -	/* Configure DMA or enable RX/TX interrupt */
> -	i2c_dev->use_dma = false;
> -	if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN) {
> -		ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> -					      msg->flags & I2C_M_RD,
> -					      f7_msg->count, f7_msg->buf,
> -					      stm32f7_i2c_dma_callback,
> -					      i2c_dev);
> -		if (!ret)
> -			i2c_dev->use_dma = true;
> -		else
> -			dev_warn(i2c_dev->dev, "can't use DMA\n");
> -	}
> +	if (!i2c_dev->atomic) {
> +		/* Enable NACK, STOP, error and transfer complete interrupts */
> +		cr1 |= STM32F7_I2C_CR1_ERRIE | STM32F7_I2C_CR1_TCIE |
> +			STM32F7_I2C_CR1_STOPIE | STM32F7_I2C_CR1_NACKIE;
> +
> +		/* Clear DMA req and TX/RX interrupt */
> +		cr1 &= ~(STM32F7_I2C_CR1_RXIE | STM32F7_I2C_CR1_TXIE |
> +				STM32F7_I2C_CR1_RXDMAEN | STM32F7_I2C_CR1_TXDMAEN);
> +
> +		/* Configure DMA or enable RX/TX interrupt */
> +		i2c_dev->use_dma = false;
> +		if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN) {
> +			ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
> +					msg->flags & I2C_M_RD,
> +					f7_msg->count, f7_msg->buf,
> +					stm32f7_i2c_dma_callback,
> +					i2c_dev);
> +			if (!ret)
> +				i2c_dev->use_dma = true;
> +			else
> +				dev_warn(i2c_dev->dev, "can't use DMA\n");
> +		}
>  
> -	if (!i2c_dev->use_dma) {
> -		if (msg->flags & I2C_M_RD)
> -			cr1 |= STM32F7_I2C_CR1_RXIE;
> -		else
> -			cr1 |= STM32F7_I2C_CR1_TXIE;
> +		if (!i2c_dev->use_dma) {
> +			if (msg->flags & I2C_M_RD)
> +				cr1 |= STM32F7_I2C_CR1_RXIE;
> +			else
> +				cr1 |= STM32F7_I2C_CR1_TXIE;
> +		} else {
> +			if (msg->flags & I2C_M_RD)
> +				cr1 |= STM32F7_I2C_CR1_RXDMAEN;
> +			else
> +				cr1 |= STM32F7_I2C_CR1_TXDMAEN;
> +		}
>  	} else {
> -		if (msg->flags & I2C_M_RD)
> -			cr1 |= STM32F7_I2C_CR1_RXDMAEN;
> -		else
> -			cr1 |= STM32F7_I2C_CR1_TXDMAEN;
> +		/* Disable all interrupts */
> +		cr1 &= ~STM32F7_I2C_ALL_IRQ_MASK;
>  	}
>  
>  	/* Configure Start/Repeated Start */
> @@ -1670,7 +1676,22 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> -static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
> +static int stm32f7_i2c_wait_polling(struct stm32f7_i2c_dev *i2c_dev)
> +{
> +	ktime_t timeout = ktime_add_ms(ktime_get(), i2c_dev->adap.timeout);
> +
> +	while (ktime_compare(ktime_get(), timeout) < 0) {
> +		udelay(5);
> +		stm32f7_i2c_isr_event(0, i2c_dev);
> +
> +		if (try_wait_for_completion(&i2c_dev->complete))
> +			return 1;

I agree with the complete / wait_for_completion approach since it allows
to keep most of code common by manually calling the isr_event for
checking status bits.  However what about using completion_done instead
of try_wait_for_completion here ? This shouldn't change much since
anyway there is a reinit_completion at the beginning of the xfer
function, but at least function naming feels better since not refering
to waiting ..

> +	}
> +
> +	return 0;
> +}
> +
> +static int stm32f7_i2c_xfer_core(struct i2c_adapter *i2c_adap,
>  			    struct i2c_msg msgs[], int num)
>  {
>  	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
> @@ -1694,8 +1715,13 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>  
>  	stm32f7_i2c_xfer_msg(i2c_dev, msgs);
>  
> -	time_left = wait_for_completion_timeout(&i2c_dev->complete,
> -						i2c_dev->adap.timeout);
> +	if (!i2c_dev->atomic) {
> +		time_left = wait_for_completion_timeout(&i2c_dev->complete,
> +							i2c_dev->adap.timeout);
> +	} else {
> +		time_left = stm32f7_i2c_wait_polling(i2c_dev);
> +	}
> +
>  	ret = f7_msg->result;
>  	if (ret) {
>  		if (i2c_dev->use_dma)
> @@ -1727,6 +1753,24 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
>  	return (ret < 0) ? ret : num;
>  }
>  
> +static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
> +			    struct i2c_msg msgs[], int num)
> +{
> +	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
> +
> +	i2c_dev->atomic = 0;
> +	return stm32f7_i2c_xfer_core(i2c_adap, msgs, num);
> +}
> +
> +static int stm32f7_i2c_xfer_atomic(struct i2c_adapter *i2c_adap,
> +			    struct i2c_msg msgs[], int num)
> +{
> +	struct stm32f7_i2c_dev *i2c_dev = i2c_get_adapdata(i2c_adap);
> +
> +	i2c_dev->atomic = 1;
> +	return stm32f7_i2c_xfer_core(i2c_adap, msgs, num);
> +}
> +
>  static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
>  				  unsigned short flags, char read_write,
>  				  u8 command, int size,
> @@ -2095,6 +2139,7 @@ static u32 stm32f7_i2c_func(struct i2c_adapter *adap)
>  
>  static const struct i2c_algorithm stm32f7_i2c_algo = {
>  	.master_xfer = stm32f7_i2c_xfer,
> +	.master_xfer_atomic = stm32f7_i2c_xfer_atomic,
>  	.smbus_xfer = stm32f7_i2c_smbus_xfer,
>  	.functionality = stm32f7_i2c_func,
>  	.reg_slave = stm32f7_i2c_reg_slave,
> -- 

Regards,
Alain

> 2.40.0
> 
