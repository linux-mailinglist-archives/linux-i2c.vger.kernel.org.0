Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78412364C6
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 21:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfFETfu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 15:35:50 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37739 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbfFETft (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 15:35:49 -0400
Received: by mail-wm1-f66.google.com with SMTP id 22so51426wmg.2
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jun 2019 12:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+XgTLMQHXUHAlRC15H03l3gn1i1407JWZiEl7Nlddc8=;
        b=rxPej+XaD2qUwYl11GzFNqf37sO+gbFXWtcskQgkqqRrdfKXJVNXNWMKUOIhNqFjnH
         sZbnuPbZbo21HKEviDQhbRvQbZn8LburWbITtvsEJE0y8WStht94fUX2bcgyE1Dcm/lf
         k5OsvlayoxvkYJ1AqrJmd7BisXQpEh/PpaWAqM8L8WIAt844ii2QLM0SNMtFcZBZkWhn
         uzfcIIQPdraQpVsk2BLRA95nwTaL4V8rxuU+oKOWJ1HzBIE2Nv0AYF5Hx4puT0WNmK/T
         iiOl87G2kq51FeqFmeOYCg0qMP1lYY6XCF9GnuBHVqQELSUiwfDN0j9gi2dDEg1GG0AL
         lk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+XgTLMQHXUHAlRC15H03l3gn1i1407JWZiEl7Nlddc8=;
        b=BfmqY1hIxnAI3jwMDr4IhEzj7Ps3NmVssTjYCn5EYjkkiv4C3qtJ1mBhTxdQ10rWWH
         yCNr4AUsL68p9lZSqHTS9sEu7IAikOGMudDW8XDo1vUYe88DK3ME0aY0HWTFZqfE+81u
         ckccmfSgtt6xm/d7cLXDlDmhBYJDMdtjud2gul4mfcVywdRDBjg+QPHY2DFxci9nIh+P
         XVZWbsk80+iIm41pwrWwt5JtZBev0FZlgi9c77gs6V813yVHI4r1NRjYipTGLqix5WZd
         pTu0WRr+GnXlsLGC9n/fqrme1++lXte6OEH3pd68JApFHDFqQm+ff58LmWo8x4mOunXm
         xwsQ==
X-Gm-Message-State: APjAAAV9WszIFtKxvoJNdIqm3r6xrmo7MQlHe4VssbdaTANGKHjnwXON
        T//m7Hezpn5TJq8wiSsegjC68A==
X-Google-Smtp-Source: APXvYqwP7o7VGE+TdqvhZHNouyX2xhkoTgrYZTIp0Ei2POvdABQ8iKlx3+djogE+DbI+YmFupn+u2w==
X-Received: by 2002:a1c:b707:: with SMTP id h7mr11518255wmf.45.1559763347150;
        Wed, 05 Jun 2019 12:35:47 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id m17sm10523991wrx.12.2019.06.05.12.35.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 12:35:46 -0700 (PDT)
Date:   Wed, 5 Jun 2019 20:35:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/8] pinctrl: qcom: sdm845: Provide ACPI support
Message-ID: <20190605193544.GX4797@dell>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-4-lee.jones@linaro.org>
 <20190605061721.GK22737@tuxbook-pro>
 <20190605073133.GL4797@dell>
 <20190605190614.GI4814@minitux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190605190614.GI4814@minitux>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 05 Jun 2019, Bjorn Andersson wrote:

