Return-Path: <linux-i2c+bounces-4366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5D917AA8
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 10:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48E86284322
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 08:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8DB1662E4;
	Wed, 26 Jun 2024 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="JxHQfBMn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3748915B0E1
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 08:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719389776; cv=none; b=tvMM0Dd6XSP10FGE6GPVZxA2t59rxs6nX7WQ4rnHCGXWbOLvNNkApt9amVBPAVBAu4ZGMk2BF+PWLMBPOF7I0ftpwc2HSAZlknlPz7x0y3hu4DnSC1QypzAMyLVNwu77R7VIrut/rwG1UFWyNqcNDwAeaYY42vRG/m2kLaW66YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719389776; c=relaxed/simple;
	bh=FE7U271Et0zH3kSFczw/PdRB9ERnQk0y3yTaAdsdjcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+HBjiNf8Sn2+VgV7KEE3Aj/lAQIaJszUqyRKmbwTs0qGCbcf7cDZvkXDvkvyE8G/65E/FMIz6rPEXixeOaywhvgpU4nSOUI5iXcifpWfB3iKf9XY02ZKwwBgl9ww01rVk7IyW3BwzGWN4j/8DeaFUiMs0SiXO17SWuSbSjZQyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=JxHQfBMn; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec1620a956so77059691fa.1
        for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 01:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719389771; x=1719994571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN/1D3fBasxOG37a9PwgmL+HryV/H3Cuqs551lJ08hk=;
        b=JxHQfBMnTrYiigVHSWLl8RQODwVj3/PA02c5oESv2/RTdlWLRyWPB8qjR1OCjN6tAI
         i/wmluBfCv/2phi2H8vD63U+aJHkwn0nx6QQMZXnSylQKvnQgILsPEj+GOhAfe9W0vpZ
         JJplxYd9gXVFiblQqfOxLEyNqkc41HuSjMFG00Kr5V8WZcO5IE68exxzFNwtoGzOhbXH
         6PbaiLWTKh7DbM7Oo48Hv3eZOgFssURUqec9LXwjTn2dNekQesIzcj2ufEEQ9ldajK9f
         wJ4LdLnvEaWLmDud62Ixq4sPSNwXQw1TPyT5yaNmWrkkc4q3MSv7OEUc8ojn+WsnnckZ
         qj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719389771; x=1719994571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SN/1D3fBasxOG37a9PwgmL+HryV/H3Cuqs551lJ08hk=;
        b=gU/9A+AO7KOd2ssvj5g9hdAbtxPhLjo0dQIy8T7SjgahvFk6BpN7rt+RugpwGvet15
         koh9efncqbwESexEf7tYGZBzlJ+En7H3QXgxVaQe8L96N9rxG6eSf2YbXn6q41p1iFkU
         pcHmqS/9viSxPjeMRYgjRr5dRnDsY2Tap0fD77reGp7F/IK97H5HI5zp6xBz/MBMXtcj
         HsNCdXx/lmsKxB28wRh7KpCX4bAzvM9GRnrNh4SjG2P6xIXvy+UraRqKiEMgAAdRsqP/
         vs6eHAmS0/D3/hOJrzz9pJvGTDEs9xfqcXMoXR/ea7DfMsvhCE5oU/OO3Y9xWQDhVfxA
         pTog==
X-Forwarded-Encrypted: i=1; AJvYcCW76dkJYnc+1ftJacT6IfCdoN2aRR+9qC0/gBWkenK2bsGlNVhK/dkKtFSXgQq8QR/Wvg4JBZG2pFMOKz+AZeMlzhytIiNKTsfW
X-Gm-Message-State: AOJu0YwUupRa5DCvCqA/v1b+y5tSB53sFInbLYE6G0AUQ3ocLqQdYyPE
	4z0ngw2ES8YfpzpxGVCFCq4A0NZ22k58/7DOG8U7Z0nA+lOHw0z1u8dMNl5P7auDVcbXGHiYjxI
	CXNwNkWeY/Kyktr1RUebU6atnG/fN+lKOrd8USg==
