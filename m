Return-Path: <linux-i2c+bounces-532-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD40A7FD1CC
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 10:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B233B21259
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 09:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45AE12B92;
	Wed, 29 Nov 2023 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="j/gPBD0x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF671F4
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 01:10:40 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7c45acb3662so1759502241.0
        for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 01:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701249040; x=1701853840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DXF9O1RgHRA6Q4+fsCadrVtEFEpBPHwaju2dJOOLyU=;
        b=j/gPBD0xqdZ/fuvsfhXb/jVD55/2QIOtjPiRvZvpQWoiIDNmlzgdxT76A+X+mUy/n0
         ZWcZZpkiokA02A3g4PoFz4d6JeQ2hcbwUBt+UbcTVwpCISATLXL1TjMxU5w77wNOnFur
         LN+T2lq9DND9p9zRtughCQFh0meyG2ZiUsIZPn0pSEGRgqh1P6cDIVIeTYDqo008HRmy
         j4DkC3BLEztSDzXqC8GMWUfJlrxEB0SLclUenWqdk5zJMIhNirKeHKm9sE3V6f1lzSdk
         2hi1uvER5qyHbcS/duscddG9cjTTS4mgdpNFp4OWhAgYIBl91NUQH8qmJUKm4gDCW8Km
         L+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701249040; x=1701853840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DXF9O1RgHRA6Q4+fsCadrVtEFEpBPHwaju2dJOOLyU=;
        b=L64W+5pD9x+uqlREQSgfrViQ7D8lBQbgDD6OsMT2jkxVykVcCWOOgGRgu5g7O2V7AP
         TZlQ07PxQ9VRw+/LlJheADAo6ukXA7rOlK7AjSUnpQZ2jcdx+cwZhE6sKaUigbgyy2qO
         ytInJRVVIIdobcX8FpQYJxxtE3zqIZ2gaC80YUSSp4rSvWDYU8swSwtDrIMJpsEhEs7s
         Z5Kkbt1aiLPJenYIE6diKqg7vwqMaUFcMMUulPTlyUUEdAXJ+SLose1D4gIW1Rtr1DUO
         MEmMhh+kY5Z4uW8KuEbu9e/Gu2+KPzFpvknCHvwTmGOzBbtSKZ2w96Dffraj8six1akK
         2G1g==
X-Gm-Message-State: AOJu0Ywvlx7EDCP7Syd3ubwUqV59MRYYT++V9lS02weYu6uakDYDOdP2
	/ZbE4bkxTPwXFh8c/5Ma4qNhMYodxjXBs+fViAaqYw==
X-Google-Smtp-Source: AGHT+IF2abYTUSSPdqJxK8T5iWMOWvfZzKBy02SfSs6APR/05/WMDIgddE4+dHi4tbmO6pUDo8nkRwKOy9RHzF4FKCA=
X-Received: by 2002:a05:6102:3746:b0:462:866e:2f2f with SMTP id
 u6-20020a056102374600b00462866e2f2fmr14921238vst.9.1701249039789; Wed, 29 Nov
 2023 01:10:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127164623.1008176-1-m.felsch@pengutronix.de>
In-Reply-To: <20231127164623.1008176-1-m.felsch@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Nov 2023 10:10:28 +0100
Message-ID: <CAMRc=MdsEWxJLHL__zYXGEMYvvLSH99GsTRv_NTaVXt2fGtNvg@mail.gmail.com>
Subject: Re: [RFC PATCH] mtd: devices: add AT24 eeprom support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, arnd@arndb.de, 
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 5:46=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>

[snip]

>
> I dropped the backward compatibility since this is a new driver not
> having to deal with it. The old and the new driver can not be used by
> the same kernel config. So it is either using the MTD eeprom driver
> supporting partitioning and NVMEM or the older one which does not
> support partitioning but keeps the backward compatibility.
>
> Comments and suggestions are very welcome :)

I skimmed through the code. Nothing obviously wrong. What I would
suggest - if we're going to have two at24 drivers - is a lot more code
reuse. I dislike the idea of having basically the same code in two
places in the kernel and having to fix bugs in both.

Though if I'm being honest - I would prefer a single driver with
backwards compatibility. Have you estimated the effort it would take
to abstract both nvmem and mtd?

[snip]

