Return-Path: <linux-i2c+bounces-831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F91C8147C3
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 13:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1294B22655
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 12:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6912C689;
	Fri, 15 Dec 2023 12:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="I7ZtUIBX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458FE2C68A;
	Fri, 15 Dec 2023 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3BF9dxop002855;
	Fri, 15 Dec 2023 13:12:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=selector1; bh=kvE5XBu2+Fd93UaI428vG
	WnjnWCMDEpyRUaHUxWJrW0=; b=I7ZtUIBX3AT99QeCJLaVB0aVgc10L3IImwTqj
	1gafLIseHZqpj2t5QQep7K8ZyoOJNIThwKPcGQ3PZzdo8e2xZSQ+IPGHNDNYTSOo
	x/ZA1ofwp59DpNn5HVtHi3WK7YrlvEi3i+aMt4iksblgxFC6ZaYZ5xgS7+weZSXM
	lnmFXMK5RtheNLKpvT+zKH3kZNWimdDf0QIbWeBqUC8XgeNhjPpvFiO7jNMBFido
	0pHT/95P0Dfh5Wm+zq8LoKsxrcyuaUNFYgqjjmf+55q6WwiEhXuP/cqwvCZp8I6D
	Xn6RM1foPk9+pmkuox3wfy6eo++A3wGNp8rJ0gSpStx8SvpzA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uxvh9n7pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Dec 2023 13:12:42 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E9B3100052;
	Fri, 15 Dec 2023 13:12:41 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D041217B7B;
	Fri, 15 Dec 2023 13:12:41 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 13:12:40 +0100
Date: Fri, 15 Dec 2023 13:12:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Pierre-Yves MORDRET
	<pierre-yves.mordret@foss.st.com>,
        Conor Dooley <conor@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Valentin Caron <valentin.caron@foss.st.com>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] i2c: stm32f7: add support for stm32mp25 soc
Message-ID: <20231215121231.GA3866676@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Valentin Caron <valentin.caron@foss.st.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
 <20231208164719.3584028-5-alain.volmat@foss.st.com>
 <20231209000747.4l6462nlzj3po3sf@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231209000747.4l6462nlzj3po3sf@zenone.zhora.eu>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_06,2023-12-14_01,2023-05-22_02

Hi Andi,

thanks for your review.

I'll shortly post a v3 to correct all your comments.

On Sat, Dec 09, 2023 at 01:07:47AM +0100, Andi Shyti wrote:
> Hi Alain,
> 
> On Fri, Dec 08, 2023 at 05:47:13PM +0100, Alain Volmat wrote:
> > The stm32mp25 has only a single interrupt line used for both
> > events and errors. In order to cope with that, reorganise the
> > error handling code so that it can be called either from the
> > common handler (used in case of SoC having only a single IT line)
> > and the error handler for others.
> > The CR1 register also embeds a new FMP bit, necessary when running
> > at Fast Mode Plus frequency. This bit should be used instead of
> > the SYSCFG bit used on other platforms.
> > Add a new compatible to distinguish between the SoCs and two
> > boolean within the setup structure in order to know if the
> > platform has a single/multiple IT lines and if the FMP bit
> > within CR1 is available or not.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> 
> your SoB here should come last because you are the one sending
> the patch.

Fixed.

> 
> > ---
> >  drivers/i2c/busses/i2c-stm32f7.c | 230 ++++++++++++++++++-------------
> >  1 file changed, 133 insertions(+), 97 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> > index 2a011deec3c5..5634332900fb 100644
> > --- a/drivers/i2c/busses/i2c-stm32f7.c
> > +++ b/drivers/i2c/busses/i2c-stm32f7.c
> > @@ -50,6 +50,7 @@
> >  #define STM32F7_I2C_TXDR			0x28
> >  
> >  /* STM32F7 I2C control 1 */
> > +#define STM32_I2C_CR1_FMP			BIT(24)
> >  #define STM32F7_I2C_CR1_PECEN			BIT(23)
> >  #define STM32F7_I2C_CR1_ALERTEN			BIT(22)
> >  #define STM32F7_I2C_CR1_SMBHEN			BIT(20)
> > @@ -226,6 +227,8 @@ struct stm32f7_i2c_spec {
> >   * @rise_time: Rise time (ns)
> >   * @fall_time: Fall time (ns)
> >   * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
> > + * @single_it_line: Only a single IT line is used for both events/errors
> > + * @fmp_cr1_bit: Fast Mode Plus control is done via a bit in CR1
> 
> Is the Fast Mode Plus an optional feature?

Yes, from what I've seen, it seems an optional feature on some versions
of stm32f7.

> 
> >   */
> >  struct stm32f7_i2c_setup {
> >  	u32 speed_freq;
> > @@ -233,6 +236,8 @@ struct stm32f7_i2c_setup {
> >  	u32 rise_time;
> >  	u32 fall_time;
> >  	u32 fmp_clr_offset;
> > +	bool single_it_line;
> > +	bool fmp_cr1_bit;
> >  };
> 
> [...]
> 
> > -static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev)
> > +static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev, u32 status)
> >  {
> >  	void __iomem *base = i2c_dev->base;
> > -	u32 cr2, status, mask;
> > +	u32 cr2, mask;
> >  	u8 val;
> >  	int ret;
> >  
> > -	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
> > -
> 
> good to see this change here, relates to my comment in patch 1.
> But I think this should go on a different patch.

Agreed. I've split this small change into a dedicated commit done before
this patch.

> 
> >  	/* Slave transmitter mode */
> >  	if (status & STM32F7_I2C_ISR_TXIS) {
> >  		i2c_slave_event(i2c_dev->slave_running,
> > @@ -1494,17 +1504,81 @@ static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev)
> >  	return IRQ_HANDLED;
> >  }
> 
> [...]
> 
> > -	setup = of_device_get_match_data(&pdev->dev);
> > -	if (!setup) {
> > -		dev_err(&pdev->dev, "Can't get device data\n");
> > -		return -ENODEV;
> > +		ret = devm_request_threaded_irq(&pdev->dev, irq_error,
> > +						NULL,
> > +						stm32f7_i2c_isr_error_thread,
> > +						IRQF_ONESHOT,
> > +						pdev->name, i2c_dev);
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "Failed to request irq error %i\n",
> > +				irq_error);
> 
> please use dev_err_probe();

Done as well in a dedicated commit at the very beginning of the serie.

> 
> > +			return ret;
> > +		}
> 
> out of the scope of the patch and just for curiosity: does the
> driver work without being able to signal on the error interrupt
> line?

Sorry, not sure to understand the question.  Just for clarification,
on the MP25 not having a dedicated error line doesn't mean we are not
signaled for errors.  It is simply they just come via the same
interrupt line, hence we need to check for both event and error
within the same handler.
On systems using two interrupts line, the error interrupt irq line
should be handled in order to tackle those errors cases.
Sorry, does this answer your question ?

> 
> Overall the patch looks good to me, though.
> 
> Andi

