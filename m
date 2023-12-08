Return-Path: <linux-i2c+bounces-694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E475A80AD7D
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 21:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C44281C20CB1
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Dec 2023 20:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568A856475;
	Fri,  8 Dec 2023 20:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOVNZuLt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127D84F601;
	Fri,  8 Dec 2023 20:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4782C433C7;
	Fri,  8 Dec 2023 20:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702065871;
	bh=dAzTKis/A168Bq4izb0pTdVXcvwbLPWwjZhbjyGsfuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOVNZuLtre13kBHgee4m2/HCdLbvfRd1C1jVy8YMKKwP7MMWca0oI/drSpeiVxYA6
	 d0LAbuKH3mFEpct4nl2L0b8av5Ow5koo0UDmh9UgFhOP+DVBfG2nP5N0tR8sboReaY
	 mzPU/LM0PrPw8axcAzodwT5pjvtKfDrMYWlGUBYSWQLYWfmgVt3ZKEA8N2qkajdR9q
	 sEQa6D0oUosCDitw3268nUaQTbX7ppmAr5dK1heV605xNr9bhdO8OWsNcjjTOqoch6
	 yy41038aEt2+gqOQs7YShU9VmIUGDCI8cZSLrdW5cLADPB2qVeTN4okZyp0VFvMsVM
	 lAVXGb7aruChg==
Date: Fri, 8 Dec 2023 21:04:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] i2c: stm32f7: perform most of irq job in threaded
 handler
Message-ID: <20231208200425.zli2j6b4lt4shasn@zenone.zhora.eu>
References: <20231208164719.3584028-1-alain.volmat@foss.st.com>
 <20231208164719.3584028-2-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208164719.3584028-2-alain.volmat@foss.st.com>

Hi Alain,

On Fri, Dec 08, 2023 at 05:47:10PM +0100, Alain Volmat wrote:
> The irq handling is currently split between the irq handler
> and the threaded irq handler.  Some of the handling (such as
> dma related stuffs) done within the irq handler might sleep or
> take some time leading to issues if the kernel is built with
> realtime constraints.  In order to fix that, perform an overall
> rework to perform most of the job within the threaded handler
> and only keep fifo access in the non threaded handler.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

quite a difficult review because this git diff algorithm makes it
difficult to read throuhg.

But it looks like just a copy paste from to
stm32f7_i2c_isr_event() to stm32f7_i2c_isr_event_thread() of the
STM32F7_I2C_ISR_NACKF, STM32F7_I2C_ISR_STOPF, STM32F7_I2C_ISR_TC
and STM32F7_I2C_ISR_TCR.

[...]

> +static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
> +{
> +	struct stm32f7_i2c_dev *i2c_dev = data;
> +	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
> +	struct stm32_i2c_dma *dma = i2c_dev->dma;
> +	void __iomem *base = i2c_dev->base;
> +	u32 status, mask;
> +	int ret;
> +
> +	if (!i2c_dev->master_mode)
> +		return stm32f7_i2c_slave_isr_event(i2c_dev);
> +
> +	status = readl_relaxed(i2c_dev->base + STM32F7_I2C_ISR);

looks to me like this readl_relaxed is read too many times during
the whole irq handling.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

