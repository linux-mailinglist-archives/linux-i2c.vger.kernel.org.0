Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 638A2464D5B
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Dec 2021 12:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349106AbhLAL7M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Dec 2021 06:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349127AbhLAL7L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Dec 2021 06:59:11 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43D8C061574
        for <linux-i2c@vger.kernel.org>; Wed,  1 Dec 2021 03:55:50 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id r11so100715968edd.9
        for <linux-i2c@vger.kernel.org>; Wed, 01 Dec 2021 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZDNu/0O2/wL9cdsIf8nv3aeSAZLtvfA00uqQBh1NqgM=;
        b=JLi8LQ1BPQkqq0Ap1cvY7ClN5cVBqwFGwDwLxPu4IMi2KsOXy9Uo/mSi+62dNHdIAq
         EmUeefFu2Gnjp8a2Uif7DBLcY6wORyuirrRcQ8tYV8dGlbLSYBiDLg7f+IpXfa+2XNyQ
         CjhCVHTngmNIrChSHY29sn/CG3NHvFNRt88GbJ+SRW+Vx7Z0mb2p98b9NZ+m77z2nwAA
         DQ++yz22Lc1PSFX0jIIqJj1C5CPWyVdZyukus9ZgQPel7CUeTkngONXzlzwnXHepe7YY
         Szl2+xV2aCcUFHm9+d2+wygvOqf+FstY8wmXgTsLapEhr+2KtmHhuwCeC26D5r0V0swM
         jRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZDNu/0O2/wL9cdsIf8nv3aeSAZLtvfA00uqQBh1NqgM=;
        b=SOtL+xuK4fdvxDoNQCvz4xuDLio8E5UhUImBb1w5QQXbhMF+eVMvnGab+u40jHNf7d
         dgr/ZcwuOfT8nu9qGr1cUf+bRFxPWTR7KpD/mXWnULXEUK207Mg8o79ziPio2r9GvP3w
         YJqZNg1jIeHXDHbxeINPGQkzgEomAQTEILy/aDuKPw0s10u9l9xW8mgs9DkIvJQqoNKF
         hVWnoQwDVYYgN3OcVhhUaa+GrqvgO4c2W64o3Yc/MLwmpo1rrtjY7vtt6FJGeILAoAR4
         zbo3BDGmA9gGBjZ5Jx7QxwStSW4fbR95FfML27/M3Cujx07lNZuuoKa/lS+Xgol8ckfl
         Dfzg==
X-Gm-Message-State: AOAM5307gjdL8B5dfxkEHbCV1DaOdnEXQ/CQseV53u47mnnrLKBb2zMM
        juKMXJXvTwp6hFwH9e0yXasRSIALlEr8CMNxJlHzXw==
X-Google-Smtp-Source: ABdhPJxIwg0FpGuQPlBD6bVJ4SJ56kyjV+ykDR9aEtGwiaJMgCNmEQicuL8L8x2/ukCTW8eZwVaz0aqDnJ2RT0PuBsg=
X-Received: by 2002:a05:6402:27c7:: with SMTP id c7mr8100855ede.0.1638359749179;
 Wed, 01 Dec 2021 03:55:49 -0800 (PST)
