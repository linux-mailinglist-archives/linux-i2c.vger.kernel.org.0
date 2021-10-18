Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEEC2432444
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Oct 2021 18:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbhJRQzu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 12:55:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:53132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231898AbhJRQzt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Oct 2021 12:55:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7585461074;
        Mon, 18 Oct 2021 16:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634576018;
        bh=pny5MV37vO/R5ODvgjHU15HLB7aU2hdszTQDIICB7Fs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cAQjAmCQHdXJo1SSHCFcpxmG2v+BkcmgZ0x4r+IaMAybc/yJ45971oDozm5e+UFtP
         t7/Az+QT55gviZ6aOH+sdpcT3hKZwWNVeN6nZj42pq2l6yMbMmeRtTh5JE28p6smFd
         8BVGhZV7OHryW/WSiWbtHgpm9zTuTOr/fvRQ87KMP1psK3on+OeUvgNqZYJgVtJIfU
         Iv/cE12fIdoQ0BMWeGfyWb1uo2LLvIchWJ/fFoeozL46Qo0Jm0ZoKvau7JMwbaM7XR
         RIqrpfOLCnlEoqZiL2nZkJnZL4CEw+TtxO3jZ+4Uosa3a/ocF6B/F0303+jkWgMnmR
         wlGGrwnGuARbA==
Date:   Mon, 18 Oct 2021 22:23:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] spi: spi-geni-qcom: Add support for GPI dma
Message-ID: <YW2mjFm5TcesGBux@matsya>
References: <20210625052213.32260-1-vkoul@kernel.org>
 <20210625052213.32260-5-vkoul@kernel.org>
 <CAD=FV=UfZxKyUZMK9c74KmMBBqgYROn1zp+vLfHaj_ghUK1t+g@mail.gmail.com>
 <YWhVIm+rqRMmkMMn@matsya>
 <CAD=FV=XMrurp4TLD7BCpVR9-+daHidHhkHG6P7u69HOBcvkMxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XMrurp4TLD7BCpVR9-+daHidHhkHG6P7u69HOBcvkMxA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 14-10-21, 09:55, Doug Anderson wrote:
> On Thu, Oct 14, 2021 at 9:04 AM Vinod Koul <vkoul@kernel.org> wrote:
> > > > +static bool geni_can_dma(struct spi_controller *ctlr,
> > > > +                        struct spi_device *slv, struct spi_transfer *xfer)
> > > > +{
> > > > +       struct spi_geni_master *mas = spi_master_get_devdata(slv->master);
> > > > +
> > > > +       /* check if dma is supported */
> > > > +       if (mas->cur_xfer_mode == GENI_GPI_DMA)
> > > > +               return true;
> > > > +
> > > > +       return false;
> > > > +}
> > >
> > > nit: might as well handle GENI_SE_DMA as well since it's just as easy
> > > to test against GENI_SE_FIFO?
> >
> > I think I will leave that for the person adding GENI_SE_DMA support :)
> 
> I was just thinking of changing the "if" statement:
> 
> if (mas->cur_xfer_mode != GENI_SE_FIFO)
> 
> It's no skin off your teeth and would make one fewer line to change
> if/when the other DMA mode is supported. In any case, I won't push it.
> ;-)

I can do that!

> > > > @@ -738,6 +1021,14 @@ static int spi_geni_probe(struct platform_device *pdev)
> > > >         if (ret)
> > > >                 goto spi_geni_probe_runtime_disable;
> > > >
> > > > +       /*
> > > > +        * check the mode supported and set_cs for fifo mode only
> > > > +        * for dma (gsi) mode, the gsi will set cs based on params passed in
> > > > +        * TRE
> > > > +        */
> > > > +       if (mas->cur_xfer_mode == GENI_SE_FIFO)
> > > > +               spi->set_cs = spi_geni_set_cs;
> > >
> > > I'm curious: is there no way to get set_cs() working in GPI mode? In
> > > an off-thread conversation Qualcomm seemed to indicate that it was
> > > possible, but maybe they didn't quite understand what I was asking.

I dont think so, as the GPI firmware controls CS here. IIRC set_cs() was
causing issues with gpi mode

> > > Without an implementation of set_cs() there will be drivers in Linux
> > > that simply aren't compatible because they make the assumption that
> > > they can lock the bus, set the CS, and do several transfers that are
> > > part of some logical "transaction". I believe that both of the SPI
> > > peripherals on boards that I work on, cros-ec and the SPI TPM make
> > > this assumption. I don't even believe that the drivers can be "fixed"
> > > because the requirement is more at the protocol level. The protocol
> > > requires you to do things like:
> > >
> > > 0. Lock the bus.
> > > 1. Set the CS.
> > > 2. Transfer a few bytes, reading the response as you go.
> > > 3. Once you see the other side respond that it's ready, transfer some
> > > more bytes.
> > > 4. Release the CS.
> > > 5. Unlock the bus.
> > >
> > > You can't do this without a set_cs() implementation because of the
> > > requirement to read the responses of the other side before moving on
> > > to the next phase of the transfer.
> > >
> > > As I understand it this is roughly the equivalent of i2c clock
> > > stretching but much more ad-hoc and defined peripherals-by-peripheral.
> > >
> > > In any case, I guess you must have examples of peripherals that need
> > > GPI mode and don't need set_cs() so we shouldn't block your way
> > > forward, but I'm just curious if you had more info on this.

Yes, I am testing with CAN bus on Rb3.

> > So I have asked some qcom folks, they tell me it is _possible_ to use
> > the cs bit in the TRE and it can work. But TBH I am not yet convinced it
> > would work as advertised. So do you enable the GPI mode for chrome books
> > or it is SE DMA mode (i think SE DMA mode might be simpler to use for
> > your case)
> 
> Sounds promising. I'm curious about why you're not convinced it would
> work as advertised? Right now we have all our SPI devices running in
> FIFO mode (!) and we've been trying to find a way to get them in DMA
> mode. I think Qualcomm is trying to avoid supporting both SE DMA and
> GPI DMA mode so they are saying that once GPI mode works then we can
> just use that.
> 
> I don't really have a huge objection to that, but I also have zero
> experience with GPI DMA mode. We don't have any need (at the moment)
> to share our SPI bus with multiple execution environments, but it
> seems like GPI mode _could_ still work as long as the chip select
> problem is solved. I did manage to get some more documentation and I
> do see a "LOCK" command, so maybe that combined with leaving the CS
> asserted would solve the problem? Maybe Mark would allow your driver
> to get called from spi_bus_lock() and spi_bus_unlock(). That seems
> like it would be important to do anyway to match the Linux SPI client
> model...

We can add lock support, but IIUC it was to prevent other EEs from
running, it may not help with chip select. It also needs someone loading
firmware on the controller.

For us, since some boards are shipping with firmware loaded, fifo and se
dma mode will not work, only option is to get gpi mode working.

> NOTE: in reality, we sorta paper over the "chip select" problem anyway
> on Chromebooks. We just configure the chip select lines as GPIOs and
> let Linux manage them. There is much less overhead in setting a GPIO
> compared to messaging a QUP, so this improves performance. As long as
> this continues to work, perhaps we don't care about whether we can
> really tell GPI mode to leave the CS asserted.

I think it would be good experiment to get it working with chromebooks.
I am sure it wont be trivial and may not work out of box, but would be a
good experiment to do :)

-- 
~Vinod
