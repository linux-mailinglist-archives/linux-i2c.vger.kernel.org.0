Return-Path: <linux-i2c+bounces-4452-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF6C91B9E8
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 10:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FE021F22B0A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 08:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B6014885B;
	Fri, 28 Jun 2024 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gobbGhOZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA53713E037
	for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563456; cv=none; b=nPaP9MFEWw17N4WvA5J2fNy28xfHqTz6Jw3vxbg7D/oYkjltfU+9uAGkQYcHGMsx+dp15Pi1tJQ50UusRkL8TBd7n+vgrnOPcI1ticDze7vhbKcLXmexL46dHUAz/I9GTAxNJa6i39XC/oaOCBKraQkRvr8i2Y6m/iTwJp1hAVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563456; c=relaxed/simple;
	bh=EtCc0Ulsm6d96qthMRZWYhCWk2z6+bTuRaI6iwHhKFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2X3CyYV4tY7TxllV9826ZVYeaVIQqZimi8UO9V7bnZm10QY6KHScL5ZVg8fNd7TJgj8ijBA1QDdZDd694zwd0tTJdHVtxlBN6CmDnyBHd1SQLc1y+ecPcFXauytYqN2d513moncF1E6gzb74XCHpyFbSR6HcXnd7S6VbfO9PAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gobbGhOZ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec59193468so3018011fa.1
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jun 2024 01:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719563453; x=1720168253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDHbCx3I4IqNsab1QxiDVhaxw/hy3+YvdSsikSHLnDU=;
        b=gobbGhOZb6RJr73TGRZ4dyk3FWaCb3TgQd2XkNqBlrafrQhJpcOgl5XtNouQ/TXfl4
         fGwbIwcxsB+pZpWhv8eNUhV0ydQdEFykmLTtx8oDHWmHInmlzLc9zd1WcXC8pb+X26AP
         fUmEpSDjdXRJKHySR6qxEuXiA1v0jJPyr6PjlYTAiEFXDOlpztzmvfZT1qTLMHQ5ut3Y
         1eG+CljaP0DYdFuKfIBBv7b+5bfhBzrBwSGdkDNsLlJ0nbt+KLXXaV1M2smgzcxznJZc
         oUFN6IH9C9OUl/cZKLS5GB/2hMklgFuToXcV6dtOIFsJSyQWU+QY8ZVHqF6KnN+uSgkq
         +Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563453; x=1720168253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDHbCx3I4IqNsab1QxiDVhaxw/hy3+YvdSsikSHLnDU=;
        b=f6ONMZdKtlT34A85PmJW3qP3CT/QWxXmYmzOGkPGcEqtP3ZOBWK6y0tKBgvVJV0f73
         cgpxdQXlv//kN2H/vvcKsV8V4uhZTRErAcO7aBd0t1NTVQrwqhl3ynr1KCg3o69eyu/n
         2vEsvrLrNh4crRwcm03mlnJAFRLPsGciLEhzZSxmd6atxFfKobSYXMrnij/OeFP6cPhE
         BYhUlZJu94pHGymdmcj3dIELap847tGpvq8MZwL5uKW+79qgm2AlfF9JQOG4AGJjoDqs
         LhrcioBsFJRIicf7vquYEr3f6drafgVYbYDqnKfe9aIl+VbvpV6vsKkNndMv+D+OinIz
         zYJA==
X-Forwarded-Encrypted: i=1; AJvYcCWKS5tUmYmX3ft6Davl3vNM0EJ3Qapizdava0Ade7UeketzVSX3T03N2PpOop5+8sR+f3mThJLir54VMRhR4hKLgXnnkLh6lzVZ
X-Gm-Message-State: AOJu0YzBAi0d4istBb1ZhgPjmVB4HsTxp4LZVi1A3/NpSySHwW9FIuRG
	6UOAD8yOBwbMu9C3OO+8OmJz3KVU99IXRjJuVESLe0G+VnWVXY2yHQhXcVINQAwIpjmW+8791NR
	VQnAsA+q+zXsSqJJB4+HgYSdJF8iE9BDI4cd++Q==
X-Google-Smtp-Source: AGHT+IHb15w1FOtsGlWaJj9fWqGVe0N7kzwCaQNEYTDO29ju0a0N9wPtmITOGOKtvPQV4WaTFtEpXrJjavnwY3sDN2o=
X-Received: by 2002:a2e:9947:0:b0:2ec:4e05:8d99 with SMTP id
 38308e7fff4ca-2ee53ca7c10mr2641601fa.20.1719563452671; Fri, 28 Jun 2024
 01:30:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628080146.49545-1-andrei.simion@microchip.com> <20240628080146.49545-2-andrei.simion@microchip.com>
In-Reply-To: <20240628080146.49545-2-andrei.simion@microchip.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 10:30:41 +0200
Message-ID: <CAMRc=MeJyByMvcFT2aJDK87bz4=+UXEuMtQ4G4MZUAUt39SS1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] eeprom: at24: avoid adjusting offset for
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

On Fri, Jun 28, 2024 at 10:02=E2=80=AFAM Andrei Simion
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
> Add "microchip,24aa025e48", "microchip,24aa025e64" compatible for the
> usage w/ 24AA025E{48, 64} type of EEPROMs where "24aa025e48" stands
> for EUI-48 address and "24aa025e64" stands for EUI-64 address.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> [andrei.simion@microchip.com: Add extended macros to initialize the struc=
ture
> with explicit value to adjusting offset. Add extra description for the co=
mmit
> message.]
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
> v2 -> v3:
> - add specific compatible names according with
> https://ww1.microchip.com/downloads/en/DeviceDoc/24AA02E48-24AA025E48-24A=
A02E64-24AA025E64-Data-Sheet-20002124H.pdf
> - add extended macros to initialize the structure with explicit value for=
 adjoff
