Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D2D2F19E5
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 16:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbhAKPlj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 10:41:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbhAKPlj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 10:41:39 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A1DC061794
        for <linux-i2c@vger.kernel.org>; Mon, 11 Jan 2021 07:40:58 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id s2so20548843oij.2
        for <linux-i2c@vger.kernel.org>; Mon, 11 Jan 2021 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2NFLJAEhP/pWZ/3KNdvaDfsdnuyk831kAKh+5k94dVg=;
        b=S5iwiv4PKXL8ewzh/rll9Sa3j2vexkhQ/+IVuul0kcR2xH5vr2wAtbeMWCArZyEinj
         LUl8PD7TmeENRc7BQmmCfXY6h1NmTM4ROO8+K4aE2RslM7xJJU5XK69VEbbVOtxdbOMw
         MJ2p+S+CWndN0O39bPTXy19+vOrobbMszcPJ6XZerhoWrpMMihWrSZ6qMJFi3LhY6/RF
         r8dBPBBdP/H3dwsnsiRx7fExy1cr7otlHSsvePHK3VbCQcGwLZWKVSG4Fy0XA9qds9xW
         SjBK/FClUenpamX4LugF2rKGKQlgkpwQIUg5b/I4uOJYz4Ce+UlNdy0joo1W5Mx8WuQt
         QR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2NFLJAEhP/pWZ/3KNdvaDfsdnuyk831kAKh+5k94dVg=;
        b=TrMaTV83lH+zij/TA0K/lRCumZPDUVXsY+nosjLYrGFkDqClvtsaH63ZIXqEZMWazm
         DdBL46nKj3zI8uO4sCJvV8XofIG/DRspy6rlmHrdMDxoCAGO5HO23IRhBYDK9+XQ2a8C
         G3aApcN7dylRWXYEP4psyGBG3JF3STye6D8BGKHl6RZLxHyXStHVV5saWAH0qUsmQ5z1
         5mnLZQwlDwZOv/xrcZdLCBrQOFkNMA5UQrWIqqelbKKOzD9TaIiBKglS/bOMrGv+rSDF
         sDAkgCYzN4VgHTLJDDx/O9+9Aa7KHZnloe436RGnCF8LL8zUQT1bR1NPjngsAe7gLPw6
         2VRw==
X-Gm-Message-State: AOAM532XsFX++ztoDJJQh6ruSmNokbsvpupAK8MKq00Uj1e5Pn85HH3g
        FWh2G8KKatAF8k4wqcmW5NiqGg==
X-Google-Smtp-Source: ABdhPJzK7vYdXsN45YWQD0Il+kWkHfKqU7Inc4xU498GSQrcdRJIekYCAqeyYbE2EHzJ/jT10Cwp4w==
X-Received: by 2002:aca:f594:: with SMTP id t142mr10185380oih.162.1610379658167;
        Mon, 11 Jan 2021 07:40:58 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o17sm22785otp.30.2021.01.11.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 07:40:57 -0800 (PST)
Date:   Mon, 11 Jan 2021 09:40:55 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] soc: qcom: geni: Add support for gpi dma
Message-ID: <X/xxh8ejwY6cHdC1@builder.lan>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111151651.1616813-4-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon 11 Jan 09:16 CST 2021, Vinod Koul wrote:

> GPI DMA is one of the DMA modes supported on geni, this adds support to
> enable that mode
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/soc/qcom/qcom-geni-se.c | 39 ++++++++++++++++++++++++++++++++-
>  include/linux/qcom-geni-se.h    |  4 ++++
>  2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index a3868228ea05..db44dc32e049 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -310,6 +310,39 @@ static void geni_se_select_dma_mode(struct geni_se *se)
>  		writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
>  }
>  
> +static int geni_se_select_gpi_mode(struct geni_se *se)

This doesn't return any information and the return value isn't looked
at, please make it void.

