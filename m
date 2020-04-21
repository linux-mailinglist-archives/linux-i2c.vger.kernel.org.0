Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF081B2B20
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 17:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgDUPZJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 11:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgDUPZI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Apr 2020 11:25:08 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DAFC061A10
        for <linux-i2c@vger.kernel.org>; Tue, 21 Apr 2020 08:25:06 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id w2so10516251edx.4
        for <linux-i2c@vger.kernel.org>; Tue, 21 Apr 2020 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A0hD3Q0ITYFJ+WJSCgWA5cOFQ2Hb706eW4ZYrVGl9Is=;
        b=nXp+eKJF/myCFRCaorUOV9CYoN/WHisSwMTKfzpZVvin3o1rzC4CCU4eM1IEsUZWzY
         K4yhdnlnO+5j7pzJIR2zo3acm84EuPDwIAqvLgv+2hMSZi28C/RwuPpbnMMXfJzQYfbO
         yVdQUm5C7n/+hWUjCO8EJmj5nopNYBLU/453U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A0hD3Q0ITYFJ+WJSCgWA5cOFQ2Hb706eW4ZYrVGl9Is=;
        b=ivzawPY26pckIh+HhvZ8OP22TNt1nSdfuudwmgjDLFWun5csn0G2JOAEqspCNbWCwH
         Fd2eIyVB0b+DhoNVnIEyR0YNq/2pvCXwCdutqmp9pjAwy3zQ9wYmGGsi0xPfhTq/HXP3
         jGlramtoZnCQTFkYSO+nMAlX7mwbYLy8LqDpgE4ZliQrlRD3LnUIpZ7e1JB6Ak8cIpnQ
         wleK8TH8KHFOwFtDPp3qBMI3KP1qCC6h/LZ4jlFVLl4dlnUKoQ1/RTw1Zr6d0rmBAaA3
         WYqsg/YZ2GKgZ6PWdYi0DeEFi1gOkd35BITWBYb5lMw+5vn1qaWR695tT0KJBZWENLcV
         ypYw==
X-Gm-Message-State: AGi0Pub1YJL33b423rLVIlJokA6PH6ord8/e4BM9loLfFqKF7yJKz9i8
        bFjPkDqXG32ihUxq+8/K/Y2+zDc9l0rzqA==
X-Google-Smtp-Source: APiQypLHE8aOsu+Fuundy7y/OTXC9Un1mum/IQA+qU5+KqLzpsWg/rMQ/WpEzRHVNey5euwFsUflag==
X-Received: by 2002:a05:6402:4ce:: with SMTP id n14mr20849607edw.32.1587482705006;
        Tue, 21 Apr 2020 08:25:05 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id g21sm493132ejm.79.2020.04.21.08.25.04
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 08:25:04 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id f13so16897351wrm.13
        for <linux-i2c@vger.kernel.org>; Tue, 21 Apr 2020 08:25:04 -0700 (PDT)
X-Received: by 2002:adf:bb94:: with SMTP id q20mr26683063wrg.105.1587482703399;
 Tue, 21 Apr 2020 08:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200421051858.11176-1-bibby.hsieh@mediatek.com> <20200421051858.11176-3-bibby.hsieh@mediatek.com>
In-Reply-To: <20200421051858.11176-3-bibby.hsieh@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 21 Apr 2020 17:24:51 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BhHpVn6aE_Q8zsg6iZu5zf05S2oO4XnE6mAfwx3HHEdw@mail.gmail.com>
Message-ID: <CAAFQd5BhHpVn6aE_Q8zsg6iZu5zf05S2oO4XnE6mAfwx3HHEdw@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] i2c: core: support bus regulator controlling in adapter
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

On Tue, Apr 21, 2020 at 7:19 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:
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
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5cc0b0ec5570..b3d15d6d449d 100644
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
> +       if (pm_runtime_status_suspended(&client->dev)) {

Shouldn't this be !pm_runtime_status_suspended()? If the device was
suspended at system suspend time, we wouldn't have powered off the
regulator in our suspend_late callback, so we don't need to re-enable
it in resume_early.

Best regards,
Tomasz