X-Google-Smtp-Source: AGHT+IHAfFPI2ymuV8CI0WM+vHlPTAP++dLqOpBf4m+jsmj8adHU4/5YqAzi57wyh80Nxr7OvQrOtM7Z51QfitwmbCM=
X-Received: by 2002:a2e:80d5:0:b0:2ec:4fe0:38bc with SMTP id
 38308e7fff4ca-2ec5b388418mr51600041fa.35.1719389771288; Wed, 26 Jun 2024
 01:16:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621121340.114486-1-andrei.simion@microchip.com> <20240621121340.114486-2-andrei.simion@microchip.com>
In-Reply-To: <20240621121340.114486-2-andrei.simion@microchip.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Jun 2024 10:16:00 +0200
Message-ID: <CAMRc=McFF523PswO=mVGAErEAVCExGdKt+0zmOLnGebAwA+i_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] eeprom: at24: avoid adjusting offset for
 24AA025E{48, 64}
To: Andrei Simion <andrei.simion@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, arnd@arndb.de, gregkh@linuxfoundation.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 2:16=E2=80=AFPM Andrei Simion
<andrei.simion@microchip.com> wrote:
>
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
>
> The EEPROMs could be used only for MAC storage. In this case the
> EEPROM areas where MACs resides could be modeled as NVMEM cells
> (directly via DT bindings) such that the already available networking
> infrastructure to read properly the MAC addresses (via
> of_get_mac_address()). The previously available compatibles needs the
> offset adjustment probably for compatibility w/ old DT bindings.
> Added "atmel,24mac02e4", "atmel,24mac02e6" compatible for the usage w/

Use imperative mode: "Add ...".

What does e4 and e6 stand for? It's not explained in the commit message.

> 24AA025E{48, 64} type of EEPROMs.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Co-developed-by: Andrei Simion <andrei.simion@microchip.com>
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
> v1 -> v2:
> - no change
> ---
>  drivers/misc/eeprom/at24.c | 73 ++++++++++++++++++++++----------------
>  1 file changed, 42 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 4bd4f32bcdab..8699a6c585c4 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -121,17 +121,19 @@ struct at24_chip_data {
>         u32 byte_len;
>         u8 flags;
>         u8 bank_addr_shift;
> +       u8 adjoff;
>         void (*read_post)(unsigned int off, char *buf, size_t count);
>  };
>
> -#define AT24_CHIP_DATA(_name, _len, _flags)                            \
> +#define AT24_CHIP_DATA(_name, _len, _flags, _adjoff)                   \
>         static const struct at24_chip_data _name =3D {                   =
 \
> -               .byte_len =3D _len, .flags =3D _flags,                   =
   \
> +               .byte_len =3D _len, .flags =3D _flags, .adjoff =3D _adjof=
f, \
>         }
>

This is a lot of churn for no reason, please keep this macro, add a
new one extended with adjoff and just pass 0 to it by default from the
existing one.

