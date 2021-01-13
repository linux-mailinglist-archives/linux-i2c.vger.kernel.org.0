Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB652F4273
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jan 2021 04:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729102AbhAMDZB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 22:25:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:45896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728903AbhAMDZA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 22:25:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66BF52312E;
        Wed, 13 Jan 2021 03:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610508259;
        bh=vixgOb18FEVdpF/CtfNzRWKBOHFizBZM2/NFu+vhSwg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dTR4w3vVxTElyiQTQhMkM/dT4PzRLF4hkrYGx9beDj5vMJboLs0kCtalQSmZHJ/fh
         iNoaGfWvNi4+R0hnEMH829mrRsn6LFmnHyB6zw+vnqtVP81GPW8w9/+gK8tERIq87M
         oQKUDiAKLJNkJtxvVi6DEZ1kwKslHVWPEeDx+S66hoJflpEXx7X6fnlHxPpphgqFO/
         h3C05rZGvl3pcPeWGDdW7STBl/9pdjglYV893w7JtLZYdoe4/r4BWAVOzk5aMn6bCo
         q55de3qHMCljbL96lDQbIk48p70EK548hfDRrA2QM+ybC4CYxT4pmQ9y2Ru7kSbsVV
         pYS6GUBconpgw==
Date:   Wed, 13 Jan 2021 08:54:14 +0530
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
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] spi: spi-geni-qcom: Add support for GPI dma
Message-ID: <20210113032414.GY2771@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-5-vkoul@kernel.org>
 <CAD=FV=XmfpQXhK_tKor-ta+5dqT-aq7OnV1e=VY-vMuXmUQEfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XmfpQXhK_tKor-ta+5dqT-aq7OnV1e=VY-vMuXmUQEfQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12-01-21, 16:01, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jan 11, 2021 at 7:17 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > We can use GPI DMA for devices where it is enabled by firmware. Add
> > support for this mode
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/spi/spi-geni-qcom.c | 395 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 384 insertions(+), 11 deletions(-)
> 
> I did a somewhat cursory review, mostly focusing on making sure that
> the non-GPI/GSI stuff doesn't regress.  ;-)  I think you've already
> got a bunch of feedback for v2 so I'll plan to look back when I see
> the v2 and maybe will find time to look at some of the GSI/GPI stuff
> too...

Thanks for the comments, I will update the comments and post v2. All the
below comments look good to me, I will respin..


> > diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> > index 512e925d5ea4..5bb0e2192734 100644
> > --- a/drivers/spi/spi-geni-qcom.c
> > +++ b/drivers/spi/spi-geni-qcom.c
> > @@ -2,6 +2,8 @@
> >  // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
> >
> >  #include <linux/clk.h>
> > +#include <linux/dmaengine.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/log2.h>
> > @@ -10,6 +12,7 @@
> >  #include <linux/pm_opp.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/qcom-geni-se.h>
> > +#include <linux/dma/qcom-gpi-dma.h>
> 
> nit: sort ordering doesn't match other includes.  It seems like
> existing includes in this file are sorted ignoring subdirs.
> 
> 
> >  static int spi_geni_prepare_message(struct spi_master *spi,
> >                                         struct spi_message *spi_msg)
> >  {
> >         int ret;
> >         struct spi_geni_master *mas = spi_master_get_devdata(spi);
> > +       struct geni_se *se = &mas->se;
> > +
> > +       mas->cur_xfer_mode = get_xfer_mode(spi);
> > +
> > +       if (mas->cur_xfer_mode == GENI_SE_FIFO) {
> > +               geni_se_select_mode(se, GENI_SE_FIFO);
> 
> You don't need to do this over and over again.  We set up FIFO mode in
> spi_geni_init() and it'll never change.
> 
> 
> > +               reinit_completion(&mas->xfer_done);
> > +               ret = setup_fifo_params(spi_msg->spi, spi);
> > +               if (ret)
> > +                       dev_err(mas->dev, "Couldn't select mode %d\n", ret);
> > +
> > +       } else if (mas->cur_xfer_mode == GENI_GPI_DMA) {
> > +               mas->num_tx_eot = 0;
> > +               mas->num_rx_eot = 0;
> > +               mas->num_xfers = 0;
> > +               reinit_completion(&mas->tx_cb);
> > +               reinit_completion(&mas->rx_cb);
> > +               memset(mas->gsi, 0, (sizeof(struct spi_geni_gsi) * NUM_SPI_XFER));
> > +               geni_se_select_mode(se, GENI_GPI_DMA);
> > +               ret = spi_geni_map_buf(mas, spi_msg);
> > +
> 
> Extra blank line?
> 
> > +       } else {
> > +               dev_err(mas->dev, "%s: Couldn't select mode %d", __func__, mas->cur_xfer_mode);
> 
> Please no __func__ in error messages unless you're doing a non-"dev"
> print.  If you want to fill your log with function names you should
> redefine the generic dev_xxx() functions to prefix "__func__" in your
> own kernel.  You probably don't even need a printout here since
> get_xfer_mode() already printed.
> 
> 
> > +static int spi_geni_unprepare_message(struct spi_master *spi_mas, struct spi_message *spi_msg)
> > +{
> > +       struct spi_geni_master *mas = spi_master_get_devdata(spi_mas);
> > +
> > +       mas->cur_speed_hz = 0;
> > +       mas->cur_bits_per_word = 0;
> 
> I think doing the above zeros will make the code a bunch slower for
> FIFO mode.  Specifically we can avoid a whole bunch of (very slow)
> interconnect code if the speed doesn't change between transfers and
> the runtime PM auto power down hasn't hit.
> 
> 
> > @@ -328,8 +609,34 @@ static int spi_geni_init(struct spi_geni_master *mas)
> >         spi_tx_cfg &= ~CS_TOGGLE;
> >         writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
> >
> > +       mas->tx = dma_request_slave_channel(mas->dev, "tx");
> > +       if (IS_ERR_OR_NULL(mas->tx)) {
> 
> I didn't look too closely at this since I think Mark wanted you to
> look into the core DMA support, but...
> 
> In general, don't you only need to do the DMA requests if you're in GPI mode?
> 
> 
> > +               dev_err(mas->dev, "Failed to get tx DMA ch %ld", PTR_ERR(mas->tx));
> > +               ret = PTR_ERR(mas->tx);
> > +               goto out_pm;
> > +       } else {
> 
> No need for else since last "if" ended up with goto".
> 
> 
> > +               mas->rx = dma_request_slave_channel(mas->dev, "rx");
> > +               if (IS_ERR_OR_NULL(mas->rx)) {
> > +                       dev_err(mas->dev, "Failed to get rx DMA ch %ld", PTR_ERR(mas->rx));
> > +                       dma_release_channel(mas->tx);
> > +                       ret = PTR_ERR(mas->rx);
> > +                       goto out_pm;
> > +               }
> > +
> > +               gsi_sz = sizeof(struct spi_geni_gsi) * NUM_SPI_XFER;
> > +               mas->gsi = devm_kzalloc(mas->dev, gsi_sz, GFP_KERNEL);
> > +               if (IS_ERR_OR_NULL(mas->gsi)) {
> 
> Is it ever an error?  Just check against NULL?
> 
> 
> > +                       dma_release_channel(mas->tx);
> > +                       dma_release_channel(mas->rx);
> > +                       mas->tx = NULL;
> > +                       mas->rx = NULL;
> 
> ret = -ENOMEM ?
> 
> 
> >  static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
> > @@ -457,6 +765,11 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
> >                 len = xfer->len / (mas->cur_bits_per_word / BITS_PER_BYTE + 1);
> >         len &= TRANS_LEN_MSK;
> >
> > +       if (!xfer->cs_change) {
> > +               if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
> > +                       m_param |= FRAGMENTATION;
> > +       }
> 
> Why are you changing this?  It's for FIFO mode which works correctly
> the way it is.  We _always_ want the FRAGMENTATION bit set because we
> explicitly set the CS.  I haven't tried it, but I'd imagine this
> change breaks stuff?  I'd expect all changes in setup_fifo_xfer() to
> be removed from your patch.  If there's some reason you need them then
> post a separate patch.
> 
> 
> > @@ -494,13 +807,52 @@ static int spi_geni_transfer_one(struct spi_master *spi,
> >                                 struct spi_transfer *xfer)
> >  {
> >         struct spi_geni_master *mas = spi_master_get_devdata(spi);
> > +       unsigned long timeout, jiffies;
> 
> Doesn't this shadow the global "jiffies"?
> 
> 
> > +       int ret = 0i, i;
> >
> >         /* Terminate and return success for 0 byte length transfer */
> >         if (!xfer->len)
> > -               return 0;
> > +               return ret;
> 
> It feels more documenting to just leave this as "return 0".
> 
> 
> > +
> > +       if (mas->cur_xfer_mode == GENI_SE_FIFO) {
> > +               setup_fifo_xfer(xfer, mas, slv->mode, spi);
> 
> It's super important to return "1" in this case to tell the SPI core
> that you left the transfer in progress.  You don't do that anymore, so
> boom.
> 
> 
> > +       } else {
> > +               setup_gsi_xfer(xfer, mas, slv, spi);
> 
> This feels very non-symmetric.  In the FIFO case you just call a
> function.  in the GSI case you have a whole pile of stuff inline.  Can
> all the stuff below be stuck in setup_gsi_xfer() or maybe you can add
> an extra wrapper function?  That means you don't need the weird goto
> flow in this function...
> 
> > @@ -661,6 +1025,15 @@ static int spi_geni_probe(struct platform_device *pdev)
> >         if (ret)
> >                 goto spi_geni_probe_runtime_disable;
> >
> > +       /*
> > +        * query the mode supported and set_cs for fifo mode only
> > +        * for dma (gsi) mode, the gsi will set cs based on params passed in
> > +        * TRE
> > +        */
> > +       mas->cur_xfer_mode = get_xfer_mode(spi);
> > +       if (mas->cur_xfer_mode == GENI_SE_FIFO)
> 
> nit: check against != GPI mode?

-- 
~Vinod
