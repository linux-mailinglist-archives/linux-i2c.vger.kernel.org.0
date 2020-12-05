Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21632CF9F7
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Dec 2020 07:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbgLEGMH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Dec 2020 01:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgLEGMH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Dec 2020 01:12:07 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA85CC0613D1
        for <linux-i2c@vger.kernel.org>; Fri,  4 Dec 2020 22:11:26 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id j1so4361086pld.3
        for <linux-i2c@vger.kernel.org>; Fri, 04 Dec 2020 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=D7AczkzMwnCTqGNk/WinEN4GxDXh0TBrfFJyaIs9yxY=;
        b=W6xJPGENxbezmkuhhtaWZSnVB8iblzBFz/ZlCgViToQq/1fJIkWo7hIZ6s89WkKvom
         fKZ1/KGgHcS6ZuRfbmQebsZHKpdk2DSAJVlITgghsbHI0FWR7kMbuabZvjrU3pAT2Uql
         k4hJtbP6tyfLVhUOe3VPtfnV1ln245JCCOPFNJRGPu3v6uzh2kuyBQeFvABGJfzt9NBw
         9By5QUj73eF6+qeQLjlh+Nc8Ya+chlN4VLJXwdHM+vJqOJuZcpcHMiXUgyUQuk4w00b5
         zTDoZia8oFImOhBVf3eAcExH7pekUIWZ/4NPjIKRyo5rF02BDVOFEBJYBXVIUshvK0j6
         LzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D7AczkzMwnCTqGNk/WinEN4GxDXh0TBrfFJyaIs9yxY=;
        b=MrKTgdsdcZb/4sKOky3Loj+2++JYbwYudDgdToP7ELPT7mJMZ6Vq6IJzyN1D0DXQ1+
         rbJSSQNDC6qru+YquPQ2bNhc/u9knxQNRbDQi3hR+GXJ6hYndmYRU2xDAjqPdCiKpvd5
         N9eM7YC2YzNjGWay4gAqAqNKxXsPaQYJWyL92CTqd54PY2fOAIBrr01INrnEfX+luIW5
         cxOA90wh/+vU4pBa0pRToFryekFEeooLGKVGaEsxzsrBZX6sba6Rjv0QMCKOJsa83zEu
         tGat5BHJjEKDTODY6rjKSDfq5Wj4NBejaIm63Qecuk1G6+ItURaxl2bQFHZN2KZe7hR4
         DYIg==
X-Gm-Message-State: AOAM530JI5AmBm8FiDI3+92Es5OcYodlqehANlRD1lMPkS9w7qxeQQ8t
        1VYVXjvLLeiL0mDAV9fj5/TX
X-Google-Smtp-Source: ABdhPJzvEXQ4h/j2yTz8qIDNrIHGaz8TRTASTCZ9h+hLDXfffPdy21Bc34vKlGOcvRYRYnuIk6pB4w==
X-Received: by 2002:a17:90a:7e95:: with SMTP id j21mr7373400pjl.217.1607148686216;
        Fri, 04 Dec 2020 22:11:26 -0800 (PST)
Received: from thinkpad ([2409:4072:648e:8bd1:74b2:a4d8:e3fe:225b])
        by smtp.gmail.com with ESMTPSA id q23sm6915493pfg.18.2020.12.04.22.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 22:11:25 -0800 (PST)
Date:   Sat, 5 Dec 2020 11:41:15 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
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
Message-ID: <20201205061115.GB4068@thinkpad>
References: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605823502.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Cristi,

On Fri, Nov 20, 2020 at 01:55:54AM +0200, Cristian Ciocaltea wrote:
> Hi,
> 
> This patchset brings a series of improvements for the Actions Semi S500
> SoCs family, by adding support for Clock & Reset Management Units, DMA,
> MMC, I2C & SIRQ controllers.
> 
> Please note the patches consist mostly of DTS and bindings/compatibles
> changes, since all the work they depend on has been already merged,
> i.e. clock fixes/additions, pinctrl driver, sirq driver.
> 
> For the moment, I have only enabled the features I could test on
> RoseapplePi SBC.
> 

I was hoping to apply this series for v5.11 but we ran out of time. So expect
this series to be in v5.12.

Thanks,
Mani

> Thanks,
> Cristi
> 
> Changes in v2:
> - Added new bindings/compatibles for S500 DMA, MMC & I2C controllers
> - Added support for the SIRQ controller
> - Added new entries in MAINTAINERS
> - Updated naming of some patches in v1
> 
> Cristian Ciocaltea (18):
>   arm: dts: owl-s500: Add Clock Management Unit
>   arm: dts: owl-s500: Set CMU clocks for UARTs
>   arm: dts: owl-s500: Add Reset controller
>   dt-bindings: dma: owl: Add compatible string for Actions Semi S500 SoC
>   dmaengine: owl: Add compatible for the Actions Semi S500 DMA
>     controller
>   arm: dts: owl-s500: Add DMA controller
>   arm: dts: owl-s500: Add pinctrl & GPIO support
>   dt-bindings: mmc: owl: Add compatible string for Actions Semi S500 SoC
>   arm: dts: owl-s500: Add MMC support
>   dt-bindings: i2c: owl: Convert Actions Semi Owl binding to a schema
>   MAINTAINERS: Update entry for Actions Semi Owl I2C binding
>   i2c: owl: Add compatible for the Actions Semi S500 I2C controller
>   arm: dts: owl-s500: Add I2C support
>   arm: dts: owl-s500: Add SIRQ controller
>   arm: dts: owl-s500-roseapplepi: Use UART clock from CMU
>   arm: dts: owl-s500-roseapplepi: Add uSD support
>   arm: dts: owl-s500-roseapplepi: Add I2C pinctrl configuration
>   MAINTAINERS: Add linux-actions ML for Actions Semi Arch
> 
>  .../devicetree/bindings/dma/owl-dma.yaml      |   5 +-
>  .../devicetree/bindings/i2c/i2c-owl.txt       |  29 ----
>  .../devicetree/bindings/i2c/i2c-owl.yaml      |  62 ++++++++
>  .../devicetree/bindings/mmc/owl-mmc.yaml      |   4 +-
>  MAINTAINERS                                   |   3 +-
>  arch/arm/boot/dts/owl-s500-roseapplepi.dts    |  97 +++++++++++-
>  arch/arm/boot/dts/owl-s500.dtsi               | 140 ++++++++++++++++++
>  drivers/dma/owl-dma.c                         |   1 +
>  drivers/i2c/busses/i2c-owl.c                  |   1 +
>  9 files changed, 304 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-owl.yaml
> 
> -- 
> 2.29.2
> 
