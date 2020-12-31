Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4F92E7EE5
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Dec 2020 10:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgLaJMj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Dec 2020 04:12:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgLaJMj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Dec 2020 04:12:39 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BD3C061573;
        Thu, 31 Dec 2020 01:11:58 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id cw27so17690438edb.5;
        Thu, 31 Dec 2020 01:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3V6f5iJoHmPBeBDPTmV70Z/7kJqb/KNhqGJIIlNMbpE=;
        b=q8eZ8MRiVntPruz75x2DlDeQWsbAz8y++8mspPKrbvqneDliKgzIcX/WILl1QFBlCn
         jh/TJD6uwO/WnbvpI75gFJp9+QYZb+40g1ZoMt/ILAO6TamSOKQVPhs/neoaG0F+IBTF
         nZf3qMqkdWLzvid1OSCobWcrGFRtFBfieNqty0GKP5H7Wc4wCgXfHia0zFtM4d1DvTbZ
         ZD5ro4ekALfZKE3FFh7nFL+V7NStksYSwgMAWeHmX4y3SlvliGd4V0aMZsg5A7dsRD+N
         pLLUovukLYurtHiJe/qAz45rioV787h1hfecghFpniEO0SVoosPRuSOajy1Ye/D1tbaA
         ypUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3V6f5iJoHmPBeBDPTmV70Z/7kJqb/KNhqGJIIlNMbpE=;
        b=kk8HXn3ueKud8WuoYRoOAzzEaVCnqN5o+1CD0BbAMR1c9DQvVumwsY1/KUcRv04zoh
         49UInz/ymMPj9Se5rXW8IOhotzDai0+OB7xck/peOkFATQJdhRufmwYLtKBC8BBDzGeU
         oLVT5miw660sM/CuagDegE57m3RWlsLte4mj7J1iCWOCldqbJPFUgwfNkCrvUJUEy4qs
         PZawvWxvenhSEMwrjL9Fjj+y8d5J5bnosXqfZd5xOOAGFDXvgmht8ur8sb5cjk2mDNO/
         2zwhFLMYxRGONDW0wY0dWG/ZpAnCCKUhLxVUWfnK/ID1LqSM6w+dpZ6zjzK1Z0t5Wdah
         eiZw==
X-Gm-Message-State: AOAM530GGLMedY6KtUPBd+Hq+QG+p1nRoLfMP9FfaSg0HKfmvIkbF/Vr
        FWb7UIjUAKWGQqkA4mWkOxs=
X-Google-Smtp-Source: ABdhPJzF1ZKXMthkfRNMx0sRVA51tAQGTfW4+hoSTfcEu8H92dFrGFD9E0c/eUEfA9sk5IqwPcHlcg==
X-Received: by 2002:a05:6402:2074:: with SMTP id bd20mr609736edb.326.1609405917523;
        Thu, 31 Dec 2020 01:11:57 -0800 (PST)
Received: from ubuntu2004 ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id ch30sm39779630edb.8.2020.12.31.01.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Dec 2020 01:11:56 -0800 (PST)
Date:   Thu, 31 Dec 2020 11:12:02 +0200
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Korsgaard <peter@korsgaard.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH v3 00/13] Add CMU/RMU/DMA/MMC/I2C support for Actions Semi
Message-ID: <20201231091202.GB916001@ubuntu2004>
References: <cover.1609263738.git.cristian.ciocaltea@gmail.com>
 <20201231075435.GG7345@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201231075435.GG7345@thinkpad>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 31, 2020 at 01:24:35PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Dec 29, 2020 at 11:17:15PM +0200, Cristian Ciocaltea wrote:
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
> Applied all patches except the 2 dmaengine patches for v5.12. Andreas, please
> let me know if you want to do the PR this time. Else I'll proceed.

Thank you, Mani!
The dmaengine patches should be picked up by Vinod, right?

> Thanks,
> Mani
> 
> > Thanks,
> > Cristi
> > 
> > Changes in v3:
> > - Squashed 'arm: dts: owl-s500-roseapplepi: Use UART clock from CMU' with
> >   'arm: dts: owl-s500: Set CMU clocks for UARTs', according to Mani's review
> > - Rebased series on v5.11-rc1 and dropped the already merged patches:
> >  * dt-bindings: mmc: owl: Add compatible string for Actions Semi S500 SoC
> >  * dt-bindings: i2c: owl: Convert Actions Semi Owl binding to a schema
> >  * MAINTAINERS: Update entry for Actions Semi Owl I2C binding
> >  * i2c: owl: Add compatible for the Actions Semi S500 I2C controller
> > 
> > Changes in v2:
> > - Added new bindings/compatibles for S500 DMA, MMC & I2C controllers
> > - Added support for the SIRQ controller
> > - Added new entries in MAINTAINERS
> > - Updated naming of some patches in v1
> > 
> > Cristian Ciocaltea (13):
> >   arm: dts: owl-s500: Add Clock Management Unit
> >   arm: dts: owl-s500: Set CMU clocks for UARTs
> >   arm: dts: owl-s500: Add Reset controller
> >   dt-bindings: dma: owl: Add compatible string for Actions Semi S500 SoC
> >   dmaengine: owl: Add compatible for the Actions Semi S500 DMA
> >     controller
> >   arm: dts: owl-s500: Add DMA controller
> >   arm: dts: owl-s500: Add pinctrl & GPIO support
> >   arm: dts: owl-s500: Add MMC support
> >   arm: dts: owl-s500: Add I2C support
> >   arm: dts: owl-s500: Add SIRQ controller
> >   arm: dts: owl-s500-roseapplepi: Add uSD support
> >   arm: dts: owl-s500-roseapplepi: Add I2C pinctrl configuration
> >   MAINTAINERS: Add linux-actions ML for Actions Semi Arch
> > 
> >  .../devicetree/bindings/dma/owl-dma.yaml      |   7 +-
> >  MAINTAINERS                                   |   1 +
> >  arch/arm/boot/dts/owl-s500-cubieboard6.dts    |   7 -
> >  .../arm/boot/dts/owl-s500-guitar-bb-rev-b.dts |   7 -
> >  .../arm/boot/dts/owl-s500-labrador-base-m.dts |   7 -
> >  arch/arm/boot/dts/owl-s500-roseapplepi.dts    |  97 +++++++++++-
> >  arch/arm/boot/dts/owl-s500-sparky.dts         |   7 -
> >  arch/arm/boot/dts/owl-s500.dtsi               | 140 ++++++++++++++++++
> >  drivers/dma/owl-dma.c                         |   3 +-
> >  9 files changed, 239 insertions(+), 37 deletions(-)
> > 
> > -- 
> > 2.30.0
> > 
