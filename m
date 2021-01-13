Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B4E2F40CC
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jan 2021 01:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392358AbhAMAnI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 19:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392079AbhAMACP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 19:02:15 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB394C061575
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 16:01:34 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id u7so150997vsg.11
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 16:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gfg+2keY06YZ/nx+eb2Z99bZR0RVYNOSVsua7Gb4moA=;
        b=B+wv9FJSTXj8xIq83DoHItpz41AE9YM0wq5yOyeovHKGBNQjHVj+oWO6ZhjerMllRa
         KBug0H5JNGNHwwCUwnxZO5N5diJc71qpHxNw+kMfIJc51XF6Y/bhNtC0DkA7FG5WtnW9
         HpzWgT2DdTkLfxXg/Q6xi0XYG2KssKpVFgNyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gfg+2keY06YZ/nx+eb2Z99bZR0RVYNOSVsua7Gb4moA=;
        b=MDTybLsoRWTg7teIl8a+0EMHal6asPfKbGEa+aePEb4nr0/uNPQHsNctr9yHTrKUMJ
         /AeXE2Ap3G7X/QlY7CabWMxu6hv//ILJduA6Y83ZqEQRkydgvxJ4nPouJCubwvpLfLaF
         Ua9JHRxx7OT2ZLujC+IMW3dSIFRg6u2NFzpIwqqxtnxypPOW5O1ZMoB22XtZcTpviwM+
         BVKsVF+AhczvEXx+xdUBOiOkypwNfy9x0GbQSAp9NSRO41mxnIQTOVfU0AWX7A2oPZQI
         JOKKDNH7dRyabChEKPgpwMyiyMunDkd2UGr2quDPMDLh9sUtXlhkzeUjNHPO4GjbichC
         3J+A==
X-Gm-Message-State: AOAM531/Dy0iR3t/DCTVzNik02DnCOztxO88cngOPxA6ihUpfrLkfZIJ
        L1miGpQk9zPN45FjAG6Bl1ToNC6RjkVb7g==
X-Google-Smtp-Source: ABdhPJxoUlVwYLN018DcGQHhn19J2vYc60UZcoiJ9faQH40IzB5F5OgrcP7eoVeVEO3i1febQI0mGw==
X-Received: by 2002:a05:6102:2413:: with SMTP id j19mr2124664vsi.17.1610496093330;
        Tue, 12 Jan 2021 16:01:33 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id c10sm27368vsq.1.2021.01.12.16.01.31
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 16:01:31 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id h18so160096vsg.8
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jan 2021 16:01:31 -0800 (PST)
X-Received: by 2002:a67:e286:: with SMTP id g6mr1897886vsf.42.1610496091010;
 Tue, 12 Jan 2021 16:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20210111151651.1616813-1-vkoul@kernel.org> <20210111151651.1616813-5-vkoul@kernel.org>
In-Reply-To: <20210111151651.1616813-5-vkoul@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 12 Jan 2021 16:01:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XmfpQXhK_tKor-ta+5dqT-aq7OnV1e=VY-vMuXmUQEfQ@mail.gmail.com>
Message-ID: <CAD=FV=XmfpQXhK_tKor-ta+5dqT-aq7OnV1e=VY-vMuXmUQEfQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] spi: spi-geni-qcom: Add support for GPI dma
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi <linux-spi@vger.kernel.org>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Mon, Jan 11, 2021 at 7:17 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> We can use GPI DMA for devices where it is enabled by firmware. Add
> support for this mode
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/spi/spi-geni-qcom.c | 395 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 384 insertions(+), 11 deletions(-)

I did a somewhat cursory review, mostly focusing on making sure that
the non-GPI/GSI stuff doesn't regress.  ;-)  I think you've already
got a bunch of feedback for v2 so I'll plan to look back when I see
the v2 and maybe will find time to look at some of the GSI/GPI stuff
too...


> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 512e925d5ea4..5bb0e2192734 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -2,6 +2,8 @@
>  // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
>
>  #include <linux/clk.h>
> +#include <linux/dmaengine.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/log2.h>
> @@ -10,6 +12,7 @@
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/qcom-geni-se.h>
> +#include <linux/dma/qcom-gpi-dma.h>

nit: sort ordering doesn't match other includes.  It seems like
existing includes in this file are sorted ignoring subdirs.


