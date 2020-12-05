Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0722CFCFA
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Dec 2020 19:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbgLEST1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Dec 2020 13:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgLERsl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Dec 2020 12:48:41 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B168C02A180;
        Sat,  5 Dec 2020 08:29:35 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id cm17so9151843edb.4;
        Sat, 05 Dec 2020 08:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WQqtIew8z+9SUipnxpDKUsTvv38hqnp7W7iU0a6e5Fs=;
        b=GV4VZYw1USsEYDmt5Ru/pQcKr7T1UdSSpOCBRlAbP8QAhwwu0CCMLyCzFJ18XKNPgm
         r9M7/ySC7rbc3yLT9G2f74xyA5WKGxwwtn7UdHmYHS76B03NBCVaKuYWAWtROMHc2KG1
         txGa81sd1BgTrMOYlJN+gM95NaHFz5+lz5cvr65mR4BiXh496tEM3I6rRbZsTGNBK5JP
         fApOzjOMkYrZExucX0Cbrap3P8wVXINi7foxYpM4EZTh1trCPDs9sQ7NLjLOYMKcrhg7
         m0XBIWLuxQnsqyHIElyT5I8gCk9b+p4Jmz2FS4OgqlazTrXVmskWhY361EyiRqiUiJkj
         PuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WQqtIew8z+9SUipnxpDKUsTvv38hqnp7W7iU0a6e5Fs=;
        b=nhEQI0Eb1Dh1exdHxlw2WnrHI9ZcaQV0kiUHV4sgNQ8Kk1nbSOduY4qGVQhFhRDtZ+
         L/ZMC2Cszi/kUoLAQE/TBtMANSixotQPFpyw8sM0EBZrnSKz5DVZUfKVFjQx33LbY2Qh
         S3ZacZ0dQtLj77r2SqquZjbXm4eFh3EFy1y4eCjIIR6XN3fdKJYLSj1obl7PTwLqvOyJ
         V7YuATxBVpIUDe3RmLHTAGHhIAzP/Rgp4LX4SQUFjVoyJli/aD688av+V5hvvPjPP8c7
         JINvynoqWIg2ZVCwjAiRmwoSgAyU4eWVTrJ/0l2R9dE+3kh18XuQpTeX7LzN+tclT48i
         VUcw==
X-Gm-Message-State: AOAM531ENOTwSmMc7hlcXTmgx1GY4o84trTUn+AlHBEBIp+CQEBsw7jg
        0EQZBWl8QILbkII/i1E+2tE=
X-Google-Smtp-Source: ABdhPJxHhxyTbkf8AeKc304pFq3fBp8Q+sg3EtAFKXfOlBuOEWGoJ+qCdATY9KOgo5nUYvxo7zkm1g==
X-Received: by 2002:aa7:c403:: with SMTP id j3mr12538643edq.217.1607185774251;
        Sat, 05 Dec 2020 08:29:34 -0800 (PST)
Received: from ubuntu2004 ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id v9sm5438858ejk.48.2020.12.05.08.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 08:29:33 -0800 (PST)
Date:   Sat, 5 Dec 2020 18:29:33 +0200
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dan Williams <dan.j.williams@intel.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH v2 00/18] Add CMU/RMU/DMA/MMC/I2C support for Actions
 Semi S500 SoCs
Message-ID: <20201205162933.GA187065@ubuntu2004>
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
 <20201205061115.GB4068@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205061115.GB4068@thinkpad>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mani,

On Sat, Dec 05, 2020 at 11:41:15AM +0530, Manivannan Sadhasivam wrote:
> Hi Cristi,
> 
> On Fri, Nov 20, 2020 at 01:55:54AM +0200, Cristian Ciocaltea wrote:
> > Hi,
> > 
> > This patchset brings a series of improvements for the Actions Semi S500
> > SoCs family, by adding support for Clock & Reset Management Units, DMA,
> > MMC, I2C & SIRQ controllers.
> > 
> > Please note the patches consist mostly of DTS and bindings/compatibles
> > changes, since all the work they depend on has been already merged,
> > i.e. clock fixes/additions, pinctrl driver, sirq driver.
> > 
> > For the moment, I have only enabled the features I could test on
> > RoseapplePi SBC.
> > 
> 
> I was hoping to apply this series for v5.11 but we ran out of time. So expect
> this series to be in v5.12.

No problem, thanks a lot for taking care of this!

Kind regards,
Cristi

> Thanks,
> Mani
> 
> > Thanks,
> > Cristi
> > 
> > Changes in v2:
> > - Added new bindings/compatibles for S500 DMA, MMC & I2C controllers
> > - Added support for the SIRQ controller
> > - Added new entries in MAINTAINERS
> > - Updated naming of some patches in v1
> > 
> > Cristian Ciocaltea (18):
> >   arm: dts: owl-s500: Add Clock Management Unit
> >   arm: dts: owl-s500: Set CMU clocks for UARTs
> >   arm: dts: owl-s500: Add Reset controller
> >   dt-bindings: dma: owl: Add compatible string for Actions Semi S500 SoC
> >   dmaengine: owl: Add compatible for the Actions Semi S500 DMA
> >     controller
> >   arm: dts: owl-s500: Add DMA controller
> >   arm: dts: owl-s500: Add pinctrl & GPIO support
> >   dt-bindings: mmc: owl: Add compatible string for Actions Semi S500 SoC
> >   arm: dts: owl-s500: Add MMC support
> >   dt-bindings: i2c: owl: Convert Actions Semi Owl binding to a schema
> >   MAINTAINERS: Update entry for Actions Semi Owl I2C binding
> >   i2c: owl: Add compatible for the Actions Semi S500 I2C controller
> >   arm: dts: owl-s500: Add I2C support
> >   arm: dts: owl-s500: Add SIRQ controller
> >   arm: dts: owl-s500-roseapplepi: Use UART clock from CMU
> >   arm: dts: owl-s500-roseapplepi: Add uSD support
> >   arm: dts: owl-s500-roseapplepi: Add I2C pinctrl configuration
> >   MAINTAINERS: Add linux-actions ML for Actions Semi Arch
> > 
> >  .../devicetree/bindings/dma/owl-dma.yaml      |   5 +-
> >  .../devicetree/bindings/i2c/i2c-owl.txt       |  29 ----
> >  .../devicetree/bindings/i2c/i2c-owl.yaml      |  62 ++++++++
> >  .../devicetree/bindings/mmc/owl-mmc.yaml      |   4 +-
> >  MAINTAINERS                                   |   3 +-
> >  arch/arm/boot/dts/owl-s500-roseapplepi.dts    |  97 +++++++++++-
> >  arch/arm/boot/dts/owl-s500.dtsi               | 140 ++++++++++++++++++
> >  drivers/dma/owl-dma.c                         |   1 +
> >  drivers/i2c/busses/i2c-owl.c                  |   1 +
> >  9 files changed, 304 insertions(+), 38 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.txt
> >  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.yaml
> > 
> > -- 
> > 2.29.2
> > 
