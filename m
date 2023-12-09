Return-Path: <linux-i2c+bounces-696-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 712FF80B0C8
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 01:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24389281A72
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 00:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781BC38C;
	Sat,  9 Dec 2023 00:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntoBUAsD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFCD369;
	Sat,  9 Dec 2023 00:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101BEC433C7;
	Sat,  9 Dec 2023 00:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702080473;
	bh=0lDWjZhcpsj5eDD+T3hZ5cTAQQFykaGs0qkCTg3+7Gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntoBUAsDFYQIe/0ThhuUrrClxY/6XTFJ3ttIK7D0kCoxzlrPg7XRYTqNlhNe5SmtZ
	 S2yKACJsl4idJTQ7L2eM6ADk958nQDtnL850qlg8YFPmR6a2XdkfYTeJmK18i51v/q
	 5GD3fPm6zeZMOfcElkERh74Xn6Lz2dESFx0cRsPtpck5igqTUlBtTzRVc+kk0g2+Xb
	 gDWsQajUAb7a+r3W5tgjFGcI29ZyybtNQdmZnckY3bKgOE701cJvcSznVHkNBJJb3f
	 CpIJRj75d9tLrlobYZmQkxfI/rgJ2ITmgUHOSozppyT6NQR3b366Z9z/cFA6LZnAuC
	 5JfMDuUAhFq+A==
Date: Sat, 9 Dec 2023 01:07:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>,
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
Subject: Re: [PATCH v2 4/7] i2c: stm32f7: add support for stm32mp25 soc
Message-ID: <20231209000747.4l6462nlzj3po3sf@zenone.zhora.eu>
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
 <20231208164719.3584028-5-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208164719.3584028-5-alain.volmat@foss.st.com>

Hi Alain,

On Fri, Dec 08, 2023 at 05:47:13PM +0100, Alain Volmat wrote:
> The stm32mp25 has only a single interrupt line used for both
> events and errors. In order to cope with that, reorganise the
> error handling code so that it can be called either from the
> common handler (used in case of SoC having only a single IT line)
> and the error handler for others.
> The CR1 register also embeds a new FMP bit, necessary when running
> at Fast Mode Plus frequency. This bit should be used instead of
> the SYSCFG bit used on other platforms.
> Add a new compatible to distinguish between the SoCs and two
> boolean within the setup structure in order to know if the
> platform has a single/multiple IT lines and if the FMP bit
> within CR1 is available or not.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

your SoB here should come last because you are the one sending
the patch.

> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 230 ++++++++++++++++++-------------
>  1 file changed, 133 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index 2a011deec3c5..5634332900fb 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -50,6 +50,7 @@
>  #define STM32F7_I2C_TXDR			0x28
>  
>  /* STM32F7 I2C control 1 */
> +#define STM32_I2C_CR1_FMP			BIT(24)
>  #define STM32F7_I2C_CR1_PECEN			BIT(23)
>  #define STM32F7_I2C_CR1_ALERTEN			BIT(22)
>  #define STM32F7_I2C_CR1_SMBHEN			BIT(20)
> @@ -226,6 +227,8 @@ struct stm32f7_i2c_spec {
>   * @rise_time: Rise time (ns)
>   * @fall_time: Fall time (ns)
>   * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
> + * @single_it_line: Only a single IT line is used for both events/errors
> + * @fmp_cr1_bit: Fast Mode Plus control is done via a bit in CR1

Is the Fast Mode Plus an optional feature?

>   */
>  struct stm32f7_i2c_setup {
>  	u32 speed_freq;
> @@ -233,6 +236,8 @@ struct stm32f7_i2c_setup {
>  	u32 rise_time;
>  	u32 fall_time;
>  	u32 fmp_clr_offset;
> +	bool single_it_line;
> +	bool fmp_cr1_bit;
>  };

[...]

> -static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev)
> +static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev, u32 status)
>  {
>  	void __iomem *base = i2c_dev->base;
> -	u32 cr2, status, mask;
> +	u32 cr2, mask;
>  	u8 val;
>  	int ret;
>  
> -	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);
> -

good to see this change here, relates to my comment in patch 1.
But I think this should go on a different patch.

>  	/* Slave transmitter mode */
>  	if (status & STM32F7_I2C_ISR_TXIS) {
>  		i2c_slave_event(i2c_dev->slave_running,
> @@ -1494,17 +1504,81 @@ static irqreturn_t stm32f7_i2c_slave_isr_event(struct stm32f7_i2c_dev *i2c_dev)
>  	return IRQ_HANDLED;
>  }

[...]

> -	setup = of_device_get_match_data(&pdev->dev);
> -	if (!setup) {
> -		dev_err(&pdev->dev, "Can't get device data\n");
> -		return -ENODEV;
> +		ret = devm_request_threaded_irq(&pdev->dev, irq_error,
> +						NULL,
> +						stm32f7_i2c_isr_error_thread,
> +						IRQF_ONESHOT,
> +						pdev->name, i2c_dev);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to request irq error %i\n",
> +				irq_error);

please use dev_err_probe();

> +			return ret;
> +		}

out of the scope of the patch and just for curiosity: does the
driver work without being able to signal on the error interrupt
line?

Overall the patch looks good to me, though.

Andi

