Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22385120494
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2019 12:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfLPL7I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Dec 2019 06:59:08 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39066 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfLPL7I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Dec 2019 06:59:08 -0500
Received: by mail-ed1-f68.google.com with SMTP id v16so4756727edy.6
        for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2019 03:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OdxYjoNvvAigHgcFiC0RbqBfDi1gELByEUzUPakRzAU=;
        b=QS4oJUXMBR1LKAmIRfNd7TsTPRvZM+p35ulJJJ0tqyFHzhtpDodYo5LQgsYohpMD38
         jd2GpYZzmeFrxdjcvVHDIEQU5Ob37zkgIrdMFcPd6V+3m11xQam+VZueAHmC/FTDgrce
         M3ruBdp8qqJK+f4rArJwqJ1LXk+sdQpFvLVbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OdxYjoNvvAigHgcFiC0RbqBfDi1gELByEUzUPakRzAU=;
        b=cghlPv14+klaLsnFGYdXmuwwQXEEi74VwT1DZhb9HLVQWu837bifPScMFPDnVnbjGp
         PPntXnTIdWIScp2iojpLLRNLvj1TDD230TpH3Q1MPZN/4mzOBJqBJvL4KWI5Tc9F7EUl
         pLPoydbhdf2X5EOd3Yh2dM5T8g6Zam/Np9kSPsg5wC0gHmt4l5IUDd31hBtJYJYwWSf+
         9bP6yCCK/ZgnLF7rVwvEhuSZtaFxa/2tBYmvq3HmyRBt6QMDqt+VX+Nhow7y4pQFh6Rr
         vkSgkIuZtNm1kaPkVuVnjkUTztG83E7XPQGvDU6OKKZl06L5Zhy4BLINTDGsz59t9DG1
         /Urw==
X-Gm-Message-State: APjAAAWUvNcbOIchPtHVHDLlIl/DVCFDVslVnpJKN9IJ5AsLFxwzFEDF
        7hlT2BI7sEJeQNMLD4j2jSPnbESMFQnUiA==
X-Google-Smtp-Source: APXvYqwVdiSu1t+JsrSJ6HxLgTalRAuJ+ho5nyXJttMgGCE8/PHV2tZ1OOQSJayoxwM1Eq4lhGY4tQ==
X-Received: by 2002:a50:d5c9:: with SMTP id g9mr17740490edj.131.1576497542967;
        Mon, 16 Dec 2019 03:59:02 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id t25sm88042edt.60.2019.12.16.03.59.01
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 03:59:02 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id y11so6894316wrt.6
        for <linux-i2c@vger.kernel.org>; Mon, 16 Dec 2019 03:59:01 -0800 (PST)
X-Received: by 2002:adf:f586:: with SMTP id f6mr28927980wro.46.1576497541085;
 Mon, 16 Dec 2019 03:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20191216080445.8747-1-bibby.hsieh@mediatek.com> <20191216080445.8747-5-bibby.hsieh@mediatek.com>
In-Reply-To: <20191216080445.8747-5-bibby.hsieh@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 16 Dec 2019 20:58:49 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CU79CnRkpo8bpijMCvtzKAkQXj6nadt3YyQSCcq5roXQ@mail.gmail.com>
Message-ID: <CAAFQd5CU79CnRkpo8bpijMCvtzKAkQXj6nadt3YyQSCcq5roXQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] i2c: core: support bus regulator controlling in adapter
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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

Hi Bibby,

On Mon, Dec 16, 2019 at 5:04 PM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
>
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>
> We get and enable bulk regulator in i2c adapter device.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/i2c/i2c-core-base.c | 65 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  3 ++
>  2 files changed, 68 insertions(+)
>

Thanks for the patch! Please see my comments below.

> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9333c865d4a9..e95ebd0af200 100644
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
> @@ -431,6 +441,54 @@ static int i2c_device_remove(struct device *dev)
>         return status;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;

We need to ensure here that if the slave device was not runtime
suspended before the system suspend, the regulator is enabled before
the slave's resume callback is called.

> +
> +       return pm_generic_resume(&adap->dev);
> +}
> +
> +static int i2c_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +
> +       return pm_generic_suspend(&adap->dev);

We need to ensure that the regulator is disabled when the system suspends.

> +}
> +#endif
> +
> +#ifdef CONFIG_PM
> +static int i2c_runtime_resume(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +
> +       pm_generic_runtime_resume(&adap->dev);

Why adap->dev? This callback is expected to execute a PM operation on
the I2C slave device.

Also, don't we need some error handling here?

> +
> +       return regulator_enable(adap->bus_reg);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +
> +       pm_generic_runtime_suspend(&adap->dev);

Ditto.

> +
> +       if (!pm_runtime_status_suspended(&adap->dev))

Since we just executed a suspend operation on the device, how is it
possible that it isn't suspended?

> +               return regulator_disable(client->adapter->bus_reg);
> +
> +       return 0;
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
> @@ -488,6 +546,7 @@ struct bus_type i2c_bus_type = {
>         .probe          = i2c_device_probe,
>         .remove         = i2c_device_remove,
>         .shutdown       = i2c_device_shutdown,
> +       .pm             = &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
>
> @@ -1351,6 +1410,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
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
> @@ -1580,6 +1644,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
>         dev_dbg(&adap->dev, "adapter [%s] unregistered\n", adap->name);
>
>         pm_runtime_disable(&adap->dev);
> +       devm_regulator_put(adap->bus_reg);
>
>         i2c_host_notify_irq_teardown(adap);
>
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

Unnecessary change.

Best regards,
Tomasz
