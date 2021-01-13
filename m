Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FCE2F425E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jan 2021 04:24:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbhAMDW5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 22:22:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:45486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727502AbhAMDW4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 22:22:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F04CF2312E;
        Wed, 13 Jan 2021 03:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610508135;
        bh=8BRJSLMo7FOYF5rPzFmLI/cNrMEmyy9hnFPOCuKIDtE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VgDO0rQ2yjnPDCXyE3lsl+AV7GzHATyCzO3O3B0LFBWgoTG88C12/7ZbfEIZyEDCd
         5lz77YREOK1ROdJtLXOswxsklpLbKh1vYLMWHL/wVt5nL3rcayvXhJNjBd+o5B5rRe
         hq8L2sK08WO4qqzI5EzlMCwVmsvauPybYGsQUgclpPprf9Lw/Qj/XxKmW5O97US0CQ
         xmaFVJSxPyDcOBpAh9Ef7ZHorgm3qSr+pbUCX76eywO8Nk9rd1XXT4b/164M1XTKhC
         3fwy/IfmXWgTzkCeHWYbD98fzL6dLFoX4jxEp6bWfKpdyQxPG5lYvRfK7RsnMl3E/S
         8ZSLXUNOyikzQ==
Date:   Wed, 13 Jan 2021 08:52:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
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
Subject: Re: [PATCH 3/7] soc: qcom: geni: Add support for gpi dma
Message-ID: <20210113032209.GX2771@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-4-vkoul@kernel.org>
 <CAD=FV=UOR2vxo7_gpjiv-djagq5bVwztCuDoCj5kjY7UtXR2PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UOR2vxo7_gpjiv-djagq5bVwztCuDoCj5kjY7UtXR2PQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12-01-21, 16:01, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jan 11, 2021 at 7:17 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > +static int geni_se_select_gpi_mode(struct geni_se *se)
> > +{
> > +       unsigned int geni_dma_mode = 0;
> > +       unsigned int gpi_event_en = 0;
> > +       unsigned int common_geni_m_irq_en = 0;
> > +       unsigned int common_geni_s_irq_en = 0;
> > +
> > +       common_geni_m_irq_en = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
> > +       common_geni_s_irq_en = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
> > +       common_geni_m_irq_en &=
> > +                       ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN |
> > +                       M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
> > +       common_geni_s_irq_en &= ~S_CMD_DONE_EN;
> > +       geni_dma_mode = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
> 
> Do you really need to do a read/modify/write of SE_GENI_DMA_MODE_EN?
> It's a register with a single bit in it.  Just set the bit, no?  There
> are cases where read-modify-write is the correct thing to do but IMO
> it shouldn't be the default way of working.  If code is initting a
> register to a default state it should just be setting the register.
> If some later incarnation of the hardware comes along and adds extra
> bits to this register then, sure, we might have to modify the code.
> However, it has the advantage where we aren't left at the whims of
> whatever was programmed by whatever version of whatever firmware was
> running on the device.  I've been bitten way more often by firmware
> leaving registers in some random / unexpected state than by new bits
> introduced by new versions of hardware.
> 
> ...same for other registers in your patch that you can just init.

Yes sounds right to me. I will review this and other register writes and
update the code

> (this is true throughout lots of Qualcomm code, but I figure might as
> well start trying to do something about it?)

yep, we can always start somewhere :)

> > +       gpi_event_en = readl_relaxed(se->base + SE_GSI_EVENT_EN);
> > +
> > +       geni_dma_mode |= GENI_DMA_MODE_EN;
> > +       gpi_event_en |= (DMA_RX_EVENT_EN | DMA_TX_EVENT_EN |
> > +                               GENI_M_EVENT_EN | GENI_S_EVENT_EN);
> > +
> > +       writel_relaxed(0, se->base + SE_IRQ_EN);
> > +       writel_relaxed(common_geni_s_irq_en, se->base + SE_GENI_S_IRQ_EN);
> > +       writel_relaxed(common_geni_m_irq_en, se->base + SE_GENI_M_IRQ_EN);
> 
> Last time I touched this bit of code I think folks agreed that it
> would be better to move managing of the interrupt enables out of the
> common code and move them to the various drivers using geni [1].  I
> was hoping that someone from Qualcomm would be able to pick this up.
> Managing them in the wrapper just ends up causing a whole bunch of
> special cases.  Any chance you could take that on as part of your
> series?
> 
> Presumably if this was mananged in individual drivers you also might
> be able to do less read-modify-write type stuff, too...
> 
> [1] https://lore.kernel.org/linux-arm-msm/CAD=FV=VWPqswOXJejyXjYT_Yspdu75ELq42cffN87FrpTwPUQg@mail.gmail.com/

If it is okay, I can take this up but after this series. We can handle
the move independently as that is certainly a good thing to do.

> > +       writel_relaxed(0xFFFFFFFF, se->base + SE_GENI_M_IRQ_CLEAR);
> > +       writel_relaxed(0xFFFFFFFF, se->base + SE_GENI_S_IRQ_CLEAR);
> > +       writel_relaxed(0xFFFFFFFF, se->base + SE_DMA_TX_IRQ_CLR);
> > +       writel_relaxed(0xFFFFFFFF, se->base + SE_DMA_RX_IRQ_CLR);
> 
> This looks mostly like geni_se_irq_clear().  Should they somehow share code?

Mostly seems similar, let me move over that and verify

> > diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> > index cb4e40908f9f..12003a6cb133 100644
> > --- a/include/linux/qcom-geni-se.h
> > +++ b/include/linux/qcom-geni-se.h
> > @@ -12,6 +12,7 @@
> >  enum geni_se_xfer_mode {
> >         GENI_SE_INVALID,
> >         GENI_SE_FIFO,
> > +       GENI_GPI_DMA,
> 
> Add a comment like "Also known as GSI" here to help people figure out
> what's going on when they're trying to parse the manual or #defines
> like "SE_GSI_EVENT_EN"

Sure will add GSI.

> > @@ -123,6 +124,9 @@ struct geni_se {
> >  #define CLK_DIV_MSK                    GENMASK(15, 4)
> >  #define CLK_DIV_SHFT                   4
> >
> > +/* GENI_IF_DISABLE_RO fields */
> > +#define FIFO_IF_DISABLE                        (BIT(0))
> 
> Maybe this define belonged in patch #1?  It doesn't seem related to this patch?

Yes the bit defines should go with the register.

-- 
~Vinod
