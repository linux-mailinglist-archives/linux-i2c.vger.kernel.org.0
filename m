Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225273A99D6
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jun 2021 14:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbhFPMEr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Jun 2021 08:04:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231769AbhFPMEq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Jun 2021 08:04:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9E616115C;
        Wed, 16 Jun 2021 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623844960;
        bh=r1XXnoZn4fycKBh7dG52yzkfQjPxg8rqCudLuUlkO0w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ufQCIBYc6+C+4lcsK3ToW4W0KxXEOgfj1j/mhK0EfTNFGcxlGWUVIN7e0i8Mtc7Cb
         GTnIQ6t3sgIU0i7U9H6TCAy9NabUFLvUE4ngOc747BcQ0QN8SrfeFuUqIzXxEyctWH
         p+3Gl9OFC7ERRJBgE+Z8oiY4MobL8SLCa2o0r4iaV8gCL1SxZNfIJlwk3Up1a4MJYK
         nuzBEH/DgIKRDaREcsgWn1ObE5bgCiJ/aKawV03R0I15/ByS1VqzLIsDLUlPn6azNb
         dyfe4cyDlyIFbx0ADu13WO1yYUxqZ503tE/5h+oPR9+NgpDDudLx0LqBXIax2vyajl
         ZngcUXbuEZQmA==
Date:   Wed, 16 Jun 2021 17:32:36 +0530
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
Message-ID: <YMnoXKAvL0461GRR@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-5-vkoul@kernel.org>
 <20210111163504.GD4728@sirena.org.uk>
 <YMm7ZWXnJyb8QT1u@vkoul-mobl>
 <20210616113505.GB6418@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616113505.GB6418@sirena.org.uk>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16-06-21, 12:35, Mark Brown wrote:
> On Wed, Jun 16, 2021 at 02:20:45PM +0530, Vinod Koul wrote:
> 
> > Looking at the code, that is ideal case. Only issue I can see is that
> > core DMA mapping device being used is incorrect. The core would use
> > ctlr->dev.parent which is the spi0 device here.
> 
> Why would the parent of the controller be a SPI device?

Sorry my bad, I meant the core use ctlr->dev.parent which in this case is
the SPI master device, 880000.spi

> > But in this case, that wont work. We have a parent qup device which is
> > the parent for both spi and dma device and needs to be used for
> > dma-mapping! 
> 
> > If we allow drivers to set dma mapping device and use that, then I can
> > reuse the core. Let me know if that is agreeable to you and I can hack
> > this up. Maybe add a new member in spi_controller which is filled by
> > drivers in can_dma() callback?
> 
> Possibly, I'd need to see the code.

Ok, let me do a prototype and share ...

Thanks
-- 
~Vinod
