Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF9014B071
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jan 2020 08:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgA1Hc2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jan 2020 02:32:28 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46291 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgA1Hc2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jan 2020 02:32:28 -0500
Received: by mail-ed1-f67.google.com with SMTP id m8so13594869edi.13
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jan 2020 23:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDQOcmAaJfaJCPAbZ0nWP5aLqhmwsKVD2wIYjeM3dS4=;
        b=JCLqp0N4xOkQGzDyDNx2XDjmHFeUZ8XCXuQ4+MkfJT/vFR6+G9Q3edKgyPdWLyFEfy
         YAAZ6Ldrg9Js43z4po6Xl6FcaUf/Kh+A774PFJqNivgFNSYTv+LbCi/l14oh9wtQCntE
         lP59B96Ywrn0dmqvwIkC82NxM5Y8Aya2Tpxe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDQOcmAaJfaJCPAbZ0nWP5aLqhmwsKVD2wIYjeM3dS4=;
        b=lKHSpSCmpCRaPZUwSSwuF08M4hxoI/L2X2yyvLbvRrUbvx0SjeCEn2n4TRoSWrP12q
         YQjJqYxJloAVI/OGhyWkTQWhwkgDQ2GKFfdjrnVHd3dvyVbE8UI4dBt3DR34oU3uVJlx
         VogdBpO2KJb3O9YW7jXkChm3Zfil15O2MjN6vWRwSQFeg46cRwz0CP0dRuC20fXARhwC
         /NL4vsaFVtpN3Ll02FSpaDTCRg/0tRGw8dRolcz/vWTmucsq3dXlSjVpWpkZVyMQE8Dw
         5Cr/Ckofoyg2SeNnjNDX4nGeeidxuEWUTek2OaGEZUeMuxIe9dDwl494no/PzmDI7jjw
         QGcQ==
X-Gm-Message-State: APjAAAUMlojD1NWG9EUkKjFw9Jm6Ry6yauaK38jFmmey1og5AUvj9uFP
        j9kgmH6nMN0mF6DSHKBCvI7FSr1AqSCJWw==
X-Google-Smtp-Source: APXvYqx4jn+UOaEhEZ17Mt8b2Um9FXA97QK+YRf2fGV+r9Ml+Eiw4XfYYidZFSC7M38PwdkBGXEhUg==
X-Received: by 2002:aa7:d956:: with SMTP id l22mr2223193eds.66.1580196745589;
        Mon, 27 Jan 2020 23:32:25 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id d1sm472659ejy.3.2020.01.27.23.32.24
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 23:32:24 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id b6so14791534wrq.0
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jan 2020 23:32:24 -0800 (PST)
X-Received: by 2002:adf:f103:: with SMTP id r3mr26807891wro.295.1580196743955;
 Mon, 27 Jan 2020 23:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com>
 <20200116025637.3524-5-bibby.hsieh@mediatek.com> <20200128063633.GA1088@ninjato>
