Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F9547030E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 15:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234944AbhLJOrr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 09:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235695AbhLJOrr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Dec 2021 09:47:47 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC31C061746
        for <linux-i2c@vger.kernel.org>; Fri, 10 Dec 2021 06:44:11 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id t5so30333154edd.0
        for <linux-i2c@vger.kernel.org>; Fri, 10 Dec 2021 06:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RRxF/P5jz+72j0td4cz0ka6JWAMGvK/ds+Q2hOGnUhU=;
        b=5FCgB4e5zfojQUpNneFRNtm50Ir+5ku9uQzmxw/ld/j+R6JYt9QfEtUG5/Cl3NTHFy
         xr081mtSbkdbXOj3Cpvvr0f08U2RViONcJgaLJUikelfZfUzbuWA2kazvfBBlrDNXWW2
         vaBd+K4/c+rgwLCSEMCVjtEog32W2tOVI2IIf0UjSPCLYvb+K4Mt7n7jDXAC3scCtEg8
         jJJ5aKRsbxOD2jFQBChiHuIQyEPeHZjjt0av0l4sFJeWUt6lZumv4bRNdBK3Ozka5PeG
         AECW0y4rYqe01wX6krv5ehbsiCoTQnoQ1X6yyoSWjBX0EWfWr06tWK55f7JOWQPTm4mi
         yEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RRxF/P5jz+72j0td4cz0ka6JWAMGvK/ds+Q2hOGnUhU=;
        b=g/tksL5k4gsyE7TSP0uDsvJbDUBNNme9NHmyJ8a1OFkeQQt0WtUJiM5fa+gzp20X3l
         laEjenvEO7FuXmw5LAXlwHbYwJD5WdGl9NnndozHjcllf/ylp7VjxHjM0KS0KyfW5fAK
         owQvgz0VI1xBv4frdepPfgRWXKHprul7ViSrVhAnz0fdRlQf3IQDsmjS5p+SnBM0Pjdq
         JO9xq9S1UUAt9Mz8Vzfy9HHuplA5WfG+UM5o0npXbkEAvR5P+yn9UzSatYvYOHcqwfx4
         EDMsjKs8ReiB1zINzqSszZJWPcn220NNLegGI4Z7RBjrDqGdww563eT8JadmzfnRNnME
         6yjQ==
X-Gm-Message-State: AOAM530TZLyBOObb4t3sbBSw2s+0w4iSsr4rR+rhRCN6Pr9LIbt4GNL9
        S+fNA5pDnRTIYaHFIAeElwsp44wx6rgcIE/v98S7Tw==
X-Google-Smtp-Source: ABdhPJybbfGEsvQ+n4+wNAyXO5uKHgFoAQnsKCCusMxwy0VSV5GvjEj/aPtbhoK1Xc1V01Xmh93aiX/jhRQaDVnGt/I=
X-Received: by 2002:a17:906:7b53:: with SMTP id n19mr24556788ejo.538.1639147446372;
 Fri, 10 Dec 2021 06:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20211203223727.62984-1-fido_max@inbox.ru>
In-Reply-To: <20211203223727.62984-1-fido_max@inbox.ru>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Dec 2021 15:43:55 +0100
Message-ID: <CAMRc=Me4pMXJLFZQR5rwhE_dUKRFum95Bk6mOR6O3Z5eaJqXOA@mail.gmail.com>
Subject: Re: [PATCH v2] eeprom: at24: Add support for 24c1025 EEPROM
To:     Maxim Kochetkov <fido_max@inbox.ru>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 3, 2021 at 11:37 PM Maxim Kochetkov <fido_max@inbox.ru> wrote:
>
> Microchip EEPROM 24xx1025 is like a 24c1024. The only difference
> between them is that the I2C address bit used to select between the
> two banks is bit 2 for the 1025 and not bit 0 as in the 1024.
>
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
> v2: rebased on git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/at24/for-next
>
>  drivers/misc/eeprom/at24.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 4d91c71c42cd..633e1cf08d6e 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -91,6 +91,7 @@ struct at24_data {
>          * Some chips tie up multiple I2C addresses; dummy devices reserve
>          * them for us.
>          */
> +       u8 bank_addr_shift;
>         struct regmap *client_regmaps[];
>  };
>
> @@ -118,6 +119,7 @@ MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to try writes (default 25)");
>  struct at24_chip_data {
>         u32 byte_len;
>         u8 flags;
> +       u8 bank_addr_shift;
>         void (*read_post)(unsigned int off, char *buf, size_t count);
>  };
>
> @@ -132,6 +134,12 @@ struct at24_chip_data {
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
> @@ -192,6 +200,7 @@ AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
> +AT24_CHIP_DATA_BS(at24_data_24c1025, 1048576 / 8, AT24_FLAG_ADDR16, 2);
>  AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
>  /* identical to 24c08 ? */
>  AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
> @@ -220,6 +229,7 @@ static const struct i2c_device_id at24_ids[] = {
>         { "24c256",     (kernel_ulong_t)&at24_data_24c256 },
>         { "24c512",     (kernel_ulong_t)&at24_data_24c512 },
>         { "24c1024",    (kernel_ulong_t)&at24_data_24c1024 },
> +       { "24c1025",    (kernel_ulong_t)&at24_data_24c1025 },
>         { "24c2048",    (kernel_ulong_t)&at24_data_24c2048 },
>         { "at24",       0 },
>         { /* END OF LIST */ }
> @@ -249,6 +259,7 @@ static const struct of_device_id at24_of_match[] = {
>         { .compatible = "atmel,24c256",         .data = &at24_data_24c256 },
>         { .compatible = "atmel,24c512",         .data = &at24_data_24c512 },
>         { .compatible = "atmel,24c1024",        .data = &at24_data_24c1024 },
> +       { .compatible = "atmel,24c1025",        .data = &at24_data_24c1025 },
>         { .compatible = "atmel,24c2048",        .data = &at24_data_24c2048 },
>         { /* END OF LIST */ },
>  };
> @@ -533,7 +544,8 @@ static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
>
>         dummy_client = devm_i2c_new_dummy_device(&base_client->dev,
>                                                  base_client->adapter,
> -                                                base_client->addr + index);
> +                                                base_client->addr +
> +                                                (index << at24->bank_addr_shift));
>         if (IS_ERR(dummy_client))
>                 return PTR_ERR(dummy_client);
>
> @@ -674,6 +686,7 @@ static int at24_probe(struct i2c_client *client)
>         at24->page_size = page_size;
>         at24->flags = flags;
>         at24->read_post = cdata->read_post;
> +       at24->bank_addr_shift = cdata->bank_addr_shift;
>         at24->num_addresses = num_addresses;
>         at24->offset_adj = at24_get_offset_adj(flags, byte_len);
>         at24->client_regmaps[0] = regmap;
> --
> 2.32.0
>

This looks good. Please send a separate patch adding this compatible
to the DT bindings so that I can queue it for v5.17.

Bart
