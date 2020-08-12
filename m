Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543F8242E6C
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Aug 2020 20:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgHLSKN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Aug 2020 14:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgHLSKN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Aug 2020 14:10:13 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC96C061383
        for <linux-i2c@vger.kernel.org>; Wed, 12 Aug 2020 11:10:12 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id p4so2925926qkf.0
        for <linux-i2c@vger.kernel.org>; Wed, 12 Aug 2020 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VfdwegdManMt+jA8jIQI5XkFybV8AAH8iJCYP8W1oJs=;
        b=XmpK0ufe1lvZwtzNPbz6tDpAbbbLTnvvGvqWxzbYP5j5M//2y95VcowYHLPE6aJEZc
         hV0jRorMK4BZKp1tGrm6ryBK93tIAMhciJWbvG84vSEfsthz9BQzLIMzhcGWe+ShnGXz
         5eToGgpJgl4rFYhUcm9LdOlgEOraQcYt08mQb2ZBnKeqwbH+SCqM/bdPeJvdQKh3P4+A
         eUZjOYE0UNKlLAZodKYyDDlI4ZafNFIGuWCflUJTd6Zrtvqx5GN3yudygLGIJ2F6/wWR
         pt/pJHvUc9N5/vw+3BC37wft/MIKi9jgiahiuE32tY5FKbSQC01IS+7Gp9JEd5h8drOe
         fa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VfdwegdManMt+jA8jIQI5XkFybV8AAH8iJCYP8W1oJs=;
        b=VOVRNNjVR1bN2VRWJinM6ZHnQN9dg3gd4NofA7A1WIhyxJZBv42GTFWoNfYqa7r3ZQ
         WhwE6vo7s0eT/fFMt5giXN8rr/ulAT0X4kuDr36uhYqTG/wZhJUxQGY5k21wE62xny77
         MHSHKcNoz4b/6N+NkG8KydqMrRFtkZm6I4T7j1+iRhzPwccyKu1rxudJULXxPCyrawWX
         6G2UV6ihiubuXSJol2U0LXE03il1I75zHYi+4BGJ8NQwfzSw2bXJCpl7wdQljA34l0FR
         vzTfrFYzGmucyFmoFsOINPt1QuFV4gwYbh7WssMP2bPaRXV37Onomzf8Kz8TWD+ynLKn
         KT6g==
X-Gm-Message-State: AOAM530kx5lUDQqyqtP07jFhySOSib/5XX0uMBcDA7hcBXxuK/7n/Yt0
        NdHdN1L0cWf8J+whNLroVba2fwNBxT7rM7CT+ooEgRT1
X-Google-Smtp-Source: ABdhPJys1m97Gi+dBm7cSNlsKHSR26coCoMadMft2n1Q519kJFIIOr7h5JvTjIo+X+pWqf0TrlX4ui1QH2ioRC9eZz8=
X-Received: by 2002:a05:620a:1285:: with SMTP id w5mr1093433qki.21.1597255811838;
 Wed, 12 Aug 2020 11:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200807150005.48c8c89b@endymion>
In-Reply-To: <20200807150005.48c8c89b@endymion>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 12 Aug 2020 20:10:01 +0200
Message-ID: <CAMpxmJWQNfgs7EH45pkhaaSzUHBw1OLjoj-1zM__FohmrjUY3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] eeprom: at24: Add support for the Sony VAIO EEPROMs
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 7, 2020 at 3:00 PM Jean Delvare <jdelvare@suse.de> wrote:
>
> Special handling of the Sony VAIO EEPROMs is the last feature of the
> legacy eeprom driver that the at24 driver does not support. Adding
> this would let us deprecate and eventually remove the legacy eeprom
> driver.
>
> So add the option to specify a post-processing callback function that
> is called after reading data from the EEPROM, before it is returned
> to the user. The 24c02-vaio type is the first use case of that option:
> the callback function will mask the sensitive data for non-root users
> exactly as the legacy eeprom driver was doing.
>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Bartosz, this is a different approach to solving the problem compared
> to your suggestion. It's even more generic in a way. Let me know what
> you think.
>

Yes and I like it much more than my own suggestion!

