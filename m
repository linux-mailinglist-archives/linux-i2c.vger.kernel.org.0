Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB5714B06E
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jan 2020 08:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgA1HbT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jan 2020 02:31:19 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39599 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbgA1HbS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jan 2020 02:31:18 -0500
Received: by mail-ed1-f65.google.com with SMTP id m13so13617998edb.6
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jan 2020 23:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L0geRHtmqVUJSlfCTZkl+IwuUFK5Gk74MqVQjHW52fY=;
        b=ZiLzjLUJ97uzop5jsJQlAVDn18oKgdoaluXrM8wlLtMh2dmVrvdUhi35ypsM2Csr6K
         cbsjPan0EAbsXQekIGoreGJtVN5RSIp8GBYU9o4l4zE3roQhEPFGCEPqpaPA/TnPXxQ3
         Tv/30pJIgrrAJtrqECpoEeH8QhHEt9ttBb/LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L0geRHtmqVUJSlfCTZkl+IwuUFK5Gk74MqVQjHW52fY=;
        b=X3dQNK7acvpmlMuTq1021vqleBbdDDSYw87A+5KunT9URKb3p/H48KFChqp+QDi+Ry
         jK1zgfs1Cw3QOo4OEIwikRarM+YrRkVRxzGMCWWGEoTzir/ojIewWM2j1N82Ylq8x00U
         u2kHhhnIW2g7ylKmlPaIW7QrWi0McjsnYHGGNlUh3qi0OtGWwBpJqvHjWM0WLhMKNh3u
         xL/wXRRpEf5Xt4QVwqEr4UmI+LEeCbabx1KwrSkDV2eR5D9aeKSgj8awtfbkxXspZ6da
         azJAzjcZdNGzyyHN4G7+kjFc/rTtPrYsGYkyiCFp/ycpPD7rFOj0uXyIJHYnKiVkOkHE
         4rgQ==
X-Gm-Message-State: APjAAAU8jzNdJnjYRL9D8UO0vCqFqo+ZNtSlyWnt+Hk3H4KDCWeQ+N7q
        V3s3wzreHp7wwF1UCmijhchBil0ULI+CVw==
X-Google-Smtp-Source: APXvYqwvCnFhuouyHH9loN8m99oc0zmcY64N+X/OCjlMTMKuG506tL8dBk/wrsjYenyu9C5QOlk4vw==
X-Received: by 2002:a17:906:4d89:: with SMTP id s9mr2113234eju.268.1580196675823;
        Mon, 27 Jan 2020 23:31:15 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id h16sm435387ejc.89.2020.01.27.23.31.14
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 23:31:14 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id c84so1317393wme.4
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jan 2020 23:31:14 -0800 (PST)
X-Received: by 2002:a05:600c:294a:: with SMTP id n10mr3258461wmd.11.1580196673765;
 Mon, 27 Jan 2020 23:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com> <20200116025637.3524-5-bibby.hsieh@mediatek.com>
In-Reply-To: <20200116025637.3524-5-bibby.hsieh@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Jan 2020 16:31:02 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bh9dUuu2fzxQSyuyRrEvN5o8PBqPCUTdrC5btN2Q1HVw@mail.gmail.com>
Message-ID: <CAAFQd5Bh9dUuu2fzxQSyuyRrEvN5o8PBqPCUTdrC5btN2Q1HVw@mail.gmail.com>
Subject: Re: [PATCH v10 4/4] i2c: core: support bus regulator controlling in adapter
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rafael,

On Thu, Jan 16, 2020 at 11:56 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
>
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>
> We get and enable bulk regulator in i2c adapter device.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/i2c/i2c-core-base.c | 81 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  3 ++
>  2 files changed, 84 insertions(+)
>

I posted some comments in a separate reply [1] and Wolfram confirmed
that he's fine with the approach [2]. Would you have some time to take
a look from the PM point of view? Thanks.

[1] https://patchwork.ozlabs.org/patch/1223991/#2350984
[2] https://patchwork.ozlabs.org/patch/1223991/#2351032

Please let me know if you want me to CC you directly on any of those replies.

Best regards,
Tomasz

> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9333c865d4a9..9b9e96b094ca 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -306,6 +306,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>  static int i2c_device_probe(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> +       struct i2c_adapter      *adap = client->adapter;
>         struct i2c_driver       *driver;
>         int status;
>
> @@ -371,6 +372,12 @@ static int i2c_device_probe(struct device *dev)
>
>         dev_dbg(dev, "probe\n");
>
> +       status = regulator_enable(adap->bus_reg);
> +       if (status != 0) {
> +               dev_err(&adap->dev, "Failed to enable power regulator\n");
> +               goto err_clear_wakeup_irq;
> +       }
> +
>         status = of_clk_set_defaults(dev->of_node, false);
>         if (status < 0)
>                 goto err_clear_wakeup_irq;
> @@ -407,6 +414,7 @@ static int i2c_device_probe(struct device *dev)
>  static int i2c_device_remove(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> +       struct i2c_adapter      *adap = client->adapter;
>         struct i2c_driver       *driver;
>         int status = 0;
>
> @@ -420,6 +428,8 @@ static int i2c_device_remove(struct device *dev)
>         }
>
>         dev_pm_domain_detach(&client->dev, true);
> +       if (!pm_runtime_status_suspended(&adap->dev))
> +               regulator_disable(adap->bus_reg);
>
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
> @@ -431,6 +441,71 @@ static int i2c_device_remove(struct device *dev)
>         return status;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       if (pm_runtime_status_suspended(&adap->dev)) {
> +               err = regulator_enable(adap->bus_reg);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return pm_generic_resume(dev);
> +}
> +
> +static int i2c_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       if (!pm_runtime_status_suspended(&adap->dev)) {
> +               err = regulator_disable(adap->bus_reg);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return pm_generic_suspend(dev);
> +}
> +#endif
> +
> +#ifdef CONFIG_PM
> +static int i2c_runtime_resume(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       err = regulator_enable(adap->bus_reg);
> +       if (err)
> +               return err;
> +
> +       return pm_generic_runtime_resume(dev);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       err = pm_generic_runtime_suspend(dev);
> +       if (err)
> +               return err;
> +
> +       return regulator_disable(adap->bus_reg);
> +}
> +#endif
> +
> +static const struct dev_pm_ops i2c_device_pm = {
> +       SET_SYSTEM_SLEEP_PM_OPS(i2c_suspend, i2c_resume)
> +       SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> +};
> +
>  static void i2c_device_shutdown(struct device *dev)
>  {
>         struct i2c_client *client = i2c_verify_client(dev);
> @@ -488,6 +563,7 @@ struct bus_type i2c_bus_type = {
>         .probe          = i2c_device_probe,
>         .remove         = i2c_device_remove,
>         .shutdown       = i2c_device_shutdown,
> +       .pm             = &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
>
> @@ -1351,6 +1427,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>                 goto out_reg;
>
>         dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
> +       adap->bus_reg = devm_regulator_get(&adap->dev, "bus");
> +       if (IS_ERR(adap->bus_reg)) {
> +               res = PTR_ERR(adap->bus_reg);
> +               goto out_reg;
> +       }
>
>         pm_runtime_no_callbacks(&adap->dev);
>         pm_suspend_ignore_children(&adap->dev, true);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index d2f786706657..833b81a680da 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>      /* for struct device */
>  #include <linux/sched.h>       /* for completion */
>  #include <linux/mutex.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/rtmutex.h>
>  #include <linux/irqdomain.h>           /* for Host Notify IRQ */
>  #include <linux/of.h>          /* for struct device_node */
> @@ -330,6 +331,7 @@ struct i2c_client {
>         int init_irq;                   /* irq set at initialization    */
>         int irq;                        /* irq issued by device         */
>         struct list_head detected;
> +
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>         i2c_slave_cb_t slave_cb;        /* callback for slave mode      */
>  #endif
> @@ -723,6 +725,7 @@ struct i2c_adapter {
>         const struct i2c_adapter_quirks *quirks;
>
>         struct irq_domain *host_notify_domain;
> +       struct regulator *bus_reg;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>
> --
> 2.18.0
