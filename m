Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E09F3306EF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 05:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbhCHEje (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Mar 2021 23:39:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234243AbhCHEjR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 7 Mar 2021 23:39:17 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACACFC06174A
        for <linux-i2c@vger.kernel.org>; Sun,  7 Mar 2021 20:39:17 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id o11so8619147iob.1
        for <linux-i2c@vger.kernel.org>; Sun, 07 Mar 2021 20:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bsbT519mzZdb7mcw/7+TNYojkJACyFMHn6cRnUT7eX0=;
        b=PTz+1nw9/NMgAcQ5v/H55nWKHg1I2Z8jcJgMvEMjg6HGSPnYvHylTDKy1hC89hNHro
         yHtPIYhPZpDRWp+v/va46n/eRPReJ3+tK1rf0I6SgqKPy2z4SGIsyiOPQjkY1XAIWl5Y
         X9RUDlJPPQYyU10FS6blP9+JMX9tyXUL98WPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bsbT519mzZdb7mcw/7+TNYojkJACyFMHn6cRnUT7eX0=;
        b=RzysFeNe7TRI473/88lP10k67tzuuhZQhKNy02ju4m0EUAyUSppqBN3i3nQHWm/Exs
         xWGZg6QAfYaVnzUmcj3mgHUwjbp+igiMt5tpJIZDMpcF7hDFwKrIYl2hct6MAxeyCkeb
         FVzCwS6Qp22/T+FAni6u8KNR+CbzrPIwi/FuJb+itkae5TIaEULRLi50PCDEoBaTuPha
         lqRpvB65G7jwFr/93f3XQWkjlzgjIMfjimw6LfWl2AOa+NPqLUxJdZEhvGyRetFOkmlb
         Ge7JBSJ+297HpnubEfg1dznzzl7XFroNkKVxEAUR71/+CnBOIADc1T2MgZKNqoRlpmyM
         Rykw==
X-Gm-Message-State: AOAM533rD3dWwEze2rCZtVy2Z2nlAsnjDHsQSnf35WQfpdp0T00CifAM
        UrDq3w8XsT8+IcOzE0/cqsdlAOTXvV12Mnn/TashQg==
X-Google-Smtp-Source: ABdhPJwXbXBGNNcHdygZ3prUT42NljCsseOPVpwNtukWEbh01trlakkHXGLwXwTQWqw4QSgtc6p7Kc98nEGxgZ5S65w=
X-Received: by 2002:a5e:d61a:: with SMTP id w26mr17530414iom.40.1615178356732;
 Sun, 07 Mar 2021 20:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20210305102004.191209-1-hsinyi@chromium.org>
In-Reply-To: <20210305102004.191209-1-hsinyi@chromium.org>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Mon, 8 Mar 2021 12:38:50 +0800
Message-ID: <CAJMQK-iDgkETDOnExG3Opuave98q0Nbq2ZK+NpyD_bmB0SrpDA@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: support bus regulator controlling in adapter
To:     Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 5, 2021 at 6:20 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> From: Bibby Hsieh <bibby.hsieh@mediatek.com>
>
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>
> We get and enable bulk regulator in i2c adapter device.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> This patch is squashed from following patch and tested on mt8183 device
> which has eeprom at24 client under i2c, so the fix in [2] is also
> verified.
> [1] https://patchwork.ozlabs.org/project/linux-i2c/cover/20200519072729.7268-1-bibby.hsieh@mediatek.com/
> [2] https://patchwork.ozlabs.org/project/linux-i2c/patch/20200522101327.13456-1-m.szyprowski@samsung.com/
> ---

Sent again with document rebased in v16 here:
https://patchwork.ozlabs.org/project/linux-i2c/cover/20210308043607.957156-1-hsinyi@chromium.org/

>  drivers/i2c/i2c-core-base.c | 93 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  2 +
>  2 files changed, 95 insertions(+)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 63ebf722a424..667f4a4de7cc 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -439,12 +439,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>  static int i2c_device_probe(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> +       struct i2c_adapter      *adap;
>         struct i2c_driver       *driver;
>         int status;
>
>         if (!client)
>                 return 0;
>
> +       adap = client->adapter;
>         client->irq = client->init_irq;
>
>         if (!client->irq) {
> @@ -510,6 +512,12 @@ static int i2c_device_probe(struct device *dev)
>
>         dev_dbg(dev, "probe\n");
>
> +       status = regulator_enable(adap->bus_regulator);
> +       if (status < 0) {
> +               dev_err(&adap->dev, "Failed to enable power regulator\n");
> +               goto err_clear_wakeup_irq;
> +       }
> +
>         status = of_clk_set_defaults(dev->of_node, false);
>         if (status < 0)
>                 goto err_clear_wakeup_irq;
> @@ -550,8 +558,10 @@ static int i2c_device_probe(struct device *dev)
>  static int i2c_device_remove(struct device *dev)
>  {
>         struct i2c_client       *client = to_i2c_client(dev);
> +       struct i2c_adapter      *adap;
>         struct i2c_driver       *driver;
>
> +       adap = client->adapter;
>         driver = to_i2c_driver(dev->driver);
>         if (driver->remove) {
>                 int status;
> @@ -564,6 +574,8 @@ static int i2c_device_remove(struct device *dev)
>         }
>
>         dev_pm_domain_detach(&client->dev, true);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               regulator_disable(adap->bus_regulator);
>
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
> @@ -576,6 +588,80 @@ static int i2c_device_remove(struct device *dev)
>         return 0;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume_early(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       int err;
> +
> +       if (!client)
> +               return 0;
> +
> +       if (!pm_runtime_status_suspended(&client->dev)) {
> +               err = regulator_enable(client->adapter->bus_regulator);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return pm_generic_resume_early(&client->dev);
> +}
> +
> +static int i2c_suspend_late(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       int err;
> +
> +       if (!client)
> +               return 0;
> +
> +       err = pm_generic_suspend_late(&client->dev);
> +       if (err)
> +               return err;
> +
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               return regulator_disable(client->adapter->bus_regulator);
> +
> +       return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_PM
> +static int i2c_runtime_resume(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       int err;
> +
> +       if (!client)
> +               return 0;
> +
> +       err = regulator_enable(client->adapter->bus_regulator);
> +       if (err)
> +               return err;
> +
> +       return pm_generic_runtime_resume(&client->dev);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       int err;
> +
> +       if (!client)
> +               return 0;
> +
> +       err = pm_generic_runtime_suspend(&client->dev);
> +       if (err)
> +               return err;
> +
> +       return regulator_disable(client->adapter->bus_regulator);
> +}
> +#endif
> +
> +static const struct dev_pm_ops i2c_device_pm = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
> +       SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> +};
> +
>  static void i2c_device_shutdown(struct device *dev)
>  {
>         struct i2c_client *client = i2c_verify_client(dev);
> @@ -633,6 +719,7 @@ struct bus_type i2c_bus_type = {
>         .probe          = i2c_device_probe,
>         .remove         = i2c_device_remove,
>         .shutdown       = i2c_device_shutdown,
> +       .pm             = &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
>
> @@ -1446,6 +1533,12 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>         if (res)
>                 goto out_reg;
>
> +       adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> +       if (IS_ERR(adap->bus_regulator)) {
> +               res = PTR_ERR(adap->bus_regulator);
> +               goto out_reg;
> +       }
> +
>         pm_runtime_no_callbacks(&adap->dev);
>         pm_suspend_ignore_children(&adap->dev, true);
>         pm_runtime_enable(&adap->dev);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 56622658b215..ec87758d9f40 100644
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
> @@ -721,6 +722,7 @@ struct i2c_adapter {
>         const struct i2c_adapter_quirks *quirks;
>
>         struct irq_domain *host_notify_domain;
> +       struct regulator *bus_regulator;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>
> --
> 2.30.1.766.gb4fecdf3b7-goog
>
