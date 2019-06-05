Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97ECC35823
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 09:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfFEH5F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 03:57:05 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35317 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbfFEH5C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 03:57:02 -0400
Received: by mail-lf1-f65.google.com with SMTP id a25so18391858lfg.2;
        Wed, 05 Jun 2019 00:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BIGkKcYfLrKZMcNofxFte/MwlnM+iUUU8rGg0Es0KCI=;
        b=jRpSbB4kywIBITbYWEf6/kRotgyPwypZ2xiTiMXOl0E1rybviEi2ONR4DIJ00lXGXR
         vVEMTcbSgDoasqjGTmiV+73RyS5JhIw9ARxsVeFOV5gxOTGpzSCvaFC9llO0HrbV2G85
         xeEVV0vodGNT1ter+ADBS8kqHyHPHJzh1tdGU1OsSUvngS/3vNlHNFdAlmivn4cDzRAO
         JhGlzf6bvGgm02RPkVP7GcaXSQ3PRqocVtumxDV/6arnynLI7jXjoxrtJewwW5IjbNo5
         gumC2sFZ7TpXE5xr6u5astLFgKblMLTLBRAixPPthRfP35JYDUz3qjFYVdLp+obMcfCb
         xvMg==
X-Gm-Message-State: APjAAAUm9WVT9+7h4UsT9IecKmTSFSbtIuxArhNiu2foPLMIAubZ/r2S
        0vwQekxBQJhpVLhGInycVgk=
X-Google-Smtp-Source: APXvYqyJTHFtU2ZPnYiQSPpENJAgbw8I3+7lh4a0s29uA2IVhDFXd/5pYXop0LCfMkGc18+7XLWDyw==
X-Received: by 2002:a19:6a01:: with SMTP id u1mr17636778lfu.141.1559721419930;
        Wed, 05 Jun 2019 00:56:59 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id t22sm4189527lje.58.2019.06.05.00.56.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 00:56:59 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hYQn2-00063e-Gt; Wed, 05 Jun 2019 09:56:57 +0200
Date:   Wed, 5 Jun 2019 09:56:56 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.brown@linaro.org,
        alokc@codeaurora.org, kramasub@codeaurora.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
        jlhugo@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Message-ID: <20190605075656.GC29637@localhost>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-2-lee.jones@linaro.org>
 <20190605062020.GL22737@tuxbook-pro>
 <20190605071625.GK4797@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605071625.GK4797@dell>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 05, 2019 at 08:16:25AM +0100, Lee Jones wrote:
> On Tue, 04 Jun 2019, Bjorn Andersson wrote:
> 
> > On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:
> > 
> > > The Qualcomm Geni I2C driver currently probes silently which can be
> > > confusing when debugging potential issues.  Add a low level (INFO)
> > > print when each I2C controller is successfully initially set-up.
> > > 
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > > index 0fa93b448e8d..e27466d77767 100644
> > > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > > @@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
> > >  		return ret;
> > >  	}
> > >  
> > > +	dev_info(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> > > +
> > 
> > I would prefer that we do not add such prints, as it would be to accept
> > the downstream behaviour of spamming the log to the point where no one
> > will ever look through it.
> 
> We should be able to find a middle ground.  Spamming the log with all
> sorts of device specific information/debug is obviously not
> constructive, but a single liner to advertise that an important
> device/controller has been successfully initialised is more helpful
> than it is hinderous.
> 
> This print was added due to the silent initialisation costing me
> several hours of debugging ACPI device/driver code (albeit learning a
> lot about ACPI as I go) just to find out that it was already doing the
> right thing - just very quietly.

No, we don't add noise like this to the logs just because it may be
useful while debugging. Even one-liners add up.

There are plenty of options for debugging already ranging from adding a
temporary dev_info() to the probe function in question to using dynamic
debugging to have driver core log every successful probe.

And in this case you say the driver was in fact already bound; that can
easily be verified through sysfs too in case things aren't behaving the
way you expect.

Johan
