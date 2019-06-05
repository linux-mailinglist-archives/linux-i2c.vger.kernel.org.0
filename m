Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5B2E359FC
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 11:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfFEJz3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 05:55:29 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50317 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfFEJz3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 05:55:29 -0400
Received: by mail-wm1-f67.google.com with SMTP id f204so1611932wme.0
        for <linux-i2c@vger.kernel.org>; Wed, 05 Jun 2019 02:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=T2lb6BFKyo6qFGuGkYXia4Pk+2dP0QxKBCkXd6OlypE=;
        b=CPgOTuOq7c9MOvfUWJ5q/1+tOxgwn+XFG+0Um2QDTbUUUZanzLWDdj11nBOM2fIwB7
         kEstullEcq59rr+WijeSFS9WnI3Qt9gjYsTf935hVMLJqfnOazzwxLxIHcji5TjkcosG
         Y9XeYmQEDs6JbYlcEA7MiiEoYVV0BhB9r3suWTxQwm2++AJs9fMMbvBXj41wWMXxBHMd
         Jf9fOl3L6hWXn6ofOl5x36eliDoR4Kpmq+BhUX/CuX//P1ZfkmcraAPARmc95tEHq9iI
         iCz+Nm6D2SuuWiuOfBEm9CAkUqn9XEWtOrlUjSO+W80Dvqivdf9+b0ODE40uSn7iXy5B
         3ZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=T2lb6BFKyo6qFGuGkYXia4Pk+2dP0QxKBCkXd6OlypE=;
        b=OMTIDnTqNsZUL7iCuWl5WuFJrGO3Gsk8XXL0eoVXCN7X9LTHiUNaotpcdOhaJBsPOp
         SVr0g0csg5sVv2eCPLYhm+1tEoAsW2+mHR6EK9SFLT/ZorXRRzwn9drbn90ZOhLZSWsv
         hq/WQUl4jcH+lFMcy/SNqzy6ax+5Cl+me3rvCCauwA3lkIazo+oyKzVBz0jbOwnXqE5b
         V+/gDs5ywBwV3EaNptQRPfBBo8o4n57IGkor8VSoq/rk19aqAE/RBNPj1hfLjoJZ1711
         U+AyglfJ/rRL5CKubgs1ZAMlJzux9J5yxs9Ylek857LokJWweKyD0g+mVUXdNfOgbGHk
         sWSA==
X-Gm-Message-State: APjAAAWTSycFuAZEVhpxDZGe6zUqm2A94hNzSzHTyP0EabUHYg1fVIxh
        UI9XLCuK/qt5vnpmXxtG/YLCdw==
X-Google-Smtp-Source: APXvYqwb15JLdo1InhCZA1cwpY0KvOYdXxpte37lxvn/nhB25qLp3J8HUS7DEBlgQIXew3zQcT8Cbw==
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr15208355wmg.164.1559728526806;
        Wed, 05 Jun 2019 02:55:26 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id z14sm7127245wre.96.2019.06.05.02.55.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 02:55:26 -0700 (PDT)
Date:   Wed, 5 Jun 2019 10:55:24 +0100
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
Subject: Re: [PATCH 6/8] usb: dwc3: qcom: Add support for booting with ACPI
Message-ID: <20190605095524.GS4797@dell>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-6-lee.jones@linaro.org>
 <20190605063507.GM22737@tuxbook-pro>
 <20190605070928.GJ4797@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190605070928.GJ4797@dell>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 05 Jun 2019, Lee Jones wrote:

> On Tue, 04 Jun 2019, Bjorn Andersson wrote:
> 
> > On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > [..]
> > > @@ -373,7 +416,7 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
> > >  
> > >  	qcom->num_clocks = count;
> > >  
> > > -	if (!count)
> > > +	if (!count || ACPI_HANDLE(dev))
> > >  		return 0;
> > 
> > Afaict you call this with count = of_count_phandle_with_args(), which
> > should be 0. But why not skip calling this at all?
> 
> Actually count can be <0, which is why I must have needed it at the
> beginning.  There is another patch in this set which checks for
> errors, thus the ACPI_HANDLE() call should now be superfluous.  I
> will test and remove it.

Just looked into this - it is still required.

of_count_phandle_with_args() returns an error not to be heeded in the
ACPI case.  So the logic goes:

[This patch]
 * It's fine to boot DT with no clocks to initialise (return 0)
 * There are no clocks to enable when booting ACPI (return 0)

[Another patch]
 * It's not fine to boot DT and for 'count < 0' (return count)

> > >  	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
> > > @@ -409,12 +452,28 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
> > >  	return 0;
> > >  }
> > >  
> > > +static const struct dwc3_acpi_pdata sdm845_acpi_pdata = {
> > > +	.qscratch_base_offset = SDM845_QSCRATCH_BASE_OFFSET,
> > > +	.qscratch_base_size = SDM845_QSCRATCH_SIZE,
> > > +	.dwc3_core_base_size = SDM845_DWC3_CORE_SIZE,
> > > +	.hs_phy_irq_index = 1,
> > > +	.dp_hs_phy_irq_index = 4,
> > > +	.dm_hs_phy_irq_index = 3,
> > > +	.ss_phy_irq_index = 2
> > > +};
> > > +
> > > +static const struct acpi_device_id dwc3_qcom_acpi_match[] = {
> > > +	{ "QCOM2430", (unsigned long)&sdm845_acpi_pdata },
> > > +	{ },
> > > +};
> > > +MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
> > 
> > Analog to of_device_get_match_data() there seems to be a
> > acpi_device_get_match_data(), if you use this you should be able to
> > have you acpi_device_id array next to the of_device_id.
> 
> Do you mean "Analogous"?
> 
> I will try to group them, thanks.
> 
> > > +
> > >  static int dwc3_qcom_probe(struct platform_device *pdev)
> > 
> > It seems that all that's left unconditional on ACPI_HANDLE() in this
> > function are the optional pieces and the tail. Wouldn't it be cleaner to
> > split it out in different functions?
> 
> There are ~50 lines of shared code in dwc3_qcom_probe(), most of it is
> interspersed between the configuration table (DT, ACPI) pieces, which
> is why it's formatted in the current way.
> 
> I can split a few things out into separate functions if you think
> it'll help.
> 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
