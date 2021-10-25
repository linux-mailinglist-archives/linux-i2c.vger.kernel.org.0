Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6476D4394DC
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Oct 2021 13:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhJYLev (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Oct 2021 07:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhJYLeu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Oct 2021 07:34:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371B4C061745;
        Mon, 25 Oct 2021 04:32:28 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id a26so17307067edy.11;
        Mon, 25 Oct 2021 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G2NPmlcMPM8u/iY4todsLOCGGObz0mNOdwPosQ4z7jU=;
        b=iBXBEyTvee6oM98JuqDH5T5z+TI3MTmuIHrsMr0w3ksV1pIAj6WbaHDx1T7wz+I4tw
         2xCsxFxgxLaHVrTNOlV0YDkxwTXVzIZ+LP94Gxhfe9fOViwdJf2OJ3w+fJsjQkkar0Fa
         g1FP3e/le9ZANjG6VbXkhB4wlk8vCZLrijf027ZnS+NAgUuZyG90RhWCSh490gSfULrg
         KLCY95RmW4RyhJKQttgg0BhurANO7w5zRir1GlebR1YQ6FVdqkvFTjoxiQXYU6VwTTqA
         87B85toll8bZQ6bp8E5lPoDLFgeWj8YEaMazpcVy/EKkkmtMs9+Adubh+9laD5ea1zaF
         I6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G2NPmlcMPM8u/iY4todsLOCGGObz0mNOdwPosQ4z7jU=;
        b=OzSF6v41+wCM+FUCn0UWY65DPPE+GhxYN9ctxY0/mhsYCz+7IunC3HY7Hhk/gZ/JS0
         1S4ZiaVjTaCLmMPmZY5f536F/8iUpOY46lUdBoUOWaFvEl6M1SDyGvOxpdbrLG6c3Dz1
         faS0GaQUQQ0DeOiuC+GOJ66KK2qkTNLyYWu9M6nrGpH4BYNsZ4Rdo7VqT04z77vHfV89
         pcHnoRInQKdQI8lKcn+WD66qoM2xAwGcVugGm2BNxSHj8bPeVqdVJwULxLXnv5ZJtPVc
         GK+hsQ1PzGzaoosrO8fyL5RBRfph+3iGldhOnJ+LtEUgHr7mPhOsERWk2mjLKw3rZm2h
         msKQ==
X-Gm-Message-State: AOAM530h/cPKEudoOo+STcPTyAwjWctNIXcKzJiGTgiTeZvgWoo2X5iq
        zJiJlHzv9SfeAdbn2+yTXkwjb2UOvn3Pb3Sp4Qg=
X-Google-Smtp-Source: ABdhPJwRTtO/pCXD97oUX/9rG5nYJlwxtG0fIcAVwqui8j4uQB48QLOBmVa/Ihxvr6hmy0V6m6XOuSP7TWuXDVe2Gjs=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr22028819ejc.69.1635161546705;
 Mon, 25 Oct 2021 04:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-9-hdegoede@redhat.com>
In-Reply-To: <20211025094119.82967-9-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Oct 2021 14:31:32 +0300
Message-ID: <CAHp75VeLAW6ZBQYidnD7PDYfAH3A2bq+oMJTru-9OW_t-XS26g@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] platform/x86: int3472: Add get_sensor_adev_and_name()
 helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The discrete.c code is not the only code which needs to lookup the
> acpi_device and device-name for the sensor for which the INT3472
> ACPI-device is a GPIO/clk/regulator provider.
>
> The tps68470.c code also needs this functionality, so factor this
> out into a new get_sensor_adev_and_name() helper.

...

> +int skl_int3472_get_sensor_adev_and_name(struct device *dev,
> +                                        struct acpi_device **sensor_adev_ret,
> +                                        const char **name_ret)
> +{
> +       struct acpi_device *adev = ACPI_COMPANION(dev);
> +       struct acpi_device *sensor;
> +       int ret = 0;
> +
> +       sensor = acpi_dev_get_first_consumer_dev(adev);
> +       if (!sensor) {
> +               dev_err(dev, "INT3472 seems to have no dependents.\n");
> +               return -ENODEV;
> +       }
> +
> +       *name_ret = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
> +                                  acpi_dev_name(sensor));
> +       if (!*name_ret)
> +               ret = -ENOMEM;
> +
> +       if (ret == 0 && sensor_adev_ret)
> +               *sensor_adev_ret = sensor;
> +       else
> +               acpi_dev_put(sensor);
> +
> +       return ret;

The error path is twisted a bit including far staying ret=0 assignment.

Can it be

       int ret;
       ...
       *name_ret = devm_kasprintf(dev, GFP_KERNEL, I2C_DEV_NAME_FORMAT,
                                  acpi_dev_name(sensor));
       if (!*name_ret) {
               acpi_dev_put(sensor);
               return -ENOMEM;
       }

       if (sensor_adev_ret)
               *sensor_adev_ret = sensor;

       return 0;

?

> +}

-- 
With Best Regards,
Andy Shevchenko
