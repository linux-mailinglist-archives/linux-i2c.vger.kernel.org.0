Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE563590A
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 10:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfFEIzd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 04:55:33 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43399 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFEIzd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 04:55:33 -0400
Received: by mail-lj1-f195.google.com with SMTP id 16so8808780ljv.10;
        Wed, 05 Jun 2019 01:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0U6eDBY+p278g6sAhkapnBhYYyaYO1FDxf1FQX6wdaE=;
        b=HBPJFEtPbn9HEHEU5p2Q9djbv2eF7H6eg8lY62yOeDAIuVGioCcz4E/ayNdXH4gHun
         q99yW1sKTkcjlp1y68fFqWw+iPWMXvTe5qvI80/jcq7QrnmTCS9d4GU8panbDoSOYjR0
         iyBD0hp2ggz1gSQil6uzxmXYLL6aczPKNRpglYcoLUc44tsb1jEm7y5AvnWwhpns63bW
         ldON1HGFb8q8iTFRXpq9wTjQwrTZJc4RITUqXroLRghk7c/hucE91tPnFf6DAGsHTVZ4
         D/NKi5296hhTm77pONZE2id+bXoP4ZFOZST4hTZV8X5ujLMqh1vRGaykT03GUZV6wPEP
         w+YA==
X-Gm-Message-State: APjAAAUj45fgmEkfRkSbbdQEQMHrGYYAwHUKPw9qsOuAdgCwJeykQUgX
        PEB2/FdGNtlir/GmoNvIJnc=
X-Google-Smtp-Source: APXvYqzvONsFYRciDKTx+Wt06noIZ5QHPF4uWQkaEhVru+K0f055PuFxcQ4dCitfAPD5HYEsSY0jVg==
X-Received: by 2002:a2e:2c17:: with SMTP id s23mr3271471ljs.214.1559724930581;
        Wed, 05 Jun 2019 01:55:30 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id x29sm4070530lfg.58.2019.06.05.01.55.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 01:55:29 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hYRhf-0006Sd-3c; Wed, 05 Jun 2019 10:55:27 +0200
Date:   Wed, 5 Jun 2019 10:55:27 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, balbi@kernel.org,
        wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, david.brown@linaro.org,
        alokc@codeaurora.org, kramasub@codeaurora.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
        jlhugo@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Message-ID: <20190605085527.GE29637@localhost>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-2-lee.jones@linaro.org>
 <20190605062020.GL22737@tuxbook-pro>
 <20190605071625.GK4797@dell>
 <20190605075656.GC29637@localhost>
 <20190605082047.GM4797@dell>
 <20190605083353.GD29637@localhost>
 <20190605084921.GQ4797@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190605084921.GQ4797@dell>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 05, 2019 at 09:49:21AM +0100, Lee Jones wrote:
> On Wed, 05 Jun 2019, Johan Hovold wrote:
> 
> > On Wed, Jun 05, 2019 at 09:20:47AM +0100, Lee Jones wrote:
> > > On Wed, 05 Jun 2019, Johan Hovold wrote:
 
> > > > There are plenty of options for debugging already ranging from adding a
> > > > temporary dev_info() to the probe function in question to using dynamic
> > > > debugging to have driver core log every successful probe.
> > > 
> > > This is what I ended up doing.  It was time consuming to parse though
> > > a log of that size when you have no paging or keyboard.
> > 
> > With the right command-line option to enable dynamic debugging you get
> > one line per successful probe, just like you wanted. Or are you now
> > saying that one-line per device is too much after all? ;)
> 
> Which command line option are you pertaining to?

To enable dynamic debugging in driver core you could use something like

	CONFIG_CMDLINE="dyndbg=\"func really_probe =p\""

That gives you two printouts per successful probe, for example:

	bus: 'usb-serial': really_probe: probing driver edgeport_ti_1 with device ttyUSB0
	bus: 'usb-serial': really_probe: bound device ttyUSB0 to driver edgeport_ti_1

Or you can of course just change the corresponding pr_debug to pr_info
while debugging.

Johan
