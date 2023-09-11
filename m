Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 449F879A3EF
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Sep 2023 08:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbjIKGyz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Sep 2023 02:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbjIKGyy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Sep 2023 02:54:54 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA90D12D
        for <linux-i2c@vger.kernel.org>; Sun, 10 Sep 2023 23:54:49 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-495e3d1edb4so553022e0c.0
        for <linux-i2c@vger.kernel.org>; Sun, 10 Sep 2023 23:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694415289; x=1695020089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXyOh/69L+jj7btllxiqwEkB6oTOH+/vnWCCjG27dFA=;
        b=EfUZRQoXMnqf5+GCzhjWkcbmYPD7oYTMpyMhfwHWiIOMg1RuQqTS8pvIgxj8kfE6bg
         3Kn+FNx2Tk2vYjitAwQR0qJ/enRvTj0MFZI94tR1RV2iJtkEQxtDEHW6+QUejmBL6xfR
         SG+gLKdsHZtjTJmTuWwHmlEK/H+nIrl5+gJ/uWs40gq986cvaeuVMwgp0SDnwGGbVERw
         jbcsoV/djpVS+qeSQJ28ITnRozoq1MbZ0eRr0Brx7Be/4LkV2XPwhxLQDv14p263CaKd
         91C2jKDTM3eXV+ggumhfnrSqLncdALkGcOLDZa3BUT82G8vjjTFQwyAW68j5ww260Qpi
         QuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694415289; x=1695020089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXyOh/69L+jj7btllxiqwEkB6oTOH+/vnWCCjG27dFA=;
        b=EfQAYZzXDidRt40VeuJfhp6fFR7u1T+bOP6ohm2WPTMDxyi1iW78vOc76MrA7mviUW
         45QNfWHg/0E5J5So9EcPu7lJJmThpUtKirefUD6FJcZO5v1h6SrYGyPyYzCaRVXkkf1z
         ND7S7ITeOAoBjZRKo9/gKtranX4IzDnJJVDQBy1+sDtUZNOKGhMIu9zjReShBPs0f3ty
         kWyZZ4g6VnnM3Q59/mkLNWRtfHUPmzbqYco99YvoLEVuUNQEQL/288BWq8Ud5iqBrRhm
         nsU4PTLSpvZEfBJqFcSfeKxGx4/4ZX5TYa2UM6OKAw2t7jwHTzMBlxTr0pz/up/H9nqN
         xkUQ==
X-Gm-Message-State: AOJu0YxP04hNDc5QweSnJhTEbKyooCoL6lOVCZhrrCTQGj+n5O//FU4v
        VShpKk5P/H66DXdVpzNdD6SfssWZc91CtZgTRbrvqg==
X-Google-Smtp-Source: AGHT+IHMaBeRWzx5kAez/oDd4wxSARcUvFTxaLdrWRenoyGrKpOx/Yvan6s1lQB6Ld6Y9huwGl7YpPxR8EaYgMz5dSs=
X-Received: by 2002:a05:6122:12eb:b0:493:fbe7:e71d with SMTP id
 k11-20020a05612212eb00b00493fbe7e71dmr4048706vkp.6.1694415288993; Sun, 10 Sep
 2023 23:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230902174547.71316-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230902174547.71316-1-biju.das.jz@bp.renesas.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 08:54:37 +0200
Message-ID: <CAMRc=MctvBdH91mfSr-1ODy3sEKtPtvcWR03NiHr6rFbrA82Lw@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Drop at24_get_chip_data()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.au@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Sep 2, 2023 at 7:45=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Replace at24_get_chip_data()->i2c_get_match_data() as it is
> redundant.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/misc/eeprom/at24.c | 32 +++-----------------------------
>  1 file changed, 3 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index dbbf7db4ff2f..af83aca452b7 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -509,32 +509,6 @@ static int at24_write(void *priv, unsigned int off, =
void *val, size_t count)
>         return 0;
>  }
>
> -static const struct at24_chip_data *at24_get_chip_data(struct device *de=
v)
> -{
> -       struct device_node *of_node =3D dev->of_node;
> -       const struct at24_chip_data *cdata;
> -       const struct i2c_device_id *id;
> -
> -       id =3D i2c_match_id(at24_ids, to_i2c_client(dev));
> -
> -       /*
> -        * The I2C core allows OF nodes compatibles to match against the
> -        * I2C device ID table as a fallback, so check not only if an OF
> -        * node is present but also if it matches an OF device ID entry.
> -        */
> -       if (of_node && of_match_device(at24_of_match, dev))
> -               cdata =3D of_device_get_match_data(dev);
> -       else if (id)
> -               cdata =3D (void *)id->driver_data;
> -       else
> -               cdata =3D acpi_device_get_match_data(dev);
> -
> -       if (!cdata)
> -               return ERR_PTR(-ENODEV);
> -
> -       return cdata;
> -}
> -
>  static int at24_make_dummy_client(struct at24_data *at24, unsigned int i=
ndex,
>                                   struct i2c_client *base_client,
>                                   struct regmap_config *regmap_config)
> @@ -601,9 +575,9 @@ static int at24_probe(struct i2c_client *client)
>         i2c_fn_block =3D i2c_check_functionality(client->adapter,
>                                                I2C_FUNC_SMBUS_WRITE_I2C_B=
LOCK);
>
> -       cdata =3D at24_get_chip_data(dev);
> -       if (IS_ERR(cdata))
> -               return PTR_ERR(cdata);
> +       cdata =3D i2c_get_match_data(client);
> +       if (!cdata)
> +               return -ENODEV;
>
>         err =3D device_property_read_u32(dev, "pagesize", &page_size);
>         if (err)
> --
> 2.25.1
>

Applied, thanks!

Bart
