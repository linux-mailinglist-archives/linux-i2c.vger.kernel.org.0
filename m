Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 133EA3645D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 21:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfFETO6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 15:14:58 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39366 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfFETO5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 15:14:57 -0400
Received: by mail-pl1-f193.google.com with SMTP id g9so10045416plm.6
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jun 2019 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3Rc60lsJ3z1zOjfi7ksD28e6ywcaQlCBCKfGl8ThP5g=;
        b=wl9zOlVGzsak3W0n9srNqt6xTicaVMXyvuV62ylpgplp0YgPU7AxCF2aoOl4RB2iC5
         6cPYPEmWEcxRkhSQT57mRJKRMLXCedtcqKwMwsOGUFlinvg03O+6j6DGB/fUMSIL09V+
         wbvrFegoqrdRMWReviAaArKT1XKDv7Q3UdZInx0oUItNDGwcSfHj0y3P/XbhDxVRBZ0D
         1yCB6OValT1P7bMoLKXsiTopYfc7JTB1ixy+cTPwWdKa2YzQE2Wk+wXa6s4NUj8y8Dfc
         D9FBIWE1C6kkbzPxlvNmqGmNa6Z9G3Xpa+E2YU9W+JqS/kkBUZJxb5rYvg85KIW0DsTX
         h0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Rc60lsJ3z1zOjfi7ksD28e6ywcaQlCBCKfGl8ThP5g=;
        b=Diqn3H9J3kkojjxDhQhZKlrx9w8Rown07bNCUEwt12b1LdYtVoGOD8ve4ThR1qNzDb
         chwrj+6HbB2n2wWRIb3Q+FDUVICA3CUd8WTa5qSwUs5+s9/hnCEUC0mTJnXKWwswfFZo
         TOe8KBEHHbzuvJJWMKoEKZgt56m9IefurQadvWIFPUzAamlLpXMAyVX84CVlLEeMBfVb
         HM8SJL1aG1faGjq3xAf3O+RQeJScW2ZhM197zzbna968teWhCBHvlsiJlc1ZmOGbslZe
         QYclyjKFuFvuFtlSMbfqsppSOI0RyPXEB7Fc8kiG6EEZvJyT9y+MKKwA5fIFftnRqtTt
         i1Tw==
X-Gm-Message-State: APjAAAXTUfCNTif/eHexcAYXTeZ1pfaDIlcrI83lduj+KL/7nwEOfrQJ
        2ljeWE5dlb/ubTkX/tb7TIcORw==
X-Google-Smtp-Source: APXvYqz+h4aRHxX//DbbKSqnGBRk+YbQMFSEIS2PAURYu4NSWDUnLwqSRo+mFseHlHHDfgCMaf9Iyw==
X-Received: by 2002:a17:902:2ba7:: with SMTP id l36mr45371487plb.334.1559762096439;
        Wed, 05 Jun 2019 12:14:56 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t15sm21182517pjb.6.2019.06.05.12.14.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 12:14:55 -0700 (PDT)
Date:   Wed, 5 Jun 2019 12:14:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/8] usb: dwc3: qcom: Start USB in 'host mode' on the
 SDM845
Message-ID: <20190605191453.GJ4814@minitux>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-7-lee.jones@linaro.org>
 <20190605070029.GN22737@tuxbook-pro>
 <20190605083454.GO4797@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605083454.GO4797@dell>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed 05 Jun 01:34 PDT 2019, Lee Jones wrote:

> On Wed, 05 Jun 2019, Bjorn Andersson wrote:
> 
> > On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
> > 
> > > When booting with Device Tree, the current default boot configuration
> > > table option, the request to boot via 'host mode' comes from the
> > > "dr_mode" property.
> > 
> > This has been the default on the MTP, but this is changing as this is
> > causing issues when connected downstream from a hub (the typical
> > development case for the primary USB port of a phone like device) and
> > more importantly we don't have support for the PMIC blocks that control
> > VBUS.
> 
> My point is not about which mode is currently chosen.  It's more about
> the capability of choosing which mode is appropriate for a given
> system via DT.
> 
> > Once these issues are resolved the dr_mode would be "otg".
> 
> OTG doesn't work on this H/W, so we need to specify "host" mode.
> 

My objection is that when you say "this H/W" you mean a particular
product, but you're making this decision for all SDM845 based products
using ACPI.

I don't know if there is a Windows phone based on SDM845, but if there
is then I don't think forcing it to host would be correct.

> > > A property of the same name can be used inside
> > > ACPI tables too.  However it is missing from the SDM845's ACPI tables
> > > so we have to supply this information using Platform Device Properites
> > > instead.
> > > 
> > 
> > Afaict this would install a fall-back property, so in the case that we
> > have specified dr_mode in DT (or ACPI) that would take precedence. So
> 
> That's correct.
> 
> > the commit message should reflect that this redefines the default choice
> > to be "host", rather than "otg".
> 
> No problem.
> 
> > Which is in conflict with what's described for dr_mode in
> > Documentation/devicetree/bindings/usb/generic.txt
> 
> This implementation only affects ACPI based platforms.  When booting
> with DT, the description in that DT related document is still
> accurate.
> 

You're right, I got lost between the patches and the sprinkled if
(ACPI_HANDLE()) in the probe. This is only added for ACPI.

> > And this driver is used on a range of different Qualcomm platforms, so I
> > don't think this is SDM845 specific.
> 
> ACPI based platforms?
> 
> All the ones I've seen use the XHCI USB driver directly ("PNP0D10").
>  

MSM8998 (835) has the same controller, so this should affect those
laptops as well.

Regards,
Bjorn

> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > index 349bf549ee44..f21fdd6cdd1a 100644
> > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > @@ -468,6 +468,11 @@ static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
> > >  };
> > >  MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
> > >  
> > > +static const struct property_entry dwc3_qcom_acpi_properties[] = {
> > > +	PROPERTY_ENTRY_STRING("dr_mode", "host"),
> > > +	{}
> > > +};
> > > +
> > >  static int dwc3_qcom_probe(struct platform_device *pdev)
> > >  {
> > >  	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
> > > @@ -603,6 +608,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
> > >  			goto platform_unalloc;
> > >  		}
> > >  
> > > +		ret = platform_device_add_properties(qcom->dwc3,
> > > +						     dwc3_qcom_acpi_properties);
> > > +		if (ret < 0) {
> > > +			dev_err(&pdev->dev, "failed to add properties\n");
> > > +			goto platform_unalloc;
> > > +		}
> > > +
> > >  		ret = platform_device_add(qcom->dwc3);
> > >  		if (ret) {
> > >  			dev_err(&pdev->dev, "failed to add device\n");
> 
> -- 
> Lee Jones [?????????]
> Linaro Services Technical Lead
> Linaro.org ??? Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