> On Wed 05 Jun 00:31 PDT 2019, Lee Jones wrote:
> 
> > On Tue, 04 Jun 2019, Bjorn Andersson wrote:
> > 
> > > On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
> > > 
> > > > This patch provides basic support for booting with ACPI instead
> > > > of the currently supported Device Tree.  When doing so there are a
> > > > couple of differences which we need to taken into consideration.
> > > > 
> > > > Firstly, the SDM850 ACPI tables omit information pertaining to the
> > > > 4 reserved GPIOs on the platform.  If Linux attempts to touch/
> > > > initialise any of these lines, the firmware will restart the
> > > > platform.
> > > > 
> > > > Secondly, when booting with ACPI, it is expected that the firmware
> > > > will set-up things like; Regulators, Clocks, Pin Functions, etc in
> > > > their ideal configuration.  Thus, the possible Pin Functions
> > > > available to this platform are not advertised when providing the
> > > > higher GPIOD/Pinctrl APIs with pin information.
> > > > 
> > > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > > ---
> > > >  drivers/pinctrl/qcom/Kconfig          |  2 +-
> > > >  drivers/pinctrl/qcom/pinctrl-sdm845.c | 35 ++++++++++++++++++++++++++-
> > > >  2 files changed, 35 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> > > > index 2e66ab72c10b..aafbe932424f 100644
> > > > --- a/drivers/pinctrl/qcom/Kconfig
> > > > +++ b/drivers/pinctrl/qcom/Kconfig
> > > > @@ -168,7 +168,7 @@ config PINCTRL_SDM660
> > > >  
> > > >  config PINCTRL_SDM845
> > > >         tristate "Qualcomm Technologies Inc SDM845 pin controller driver"
> > > > -       depends on GPIOLIB && OF
> > > > +       depends on GPIOLIB && (OF || ACPI)
> > > >         select PINCTRL_MSM
> > > >         help
> > > >           This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> > > > diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> > > > index c97f20fca5fd..7188bee3cf3e 100644
> > > > --- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
> > > > +++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
> > > > @@ -3,6 +3,7 @@
> > > >   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> > > >   */
> > > >  
> > > > +#include <linux/acpi.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/of.h>
> > > >  #include <linux/platform_device.h>
> > > > @@ -1277,6 +1278,10 @@ static const struct msm_pingroup sdm845_groups[] = {
> > > >  	UFS_RESET(ufs_reset, 0x99f000),
> > > >  };
> > > >  
> > > > +static const int sdm845_acpi_reserved_gpios[] = {
> > > > +	0, 1, 2, 3, 81, 82, 83, 84, -1
> > > > +};
> > > > +
> > > >  static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
> > > >  	.pins = sdm845_pins,
> > > >  	.npins = ARRAY_SIZE(sdm845_pins),
> > > > @@ -1284,14 +1289,41 @@ static const struct msm_pinctrl_soc_data sdm845_pinctrl = {
> > > >  	.nfunctions = ARRAY_SIZE(sdm845_functions),
> > > >  	.groups = sdm845_groups,
> > > >  	.ngroups = ARRAY_SIZE(sdm845_groups),
> > > > +	.reserved_gpios = sdm845_acpi_reserved_gpios,
> > > 
> > > The reason why put these in DT is because the list is board/firmware
> > > dependent. E.g. the firmware on db845c does not support the peripherals
> > > that sits on these 8 pins and as such these are not reserved.
> > 
> > If we need to be more particular about which platform(s) this affects,
> > we could add matching based on their differences (some ACPI HID or F/W
> > version/descriptor, etc) as and when we enable them for booting with
> > ACPI.
> > 
> 
> You're making an assumption that all SDM845 (the platform) devices using
> ACPI will have this list of GPIOs reserved for secure firmware to use,
> this is questionable but I don't have any better suggestion.

Yes, I am, since this is the first and currently only device which
ticks those boxes.  If/when there are others AND if they require a
different configuration, we can look at the differences and conduct
some suitable matching on them at the time.

> But you do this by adding a new struct msm_pinctrl_soc_data
> sdm845_acpi_pinctrl, specifically for the ACPI case. And then, on the
> line I object to here, you add this list as the list of reserved GPIOs
> for the DT case as well.

Ohhhh, now I see what you're getting at.  Yes, that's a mistake left
over from testing.  That needs removing -- good spot.

> > > But given that the two structs looks identical now, did you perhaps not
> > > intend to add.reserved_gpios for the non-ACPI case?
> > 
> > Given your example above, I think it's best that we let the
> > configuration tables advertise these in the first instance.  I only
> > add them here because it is not possible to obtain them from
> > elsewhere.
> > 
> 
> Then add it for ACPI only - which I still presume you intended to do by
> adding sdm845_acpi_pinctrl (which is now identical to sdm845_pinctrl).

We're arguing about the same thing - sorry for the confusion.

I will fix this.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
