Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3A42F40D6
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jan 2021 01:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393721AbhAMAnJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 19:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392098AbhAMACz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 19:02:55 -0500
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72617C0617A5
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 16:01:44 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id a6so118387vkb.8
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 16:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3BtruZqMnfhWC8c+dyxQjHk/A/qVpuTj2wP4eiHZiZg=;
        b=QLG6Rs/Kl7iv0RZCYBM7+LdcLP8MYmiFoPiRCbRaC8fqyruBzgxDQNLkoCnnYckqCX
         07Iv6NK3sO1gPQkH75J4yoQmJStnUVf7GmBIwUXaAt+T8gFaooSktmqLbLGShghaGq4Y
         7NAKEZO4aTboVunWQoZcuCbxgpsgxdwUMTdto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3BtruZqMnfhWC8c+dyxQjHk/A/qVpuTj2wP4eiHZiZg=;
        b=XOaAcR3ARVeI4W7xH6Uwk1ISRXh5FPAtXd4/rX1U4o196cbLqVtoJblXItz8y5JXHY
         HBHyuwudkBOGe4ccI8F9UEH3e1IIBBXMBYyTnO9+M9c5LrhZKoTsq8Qz3ERAHW6Wcaaf
         L+XRZYJeLTVBWgmfff2TUAyPmMWT/YxYDdtJvT1yXZfXiTesB3CB49+LriIgh5uQjyIk
         +v11gFCRs/+q8s/M6wp5fWX1hxhorvlGNVwweZB5ii39DedJkZa16S/arDanRDVj/kBN
         qSxwk3OJGuhfziInTm/hWogGs8HN47/Tj/69VnK6BaAkr7Hn23Kiebc/ICqXnVWkq+rX
         8kEQ==
X-Gm-Message-State: AOAM533njiTBJUpjJ5I6mXwXvBiqhO2LeL44tJksrmCl9TEleX9kw8Sx
        BilAzVBIU0uQbMOqkUaDOADHqshuVVDocw==
X-Google-Smtp-Source: ABdhPJzHZvYJ8T27M0Z84rbb8kZv9x0EenskYIOxQxwxOPVHuWRXHqOUHhxVUa2enkKGEOJVF+SiVQ==
X-Received: by 2002:a1f:608a:: with SMTP id u132mr2337781vkb.10.1610496103735;
        Tue, 12 Jan 2021 16:01:43 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id p136sm75747vke.6.2021.01.12.16.01.43
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 16:01:43 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id e15so183368vsa.0
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 16:01:43 -0800 (PST)
X-Received: by 2002:a67:ec45:: with SMTP id z5mr2070809vso.10.1610496103001;
 Tue, 12 Jan 2021 16:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20210111151651.1616813-1-vkoul@kernel.org> <20210111151651.1616813-4-vkoul@kernel.org>
In-Reply-To: <20210111151651.1616813-4-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 12 Jan 2021 16:01:30 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UOR2vxo7_gpjiv-djagq5bVwztCuDoCj5kjY7UtXR2PQ@mail.gmail.com>
Message-ID: <CAD=FV=UOR2vxo7_gpjiv-djagq5bVwztCuDoCj5kjY7UtXR2PQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] soc: qcom: geni: Add support for gpi dma
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi <linux-spi@vger.kernel.org>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, Jan 11, 2021 at 7:17 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> +static int geni_se_select_gpi_mode(struct geni_se *se)
> +{
> +       unsigned int geni_dma_mode = 0;
> +       unsigned int gpi_event_en = 0;
> +       unsigned int common_geni_m_irq_en = 0;
> +       unsigned int common_geni_s_irq_en = 0;
> +
> +       common_geni_m_irq_en = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
> +       common_geni_s_irq_en = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
> +       common_geni_m_irq_en &=
> +                       ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN |
> +                       M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
> +       common_geni_s_irq_en &= ~S_CMD_DONE_EN;
> +       geni_dma_mode = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);

Do you really need to do a read/modify/write of SE_GENI_DMA_MODE_EN?
It's a register with a single bit in it.  Just set the bit, no?  There
are cases where read-modify-write is the correct thing to do but IMO
it shouldn't be the default way of working.  If code is initting a
register to a default state it should just be setting the register.
If some later incarnation of the hardware comes along and adds extra
bits to this register then, sure, we might have to modify the code.
However, it has the advantage where we aren't left at the whims of
whatever was programmed by whatever version of whatever firmware was
running on the device.  I've been bitten way more often by firmware
leaving registers in some random / unexpected state than by new bits
introduced by new versions of hardware.

...same for other registers in your patch that you can just init.

(this is true throughout lots of Qualcomm code, but I figure might as
well start trying to do something about it?)


> +       gpi_event_en = readl_relaxed(se->base + SE_GSI_EVENT_EN);
> +
> +       geni_dma_mode |= GENI_DMA_MODE_EN;
> +       gpi_event_en |= (DMA_RX_EVENT_EN | DMA_TX_EVENT_EN |
> +                               GENI_M_EVENT_EN | GENI_S_EVENT_EN);
> +
> +       writel_relaxed(0, se->base + SE_IRQ_EN);
> +       writel_relaxed(common_geni_s_irq_en, se->base + SE_GENI_S_IRQ_EN);
> +       writel_relaxed(common_geni_m_irq_en, se->base + SE_GENI_M_IRQ_EN);

Last time I touched this bit of code I think folks agreed that it
would be better to move managing of the interrupt enables out of the
common code and move them to the various drivers using geni [1].  I
was hoping that someone from Qualcomm would be able to pick this up.
Managing them in the wrapper just ends up causing a whole bunch of
special cases.  Any chance you could take that on as part of your
series?

Presumably if this was mananged in individual drivers you also might
be able to do less read-modify-write type stuff, too...

[1] https://lore.kernel.org/linux-arm-msm/CAD=FV=VWPqswOXJejyXjYT_Yspdu75ELq42cffN87FrpTwPUQg@mail.gmail.com/


> +       writel_relaxed(0xFFFFFFFF, se->base + SE_GENI_M_IRQ_CLEAR);
> +       writel_relaxed(0xFFFFFFFF, se->base + SE_GENI_S_IRQ_CLEAR);
> +       writel_relaxed(0xFFFFFFFF, se->base + SE_DMA_TX_IRQ_CLR);
> +       writel_relaxed(0xFFFFFFFF, se->base + SE_DMA_RX_IRQ_CLR);

This looks mostly like geni_se_irq_clear().  Should they somehow share code?


> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index cb4e40908f9f..12003a6cb133 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -12,6 +12,7 @@
>  enum geni_se_xfer_mode {
>         GENI_SE_INVALID,
>         GENI_SE_FIFO,
> +       GENI_GPI_DMA,

Add a comment like "Also known as GSI" here to help people figure out
what's going on when they're trying to parse the manual or #defines
like "SE_GSI_EVENT_EN"


> @@ -123,6 +124,9 @@ struct geni_se {
>  #define CLK_DIV_MSK                    GENMASK(15, 4)
>  #define CLK_DIV_SHFT                   4
>
> +/* GENI_IF_DISABLE_RO fields */
> +#define FIFO_IF_DISABLE                        (BIT(0))

Maybe this define belonged in patch #1?  It doesn't seem related to this patch?
