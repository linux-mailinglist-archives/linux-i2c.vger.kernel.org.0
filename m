Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7503814AE86
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jan 2020 04:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgA1D52 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jan 2020 22:57:28 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38791 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgA1D52 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jan 2020 22:57:28 -0500
Received: by mail-ed1-f66.google.com with SMTP id p23so4418000edr.5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jan 2020 19:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gw24Y2AQXIAfbTJfxFOxt3WeUj63ebRND7ycY8ejxCQ=;
        b=R7Z/E3abAEUwwpbYiKYcQGPTfvcGSf47GTGyW+G4yf3i5N/EPO5xeU7GfKro5nxI5k
         SA0/U1TWwkcK/MnzK+WEBMELYof/bKNmsfsqZz3n9SMbT7aF4WzTjqhtappz+axMR8Ml
         HTa1xzNFGfbaCGJqDWOtSmLzqpbhiMOmnJvlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gw24Y2AQXIAfbTJfxFOxt3WeUj63ebRND7ycY8ejxCQ=;
        b=cyGWmwztDA5GYTXgY8R1e2KXGyo5AMw8N41k55MSMnwbPs5HxNLY0/7PPyXVxLMzuq
         3dbM6G4eBfV9jmNPG6fYnFuJt0gqUUc/IrDywV8csZWHdyAB7T0I/LDkTfrnfMyRNKkF
         gNnzd9fRIChr1X9yXN6WoG0UvGGaXnld299795JG03pnZT33sRDJZac0nTuE05pWD7cA
         DY7LYHXrNkcWn2tfYv1A0eK0Lr9OILEsChnER9Xb4TZPQUNd6k5IMqHaEufnyJboQeTF
         EM5WBxTGfOPiACN+D214rzOdTDvGibtbPBJR+KkdQL8FbyuxlTNwC1TD6qkPM90RzcBo
         Ds/g==
X-Gm-Message-State: APjAAAXkiYjDi3yYxjokFZmuqyJtUMXlGHZiO1oLdyQljp3Pe8/duXSZ
        nyt8YJ+tcgl5zl5TzTbn17cINF3P6zFyAw==
X-Google-Smtp-Source: APXvYqyby59QMQMKLIrcSIhlB601Z3xYGAVGFZ89i25c9PfJ3BgklH/ybGLszuVXnbYieFsAIZrqfQ==
X-Received: by 2002:a17:907:215b:: with SMTP id rk27mr1413706ejb.322.1580183844966;
        Mon, 27 Jan 2020 19:57:24 -0800 (PST)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id l9sm250690edn.54.2020.01.27.19.57.23
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 19:57:24 -0800 (PST)
Received: by mail-wr1-f47.google.com with SMTP id g17so14341851wro.2
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jan 2020 19:57:23 -0800 (PST)
X-Received: by 2002:adf:ee52:: with SMTP id w18mr25816371wro.415.1580183843131;
 Mon, 27 Jan 2020 19:57:23 -0800 (PST)
MIME-Version: 1.0
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com> <20200116025637.3524-5-bibby.hsieh@mediatek.com>
In-Reply-To: <20200116025637.3524-5-bibby.hsieh@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Jan 2020 12:57:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DS0p8iyqfFuHQWnpX+WGd1bUEdFMHF_1inKMuSY_j_zA@mail.gmail.com>
Message-ID: <CAAFQd5DS0p8iyqfFuHQWnpX+WGd1bUEdFMHF_1inKMuSY_j_zA@mail.gmail.com>
Subject: Re: [PATCH v10 4/4] i2c: core: support bus regulator controlling in adapter
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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

Hi Bibby,

Please see my comments inline.

Hi Wolfram,

Would you have some time to take a look and comment on the general
approach? Thanks.

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

Why adap->dev? We control the regulator in bus-level runtime PM
callbacks of the client->dev, right?

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

Ditto.

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

Ditto.

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

nit: Unnecessary change.

Best regards,
Tomasz
