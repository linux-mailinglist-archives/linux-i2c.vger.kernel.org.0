Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3959914CBE4
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 14:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgA2Nyc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 08:54:32 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33495 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgA2Nyc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jan 2020 08:54:32 -0500
Received: by mail-qk1-f196.google.com with SMTP id h23so17075222qkh.0
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jan 2020 05:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rYOGFr9wS3HXrXEfVL8jpzDCtWVLlGedKrOARmVJi80=;
        b=UUQJmVe3RNHr2pAk/tALeA720imfjRHs47ntw1zXz/kqNcwGoBQC0PW8D06qV2Oidm
         /3hAlVbIi6jc7HbqeOijLyabl+P6omrNVI4SgR2SXGbNIdgYn0c/nvixNsABMaqxeN89
         m5GAYxhLMy5VIPizb7/fIzdcW9JxzCEUq2OCLvEFDdIdJKZEDYiSzdiuSdf70G6m3+lw
         OCRpUjx8T2h2/G5TP2qnwqTl04kx4ceG7lNSbFP36iNl9n4KIgVlA3bvC3DjjagYfBaN
         /HgiR6xceYivvrVJl9b9e6/vrS5oZuMhvT08M5F2bjiJZz15F3bzgXcW2kEOvSTtYtN4
         r9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rYOGFr9wS3HXrXEfVL8jpzDCtWVLlGedKrOARmVJi80=;
        b=Fe/1pu1bXKbcsfXEymzl8dS4bnHXG5pwSN19+Y/B+4G6K/f1gOUlI1T2DJyYBCGJaU
         VH9rlQznL5UWXP5YZLcdZUrsYg89l0fDcyayr8GwSfuyMFmd4kzInZhEXPFwlbQ4nDqH
         U64uyLRExXaNBNPm11DtxB8E52MKoh4gIY2iMcZt01OfQzt6jO5HuhWWTguAsYkd8xrc
         AI5fImNmZWpC8iB00XQ61YOaKhSOWjkM7PuXOFWX8Q5kFdamdO2v+Vy0v+Wc34jEonBb
         6bhEqgwKJjaz2QsS+2QIi3H8CZtrO/1tfKtFE2gFlkCunw/NFLbWgctreb2Cqv7zrGVw
         683A==
X-Gm-Message-State: APjAAAUgF6LlH5CxVGyxYJtZ3cUR2kaLfcqYaDAgXx76sOhqOlMvGMzg
        p+MXLH5fiRdyvO8oFCGa3fvtuDLbD8kHGr3UGsCVYw==
X-Google-Smtp-Source: APXvYqxBEm4xJ6kv4arA/On09OUECl7DMlqvpUATSIKO8jSWyETC4I0SLTiOGIrDuIdF6CfuHSTxmM2f0fSLvrDBC7A=
X-Received: by 2002:a05:620a:12cf:: with SMTP id e15mr28371679qkl.120.1580306071128;
 Wed, 29 Jan 2020 05:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com> <20200121134157.20396-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20200121134157.20396-2-sakari.ailus@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 29 Jan 2020 14:54:20 +0100
Message-ID: <CAMpxmJX8gF3TujMMeEgERAFM4YbpgnNjOmuV+U7uWCndqsyGeA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] i2c: Allow driver to manage the device's power
 state during probe
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

wt., 21 sty 2020 o 14:41 Sakari Ailus <sakari.ailus@linux.intel.com> napisa=
=C5=82(a):
>
> Enable drivers to tell ACPI that there's no need to power on a device for
> probe. Drivers should still perform this by themselves if there's a need
> to. In some cases powering on the device during probe is undesirable, and
> this change enables a driver to choose what fits best for it.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/i2c/i2c-core-base.c | 15 ++++++++++++---
>  include/linux/i2c.h         |  3 +++
>  2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9f8dcd3f83850..7bf1699c9044d 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -303,6 +303,14 @@ static int i2c_smbus_host_notify_to_irq(const struct=
 i2c_client *client)
>         return irq > 0 ? irq : -ENXIO;
>  }
>
> +static bool probe_low_power(struct device *dev)
> +{
> +       struct i2c_driver *driver =3D to_i2c_driver(dev->driver);
> +
> +       return driver->probe_low_power &&
> +               device_property_present(dev, "probe-low-power");
> +}
> +
>  static int i2c_device_probe(struct device *dev)
>  {
>         struct i2c_client       *client =3D i2c_verify_client(dev);
> @@ -375,7 +383,8 @@ static int i2c_device_probe(struct device *dev)
>         if (status < 0)
>                 goto err_clear_wakeup_irq;
>
> -       status =3D dev_pm_domain_attach(&client->dev, true);
> +       status =3D dev_pm_domain_attach(&client->dev,
> +                                     !probe_low_power(&client->dev));
>         if (status)
>                 goto err_clear_wakeup_irq;
>
> @@ -397,7 +406,7 @@ static int i2c_device_probe(struct device *dev)
>         return 0;
>
>  err_detach_pm_domain:
> -       dev_pm_domain_detach(&client->dev, true);
> +       dev_pm_domain_detach(&client->dev, !probe_low_power(&client->dev)=
);
>  err_clear_wakeup_irq:
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
> @@ -419,7 +428,7 @@ static int i2c_device_remove(struct device *dev)
>                 status =3D driver->remove(client);
>         }
>
> -       dev_pm_domain_detach(&client->dev, true);
> +       dev_pm_domain_detach(&client->dev, !probe_low_power(&client->dev)=
);
>
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 582ef05ec07ed..6d0d6af393c56 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -229,6 +229,8 @@ enum i2c_alert_protocol {
>   * @address_list: The I2C addresses to probe (for detect)
>   * @clients: List of detected clients we created (for i2c-core use only)
>   * @disable_i2c_core_irq_mapping: Tell the i2c-core to not do irq-mappin=
g
> + * @probe_low_power: Let the driver manage the device's power state
> + *                  during probe and remove.
>   *
>   * The driver.owner field should be set to the module owner of this driv=
er.
>   * The driver.name field should be set to the name of this driver.
> @@ -289,6 +291,7 @@ struct i2c_driver {
>         struct list_head clients;
>
>         bool disable_i2c_core_irq_mapping;
> +       bool probe_low_power;

I don't see any users of disable_i2c_core_irq_mapping in current
mainline. Maybe instead of adding another 1-byte boolean for every
such property, let's just use the fact that this struct will have at
least an alignment of 32-bits anyway and merge the two into an int
field called 'flags' so that we can extend it in the future if needed?

The name 'probe_low_power' is misleading to me too. It makes me think
it's the default state for some reason. It should be something like
'allow_low_power_probe'.

Bartosz

>  };
>  #define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
>
> --
> 2.20.1
>