In-Reply-To: <20200128063633.GA1088@ninjato>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Jan 2020 16:32:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CWqhZpSn=w-r6kSWyNAmjNG1eE6A-z48fxfg4VT_B=3w@mail.gmail.com>
Message-ID: <CAAFQd5CWqhZpSn=w-r6kSWyNAmjNG1eE6A-z48fxfg4VT_B=3w@mail.gmail.com>
Subject: Re: [PATCH v10 4/4] i2c: core: support bus regulator controlling in adapter
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 28, 2020 at 3:36 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Thu, Jan 16, 2020 at 10:56:37AM +0800, Bibby Hsieh wrote:
> > Although in the most platforms, the bus power of i2c
> > are alway on, some platforms disable the i2c bus power
> > in order to meet low power request.
> >
> > We get and enable bulk regulator in i2c adapter device.
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
>
> ...
>
> > +#ifdef CONFIG_PM_SLEEP
> > +static int i2c_resume(struct device *dev)
> > +{
> > +     struct i2c_client *client = i2c_verify_client(dev);
> > +     struct i2c_adapter *adap = client->adapter;
> > +     int err;
> > +
> > +     if (pm_runtime_status_suspended(&adap->dev)) {
> > +             err = regulator_enable(adap->bus_reg);
> > +             if (err)
> > +                     return err;
> > +     }
> > +
> > +     return pm_generic_resume(dev);
> > +}
> > +
> > +static int i2c_suspend(struct device *dev)
> > +{
> > +     struct i2c_client *client = i2c_verify_client(dev);
> > +     struct i2c_adapter *adap = client->adapter;
> > +     int err;
> > +
> > +     if (!pm_runtime_status_suspended(&adap->dev)) {
> > +             err = regulator_disable(adap->bus_reg);
> > +             if (err)
> > +                     return err;
> > +     }
> > +
> > +     return pm_generic_suspend(dev);
> > +}
> > +#endif
> > +
> > +#ifdef CONFIG_PM
> > +static int i2c_runtime_resume(struct device *dev)
> > +{
> > +     struct i2c_client *client = i2c_verify_client(dev);
> > +     struct i2c_adapter *adap = client->adapter;
> > +     int err;
> > +
> > +     err = regulator_enable(adap->bus_reg);
> > +     if (err)
> > +             return err;
> > +
> > +     return pm_generic_runtime_resume(dev);
> > +}
> > +
> > +static int i2c_runtime_suspend(struct device *dev)
> > +{
> > +     struct i2c_client *client = i2c_verify_client(dev);
> > +     struct i2c_adapter *adap = client->adapter;
> > +     int err;
> > +
> > +     err = pm_generic_runtime_suspend(dev);
> > +     if (err)
> > +             return err;
> > +
> > +     return regulator_disable(adap->bus_reg);
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops i2c_device_pm = {
> > +     SET_SYSTEM_SLEEP_PM_OPS(i2c_suspend, i2c_resume)
> > +     SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> > +};
> > +
>
> It looks good to me, yet I am not a PM expert. An ack from someone more
> into that topic would be great, if possible.
>
> >  static void i2c_device_shutdown(struct device *dev)
> >  {
> >       struct i2c_client *client = i2c_verify_client(dev);
> > @@ -488,6 +563,7 @@ struct bus_type i2c_bus_type = {
> >       .probe          = i2c_device_probe,
> >       .remove         = i2c_device_remove,
> >       .shutdown       = i2c_device_shutdown,
> > +     .pm             = &i2c_device_pm,
> >  };
> >  EXPORT_SYMBOL_GPL(i2c_bus_type);
> >
> > @@ -1351,6 +1427,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
> >               goto out_reg;
> >
> >       dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
> > +     adap->bus_reg = devm_regulator_get(&adap->dev, "bus");
> > +     if (IS_ERR(adap->bus_reg)) {
> > +             res = PTR_ERR(adap->bus_reg);
> > +             goto out_reg;
> > +     }
> >
> >       pm_runtime_no_callbacks(&adap->dev);
> >       pm_suspend_ignore_children(&adap->dev, true);
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index d2f786706657..833b81a680da 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -15,6 +15,7 @@
> >  #include <linux/device.h>    /* for struct device */
> >  #include <linux/sched.h>     /* for completion */
> >  #include <linux/mutex.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/rtmutex.h>
> >  #include <linux/irqdomain.h>         /* for Host Notify IRQ */
> >  #include <linux/of.h>                /* for struct device_node */
> > @@ -330,6 +331,7 @@ struct i2c_client {
> >       int init_irq;                   /* irq set at initialization    */
> >       int irq;                        /* irq issued by device         */
> >       struct list_head detected;
> > +
> >  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> >       i2c_slave_cb_t slave_cb;        /* callback for slave mode      */
> >  #endif
> > @@ -723,6 +725,7 @@ struct i2c_adapter {
> >       const struct i2c_adapter_quirks *quirks;
> >
> >       struct irq_domain *host_notify_domain;
> > +     struct regulator *bus_reg;
>
> "bus_regulator" please. "reg" is ambigious with "register".
>
> And what Tomasz said, of course.
>

Thanks a lot.

I've added Rafael and linux-pm in another reply quoting the whole patch.

Best regards,
Tomasz