> +
> +static const struct of_device_id at24_of_match[] =3D {
> +       { .compatible =3D "atmel,24c00",          .data =3D &at24_data_24=
c00 },
> +       { .compatible =3D "atmel,24c01",          .data =3D &at24_data_24=
c01 },
> +       { .compatible =3D "atmel,24cs01",         .data =3D &at24_data_24=
cs01 },
> +       { .compatible =3D "atmel,24c02",          .data =3D &at24_data_24=
c02 },
> +       { .compatible =3D "atmel,24cs02",         .data =3D &at24_data_24=
cs02 },
> +       { .compatible =3D "atmel,24mac402",       .data =3D &at24_data_24=
mac402 },
> +       { .compatible =3D "atmel,24mac602",       .data =3D &at24_data_24=
mac602 },
> +       { .compatible =3D "atmel,spd",            .data =3D &at24_data_sp=
d },
> +       { .compatible =3D "atmel,24c04",          .data =3D &at24_data_24=
c04 },
> +       { .compatible =3D "atmel,24cs04",         .data =3D &at24_data_24=
cs04 },
> +       { .compatible =3D "atmel,24c08",          .data =3D &at24_data_24=
c08 },
> +       { .compatible =3D "atmel,24cs08",         .data =3D &at24_data_24=
cs08 },
> +       { .compatible =3D "atmel,24c16",          .data =3D &at24_data_24=
c16 },
> +       { .compatible =3D "atmel,24cs16",         .data =3D &at24_data_24=
cs16 },
> +       { .compatible =3D "atmel,24c32",          .data =3D &at24_data_24=
c32 },
> +       { .compatible =3D "atmel,24cs32",         .data =3D &at24_data_24=
cs32 },
> +       { .compatible =3D "atmel,24c64",          .data =3D &at24_data_24=
c64 },
> +       { .compatible =3D "atmel,24cs64",         .data =3D &at24_data_24=
cs64 },
> +       { .compatible =3D "atmel,24c128",         .data =3D &at24_data_24=
c128 },
> +       { .compatible =3D "atmel,24c256",         .data =3D &at24_data_24=
c256 },
> +       { .compatible =3D "atmel,24c512",         .data =3D &at24_data_24=
c512 },
> +       { .compatible =3D "atmel,24c1024",        .data =3D &at24_data_24=
c1024 },
> +       { .compatible =3D "atmel,24c1025",        .data =3D &at24_data_24=
c1025 },
> +       { .compatible =3D "atmel,24c2048",        .data =3D &at24_data_24=
c2048 },
> +       { /* END OF LIST */ },
> +};
> +MODULE_DEVICE_TABLE(of, at24_of_match);

This is one of examples: I have a patch queued for the nvmem version
where we use of_match_ptr() and add __maybe_unused to this struct.
There's no reason really to have that struct duplicated.

[snip]

> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 6d83e72a24d2..1a850b19515d 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -148,6 +148,9 @@ static ssize_t mtd_type_show(struct device *dev,
>         case MTD_ROM:
>                 type =3D "rom";
>                 break;
> +       case MTD_EEPROM:
> +               type =3D "eeprom";
> +               break;
>         case MTD_NORFLASH:
>                 type =3D "nor";
>                 break;
> diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
> index 714d55b49d2a..59bf43d58ddb 100644
> --- a/include/uapi/mtd/mtd-abi.h
> +++ b/include/uapi/mtd/mtd-abi.h
> @@ -146,6 +146,7 @@ struct mtd_read_req {
>  #define MTD_DATAFLASH          6
>  #define MTD_UBIVOLUME          7
>  #define MTD_MLCNANDFLASH       8       /* MLC NAND (including TLC) */
> +#define MTD_EEPROM             9
>
>  #define MTD_WRITEABLE          0x400   /* Device is writeable */
>  #define MTD_BIT_WRITEABLE      0x800   /* Single bits can be flipped */
> @@ -159,6 +160,7 @@ struct mtd_read_req {
>  #define MTD_CAP_NORFLASH       (MTD_WRITEABLE | MTD_BIT_WRITEABLE)
>  #define MTD_CAP_NANDFLASH      (MTD_WRITEABLE)
>  #define MTD_CAP_NVRAM          (MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_=
NO_ERASE)
> +#define MTD_CAP_EEPROM         (MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_=
NO_ERASE)
>
>  /* Obsolete ECC byte placement modes (used with obsolete MEMGETOOBSEL) *=
/
>  #define MTD_NANDECC_OFF                0       /* Switch off ECC (Not re=
commended) */
> --
> 2.39.2
>

The infrastructure for supporting EEPROM should be sent as a separate patch=
 IMO.

Bart