> +{
> +	unsigned int geni_dma_mode = 0;
> +	unsigned int gpi_event_en = 0;
> +	unsigned int common_geni_m_irq_en = 0;
> +	unsigned int common_geni_s_irq_en = 0;

These could certainly be given a shorter name.

None of them needs to be initialized, first access in all cases are
assignments.

> +
> +	common_geni_m_irq_en = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
> +	common_geni_s_irq_en = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
> +	common_geni_m_irq_en &=
> +			~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN |
> +			M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
> +	common_geni_s_irq_en &= ~S_CMD_DONE_EN;
> +	geni_dma_mode = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
> +	gpi_event_en = readl_relaxed(se->base + SE_GSI_EVENT_EN);
> +
> +	geni_dma_mode |= GENI_DMA_MODE_EN;
> +	gpi_event_en |= (DMA_RX_EVENT_EN | DMA_TX_EVENT_EN |
> +				GENI_M_EVENT_EN | GENI_S_EVENT_EN);

Please reorder these so that you do
	readl(m)
	mask out bits of m

	readl(s)
	mask out bits of s

	...

> +
> +	writel_relaxed(0, se->base + SE_IRQ_EN);
> +	writel_relaxed(common_geni_s_irq_en, se->base + SE_GENI_S_IRQ_EN);
> +	writel_relaxed(common_geni_m_irq_en, se->base + SE_GENI_M_IRQ_EN);
> +	writel_relaxed(0xFFFFFFFF, se->base + SE_GENI_M_IRQ_CLEAR);

Lowercase hex digits please.

> +	writel_relaxed(0xFFFFFFFF, se->base + SE_GENI_S_IRQ_CLEAR);
> +	writel_relaxed(0xFFFFFFFF, se->base + SE_DMA_TX_IRQ_CLR);
> +	writel_relaxed(0xFFFFFFFF, se->base + SE_DMA_RX_IRQ_CLR);
> +	writel_relaxed(geni_dma_mode, se->base + SE_GENI_DMA_MODE_EN);
> +	writel_relaxed(gpi_event_en, se->base + SE_GSI_EVENT_EN);

Why is this driver using _relaxed accessors exclusively? Why are you
using _relaxed versions?

And wouldn't it be suitable to have a wmb() before the "dma mode enable"
and "event enable" at least? (I.e. use writel() instead)

Regards,
Bjorn

> +
> +	return 0;
> +}
> +
>  /**
>   * geni_se_select_mode() - Select the serial engine transfer mode
>   * @se:		Pointer to the concerned serial engine.
> @@ -317,7 +350,8 @@ static void geni_se_select_dma_mode(struct geni_se *se)
>   */
>  void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
>  {
> -	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA);
> +	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA &&
> +		mode != GENI_GPI_DMA);
>  
>  	switch (mode) {
>  	case GENI_SE_FIFO:
> @@ -326,6 +360,9 @@ void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
>  	case GENI_SE_DMA:
>  		geni_se_select_dma_mode(se);
>  		break;
> +	case GENI_GPI_DMA:
> +		geni_se_select_gpi_mode(se);
> +		break;
>  	case GENI_SE_INVALID:
>  	default:
>  		break;
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index cb4e40908f9f..12003a6cb133 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -12,6 +12,7 @@
>  enum geni_se_xfer_mode {
>  	GENI_SE_INVALID,
>  	GENI_SE_FIFO,
> +	GENI_GPI_DMA,
>  	GENI_SE_DMA,
>  };
>  
> @@ -123,6 +124,9 @@ struct geni_se {
>  #define CLK_DIV_MSK			GENMASK(15, 4)
>  #define CLK_DIV_SHFT			4
>  
> +/* GENI_IF_DISABLE_RO fields */
> +#define FIFO_IF_DISABLE			(BIT(0))
> +
>  /* GENI_FW_REVISION_RO fields */
>  #define FW_REV_PROTOCOL_MSK		GENMASK(15, 8)
>  #define FW_REV_PROTOCOL_SHFT		8
> -- 
> 2.26.2
> 
