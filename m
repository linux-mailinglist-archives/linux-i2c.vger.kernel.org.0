Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB0741838
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 00:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405593AbfFKWdx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 18:33:53 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35458 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404099AbfFKWdx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 18:33:53 -0400
Received: by mail-pl1-f196.google.com with SMTP id p1so5731412plo.2
        for <linux-i2c@vger.kernel.org>; Tue, 11 Jun 2019 15:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rheF1XeHr+TBtp29Z8BqnMhDdcbdifoVvsMUnTVTQ0w=;
        b=QKzewkqqr14aegyj9+KanpTXPALGWcAhgyKlFkPm+hIUpaiT5vfVCHwLDQjJnicRB4
         jWOVMCSmyMs7lj97v8kBr5AIAjLEtAYARRhQvSIdJl6dY8M8BIMwu6hXtzBO/6hQAAVZ
         R/3aJvCS5f1cpoXdCsmvWLdPJctFcP3gL7lhMRFa2f04l87qEV3sG+LctemNIIutyiz0
         coO2IFn//1n30Y5C3x2psChDUceRjUq3sahJi0y3yAlHV+XXZsp9XT/sRIA/UjAFFgGJ
         VuUO6M6OzU+lbVMu8QhXHbQzabAHnK3JcUwmnUhN5ilGVa3HtEDaHSJuGg4zy3T9ddsl
         /2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rheF1XeHr+TBtp29Z8BqnMhDdcbdifoVvsMUnTVTQ0w=;
        b=mJz9/GZxiMJBbrX2EuxjlTbSFJtqPxZJG66f+9BWeilrH0QyFK3g85r9/wKdjMDIPv
         ybdRptP+5u/106CAUgNwGGxgZNUBj1hFShh/ILvVyENxGGcoQAySWhBvaCUg6OKOq7bC
         4fbb+ZcWeKanmFZZVK569ktN5+Rxohb/JPDxzsIwY1vruSpONZeasqF71ZNuy/i8IUIU
         +6me0bCg73Dmp4q7p1adzEPGLf0fBjo3DTmOheqjA/A1HS79yMAFRRtd7RfFf73GVq5p
         K05rxLqVDSBZTNLnW43w3El+Lc4IviH1ibGn3LnFl9wtTmBXrdyELU0CuXS7Inat7yjg
         vq0g==
X-Gm-Message-State: APjAAAWGIlkiTAC8O4tjWzGKUdBakHu666/PTHcjrMsn3Otq2AqbxRz8
        Bmv7LhYfWPBFxAyAa180OQW9Ig==
X-Google-Smtp-Source: APXvYqzOrGp2e1lCEgBy09sDw+6XFk1Cp1xh3ZSUOlQ7lXvCww/YU+McON7j6rpV8WQzMMdtV7Kusw==
X-Received: by 2002:a17:902:42a5:: with SMTP id h34mr40878255pld.16.1560292432547;
        Tue, 11 Jun 2019 15:33:52 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w4sm18222973pfw.97.2019.06.11.15.33.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 15:33:51 -0700 (PDT)
Date:   Tue, 11 Jun 2019 15:33:49 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
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
Message-ID: <20190611223349.GS4814@minitux>
References: <20190610084213.1052-1-lee.jones@linaro.org>
 <20190610084213.1052-7-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610084213.1052-7-lee.jones@linaro.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon 10 Jun 01:42 PDT 2019, Lee Jones wrote:

> When booting with Device Tree, the current default boot configuration
> table option, the request to boot via 'host mode' comes from the
> 'dr_mode' property.

As I said in my previous review, the default mode for SDM845 is OTG. For
the MTP specifically we specify the default mode to be peripheral (was
host).


The remaining thing that worries me with this patch is that I do expect
that at least one of the USB-C ports is OTG. But I am not able to
conclude anything regarding this and host-only is a good default for
this type of device, so I suggest that we merge this.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> A property of the same name can be used inside
> ACPI tables too.  However it is missing from the SDM845's ACPI tables
> so we have to supply this information using Platform Device Properties
> instead.
> 
> This does not change the behaviour of any currently supported devices.
> The property is only set on ACPI enabled platforms, thus for H/W
> booting DT, unless a 'dr_mode' property is present, the default is
> still OTG (On-The-Go) as per [0].  Any new ACPI devices added will
> also be able to over-ride this implementation by providing a 'dr_mode'
> property in their ACPI tables.  In cases where 'dr_mode' is omitted
> from the tables AND 'host mode' should not be the default (very
> unlikely), then we will have to add some way of choosing between them
> at run time - most likely by ACPI HID.
> 
> [0] Documentation/devicetree/bindings/usb/generic.txt
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1e1f12b7991d..55ba04254e38 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -444,6 +444,11 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
>  	return 0;
>  }
>  
> +static const struct property_entry dwc3_qcom_acpi_properties[] = {
> +	PROPERTY_ENTRY_STRING("dr_mode", "host"),
> +	{}
> +};
> +
>  static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
>  {
>  	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
> @@ -488,6 +493,13 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
>  		goto out;
>  	}
>  
> +	ret = platform_device_add_properties(qcom->dwc3,
> +					     dwc3_qcom_acpi_properties);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to add properties\n");
> +		goto out;
> +	}
> +
>  	ret = platform_device_add(qcom->dwc3);
>  	if (ret)
>  		dev_err(&pdev->dev, "failed to add device\n");
> -- 
> 2.17.1
> 
