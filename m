Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59AB641BD7
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 07:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730839AbfFLF5k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 01:57:40 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52897 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730835AbfFLF5k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 01:57:40 -0400
Received: by mail-wm1-f68.google.com with SMTP id s3so5174025wms.2
        for <linux-i2c@vger.kernel.org>; Tue, 11 Jun 2019 22:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=4of8ZiK34nF/APP+EeYx9XNCcGPU1AME2L4lrHVraeI=;
        b=SD79wLU+G6g5/2870hSYrojXo8hkeJYjHJvuJMFUl4pMujwbM+t0i5yVvfgSuJzikK
         bbMaoLkZRFq9lrBAnxGgMo7Wrr3d03cr+rLois8ec1U2UplLC+1ye25jxyNICqFESQ5B
         Z66rCwLwDivfh9dprT0lI7za4JpauGVpOJWxSxSx+OJWj3EzbmXNdqlx95XsQbICUZJX
         3L0/4zj64CDQ4DesKqgZ9NfDR0/VRLD0FvtnAiITdNaN0fu3aqCoN0iUa/CtBHkT0bTO
         +u/BKQPj4AeOLK8Za3+5h9ls2FpC9zM1dwf42W5Sz8wh5DPuzSUqyYJHW62NKDW4ttYo
         jmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=4of8ZiK34nF/APP+EeYx9XNCcGPU1AME2L4lrHVraeI=;
        b=WKD417qHxCA5i04xAbNcuE87BURrkKUFOgu3hPTdzz/9DdX1skbTg42hElblKgr6MC
         q+XdBx0Xj+lJzNUvOuGC+Dd1R23vlFVs7gg7OIOqY2iemeWMnENMg2QR4FJecs7UYn4M
         /jBjqlD443eGo567zbG6PowRhGPgTRvbCXCFQWyh/3fhzMNf/XRRKif8sas9kXyeUOaj
         fsovAyDC/DsCn7z7bHkP0vujIpy3LlQDbbsfT29E/9RczLGtrjtkTArccbZEd1Mf6fcj
         zbpp40A84IgO1BORTeYwpoO5jjTIW4cujHf9gGpmDA0PfbS73ZSe2E9JfAS+dLKi2ntI
         R3FQ==
X-Gm-Message-State: APjAAAV8x9+5TX8iWNeyAeVggISukAW0O0q7JXpW4SS69bp0TOZ4n/AG
        PpCQVvNK3w7mu6cdND2yvQ1lXA==
X-Google-Smtp-Source: APXvYqzJvBNZQtwmkeMKOpNbBz81+iFkqBs/75CCe2ORqE04JpIzCx+Il2rit2gE1lFSlYBsiUOwtA==
X-Received: by 2002:a1c:618a:: with SMTP id v132mr20248396wmb.17.1560319058242;
        Tue, 11 Jun 2019 22:57:38 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id r3sm20726946wrr.61.2019.06.11.22.57.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 22:57:37 -0700 (PDT)
Date:   Wed, 12 Jun 2019 06:57:36 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the
 SDM845
Message-ID: <20190612055736.GO4797@dell>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190610084213.1052-7-lee.jones@linaro.org>
 <20190611223349.GS4814@minitux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190611223349.GS4814@minitux>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 11 Jun 2019, Bjorn Andersson wrote:

> On Mon 10 Jun 01:42 PDT 2019, Lee Jones wrote:
> 
> > When booting with Device Tree, the current default boot configuration
> > table option, the request to boot via 'host mode' comes from the
> > 'dr_mode' property.
> 
> As I said in my previous review, the default mode for SDM845 is OTG. For
> the MTP specifically we specify the default mode to be peripheral (was
> host).
> 
> 
> The remaining thing that worries me with this patch is that I do expect
> that at least one of the USB-C ports is OTG. But I am not able to
> conclude anything regarding this and host-only is a good default for
> this type of device, so I suggest that we merge this.

Right.  So one thing to consider is that Qualcomm Mobile Dept. do not
use ACPI for Linux, so this patch-set only affects the Laptop
form factor devices, where 'host' is the expected mode.

> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for taking the time to review this Bjorn.

Hopefully we can get Felipe's attention soon.

Felipe,

One thing to think about when taking Bjorn's Reviewed-by into
consideration; although we both work for Linaro, we actually operate
in different teams.  Bjorn is on the Qualcomm Landing Team, and as an
ex-Qualcomm employee he is in an excellent position to review these
patches, thus his Review should carry more weight than the usual
co-worker review IMHO.

TIA.

> > A property of the same name can be used inside
> > ACPI tables too.  However it is missing from the SDM845's ACPI tables
> > so we have to supply this information using Platform Device Properties
> > instead.
> > 
> > This does not change the behaviour of any currently supported devices.
> > The property is only set on ACPI enabled platforms, thus for H/W
> > booting DT, unless a 'dr_mode' property is present, the default is
> > still OTG (On-The-Go) as per [0].  Any new ACPI devices added will
> > also be able to over-ride this implementation by providing a 'dr_mode'
> > property in their ACPI tables.  In cases where 'dr_mode' is omitted
> > from the tables AND 'host mode' should not be the default (very
> > unlikely), then we will have to add some way of choosing between them
> > at run time - most likely by ACPI HID.
> > 
> > [0] Documentation/devicetree/bindings/usb/generic.txt
> > 
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index 1e1f12b7991d..55ba04254e38 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -444,6 +444,11 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
> >  	return 0;
> >  }
> >  
> > +static const struct property_entry dwc3_qcom_acpi_properties[] = {
> > +	PROPERTY_ENTRY_STRING("dr_mode", "host"),
> > +	{}
> > +};
> > +
> >  static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
> >  {
> >  	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
> > @@ -488,6 +493,13 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
> >  		goto out;
> >  	}
> >  
> > +	ret = platform_device_add_properties(qcom->dwc3,
> > +					     dwc3_qcom_acpi_properties);
> > +	if (ret < 0) {
> > +		dev_err(&pdev->dev, "failed to add properties\n");
> > +		goto out;
> > +	}
> > +
> >  	ret = platform_device_add(qcom->dwc3);
> >  	if (ret)
> >  		dev_err(&pdev->dev, "failed to add device\n");

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