> - drop co-developed-by to maintain the commit history
>  (chronological order of modifications)
>
> v1 -> v2:
> - no change
> ---
>  drivers/misc/eeprom/at24.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 4bd4f32bcdab..e2ac08f656cf 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -121,20 +121,29 @@ struct at24_chip_data {
>         u32 byte_len;
>         u8 flags;
>         u8 bank_addr_shift;
> +       u8 adjoff;
>         void (*read_post)(unsigned int off, char *buf, size_t count);
>  };
>
> -#define AT24_CHIP_DATA(_name, _len, _flags)                            \
> +#define AT24_CHIP_DATA_AO(_name, _len, _flags, _ao)                    \

Please, don't try to save space on a few letters, call it
AT24_CHIP_DATA_ADJOFF() for better readability.

>         static const struct at24_chip_data _name =3D {                   =
 \
>                 .byte_len =3D _len, .flags =3D _flags,                   =
   \
> +               .adjoff =3D _ao                                          =
 \
>         }
>
> -#define AT24_CHIP_DATA_CB(_name, _len, _flags, _read_post)             \
> +#define AT24_CHIP_DATA(_name, _len, _flags)                            \
> +       AT24_CHIP_DATA_AO(_name, _len, _flags, 0)
> +
> +#define AT24_CHIP_DATA_CB_AO(_name, _len, _flags, _ao, _read_post)     \
>         static const struct at24_chip_data _name =3D {                   =
 \
>                 .byte_len =3D _len, .flags =3D _flags,                   =
   \
> +               .adjoff =3D _ao,                                         =
 \
>                 .read_post =3D _read_post,                               =
 \
>         }
>
> +#define AT24_CHIP_DATA_CB(_name, _len, _flags, _read_post)             \
> +       AT24_CHIP_DATA_CB_AO(_name, _len, _flags, 0, _read_post)
> +
>  #define AT24_CHIP_DATA_BS(_name, _len, _flags, _bank_addr_shift)       \
>         static const struct at24_chip_data _name =3D {                   =
 \
>                 .byte_len =3D _len, .flags =3D _flags,                   =
   \
> @@ -170,9 +179,13 @@ AT24_CHIP_DATA(at24_data_24cs01, 16,
>  AT24_CHIP_DATA(at24_data_24c02, 2048 / 8, 0);
>  AT24_CHIP_DATA(at24_data_24cs02, 16,
>         AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
> -AT24_CHIP_DATA(at24_data_24mac402, 48 / 8,
> +AT24_CHIP_DATA_AO(at24_data_24mac402, 48 / 8,
> +       AT24_FLAG_MAC | AT24_FLAG_READONLY, 1);

And this will not break existing users? I guess you refer to these
changes in your commit message but it's not very clear what you're
doing and why.

> +AT24_CHIP_DATA_AO(at24_data_24mac602, 64 / 8,
> +       AT24_FLAG_MAC | AT24_FLAG_READONLY, 1);
> +AT24_CHIP_DATA(at24_data_24aa025e48, 48 / 8,
>         AT24_FLAG_MAC | AT24_FLAG_READONLY);
> -AT24_CHIP_DATA(at24_data_24mac602, 64 / 8,
> +AT24_CHIP_DATA(at24_data_24aa025e64, 64 / 8,
>         AT24_FLAG_MAC | AT24_FLAG_READONLY);
>  /* spd is a 24c02 in memory DIMMs */
>  AT24_CHIP_DATA(at24_data_spd, 2048 / 8,
> @@ -218,6 +231,8 @@ static const struct i2c_device_id at24_ids[] =3D {
>         { "24cs02",     (kernel_ulong_t)&at24_data_24cs02 },
>         { "24mac402",   (kernel_ulong_t)&at24_data_24mac402 },
>         { "24mac602",   (kernel_ulong_t)&at24_data_24mac602 },
> +       { "24aa025e48", (kernel_ulong_t)&at24_data_24aa025e48 },
> +       { "24aa025e64", (kernel_ulong_t)&at24_data_24aa025e64 },
>         { "spd",        (kernel_ulong_t)&at24_data_spd },
>         { "24c02-vaio", (kernel_ulong_t)&at24_data_24c02_vaio },
>         { "24c04",      (kernel_ulong_t)&at24_data_24c04 },
> @@ -270,6 +285,8 @@ static const struct of_device_id __maybe_unused at24_=
of_match[] =3D {
>         { .compatible =3D "atmel,24c1024",        .data =3D &at24_data_24=
c1024 },
>         { .compatible =3D "atmel,24c1025",        .data =3D &at24_data_24=
c1025 },
>         { .compatible =3D "atmel,24c2048",        .data =3D &at24_data_24=
c2048 },
> +       { .compatible =3D "microchip,24aa025e48", .data =3D &at24_data_24=
aa025e48 },
> +       { .compatible =3D "microchip,24aa025e64", .data =3D &at24_data_24=
aa025e64 },
>         { /* END OF LIST */ },
>  };
>  MODULE_DEVICE_TABLE(of, at24_of_match);
> @@ -690,7 +707,8 @@ static int at24_probe(struct i2c_client *client)
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

