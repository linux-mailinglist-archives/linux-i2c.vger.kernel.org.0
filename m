Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3703284AC2
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 13:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgJFLUz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 07:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJFLUy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Oct 2020 07:20:54 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1E1C061755
        for <linux-i2c@vger.kernel.org>; Tue,  6 Oct 2020 04:20:54 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id j2so13119236eds.9
        for <linux-i2c@vger.kernel.org>; Tue, 06 Oct 2020 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wen69TLHUbxCgCs/H5qxqX6NSpZw4Fgitk7piiLUW1A=;
        b=YUUoj+h2Lgpn4wY2uwdieC+LUP/sEG7wzi5HHQrWu7D3q7Vzww8DbongmzlNe7Puo7
         VOwJMKY65e7xXWNJv6HXh66IqvXbPt0ORpz7QgAYmFQEGGbOqdSD36rsieLLGx65TjzC
         aIXDL/ZYYxQAUhMM842Gp44TFBhOUeuSad3LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wen69TLHUbxCgCs/H5qxqX6NSpZw4Fgitk7piiLUW1A=;
        b=uQvrx5tlVp/auwXOcpEPfaAgwjjrKXQD0KHGY6Ht9fCD//c78JTlnjMad0XSbzTzJ6
         bczXj6nEr+rgfabxFkWWbmWdXQdPJrU3g7TQKXMITsFmswKbVEVuwTjVlOjCMoUHhxeF
         IORm5dBaCEbSVd0jrgA5O1WXaBiO63SLz6eLwT2lCSW3aqzEINnPKp1JIjbbULBnRBwv
         iVaW8KdTvS29EzCIwLBGj63zBrB3ghNGJeqYW993VsHyvFjquSUi+XeUHW3zfiY3siw9
         MmL9W+8fJoRGGuReiWZqNdkKTPxHixA/vmWIBdJXdmMKrris7VGoECGpeu0zEx/RQLas
         dopg==
X-Gm-Message-State: AOAM532t0GTALG+P6xPNuWfwatBUcN3ovxj9JIfh9WZtNMb9H8KO8mB9
        DJ/s6+8BTmbaWzsOcJ3ov/1UeOLte4uviQ==
X-Google-Smtp-Source: ABdhPJySgXose4soS8laebG7lF4FBCuK51nos8YpmdH8uPuZ/pawEkohOY5JCGR/mI1gt/lb4+2o3g==
X-Received: by 2002:a50:d0d0:: with SMTP id g16mr4762496edf.18.1601983252654;
        Tue, 06 Oct 2020 04:20:52 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id e5sm1918022ejb.26.2020.10.06.04.20.50
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 04:20:51 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id w5so13007616wrp.8
        for <linux-i2c@vger.kernel.org>; Tue, 06 Oct 2020 04:20:50 -0700 (PDT)
X-Received: by 2002:adf:fe08:: with SMTP id n8mr4321480wrr.159.1601983249983;
 Tue, 06 Oct 2020 04:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com> <20200903081550.6012-7-sakari.ailus@linux.intel.com>
In-Reply-To: <20200903081550.6012-7-sakari.ailus@linux.intel.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 6 Oct 2020 13:20:37 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DqYHckYA4LSkt5UN35HuOLC=rJhPFHbGu8p-B2vSTrqg@mail.gmail.com>
Message-ID: <CAAFQd5DqYHckYA4LSkt5UN35HuOLC=rJhPFHbGu8p-B2vSTrqg@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] at24: Support probing while off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sakari,

On Thu, Sep 3, 2020 at 10:15 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> In certain use cases (where the chip is part of a camera module, and the
> camera module is wired together with a camera privacy LED), powering on
> the device during probe is undesirable. Add support for the at24 to
> execute probe while being powered off. For this to happen, a hint in form
> of a device property is required from the firmware.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/misc/eeprom/at24.c | 43 +++++++++++++++++++++++---------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 8f5de5f10bbea..2d24e33788d7d 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -595,6 +595,7 @@ static int at24_probe(struct i2c_client *client)
>         bool i2c_fn_i2c, i2c_fn_block;
>         unsigned int i, num_addresses;
>         struct at24_data *at24;
> +       bool low_power;
>         struct regmap *regmap;
>         bool writable;
>         u8 test_byte;
> @@ -733,25 +734,30 @@ static int at24_probe(struct i2c_client *client)
>
>         i2c_set_clientdata(client, at24);
>
> -       err = regulator_enable(at24->vcc_reg);
> -       if (err) {
> -               dev_err(dev, "Failed to enable vcc regulator\n");
> -               return err;
> -       }
> +       low_power = acpi_dev_state_low_power(&client->dev);
> +       if (!low_power) {
> +               err = regulator_enable(at24->vcc_reg);
> +               if (err) {
> +                       dev_err(dev, "Failed to enable vcc regulator\n");
> +                       return err;
> +               }
>
> -       /* enable runtime pm */
> -       pm_runtime_set_active(dev);
> +               pm_runtime_set_active(dev);
> +       }
>         pm_runtime_enable(dev);
>

What's the guarantee that at this point the runtime PM wouldn't
suspend the device? Notice that the nvmem device is already exposed to
the userspace, which could trigger pm runtime gets and puts (and thus
idles as well).

Best regards,
Tomasz

>         /*
> -        * Perform a one-byte test read to verify that the
> -        * chip is functional.
> +        * Perform a one-byte test read to verify that the chip is functional,
> +        * unless powering on the device is to be avoided during probe (i.e.
> +        * it's powered off right now).
>          */
> -       err = at24_read(at24, 0, &test_byte, 1);
> -       if (err) {
> -               pm_runtime_disable(dev);
> -               regulator_disable(at24->vcc_reg);
> -               return -ENODEV;
> +       if (!low_power) {
> +               err = at24_read(at24, 0, &test_byte, 1);
> +               if (err) {
> +                       pm_runtime_disable(dev);
> +                       regulator_disable(at24->vcc_reg);
> +                       return -ENODEV;
> +               }
>         }
>
>         pm_runtime_idle(dev);
> @@ -771,9 +777,11 @@ static int at24_remove(struct i2c_client *client)
>         struct at24_data *at24 = i2c_get_clientdata(client);
>
>         pm_runtime_disable(&client->dev);
> -       if (!pm_runtime_status_suspended(&client->dev))
> -               regulator_disable(at24->vcc_reg);
> -       pm_runtime_set_suspended(&client->dev);
> +       if (!acpi_dev_state_low_power(&client->dev)) {
> +               if (!pm_runtime_status_suspended(&client->dev))
> +                       regulator_disable(at24->vcc_reg);
> +               pm_runtime_set_suspended(&client->dev);
> +       }
>
>         return 0;
>  }
> @@ -810,6 +818,7 @@ static struct i2c_driver at24_driver = {
>         .probe_new = at24_probe,
>         .remove = at24_remove,
>         .id_table = at24_ids,
> +       .flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
>  };
>
>  static int __init at24_init(void)
> --
> 2.20.1
>
