Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487AC2F4237
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jan 2021 04:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbhAMDEU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 22:04:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:43928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728722AbhAMDET (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 Jan 2021 22:04:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E022923132;
        Wed, 13 Jan 2021 03:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610507019;
        bh=Lb24rQrKobyTU7A/TU/jdr6OZKSzLpDca0GkNO8kDnI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jPTmRs+lvTvzIyhdI94vZd+ttqxTP5Jz129r0rQnL/9e6DyGCnqjJgOitPc+9ImbU
         6h82quHxRePvuryNqcC4SXZjhdjDD6q8OI/aPtvGDOPOGb4lf8RuJ1SBcwwaLOon4a
         pwSAq8m6YfyuprW6Qf8K8xdMNupn3xX8FpEmzegnxmKo69FE0JK1lRrHayX2DW/OyR
         c/EWEDRGxtAeOH5cI4zy4hUmsDjdi6NovCgQ/q3B0lwmz+Vyc+HxZ5u77f0RgIW6N9
         WWflhDvfUkTnfRteSgw63pdXjDnbrD1xpGmke2M699RVJv7a899G2Wx8VDlCzJujsW
         fu9gpKF5dkLjw==
Date:   Wed, 13 Jan 2021 08:33:33 +0530
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
Subject: Re: [PATCH 0/7] Add and enable GPI DMA users
Message-ID: <20210113030333.GV2771@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <CAD=FV=XvgP5j3ikCnr2zDptFbWPRQhGGQotqyFGmN7NWNP8knA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XvgP5j3ikCnr2zDptFbWPRQhGGQotqyFGmN7NWNP8knA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Doug,

On 12-01-21, 16:01, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jan 11, 2021 at 7:17 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > Hello,
> >
> > This series add the GPI DMA in qcom geni spi and i2c drivers. For this we
> > first need to move GENI_IF_DISABLE_RO and struct geni_wrapper to common
> > headers and then add support for gpi dma in geni driver.
> >
> > Then we add spi and i2c geni driver changes to support this DMA.
> >
> > Lastly, add the GPI dma nodes and enable dma for spi found in Rb3 board.
> >
> > To merge this, we could merge all thru qcom tree with ack on spi/i2c.
> 
> It'd be super great if somewhere (ideally in the commit message and
> maybe somewhere in the code) you could talk more about the different
> modes.  Maybe something like this (if it's correct):
> 
> GPI Mode (confusingly, also known as "GSI" mode in some places): In
> this mode something else running on the SoC is sharing access to the
> geni instance.  This mode allows sharing the device between the Linux
> kernel and other users including handling the fact that other users
> might be running the geni port at a different clock rate.  GPI mode
> limits what you can do with a port.  For instance, direct control of
> chip select is not allowed.  NOTE: if firmware has configured a geni
> instance for GPI then FIFO and SE_DMA usage is not allowed.
> Conversely, if firmware has not configured a geni instance for GPI
> then only FIFO and SE_DMA usage is allowed.
> 
> SE DMA Mode: Data transfers happen over DMA.
> 
> SE FIFO Mode: Data is manually transferred into the FIFO by the CPU.

I think it is a good feedback, there is indeed bunch of confusion wrt
QUP DMA and i think we should add above to qcom geni driver and not just
in cover letter. FWIW for all practical purposes GSI and GPI can be used
interchangeably. There are some nuisances involved like firmware and a
microcontroller but for the sake of simplicity we can skip that :)

Thanks
-- 
~Vinod
