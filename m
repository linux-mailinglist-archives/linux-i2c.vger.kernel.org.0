Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900B44679BE
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 15:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239347AbhLCOyK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 09:54:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235792AbhLCOyJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 09:54:09 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D28FC061751
        for <linux-i2c@vger.kernel.org>; Fri,  3 Dec 2021 06:50:45 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id l25so12406570eda.11
        for <linux-i2c@vger.kernel.org>; Fri, 03 Dec 2021 06:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4TM9UdqAwiY12CkrUHMGRJNGsl+7pjmSLxaNo42G7IM=;
        b=7AOz1vQlK3OhznZXldBNN+05/fLuZRyaVz/hhT2oO18IBLqRVAdMdOI6Bb1lEDI2M2
         5yiueqcQf3qug/Sk8XVtm8e9hhYbpMmhlAb8t2DQWZoia3SyBRVGxcpMxc3PHZNWF/sv
         j7Kb0G+6D5P6mavtB7rnNT1BYB0OnoS98oYOR9itSk/0LhlIGmQbTIU4dNTV28CuslB3
         5X3CnbS/8DPI2mgNtHEPV6eiQNN7kdh40VAxcLT9k9RPIuMxkZEBq/mCMFD19Qzv/uSX
         UikMMMv3dh9u8dPnj3ltxTCuILpZMsK9zBM6RP2q3CbR+nqe1YG3HSt1/kdg56rCcdCl
         V6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4TM9UdqAwiY12CkrUHMGRJNGsl+7pjmSLxaNo42G7IM=;
        b=uIPNHnqBnzcXSNykr1iTBnaeYNOmqVikzcHauMXaLT5RW/2gc9R4cylGCrl5X5eXyb
         U3AbAnq9CEeBbWci++R0CsVdydQM/9hBtzKheIqxf19LsY0fWxtEO1bfGKRnBNIrKXZD
         5SSQOQ7x9AfcerwtH1iHDM9s8b9s9D9qomGUjAGmKXHBV2fYQkxXSmL+W4bv7a2OClgs
         6sj8ISw7ngqLfUVCxgELkFyVuC4+naHaQGTzs2HsO/poUfjFbUKMBeb84ASD299yJYzN
         QgpjyHa/8O++yq5+JTK6OwXis/ZuDU6eYfXokUiWclrnnt1xcmsKbi4joUotwdDPtm1U
         Ikzg==
X-Gm-Message-State: AOAM532qyMB+i70V+ON9lYUPYVUW2dgC+CA1PfMYBIqV58FtfYrqXRq7
        82UPRKHH2wGUAKd++xkyoomLJmrHwxOJEjYHMCbogA==
X-Google-Smtp-Source: ABdhPJwdU91eLHV3w6dOWNaj2vWID+ww9DVIWoONmlh+L8GoKTrFACAvEzwZxj6r9lk+f2uvPRAd64LpMieK7lztf+k=
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr26949450edd.365.1638543043732;
 Fri, 03 Dec 2021 06:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20211018210039.129110-1-fido_max@inbox.ru>
In-Reply-To: <20211018210039.129110-1-fido_max@inbox.ru>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 3 Dec 2021 15:50:33 +0100
Message-ID: <CAMRc=Mcs-zR1+y6uQVkmGSnAKVSSZoez=kgYvtkohQVpZLPc-A@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Add support for 24c1025 EEPROM
To:     Maxim Kochetkov <fido_max@inbox.ru>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, =gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Oct 18, 2021 at 11:00 PM Maxim Kochetkov <fido_max@inbox.ru> wrote:
>
> Microchip EEPROM 24xx1025 is like a 24c1024. The only difference
> between them is that the I2C address bit used to select between the
> two banks is bit 2 for the 1025 and not bit 0 as in the 1024.
>
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  drivers/misc/eeprom/at24.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 305ffad131a2..6543ff6536aa 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -96,6 +96,7 @@ struct at24_data {
>          * Some chips tie up multiple I2C addresses; dummy devices reserve
>          * them for us, and we'll use them with SMBus calls.
>          */
> +       u8 bank_addr_shift;
>         struct at24_client client[];
>  };
>
> @@ -123,6 +124,7 @@ MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
>  struct at24_chip_data {
>         u32 byte_len;
>         u8 flags;
> +       u8 bank_addr_shift;
>         void (*read_post)(unsigned int off, char *buf, size_t count);
>  };
>
> @@ -137,6 +139,12 @@ struct at24_chip_data {
>                 .read_post = _read_post,                                \
>         }
>
> +#define AT24_CHIP_DATA_BS(_name, _len, _flags, _bank_addr_shift)       \
> +       static const struct at24_chip_data _name = {                    \
> +               .byte_len = _len, .flags = _flags,                      \
> +               .bank_addr_shift = _bank_addr_shift                     \
> +       }
> +
>  static void at24_read_post_vaio(unsigned int off, char *buf, size_t count)
>  {
>         int i;
> @@ -197,6 +205,7 @@ AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
> +AT24_CHIP_DATA_BS(at24_data_24c1025, 1048576 / 8, AT24_FLAG_ADDR16, 2);
>  AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
>  /* identical to 24c08 ? */
>  AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
> @@ -225,6 +234,7 @@ static const struct i2c_device_id at24_ids[] = {
>         { "24c256",     (kernel_ulong_t)&at24_data_24c256 },
>         { "24c512",     (kernel_ulong_t)&at24_data_24c512 },
>         { "24c1024",    (kernel_ulong_t)&at24_data_24c1024 },
> +       { "24c1025",    (kernel_ulong_t)&at24_data_24c1025 },
>         { "24c2048",    (kernel_ulong_t)&at24_data_24c2048 },
>         { "at24",       0 },
>         { /* END OF LIST */ }
> @@ -254,6 +264,7 @@ static const struct of_device_id at24_of_match[] = {
>         { .compatible = "atmel,24c256",         .data = &at24_data_24c256 },
>         { .compatible = "atmel,24c512",         .data = &at24_data_24c512 },
>         { .compatible = "atmel,24c1024",        .data = &at24_data_24c1024 },
> +       { .compatible = "atmel,24c1025",        .data = &at24_data_24c1025 },
>         { .compatible = "atmel,24c2048",        .data = &at24_data_24c2048 },
>         { /* END OF LIST */ },
>  };
> @@ -548,7 +559,8 @@ static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
>         dev = &base_client->dev;
>
>         dummy_client = devm_i2c_new_dummy_device(dev, base_client->adapter,
> -                                                base_client->addr + index);
> +                                                base_client->addr +
> +                                                (index << at24->bank_addr_shift));
>         if (IS_ERR(dummy_client))
>                 return PTR_ERR(dummy_client);
>
> @@ -689,6 +701,7 @@ static int at24_probe(struct i2c_client *client)
>         at24->page_size = page_size;
>         at24->flags = flags;
>         at24->read_post = cdata->read_post;
> +       at24->bank_addr_shift = cdata->bank_addr_shift;
>         at24->num_addresses = num_addresses;
>         at24->offset_adj = at24_get_offset_adj(flags, byte_len);
>         at24->client[0].client = client;
> --
> 2.32.0
>

I wonder what the reason for this change in a standardized protocol was...

Anyway, can you rebase it on top of
git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
at24/for-next please? We had a change in how the i2c client is
accessed and now this fails to apply.

Thanks!
Bart