>  static int spi_geni_prepare_message(struct spi_master *spi,
>                                         struct spi_message *spi_msg)
>  {
>         int ret;
>         struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +       struct geni_se *se = &mas->se;
> +
> +       mas->cur_xfer_mode = get_xfer_mode(spi);
> +
> +       if (mas->cur_xfer_mode == GENI_SE_FIFO) {
> +               geni_se_select_mode(se, GENI_SE_FIFO);

You don't need to do this over and over again.  We set up FIFO mode in
spi_geni_init() and it'll never change.


> +               reinit_completion(&mas->xfer_done);
> +               ret = setup_fifo_params(spi_msg->spi, spi);
> +               if (ret)
> +                       dev_err(mas->dev, "Couldn't select mode %d\n", ret);
> +
> +       } else if (mas->cur_xfer_mode == GENI_GPI_DMA) {
> +               mas->num_tx_eot = 0;
> +               mas->num_rx_eot = 0;
> +               mas->num_xfers = 0;
> +               reinit_completion(&mas->tx_cb);
> +               reinit_completion(&mas->rx_cb);
> +               memset(mas->gsi, 0, (sizeof(struct spi_geni_gsi) * NUM_SPI_XFER));
> +               geni_se_select_mode(se, GENI_GPI_DMA);
> +               ret = spi_geni_map_buf(mas, spi_msg);
> +

Extra blank line?

> +       } else {
> +               dev_err(mas->dev, "%s: Couldn't select mode %d", __func__, mas->cur_xfer_mode);

Please no __func__ in error messages unless you're doing a non-"dev"
print.  If you want to fill your log with function names you should
redefine the generic dev_xxx() functions to prefix "__func__" in your
own kernel.  You probably don't even need a printout here since
get_xfer_mode() already printed.


> +static int spi_geni_unprepare_message(struct spi_master *spi_mas, struct spi_message *spi_msg)
> +{
> +       struct spi_geni_master *mas = spi_master_get_devdata(spi_mas);
> +
> +       mas->cur_speed_hz = 0;
> +       mas->cur_bits_per_word = 0;

I think doing the above zeros will make the code a bunch slower for
FIFO mode.  Specifically we can avoid a whole bunch of (very slow)
interconnect code if the speed doesn't change between transfers and
the runtime PM auto power down hasn't hit.


> @@ -328,8 +609,34 @@ static int spi_geni_init(struct spi_geni_master *mas)
>         spi_tx_cfg &= ~CS_TOGGLE;
>         writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
>
> +       mas->tx = dma_request_slave_channel(mas->dev, "tx");
> +       if (IS_ERR_OR_NULL(mas->tx)) {

I didn't look too closely at this since I think Mark wanted you to
look into the core DMA support, but...

In general, don't you only need to do the DMA requests if you're in GPI mode?


> +               dev_err(mas->dev, "Failed to get tx DMA ch %ld", PTR_ERR(mas->tx));
> +               ret = PTR_ERR(mas->tx);
> +               goto out_pm;
> +       } else {

No need for else since last "if" ended up with goto".


> +               mas->rx = dma_request_slave_channel(mas->dev, "rx");
> +               if (IS_ERR_OR_NULL(mas->rx)) {
> +                       dev_err(mas->dev, "Failed to get rx DMA ch %ld", PTR_ERR(mas->rx));
> +                       dma_release_channel(mas->tx);
> +                       ret = PTR_ERR(mas->rx);
> +                       goto out_pm;
> +               }
> +
> +               gsi_sz = sizeof(struct spi_geni_gsi) * NUM_SPI_XFER;
> +               mas->gsi = devm_kzalloc(mas->dev, gsi_sz, GFP_KERNEL);
> +               if (IS_ERR_OR_NULL(mas->gsi)) {

Is it ever an error?  Just check against NULL?


> +                       dma_release_channel(mas->tx);
> +                       dma_release_channel(mas->rx);
> +                       mas->tx = NULL;
> +                       mas->rx = NULL;

ret = -ENOMEM ?


>  static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
> @@ -457,6 +765,11 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
>                 len = xfer->len / (mas->cur_bits_per_word / BITS_PER_BYTE + 1);
>         len &= TRANS_LEN_MSK;
>
> +       if (!xfer->cs_change) {
> +               if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
> +                       m_param |= FRAGMENTATION;
> +       }

Why are you changing this?  It's for FIFO mode which works correctly
the way it is.  We _always_ want the FRAGMENTATION bit set because we
explicitly set the CS.  I haven't tried it, but I'd imagine this
change breaks stuff?  I'd expect all changes in setup_fifo_xfer() to
be removed from your patch.  If there's some reason you need them then
post a separate patch.


> @@ -494,13 +807,52 @@ static int spi_geni_transfer_one(struct spi_master *spi,
>                                 struct spi_transfer *xfer)
>  {
>         struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +       unsigned long timeout, jiffies;

Doesn't this shadow the global "jiffies"?


> +       int ret = 0i, i;
>
>         /* Terminate and return success for 0 byte length transfer */
>         if (!xfer->len)
> -               return 0;
> +               return ret;

It feels more documenting to just leave this as "return 0".


> +
> +       if (mas->cur_xfer_mode == GENI_SE_FIFO) {
> +               setup_fifo_xfer(xfer, mas, slv->mode, spi);

It's super important to return "1" in this case to tell the SPI core
that you left the transfer in progress.  You don't do that anymore, so
boom.


> +       } else {
> +               setup_gsi_xfer(xfer, mas, slv, spi);

This feels very non-symmetric.  In the FIFO case you just call a
function.  in the GSI case you have a whole pile of stuff inline.  Can
all the stuff below be stuck in setup_gsi_xfer() or maybe you can add
an extra wrapper function?  That means you don't need the weird goto
flow in this function...

> @@ -661,6 +1025,15 @@ static int spi_geni_probe(struct platform_device *pdev)
>         if (ret)
>                 goto spi_geni_probe_runtime_disable;
>
> +       /*
> +        * query the mode supported and set_cs for fifo mode only
> +        * for dma (gsi) mode, the gsi will set cs based on params passed in
> +        * TRE
> +        */
> +       mas->cur_xfer_mode = get_xfer_mode(spi);
> +       if (mas->cur_xfer_mode == GENI_SE_FIFO)

nit: check against != GPI mode?
