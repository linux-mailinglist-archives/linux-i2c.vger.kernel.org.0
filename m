Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9011E0D5E
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 13:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388753AbgEYLeU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 May 2020 07:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388691AbgEYLeT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 May 2020 07:34:19 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8359BC061A0E
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 04:34:19 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id se13so20120304ejb.9
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 04:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jcstEHUTZ/N80WBqA3Bn95izpDLoPr9B+Ndu3/xL8P0=;
        b=Ga7PR3x1cyP9C7dZNKUuPfUY1KrJGuvA8WHisZeod8m2dL5dANd2QFNnF2qILBAMUp
         FB+Zy0GgV1A+toxiq9lvJDUYPEQESHNeW8AxsWv+fQmZk+u4M1F5udBRgqHDYEeqTElX
         pPYFoUGIRFqdwOIQimoJCay8uzdD6zsR1A1uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jcstEHUTZ/N80WBqA3Bn95izpDLoPr9B+Ndu3/xL8P0=;
        b=MKZLde8zZxx81RGygXY2lcZOibA6yidAqQWlXNHIlBEceWqAVEuYVRtl1Wb5C5GO7T
         AP25M8hv9gQMvVzUPd2BFhZNULupOeOjZW6YuujJH1CzF3m4Sltu4X0JpxZa1w1ebZEu
         ZJGM5h6O5p7jXu4LD/enHc9WPy9fyK7MWIfK/WHZ4ws1WyedozSolO7Yko52erTtXr66
         XlLBUhcpGif1rLlo2QFnhjjL3GJn28E18V5Re6BlRaXUT6dcexVeQqBUagr960V523qW
         wdo69H7KUsYqjP4vZfaomnLr7S5zFDxTv7D3N/1fLqHkRz2+tyo5LrPNKAUxZtgFCmMP
         t0Eg==
X-Gm-Message-State: AOAM533TRiHvdBZ4auUlbWvnW0Voiz9LYNXlcrQtNE0QrWG6CIdsHGYS
        rSNtIM8OwRuv8ZxCieU37Wr8N1mZTTU=
X-Google-Smtp-Source: ABdhPJwsirlocK1JUQNHg43TvTZ9U5J2y2F6RR1oH4NwhzzJb18DFdiXjSQCuBlQOXZXP/8sGXMkxw==
X-Received: by 2002:a17:906:d86:: with SMTP id m6mr19336994eji.434.1590406457926;
        Mon, 25 May 2020 04:34:17 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id ay6sm15412024edb.29.2020.05.25.04.34.17
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 04:34:17 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id j16so4338646wrb.7
        for <linux-i2c@vger.kernel.org>; Mon, 25 May 2020 04:34:17 -0700 (PDT)
X-Received: by 2002:adf:92a5:: with SMTP id 34mr15142405wrn.415.1590406456567;
 Mon, 25 May 2020 04:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
 <20200519072729.7268-3-bibby.hsieh@mediatek.com> <952995ec-0865-d8ff-e285-522705fa9709@ti.com>
In-Reply-To: <952995ec-0865-d8ff-e285-522705fa9709@ti.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 25 May 2020 13:34:04 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Bx=zgsUAg7fA2jfsV_yFyPmnotTWEBEr2V3Nn5HO8qQQ@mail.gmail.com>
Message-ID: <CAAFQd5Bx=zgsUAg7fA2jfsV_yFyPmnotTWEBEr2V3Nn5HO8qQQ@mail.gmail.com>
Subject: Re: [PATCH v15 2/2] i2c: core: support bus regulator controlling in adapter
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Grygorii,

On Fri, May 22, 2020 at 7:59 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
>
>
>
> On 19/05/2020 10:27, Bibby Hsieh wrote:
> > Although in the most platforms, the bus power of i2c
> > are alway on, some platforms disable the i2c bus power
> > in order to meet low power request.
> >
> > We get and enable bulk regulator in i2c adapter device.
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >   drivers/i2c/i2c-core-base.c | 84 +++++++++++++++++++++++++++++++++++++
> >   include/linux/i2c.h         |  2 +
> >   2 files changed, 86 insertions(+)
> >
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 5cc0b0ec5570..e1cc8d46bc51 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -313,12 +313,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
> >   static int i2c_device_probe(struct device *dev)
> >   {
> >       struct i2c_client       *client = i2c_verify_client(dev);
> > +     struct i2c_adapter      *adap;
> >       struct i2c_driver       *driver;
> >       int status;
> >
> >       if (!client)
> >               return 0;
> >
> > +     adap = client->adapter;
> >       driver = to_i2c_driver(dev->driver);
> >
> >       client->irq = client->init_irq;
> > @@ -378,6 +380,12 @@ static int i2c_device_probe(struct device *dev)
> >
> >       dev_dbg(dev, "probe\n");
> >
> > +     status = regulator_enable(adap->bus_regulator);
> > +     if (status < 0) {
> > +             dev_err(&adap->dev, "Failed to enable power regulator\n");
> > +             goto err_clear_wakeup_irq;
> > +     }
> > +
> >       status = of_clk_set_defaults(dev->of_node, false);
> >       if (status < 0)
> >               goto err_clear_wakeup_irq;
> > @@ -414,12 +422,14 @@ static int i2c_device_probe(struct device *dev)
> >   static int i2c_device_remove(struct device *dev)
> >   {
> >       struct i2c_client       *client = i2c_verify_client(dev);
> > +     struct i2c_adapter      *adap;
> >       struct i2c_driver       *driver;
> >       int status = 0;
> >
> >       if (!client || !dev->driver)
> >               return 0;
> >
> > +     adap = client->adapter;
> >       driver = to_i2c_driver(dev->driver);
> >       if (driver->remove) {
> >               dev_dbg(dev, "remove\n");
> > @@ -427,6 +437,8 @@ static int i2c_device_remove(struct device *dev)
> >       }
> >
> >       dev_pm_domain_detach(&client->dev, true);
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             regulator_disable(adap->bus_regulator);
>
> Not sure this check is correct.
>
> i2c_device_probe()
>   - regulator_enable - 1
>
> pm_runtime_get()
>   - regulator_enable - 2
>

I believe regulator_enable() wouldn't be called again, because the
device was already active in probe. However, I've been having
difficulties keeping track of runtime PM semantics under various
circumstances (e.g. ACPI vs DT), so can't tell for sure anymore.

> i2c_device_remove()
>   - pm_runtime_status_suspended() flase
>     - regulator_disable() - 1 --> still active?
>
> Sorry, I probably missing smth.
>
> >
> >       dev_pm_clear_wake_irq(&client->dev);
> >       device_init_wakeup(&client->dev, false);
> > @@ -438,6 +450,72 @@ static int i2c_device_remove(struct device *dev)
> >       return status;
> >   }
> >
>
> [...]
>
> --
> Best regards,
> grygorii
