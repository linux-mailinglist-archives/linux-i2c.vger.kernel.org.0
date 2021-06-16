Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA5F3A954C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Jun 2021 10:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbhFPIwz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Jun 2021 04:52:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:44154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231318AbhFPIwz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 16 Jun 2021 04:52:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90DE86115B;
        Wed, 16 Jun 2021 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623833449;
        bh=0RiZqdL/N3p9wsukY1cKqE3It2WhUjFIue2G+sKSwRs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o5D1UmSsCdG/nTX7zN1ZUAxjBIyR9Pug2ZB9dETlxGKdoU2Z87qMz18bljY/QR0FC
         kk7+pbZby6Clz/OSqx/Yl4EdKRcX7WnneW0pSgcCYK7A7NSDpFPOtY0IckVfFlrKLQ
         wqsd+YD0lg7u1WiCCb59eBau9fEzxPURFODhVymLMFTJnYEeHqcBS82IcC4Ruunr9R
         nJcp0nNynW98it74rzdjKnAxmZqn8Hc3cPkBBCq8RvdRPC6tBRRy5IkN7cDAhNJcA0
         x+4N6zN7rnRr/CVG2+7eQZStuZV8befS2yEg3meSa8PLY/1SAal2i/C58Dd7a0CPVZ
         brZY5465JG81A==
Date:   Wed, 16 Jun 2021 14:20:45 +0530
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
Message-ID: <YMm7ZWXnJyb8QT1u@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-5-vkoul@kernel.org>
 <20210111163504.GD4728@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111163504.GD4728@sirena.org.uk>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mark,

On 11-01-21, 16:35, Mark Brown wrote:
> On Mon, Jan 11, 2021 at 08:46:48PM +0530, Vinod Koul wrote:
> 
> > +static int get_xfer_mode(struct spi_master *spi)
> > +{
> > +	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> > +	struct geni_se *se = &mas->se;
> > +	int mode = GENI_SE_FIFO;
> 
> Why not use the core DMA mapping support?

Sorry I seemed to have missed replying to this one.

Looking at the code, that is ideal case. Only issue I can see is that
core DMA mapping device being used is incorrect. The core would use
ctlr->dev.parent which is the spi0 device here.

But in this case, that wont work. We have a parent qup device which is
the parent for both spi and dma device and needs to be used for
dma-mapping! 

If we allow drivers to set dma mapping device and use that, then I can
reuse the core. Let me know if that is agreeable to you and I can hack
this up. Maybe add a new member in spi_controller which is filled by
drivers in can_dma() callback?

Thanks
-- 
~Vinod