MIME-Version: 1.0
References: <d94eb710-70e8-ae76-f58d-bed80b9d61d6@gmail.com>
In-Reply-To: <d94eb710-70e8-ae76-f58d-bed80b9d61d6@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 1 Dec 2021 12:55:38 +0100
Message-ID: <CAMRc=MfJZA1THG9ZwLGavyc4H+_g5Z3E0spdfggwPh5YtXyNzQ@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: remove struct at24_client
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Nov 28, 2021 at 7:15 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> We use member client only to get a reference to the associated struct
> device, via &client->dev. However we can get the same reference from
> the associated regmap, via regmap_get_device(regmap).
> Therefore struct at24_client can be removed and replaced with a regmap
> pointer.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/misc/eeprom/at24.c | 53 +++++++++++++-------------------------
>  1 file changed, 18 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 49ab656e8..4d91c71c4 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -68,11 +68,6 @@
>   * which won't work on pure SMBus systems.
>   */
>
> -struct at24_client {
> -       struct i2c_client *client;
> -       struct regmap *regmap;
> -};
> -
>  struct at24_data {
>         /*
>          * Lock protects against activities from other Linux tasks,
> @@ -94,9 +89,9 @@ struct at24_data {
>
>         /*
>          * Some chips tie up multiple I2C addresses; dummy devices reserve
> -        * them for us, and we'll use them with SMBus calls.
> +        * them for us.
>          */
> -       struct at24_client client[];
> +       struct regmap *client_regmaps[];
>  };
>
>  /*
> @@ -275,8 +270,8 @@ MODULE_DEVICE_TABLE(acpi, at24_acpi_ids);
>   * set the byte address; on a multi-master board, another master
>   * may have changed the chip's "current" address pointer.
>   */
> -static struct at24_client *at24_translate_offset(struct at24_data *at24,
> -                                                unsigned int *offset)
> +static struct regmap *at24_translate_offset(struct at24_data *at24,
> +                                           unsigned int *offset)
>  {
>         unsigned int i;
>
> @@ -288,12 +283,12 @@ static struct at24_client *at24_translate_offset(struct at24_data *at24,
>                 *offset &= 0xff;
>         }
>
> -       return &at24->client[i];
> +       return at24->client_regmaps[i];
>  }
>
>  static struct device *at24_base_client_dev(struct at24_data *at24)
>  {
> -       return &at24->client[0].client->dev;
> +       return regmap_get_device(at24->client_regmaps[0]);
>  }
>
>  static size_t at24_adjust_read_count(struct at24_data *at24,
> @@ -324,14 +319,10 @@ static ssize_t at24_regmap_read(struct at24_data *at24, char *buf,
>                                 unsigned int offset, size_t count)
>  {
>         unsigned long timeout, read_time;
> -       struct at24_client *at24_client;
> -       struct i2c_client *client;
>         struct regmap *regmap;
>         int ret;
>
> -       at24_client = at24_translate_offset(at24, &offset);
> -       regmap = at24_client->regmap;
> -       client = at24_client->client;
> +       regmap = at24_translate_offset(at24, &offset);
>         count = at24_adjust_read_count(at24, offset, count);
>
>         /* adjust offset for mac and serial read ops */
> @@ -346,7 +337,7 @@ static ssize_t at24_regmap_read(struct at24_data *at24, char *buf,
>                 read_time = jiffies;
>
>                 ret = regmap_bulk_read(regmap, offset, buf, count);
> -               dev_dbg(&client->dev, "read %zu@%d --> %d (%ld)\n",
> +               dev_dbg(regmap_get_device(regmap), "read %zu@%d --> %d (%ld)\n",
>                         count, offset, ret, jiffies);
>                 if (!ret)
>                         return count;
> @@ -387,14 +378,10 @@ static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
>                                  unsigned int offset, size_t count)
>  {
>         unsigned long timeout, write_time;
> -       struct at24_client *at24_client;
> -       struct i2c_client *client;
>         struct regmap *regmap;
>         int ret;
>
> -       at24_client = at24_translate_offset(at24, &offset);
> -       regmap = at24_client->regmap;
> -       client = at24_client->client;
> +       regmap = at24_translate_offset(at24, &offset);
>         count = at24_adjust_write_count(at24, offset, count);
>         timeout = jiffies + msecs_to_jiffies(at24_write_timeout);
>
> @@ -406,7 +393,7 @@ static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
>                 write_time = jiffies;
>
>                 ret = regmap_bulk_write(regmap, offset, buf, count);
> -               dev_dbg(&client->dev, "write %zu@%d --> %d (%ld)\n",
> +               dev_dbg(regmap_get_device(regmap), "write %zu@%d --> %d (%ld)\n",
>                         count, offset, ret, jiffies);
>                 if (!ret)
>                         return count;
> @@ -538,16 +525,14 @@ static const struct at24_chip_data *at24_get_chip_data(struct device *dev)
>  }
>
>  static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
> +                                 struct i2c_client *base_client,
>                                   struct regmap_config *regmap_config)
>  {
> -       struct i2c_client *base_client, *dummy_client;
> +       struct i2c_client *dummy_client;
>         struct regmap *regmap;
> -       struct device *dev;
> -
> -       base_client = at24->client[0].client;
> -       dev = &base_client->dev;
>
> -       dummy_client = devm_i2c_new_dummy_device(dev, base_client->adapter,
> +       dummy_client = devm_i2c_new_dummy_device(&base_client->dev,
> +                                                base_client->adapter,
>                                                  base_client->addr + index);
>         if (IS_ERR(dummy_client))
>                 return PTR_ERR(dummy_client);
> @@ -556,8 +541,7 @@ static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
>         if (IS_ERR(regmap))
>                 return PTR_ERR(regmap);
>
> -       at24->client[index].client = dummy_client;
> -       at24->client[index].regmap = regmap;
> +       at24->client_regmaps[index] = regmap;
>
>         return 0;
>  }
> @@ -680,7 +664,7 @@ static int at24_probe(struct i2c_client *client)
>         if (IS_ERR(regmap))
>                 return PTR_ERR(regmap);
>
> -       at24 = devm_kzalloc(dev, struct_size(at24, client, num_addresses),
> +       at24 = devm_kzalloc(dev, struct_size(at24, client_regmaps, num_addresses),
>                             GFP_KERNEL);
>         if (!at24)
>                 return -ENOMEM;
> @@ -692,8 +676,7 @@ static int at24_probe(struct i2c_client *client)
>         at24->read_post = cdata->read_post;
>         at24->num_addresses = num_addresses;
>         at24->offset_adj = at24_get_offset_adj(flags, byte_len);
> -       at24->client[0].client = client;
> -       at24->client[0].regmap = regmap;
> +       at24->client_regmaps[0] = regmap;
>
>         at24->vcc_reg = devm_regulator_get(dev, "vcc");
>         if (IS_ERR(at24->vcc_reg))
> @@ -709,7 +692,7 @@ static int at24_probe(struct i2c_client *client)
>
>         /* use dummy devices for multiple-address chips */
>         for (i = 1; i < num_addresses; i++) {
> -               err = at24_make_dummy_client(at24, i, &regmap_config);
> +               err = at24_make_dummy_client(at24, i, client, &regmap_config);
>                 if (err)
>                         return err;
>         }
> --
> 2.34.0
>

Great cleanup, thanks a lot. Queued for v5.17.

Bart