>  drivers/misc/eeprom/at24.c |   42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> --- linux-5.7.orig/drivers/misc/eeprom/at24.c   2020-06-01 01:49:15.000000000 +0200
> +++ linux-5.7/drivers/misc/eeprom/at24.c        2020-08-07 12:46:47.075238130 +0200
> @@ -8,6 +8,7 @@
>
>  #include <linux/acpi.h>
>  #include <linux/bitops.h>
> +#include <linux/capability.h>
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
> @@ -89,6 +90,7 @@ struct at24_data {
>
>         struct nvmem_device *nvmem;
>         struct regulator *vcc_reg;
> +       void (*read_post)(unsigned int off, char *buf, size_t count);
>
>         /*
>          * Some chips tie up multiple I2C addresses; dummy devices reserve
> @@ -121,6 +123,7 @@ MODULE_PARM_DESC(at24_write_timeout, "Ti
>  struct at24_chip_data {
>         u32 byte_len;
>         u8 flags;
> +       void (*read_post)(unsigned int off, char *buf, size_t count);
>  };
>
>  #define AT24_CHIP_DATA(_name, _len, _flags)                            \
> @@ -128,6 +131,33 @@ struct at24_chip_data {
>                 .byte_len = _len, .flags = _flags,                      \
>         }
>
> +#define AT24_CHIP_DATA_CB(_name, _len, _flags, _read_post)             \
> +       static const struct at24_chip_data _name = {                    \
> +               .byte_len = _len, .flags = _flags,                      \
> +               .read_post = _read_post,                                \
> +       }
> +
> +
> +static void at24_read_post_vaio(unsigned int off, char *buf, size_t count)
> +{
> +       int i;
> +
> +       if (capable(CAP_SYS_ADMIN))
> +               return;
> +
> +       /*
> +        * Hide VAIO private settings to regular users:
> +        * - BIOS passwords: bytes 0x00 to 0x0f
> +        * - UUID: bytes 0x10 to 0x1f
> +        * - Serial number: 0xc0 to 0xdf
> +        */
> +       for (i = 0; i < count; i++) {
> +               if ((off + i <= 0x1f) ||
> +                   (off + i >= 0xc0 && off + i <= 0xdf))
> +                       buf[i] = 0;
> +       }
> +}
> +
>  /* needs 8 addresses as A0-A2 are ignored */
>  AT24_CHIP_DATA(at24_data_24c00, 128 / 8, AT24_FLAG_TAKE8ADDR);
>  /* old variants can't be handled with this generic entry! */
> @@ -144,6 +174,10 @@ AT24_CHIP_DATA(at24_data_24mac602, 64 /
>  /* spd is a 24c02 in memory DIMMs */
>  AT24_CHIP_DATA(at24_data_spd, 2048 / 8,
>         AT24_FLAG_READONLY | AT24_FLAG_IRUGO);
> +/* 24c02_vaio is a 24c02 on some Sony laptops */
> +AT24_CHIP_DATA_CB(at24_data_24c02_vaio, 2048 / 8,
> +       AT24_FLAG_READONLY | AT24_FLAG_IRUGO,
> +       at24_read_post_vaio);
>  AT24_CHIP_DATA(at24_data_24c04, 4096 / 8, 0);
>  AT24_CHIP_DATA(at24_data_24cs04, 16,
>         AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> @@ -177,6 +211,7 @@ static const struct i2c_device_id at24_i
>         { "24mac402",   (kernel_ulong_t)&at24_data_24mac402 },
>         { "24mac602",   (kernel_ulong_t)&at24_data_24mac602 },
>         { "spd",        (kernel_ulong_t)&at24_data_spd },
> +       { "24c02-vaio", (kernel_ulong_t)&at24_data_24c02_vaio },
>         { "24c04",      (kernel_ulong_t)&at24_data_24c04 },
>         { "24cs04",     (kernel_ulong_t)&at24_data_24cs04 },
>         { "24c08",      (kernel_ulong_t)&at24_data_24c08 },
> @@ -389,6 +424,9 @@ static int at24_read(void *priv, unsigne
>         struct device *dev;
>         char *buf = val;
>         int ret;
> +       unsigned int orig_off = off;
> +       char *orig_buf = buf;
> +       size_t orig_count = count;
>
>         at24 = priv;
>         dev = at24_base_client_dev(at24);
> @@ -427,6 +465,9 @@ static int at24_read(void *priv, unsigne
>
>         pm_runtime_put(dev);
>
> +       if (unlikely(at24->read_post))
> +               at24->read_post(orig_off, orig_buf, orig_count);
> +
>         return 0;
>  }
>
> @@ -654,6 +695,7 @@ static int at24_probe(struct i2c_client
>         at24->byte_len = byte_len;
>         at24->page_size = page_size;
>         at24->flags = flags;
> +       at24->read_post = cdata->read_post;
>         at24->num_addresses = num_addresses;
>         at24->offset_adj = at24_get_offset_adj(flags, byte_len);
>         at24->client[0].client = client;
>
>
> --
> Jean Delvare
> SUSE L3 Support

Looks good to me, I can take it after v5.9-rc1 is tagged.

Bartosz
