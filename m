Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 659632F1C3A
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 18:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389471AbhAKRWq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 12:22:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:55678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389172AbhAKRWp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 12:22:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16AFF22AAD;
        Mon, 11 Jan 2021 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610385725;
        bh=ucPgUzXVIgWKKN/+F8TNx30krDlRgEwvSla3l6JVkSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UKRoI/e2JspwtRrHn2mzv0r4hzgem7xRf7oblunSNksCu9iLEM30gwWBM+EfL4EZ8
         8QztRIpnPMiMF9LJj7czvYTXwakOf15ku18gA1aMtTx10xl/7NyhyHX7cRrYAPqylg
         IjOmojire0zwNCkbqEQNluEw6AZ3nstYOJ2Wf1KXerz2eQeIG0WknAxcDsCFL2np5k
         0ogyxZPPzrYbUUPh9lT62na9TIeswAO3VWqXZfOZ/5gR+QV7JlqV3PquwjfMBkm9U0
         L/7l9dHWiZjydDjUuwz7eWNWIz4Gjk5pzYcwhu4Vdk6X9gnQs4KBeNa1q/osAxTXmA
         XvX/jN8RUx9FQ==
Date:   Mon, 11 Jan 2021 22:52:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] soc: qcom: geni: Add support for gpi dma
Message-ID: <20210111172200.GZ2771@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-4-vkoul@kernel.org>
 <X/xxh8ejwY6cHdC1@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/xxh8ejwY6cHdC1@builder.lan>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11-01-21, 09:40, Bjorn Andersson wrote:
> On Mon 11 Jan 09:16 CST 2021, Vinod Koul wrote:
> 
> > GPI DMA is one of the DMA modes supported on geni, this adds support to
> > enable that mode
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/soc/qcom/qcom-geni-se.c | 39 ++++++++++++++++++++++++++++++++-
> >  include/linux/qcom-geni-se.h    |  4 ++++
> >  2 files changed, 42 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> > index a3868228ea05..db44dc32e049 100644
> > --- a/drivers/soc/qcom/qcom-geni-se.c
> > +++ b/drivers/soc/qcom/qcom-geni-se.c
> > @@ -310,6 +310,39 @@ static void geni_se_select_dma_mode(struct geni_se *se)
> >  		writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
> >  }
> >  
> > +static int geni_se_select_gpi_mode(struct geni_se *se)
> 
> This doesn't return any information and the return value isn't looked
> at, please make it void.

Sure..

> > +{
> > +	unsigned int geni_dma_mode = 0;
> > +	unsigned int gpi_event_en = 0;
> > +	unsigned int common_geni_m_irq_en = 0;
> > +	unsigned int common_geni_s_irq_en = 0;
> 
> These could certainly be given a shorter name.

Certainly..

> None of them needs to be initialized, first access in all cases are
> assignments.

Will update

> > +
> > +	common_geni_m_irq_en = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
> > +	common_geni_s_irq_en = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
> > +	common_geni_m_irq_en &=
> > +			~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN |
> > +			M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
> > +	common_geni_s_irq_en &= ~S_CMD_DONE_EN;
> > +	geni_dma_mode = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
> > +	gpi_event_en = readl_relaxed(se->base + SE_GSI_EVENT_EN);
> > +
> > +	geni_dma_mode |= GENI_DMA_MODE_EN;
> > +	gpi_event_en |= (DMA_RX_EVENT_EN | DMA_TX_EVENT_EN |
> > +				GENI_M_EVENT_EN | GENI_S_EVENT_EN);
> 
> Please reorder these so that you do
> 	readl(m)
> 	mask out bits of m
> 
> 	readl(s)
> 	mask out bits of s
> 
> 	...

okay will update

> > +
> > +	writel_relaxed(0, se->base + SE_IRQ_EN);
> > +	writel_relaxed(common_geni_s_irq_en, se->base + SE_GENI_S_IRQ_EN);
> > +	writel_relaxed(common_geni_m_irq_en, se->base + SE_GENI_M_IRQ_EN);
> > +	writel_relaxed(0xFFFFFFFF, se->base + SE_GENI_M_IRQ_CLEAR);
> 
> Lowercase hex digits please.

Yeah missed

> > +	writel_relaxed(0xFFFFFFFF, se->base + SE_GENI_S_IRQ_CLEAR);
> > +	writel_relaxed(0xFFFFFFFF, se->base + SE_DMA_TX_IRQ_CLR);
> > +	writel_relaxed(0xFFFFFFFF, se->base + SE_DMA_RX_IRQ_CLR);
> > +	writel_relaxed(geni_dma_mode, se->base + SE_GENI_DMA_MODE_EN);
> > +	writel_relaxed(gpi_event_en, se->base + SE_GSI_EVENT_EN);
> 
> Why is this driver using _relaxed accessors exclusively? Why are you
> using _relaxed versions?
> 
> And wouldn't it be suitable to have a wmb() before the "dma mode enable"
> and "event enable" at least? (I.e. use writel() instead)

Yeah we invoke this to select the mode before programming DMA, so yes a
wmb() would make sense. Thanks for quick look

-- 
~Vinod
