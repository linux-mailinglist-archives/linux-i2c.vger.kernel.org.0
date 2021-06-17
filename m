Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8023AABC7
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jun 2021 08:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhFQGXH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Jun 2021 02:23:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:51524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhFQGXG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Jun 2021 02:23:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9D6B60FEA;
        Thu, 17 Jun 2021 06:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623910859;
        bh=57dsMicloxNOk1lyxm1iyNvezjRmT/zehpa8a/omzhY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dFt2djALGgzeWAZu+Dk2zJpX39bUyQPeCqO6YtdyHU7HLGuVBvBJzacgi/liSnitV
         O61ASU5ehkEC0aHKQjkcPLXw7EROtY140dw5GGXNAUAusxNX3jp0rjYmxX7dnNz6MO
         op8hoyy0aWGypOGFUsvVav8cO1NS8lbH1N1UsMWk/lEdnRgXGijCCIxUyGURAC1l4I
         Er5E9qY1Hf/4cXbDTlXdgPk6jEJln700T5ys6wL0nzIXvciKyobgL3BZK4rKfKiMJu
         qQ+B89er/JIrUg/rcTudzgtQCbC1IClZpuPsXz5h7K56AQl7caMOP4336TQ1lrDRpo
         vS3c3xVpY/3XA==
Date:   Thu, 17 Jun 2021 11:50:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] spi: spi-geni-qcom: Add support for GPI dma
Message-ID: <YMrpx7uK2pM4AwYh@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-5-vkoul@kernel.org>
 <20210111163504.GD4728@sirena.org.uk>
 <YMm7ZWXnJyb8QT1u@vkoul-mobl>
 <20210616113505.GB6418@sirena.org.uk>
 <YMnoXKAvL0461GRR@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMnoXKAvL0461GRR@vkoul-mobl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16-06-21, 17:32, Vinod Koul wrote:
> On 16-06-21, 12:35, Mark Brown wrote:
> > On Wed, Jun 16, 2021 at 02:20:45PM +0530, Vinod Koul wrote:
> > > But in this case, that wont work. We have a parent qup device which is
> > > the parent for both spi and dma device and needs to be used for
> > > dma-mapping! 
> > 
> > > If we allow drivers to set dma mapping device and use that, then I can
> > > reuse the core. Let me know if that is agreeable to you and I can hack
> > > this up. Maybe add a new member in spi_controller which is filled by
> > > drivers in can_dma() callback?
> > 
> > Possibly, I'd need to see the code.
> 
> Ok, let me do a prototype and share ...

So setting the dma_map_dev in the can_dma() callback does not work as we
would need device before we invoke can_dma(), so modified this to be set
earlier by driver (in driver probe, set the dma_map_dev) and use in
__spi_map_msg().

With this it works for me & I was able to get rid of driver mapping code

-- >8 --

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index e353b7a9e54e..315f7e7545f7 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -961,11 +961,15 @@ static int __spi_map_msg(struct spi_controller *ctlr, struct spi_message *msg)
 
 	if (ctlr->dma_tx)
 		tx_dev = ctlr->dma_tx->device->dev;
+	else if (ctlr->dma_map_dev)
+		tx_dev = ctlr->dma_map_dev;
 	else
 		tx_dev = ctlr->dev.parent;
 
 	if (ctlr->dma_rx)
 		rx_dev = ctlr->dma_rx->device->dev;
+	else if (ctlr->dma_map_dev)
+		rx_dev = ctlr->dma_map_dev;
 	else
 		rx_dev = ctlr->dev.parent;
 
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 74239d65c7fd..4d3f116f5723 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -586,6 +586,7 @@ struct spi_controller {
 	bool			(*can_dma)(struct spi_controller *ctlr,
 					   struct spi_device *spi,
 					   struct spi_transfer *xfer);
+	struct device *dma_map_dev;
 
 	/*
 	 * These hooks are for drivers that want to use the generic

-- 
~Vinod
