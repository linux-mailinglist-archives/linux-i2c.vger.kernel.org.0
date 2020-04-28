Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E521BBCBA
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 13:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgD1Lok (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 07:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgD1Lok (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 07:44:40 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEEDC03C1AB
        for <linux-i2c@vger.kernel.org>; Tue, 28 Apr 2020 04:44:40 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id n17so16969370ejh.7
        for <linux-i2c@vger.kernel.org>; Tue, 28 Apr 2020 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z4N6XtG1ZXKRYHsuz8CRKPzisp3+tik69lDc5VTWRYY=;
        b=jjodG4Yv5WB32QuF7yWDCS2QrLx4aPImKR5BGN452G7gail+hWqZWgK9a11uH4DARR
         A4daXbwpzfIUhYvw23BJr7B1QhgA8pUbXoBM6ieR6BRNV1hB2LipzrRu8qJ9Ip1ZOB2e
         0UlqNDVAJiwU5nxy1DEihKo6CeA3gvFRWxIio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z4N6XtG1ZXKRYHsuz8CRKPzisp3+tik69lDc5VTWRYY=;
        b=oZHLrSE8IT4WpCbwWJtzMgI1iRKlgh1w5CwvPj2KLowvLvrXJ0I4dqu8QYiLScE1ak
         F21zXDlWFJgHfT9OeKMhk1Oq7O+FHfpQc6DTgidBPTJxmUmj9AfmoOtDyVwXAjtKirmk
         MJx9JvXdKz6xG/exiSVWeQSuliLIz/OUFhHqWZrqFnww2GhuXRrY1I/IqiThCDoqqgOH
         jyB2lxkRBErbXkHAaNz6yKxJ/Ogz+oGiqnC6xxMvsstgIT8En1OwNmRQ3rPj2ay4u7qv
         iJyGxfRDu7OHzqgDBDK71oIC2A+F99UJ0HtGawwcOFeD7cn/xzpbqIiSTitSAP4djOUp
         +WQg==
X-Gm-Message-State: AGi0Pua8ZuDWBKrX/JnVqig6vImqfEU6EvSapzXygJomSExpGwapS2Qo
        0heNBjiCFVzGUkxeqJ4QIDtWo96Rs040rQ==
X-Google-Smtp-Source: APiQypLNi8fH82qXxcilNYM0D1YrHGB3/HVQ0vVZ4KsCQBnd8O59VT8FPn1B+NZBJrkdHymXdAZU9g==
X-Received: by 2002:a17:906:9450:: with SMTP id z16mr23409593ejx.166.1588074278315;
        Tue, 28 Apr 2020 04:44:38 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id ce18sm423349ejb.61.2020.04.28.04.44.37
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 04:44:37 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id i10so24252900wrv.10
        for <linux-i2c@vger.kernel.org>; Tue, 28 Apr 2020 04:44:37 -0700 (PDT)
X-Received: by 2002:adf:fc4f:: with SMTP id e15mr33034447wrs.415.1588074276426;
 Tue, 28 Apr 2020 04:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200428061813.27072-1-bibby.hsieh@mediatek.com>
 <20200428061813.27072-3-bibby.hsieh@mediatek.com> <e3583893-f49d-0e78-6414-ed565099af63@ti.com>
In-Reply-To: <e3583893-f49d-0e78-6414-ed565099af63@ti.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Apr 2020 13:44:25 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DEuYWzZz=SeOTjJg_vxaYdYuf_vw-UFVMRYDBKxdtL0A@mail.gmail.com>
Message-ID: <CAAFQd5DEuYWzZz=SeOTjJg_vxaYdYuf_vw-UFVMRYDBKxdtL0A@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] i2c: core: support bus regulator controlling in adapter
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

On Tue, Apr 28, 2020 at 1:25 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
>
>
>
> On 28/04/2020 09:18, Bibby Hsieh wrote:
> > Although in the most platforms, the bus power of i2c
> > are alway on, some platforms disable the i2c bus power
> > in order to meet low power request.
> >
> > We get and enable bulk regulator in i2c adapter device.
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >   drivers/i2c/i2c-core-base.c | 82 +++++++++++++++++++++++++++++++++++++
> >   include/linux/i2c.h         |  2 +
> >   2 files changed, 84 insertions(+)
> >
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 5cc0b0ec5570..f81b42a4ed07 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -313,6 +313,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
> >   static int i2c_device_probe(struct device *dev)
> >   {
> >       struct i2c_client       *client = i2c_verify_client(dev);
> > +     struct i2c_adapter      *adap = client->adapter;
> >       struct i2c_driver       *driver;
> >       int status;
> >
> > @@ -378,6 +379,12 @@ static int i2c_device_probe(struct device *dev)
> >
> >       dev_dbg(dev, "probe\n");
> >
> > +     status = regulator_enable(adap->bus_regulator);
> > +     if (status < 0) {
> > +             dev_err(&adap->dev, "Failed to enable power regulator\n");
> > +             goto err_clear_wakeup_irq;
> > +     }
> > +
>
> Sry, but this is confusing.
> What if there is separate regulators for I2C device and bus/adapter?
>
> I2C bus is transaction based and usually I2C bus drivers ensures that i2c bus is
> in proper state to perform transaction. While I2C devices can be enable, configured and
> function without actually interacting with I2C bus unless required (irq for example).
>
> With you change any I2C device will enable and keep bus regulator on all the time it's active
> even if there is no I2C interruptions.

The I2C SDA/SCL lines must stay high for all the time the bus is idle.
The regulator in question here is exactly the regulator that drives
the voltage rail the SDA/SCL lines are pulled up to and so it needs to
be enabled all the time any slave device is active and expects the I2C
bus to be in a valid state.

>
> Following the problem description it seems
>   - i2c bus driver should get regulator and ensure it's enabled for the duration of transaction(s)

That's not necessary given the point below, because the slave driver
must not trigger any I2C transactions when the slave device is not
active.

>   - i2c device should get its own regulator (or the same if shared)  ensure it's enabled for
>     the period device is active.

This is a board design aspect and not specific to any particular I2C
slave device, so slave drivers should not be aware of it. This patch
exactly attempts to get this SDA/SCL regulator on behalf of the slave
device.

>
>
> >       status = of_clk_set_defaults(dev->of_node, false);
> >       if (status < 0)
> >               goto err_clear_wakeup_irq;
> > @@ -414,6 +421,7 @@ static int i2c_device_probe(struct device *dev)
> >   static int i2c_device_remove(struct device *dev)
> >   {
> >       struct i2c_client       *client = i2c_verify_client(dev);
> > +     struct i2c_adapter      *adap = client->adapter;
> >       struct i2c_driver       *driver;
> >       int status = 0;
> >
> > @@ -427,6 +435,8 @@ static int i2c_device_remove(struct device *dev)
> >       }
> >
> >       dev_pm_domain_detach(&client->dev, true);
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             regulator_disable(adap->bus_regulator);
> >
> >       dev_pm_clear_wake_irq(&client->dev);
> >       device_init_wakeup(&client->dev, false);
> > @@ -438,6 +448,72 @@ static int i2c_device_remove(struct device *dev)
> >       return status;
> >   }
> >
> > +#ifdef CONFIG_PM_SLEEP
> > +static int i2c_resume_early(struct device *dev)
> > +{
> > +     struct i2c_client *client = i2c_verify_client(dev);
> > +     struct i2c_adapter *adap = client->adapter;
> > +     int err;
> > +
> > +     if (!pm_runtime_status_suspended(&client->dev)) {
> > +             err = regulator_enable(adap->bus_regulator);
> > +             if (err)
> > +                     return err;
> > +     }
> > +
> > +     return pm_generic_resume_early(&client->dev);
> > +}
> > +
> > +static int i2c_suspend_late(struct device *dev)
> > +{
> > +     struct i2c_client *client = i2c_verify_client(dev);
> > +     struct i2c_adapter *adap = client->adapter;
> > +     int err;
> > +
> > +     err = pm_generic_suspend_late(&client->dev);
> > +     if (err)
> > +             return err;
> > +
> > +     if (!pm_runtime_status_suspended(&client->dev))
> > +             return regulator_disable(adap->bus_regulator);
> > +
> > +     return err;
> > +}
> > +#endif
>
> Have you considered pm_runtime_force_suspend/pm_runtime_force_resume?
>
> > +
> > +#ifdef CONFIG_PM
> > +static int i2c_runtime_resume(struct device *dev)
> > +{
> > +     struct i2c_client *client = i2c_verify_client(dev);
> > +     struct i2c_adapter *adap = client->adapter;
> > +     int err;
> > +
> > +     err = regulator_enable(adap->bus_regulator);
> > +     if (err)
> > +             return err;
> > +
> > +     return pm_generic_runtime_resume(&client->dev);
> > +}
> > +
> > +static int i2c_runtime_suspend(struct device *dev)
> > +{
> > +     struct i2c_client *client = i2c_verify_client(dev);
> > +     struct i2c_adapter *adap = client->adapter;
> > +     int err;
> > +
> > +     err = pm_generic_runtime_suspend(&client->dev);
> > +     if (err)
> > +             return err;
> > +
> > +     return regulator_disable(adap->bus_regulator);
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops i2c_device_pm = {
> > +     SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
> > +     SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> > +};
> > +
> >   static void i2c_device_shutdown(struct device *dev)
> >   {
> >       struct i2c_client *client = i2c_verify_client(dev);
> > @@ -495,6 +571,7 @@ struct bus_type i2c_bus_type = {
> >       .probe          = i2c_device_probe,
> >       .remove         = i2c_device_remove,
> >       .shutdown       = i2c_device_shutdown,
> > +     .pm             = &i2c_device_pm,
> >   };
> >   EXPORT_SYMBOL_GPL(i2c_bus_type);
> >
> > @@ -1333,6 +1410,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
> >       if (res)
> >               goto out_reg;
> >
> > +     adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> > +     if (IS_ERR(adap->bus_regulator)) {
> > +             res = PTR_ERR(adap->bus_regulator);
> > +             goto out_reg;
> > +     }
> >       dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
> >
> >       pm_runtime_no_callbacks(&adap->dev);
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index 456fc17ecb1c..bc83af0d38d1 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -15,6 +15,7 @@
> >   #include <linux/device.h>   /* for struct device */
> >   #include <linux/sched.h>    /* for completion */
> >   #include <linux/mutex.h>
> > +#include <linux/regulator/consumer.h>
> >   #include <linux/rtmutex.h>
> >   #include <linux/irqdomain.h>                /* for Host Notify IRQ */
> >   #include <linux/of.h>               /* for struct device_node */
> > @@ -721,6 +722,7 @@ struct i2c_adapter {
> >       const struct i2c_adapter_quirks *quirks;
> >
> >       struct irq_domain *host_notify_domain;
> > +     struct regulator *bus_regulator;
> >   };
> >   #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
> >
> >
>
> --
> Best regards,
> grygorii
