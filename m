Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7B31BBCC1
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 13:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgD1Lpf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 07:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgD1Lpf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 07:45:35 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 446F8C03C1AB
        for <linux-i2c@vger.kernel.org>; Tue, 28 Apr 2020 04:45:34 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id e2so16933354eje.13
        for <linux-i2c@vger.kernel.org>; Tue, 28 Apr 2020 04:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ghVaLvgfptCaaZOVahUCAkpUeHXgsqT+vrjbhFZHSc=;
        b=WCmchLk82HqiCwaieVSY9+b2tv9ZS0iPFiPat7z0ETDi1r6Q3uKq+VtUw1I9fi4r7P
         roUOHRDmnS37DXdW+kZZ6g2KXV966oORc1KFftEULlQvlPJzccIAcGKPpuqN3CsuxRzj
         4L3tzgO8TQqjcZ3cXCZ/mpc6rs0RFAbhj5XCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ghVaLvgfptCaaZOVahUCAkpUeHXgsqT+vrjbhFZHSc=;
        b=m7cTaJ6jPPEhLmprBtzVYpmXCu9jo6yKtf+5kC4Llc47kI6lXuD2L5Vevsr11VQHBU
         GdP7DDopIUOTGCESmqWwuhHNCbr/WsIyviY+Jg8hSmA56YDt3tKgesLIv9Gd1a4K34od
         yt+2G8EL//Z25ZdWEe0Cs5AQKHKLMtLQ/9Suv5mB+ofk1H2EYZ2cMbNOJ8q2eEaOFdZm
         OhH+hQ9fybe67bTAvQPHXGxCpSQqfMB1IOqngk3ax8dIWlPENIFg/3j/MxXMyTc/AOpl
         O69ONLckUGJ6X6DgyTK6MRi06ozxzntFFIGMP5hSBMUax1WTvsgwbnQbbB4WDL8OBPHO
         32Cw==
X-Gm-Message-State: AGi0PuYge4BgClaBTz/Olldpx+cE6Dm6n+piyyOH6O2L3pLK9qDX5Brq
        ZLa8v74pRR+EYxNRQhytBwH38SPKE2fKZQ==
X-Google-Smtp-Source: APiQypIvVqgN4rFCN4msy8k5++wM62sa/IpzqrOMqu/iUGkkqr1hreL/ZZzDSzyGVbkLH4YQ9ZIBSA==
X-Received: by 2002:a17:906:a39a:: with SMTP id k26mr23218102ejz.172.1588074332435;
        Tue, 28 Apr 2020 04:45:32 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id y13sm262081edv.9.2020.04.28.04.45.31
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 04:45:31 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id k1so24300956wrx.4
        for <linux-i2c@vger.kernel.org>; Tue, 28 Apr 2020 04:45:31 -0700 (PDT)
X-Received: by 2002:adf:9d8d:: with SMTP id p13mr32019542wre.17.1588074330852;
 Tue, 28 Apr 2020 04:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200428061813.27072-1-bibby.hsieh@mediatek.com> <20200428061813.27072-3-bibby.hsieh@mediatek.com>
In-Reply-To: <20200428061813.27072-3-bibby.hsieh@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 28 Apr 2020 13:45:18 +0200
X-Gmail-Original-Message-ID: <CAAFQd5A0wG22F32bEZeN1ZmwxnbQkcexHV9JbPUFrTijF3TgLw@mail.gmail.com>
Message-ID: <CAAFQd5A0wG22F32bEZeN1ZmwxnbQkcexHV9JbPUFrTijF3TgLw@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] i2c: core: support bus regulator controlling in adapter
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
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

On Tue, Apr 28, 2020 at 8:18 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
>
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>
> We get and enable bulk regulator in i2c adapter device.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/i2c/i2c-core-base.c | 82 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  2 +
>  2 files changed, 84 insertions(+)
>

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5cc0b0ec5570..f81b42a4ed07 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -313,6 +313,7 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>  static int i2c_device_probe(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> +       struct i2c_adapter      *adap = client->adapter;
>         struct i2c_driver       *driver;
>         int status;
>
> @@ -378,6 +379,12 @@ static int i2c_device_probe(struct device *dev)
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
> @@ -414,6 +421,7 @@ static int i2c_device_probe(struct device *dev)
>  static int i2c_device_remove(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> +       struct i2c_adapter      *adap = client->adapter;
>         struct i2c_driver       *driver;
>         int status = 0;
>
> @@ -427,6 +435,8 @@ static int i2c_device_remove(struct device *dev)
>         }
>
>         dev_pm_domain_detach(&client->dev, true);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               regulator_disable(adap->bus_regulator);
>
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
> @@ -438,6 +448,72 @@ static int i2c_device_remove(struct device *dev)
>         return status;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume_early(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       if (!pm_runtime_status_suspended(&client->dev)) {
> +               err = regulator_enable(adap->bus_regulator);
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
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       err = pm_generic_suspend_late(&client->dev);
> +       if (err)
> +               return err;
> +
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               return regulator_disable(adap->bus_regulator);
> +
> +       return err;
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
> +       err = regulator_enable(adap->bus_regulator);
> +       if (err)
> +               return err;
> +
> +       return pm_generic_runtime_resume(&client->dev);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       struct i2c_adapter *adap = client->adapter;
> +       int err;
> +
> +       err = pm_generic_runtime_suspend(&client->dev);
> +       if (err)
> +               return err;
> +
> +       return regulator_disable(adap->bus_regulator);
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
> @@ -495,6 +571,7 @@ struct bus_type i2c_bus_type = {
>         .probe          = i2c_device_probe,
>         .remove         = i2c_device_remove,
>         .shutdown       = i2c_device_shutdown,
> +       .pm             = &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
>
> @@ -1333,6 +1410,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>         if (res)
>                 goto out_reg;
>
> +       adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> +       if (IS_ERR(adap->bus_regulator)) {
> +               res = PTR_ERR(adap->bus_regulator);
> +               goto out_reg;
> +       }
>         dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
>
>         pm_runtime_no_callbacks(&adap->dev);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 456fc17ecb1c..bc83af0d38d1 100644
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
> 2.18.0