> -#define AT24_CHIP_DATA_CB(_name, _len, _flags, _read_post)             \
> +#define AT24_CHIP_DATA_CB(_name, _len, _flags, _adjoff, _read_post)    \
>         static const struct at24_chip_data _name =3D {                   =
 \
>                 .byte_len =3D _len, .flags =3D _flags,                   =
   \
> +               .adjoff =3D _adjoff,                                     =
 \
>                 .read_post =3D _read_post,                               =
 \
>         }
>
> @@ -162,53 +164,57 @@ static void at24_read_post_vaio(unsigned int off, c=
har *buf, size_t count)
>  }
>
>  /* needs 8 addresses as A0-A2 are ignored */
> -AT24_CHIP_DATA(at24_data_24c00, 128 / 8, AT24_FLAG_TAKE8ADDR);
> +AT24_CHIP_DATA(at24_data_24c00, 128 / 8, AT24_FLAG_TAKE8ADDR, 0);
>  /* old variants can't be handled with this generic entry! */
> -AT24_CHIP_DATA(at24_data_24c01, 1024 / 8, 0);
> +AT24_CHIP_DATA(at24_data_24c01, 1024 / 8, 0, 0);
>  AT24_CHIP_DATA(at24_data_24cs01, 16,
> -       AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> -AT24_CHIP_DATA(at24_data_24c02, 2048 / 8, 0);
> +       AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> +AT24_CHIP_DATA(at24_data_24c02, 2048 / 8, 0, 0);
>  AT24_CHIP_DATA(at24_data_24cs02, 16,
> -       AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> +       AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
>  AT24_CHIP_DATA(at24_data_24mac402, 48 / 8,
> -       AT24_FLAG_MAC | AT24_FLAG_READONLY);
> +       AT24_FLAG_MAC | AT24_FLAG_READONLY, 1);
>  AT24_CHIP_DATA(at24_data_24mac602, 64 / 8,
> -       AT24_FLAG_MAC | AT24_FLAG_READONLY);
> +       AT24_FLAG_MAC | AT24_FLAG_READONLY, 1);
> +AT24_CHIP_DATA(at24_data_24mac02e4, 48 / 8,
> +       AT24_FLAG_MAC | AT24_FLAG_READONLY, 0);
> +AT24_CHIP_DATA(at24_data_24mac02e6, 64 / 8,
> +       AT24_FLAG_MAC | AT24_FLAG_READONLY, 0);
>  /* spd is a 24c02 in memory DIMMs */
>  AT24_CHIP_DATA(at24_data_spd, 2048 / 8,
> -       AT24_FLAG_READONLY | AT24_FLAG_IRUGO);
> +       AT24_FLAG_READONLY | AT24_FLAG_IRUGO, 0);
>  /* 24c02_vaio is a 24c02 on some Sony laptops */
>  AT24_CHIP_DATA_CB(at24_data_24c02_vaio, 2048 / 8,
> -       AT24_FLAG_READONLY | AT24_FLAG_IRUGO,
> +       AT24_FLAG_READONLY | AT24_FLAG_IRUGO, 0,
>         at24_read_post_vaio);
> -AT24_CHIP_DATA(at24_data_24c04, 4096 / 8, 0);
> +AT24_CHIP_DATA(at24_data_24c04, 4096 / 8, 0, 0);
>  AT24_CHIP_DATA(at24_data_24cs04, 16,
> -       AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> +       AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
>  /* 24rf08 quirk is handled at i2c-core */
> -AT24_CHIP_DATA(at24_data_24c08, 8192 / 8, 0);
> +AT24_CHIP_DATA(at24_data_24c08, 8192 / 8, 0, 0);
>  AT24_CHIP_DATA(at24_data_24cs08, 16,
> -       AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> -AT24_CHIP_DATA(at24_data_24c16, 16384 / 8, 0);
> +       AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> +AT24_CHIP_DATA(at24_data_24c16, 16384 / 8, 0, 0);
>  AT24_CHIP_DATA(at24_data_24cs16, 16,
> -       AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> -AT24_CHIP_DATA(at24_data_24c32, 32768 / 8, AT24_FLAG_ADDR16);
> +       AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> +AT24_CHIP_DATA(at24_data_24c32, 32768 / 8, AT24_FLAG_ADDR16, 0);
>  /* M24C32-D Additional Write lockable page (M24C32-D order codes) */
> -AT24_CHIP_DATA(at24_data_24c32d_wlp, 32, AT24_FLAG_ADDR16);
> +AT24_CHIP_DATA(at24_data_24c32d_wlp, 32, AT24_FLAG_ADDR16, 0);
>  AT24_CHIP_DATA(at24_data_24cs32, 16,
> -       AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> -AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16);
> +       AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> +AT24_CHIP_DATA(at24_data_24c64, 65536 / 8, AT24_FLAG_ADDR16, 0);
>  /* M24C64-D Additional Write lockable page (M24C64-D order codes) */
> -AT24_CHIP_DATA(at24_data_24c64d_wlp, 32, AT24_FLAG_ADDR16);
> +AT24_CHIP_DATA(at24_data_24c64d_wlp, 32, AT24_FLAG_ADDR16, 0);
>  AT24_CHIP_DATA(at24_data_24cs64, 16,
> -       AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> -AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16);
> -AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
> -AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
> -AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
> +       AT24_FLAG_ADDR16 | AT24_FLAG_SERIAL | AT24_FLAG_READONLY, 0);
> +AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLAG_ADDR16, 0);
> +AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16, 0);
> +AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16, 0);
> +AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16, 0);
> +AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16, 0);
>  AT24_CHIP_DATA_BS(at24_data_24c1025, 1048576 / 8, AT24_FLAG_ADDR16, 2);
> -AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
>  /* identical to 24c08 ? */
> -AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
> +AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0, 0);
>
>  static const struct i2c_device_id at24_ids[] =3D {
>         { "24c00",      (kernel_ulong_t)&at24_data_24c00 },
> @@ -217,7 +223,9 @@ static const struct i2c_device_id at24_ids[] =3D {
>         { "24c02",      (kernel_ulong_t)&at24_data_24c02 },
>         { "24cs02",     (kernel_ulong_t)&at24_data_24cs02 },
>         { "24mac402",   (kernel_ulong_t)&at24_data_24mac402 },
> +       { "24mac02e4",  (kernel_ulong_t)&at24_data_24mac02e4 },
>         { "24mac602",   (kernel_ulong_t)&at24_data_24mac602 },
> +       { "24mac02e6",  (kernel_ulong_t)&at24_data_24mac02e6 },
>         { "spd",        (kernel_ulong_t)&at24_data_spd },
>         { "24c02-vaio", (kernel_ulong_t)&at24_data_24c02_vaio },
>         { "24c04",      (kernel_ulong_t)&at24_data_24c04 },
> @@ -250,7 +258,9 @@ static const struct of_device_id __maybe_unused at24_=
of_match[] =3D {
>         { .compatible =3D "atmel,24c02",          .data =3D &at24_data_24=
c02 },
>         { .compatible =3D "atmel,24cs02",         .data =3D &at24_data_24=
cs02 },
>         { .compatible =3D "atmel,24mac402",       .data =3D &at24_data_24=
mac402 },
> +       { .compatible =3D "atmel,24mac02e4",      .data =3D &at24_data_24=
mac02e4 },
>         { .compatible =3D "atmel,24mac602",       .data =3D &at24_data_24=
mac602 },
> +       { .compatible =3D "atmel,24mac02e6",      .data =3D &at24_data_24=
mac02e6 },
>         { .compatible =3D "atmel,spd",            .data =3D &at24_data_sp=
d },
>         { .compatible =3D "atmel,24c04",          .data =3D &at24_data_24=
c04 },
>         { .compatible =3D "atmel,24cs04",         .data =3D &at24_data_24=
cs04 },
> @@ -690,7 +700,8 @@ static int at24_probe(struct i2c_client *client)
>         at24->read_post =3D cdata->read_post;
>         at24->bank_addr_shift =3D cdata->bank_addr_shift;
>         at24->num_addresses =3D num_addresses;
> -       at24->offset_adj =3D at24_get_offset_adj(flags, byte_len);
> +       at24->offset_adj =3D cdata->adjoff ?
> +                               at24_get_offset_adj(flags, byte_len) : 0;
>         at24->client_regmaps[0] =3D regmap;
>
>         at24->vcc_reg =3D devm_regulator_get(dev, "vcc");
> --
> 2.34.1
>

Bart

