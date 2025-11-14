Return-Path: <linux-i2c+bounces-14082-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AE2C5BACE
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Nov 2025 08:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B774C348F88
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Nov 2025 07:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E783327F4CE;
	Fri, 14 Nov 2025 07:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVJV5p/t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45542652A6
	for <linux-i2c@vger.kernel.org>; Fri, 14 Nov 2025 07:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763103980; cv=none; b=sCXIFkFVVx6SJnnjQnNunS2y0vpx+BSVb0fzvSKw48elv/7QDspontUbxgD9KU9HGpJA6JU8ZEXJMIft1X3JuKvm2pLBFhaEh/CZNuYGgN8xdukX5M+qYjL9nRJ1eDVYbPrEPF7Kxtgy7++egoTd3IjCW8cKckMVjnWx6gyOvsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763103980; c=relaxed/simple;
	bh=xD78xYqPUz5Bo8pWxFQPqaNWPyhYIoXYA8uVCFHIHB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIyyBJqFqqYStDpywPWLOD01m+xZMR3D4Do4b0MDVwTH5ZtZyBoHiITYkFoCHJlKdsrjilKaaDTr1202mbP4WEShnRP2nD/n5dB97zZQaUw399h8rrLGz9G2odtGNXNa9zGUixgiH/yXWXkyciOpS7bZtNHt91f8gmZk41ZFc7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVJV5p/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E25BC2BC87
	for <linux-i2c@vger.kernel.org>; Fri, 14 Nov 2025 07:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763103980;
	bh=xD78xYqPUz5Bo8pWxFQPqaNWPyhYIoXYA8uVCFHIHB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HVJV5p/tziD6KJ6uUs1rL2Hb6kvq78wlxOPG6kp5Vi9trnoH6QCVWTKFUJis/X0hk
	 +QnOdqiKh7XVHGQf0bqycw5/zkvZ9qOzYI/D3g6t8YSP+UFDy3+lUBugi+JjYkC710
	 73svnx+XhBkdefftzSd2eek4alkxgTHWngcgNREE1CCtuaSBVIf2W6PNHpJzx0pmpu
	 YocHtmMVgC2eBQsA6PPN3pXumWh9b8wK8mmB3nTFyiFJaiLz9uk45UT2N5sMhvIXP1
	 WM4gHIa5WzoKhFaTu1Au48YDjdUfHDAoE7XM4nHLQk+hYtoe+6/e2gxk9O18bAaJsv
	 3VVmrdVPkpdtQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso2836333a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 13 Nov 2025 23:06:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULo1udvv3fxdGiwLBer5+SOi0sgm6/ZrSYFPwHCVI2G3Dp/ZvANRA2SWQcnVLRH5RtwbExlGtyKlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsXcvi1XVwlJqehnTlWp/bS8dKoo5AJY/LpsaIVlofZ3AH/6rF
	pWbd9rZRBpjTFUOVDoQy09qe5BdSned2eJZN+M19vMkvXuB/sCU/la7812o7+a7MNr+NNHToNy0
	prtDIr7hemlR5+BAzGg5iV7iGPHrCKQM=
X-Google-Smtp-Source: AGHT+IEkDdZWZMzkRirxddiBNFxn6xwZTom9lrJFa4HKf92yuZryd4xH4sSCkQGOMjvxBfZdDFVIv10UaCPLyiR4uiQ=
X-Received: by 2002:a17:907:1b04:b0:b04:274a:fc87 with SMTP id
 a640c23a62f3a-b736789d345mr198341966b.4.1763103978633; Thu, 13 Nov 2025
 23:06:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763018288.git.zhoubinbin@loongson.cn> <8899e0bf2a008003208dbcb63b4a40ae116fe5d8.1763018288.git.zhoubinbin@loongson.cn>
In-Reply-To: <8899e0bf2a008003208dbcb63b4a40ae116fe5d8.1763018288.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 14 Nov 2025 15:06:17 +0800
X-Gmail-Original-Message-ID: <CAAhV-H49z=Dee0xm6_xQwt7ziPtDeCGmMWqj2CnMw6VPTyabqA@mail.gmail.com>
X-Gm-Features: AWmQ_bm4-ovrA9f7xwdRsTUA3T231oq0V0yOS2PUVcQmp6QQDCnUWPiG6mJTiiM
Message-ID: <CAAhV-H49z=Dee0xm6_xQwt7ziPtDeCGmMWqj2CnMw6VPTyabqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: ls2x-v2: Add driver for Loongson-2K0300 I2C controller
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Thu, Nov 13, 2025 at 4:48=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> This I2C module is integrated into the Loongson-2K0300 SoCs.
>
> It provides multi-master functionality and controls all I2C bus-specific
> timing, protocols, arbitration, and timing. It supports both standard
> and fast modes.
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  MAINTAINERS                      |   1 +
>  drivers/i2c/busses/Kconfig       |  10 +
>  drivers/i2c/busses/Makefile      |   1 +
>  drivers/i2c/busses/i2c-ls2x-v2.c | 513 +++++++++++++++++++++++++++++++
>  4 files changed, 525 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ls2x-v2.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ddecf1ef3bed..8badab5d774d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14601,6 +14601,7 @@ M:      Binbin Zhou <zhoubinbin@loongson.cn>
>  L:     linux-i2c@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> +F:     drivers/i2c/busses/i2c-ls2x-v2.c
Move this line after i2c-ls2x.c?

>  F:     drivers/i2c/busses/i2c-ls2x.c
>
>  LOONGSON PWM DRIVER
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index fd81e49638aa..f52abbe20ce5 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -855,6 +855,16 @@ config I2C_LS2X
>           This driver can also be built as a module. If so, the module
>           will be called i2c-ls2x.
>
> +config I2C_LS2X_V2
> +       tristate "Loongson-2 Fast Speed I2C adapter"
> +       depends on LOONGARCH || COMPILE_TEST
> +       help
> +         If you say yes to this option, support will be included for the
> +         I2C interface on the Loongson-2K0300 SoCs.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called i2c-ls2x-v2.
> +
>  config I2C_MLXBF
>          tristate "Mellanox BlueField I2C controller"
>          depends on (MELLANOX_PLATFORM && ARM64) || COMPILE_TEST
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index fb985769f5ff..8cdfc30b79e9 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -80,6 +80,7 @@ obj-$(CONFIG_I2C_KEBA)                +=3D i2c-keba.o
>  obj-$(CONFIG_I2C_KEMPLD)       +=3D i2c-kempld.o
>  obj-$(CONFIG_I2C_LPC2K)                +=3D i2c-lpc2k.o
>  obj-$(CONFIG_I2C_LS2X)         +=3D i2c-ls2x.o
> +obj-$(CONFIG_I2C_LS2X_V2)      +=3D i2c-ls2x-v2.o
>  obj-$(CONFIG_I2C_MESON)                +=3D i2c-meson.o
>  obj-$(CONFIG_I2C_MICROCHIP_CORE)       +=3D i2c-microchip-corei2c.o
>  obj-$(CONFIG_I2C_MPC)          +=3D i2c-mpc.o
> diff --git a/drivers/i2c/busses/i2c-ls2x-v2.c b/drivers/i2c/busses/i2c-ls=
2x-v2.c
> new file mode 100644
> index 000000000000..e3b2a7ffe67e
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ls2x-v2.c
> @@ -0,0 +1,513 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Loongson-2K fast I2C controller driver
> + *
> + * Copyright (C) 2025 Loongson Technology Corporation Limited
> + *
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/iopoll.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/units.h>
> +
> +/* Loongson-2 fast I2C offset registers */
> +#define LOONGSON2_I2C_CR1      0x00    /* I2C control 1 register */
> +#define LOONGSON2_I2C_CR2      0x04    /* I2C control 2 register */
> +#define LOONGSON2_I2C_OAR      0x08    /* I2C slave address register */
> +#define LOONGSON2_I2C_DR       0x10    /* I2C data register */
> +#define LOONGSON2_I2C_SR1      0x14    /* I2C status 1 register */
> +#define LOONGSON2_I2C_SR2      0x18    /* I2C status 2 register */
> +#define LOONGSON2_I2C_CCR      0x1C    /* I2C clock control register */
> +#define LOONGSON2_I2C_TRISE    0x20    /* I2C trise register */
> +#define LOONGSON2_I2C_FLTR     0x24
> +
> +/* Bitfields of I2C control 1 register */
> +#define LOONGSON2_I2C_CR1_PE           BIT(0)
> +#define LOONGSON2_I2C_CR1_START                BIT(8)
> +#define LOONGSON2_I2C_CR1_STOP         BIT(9)
> +#define LOONGSON2_I2C_CR1_ACK          BIT(10)
> +#define LOONGSON2_I2C_CR1_POS          BIT(11)
> +
> +#define LOONGSON2_I2C_CR1_OP_MASK      (LOONGSON2_I2C_CR1_START | LOONGS=
ON2_I2C_CR1_STOP)
> +
> +/* Bitfields of I2C control 2 register */
> +#define LOONGSON2_I2C_CR2_FREQ         GENMASK(5, 0)
> +#define LOONGSON2_I2C_CR2_ITERREN      BIT(8)
> +#define LOONGSON2_I2C_CR2_ITEVTEN      BIT(9)
> +#define LOONGSON2_I2C_CR2_ITBUFEN      BIT(10)
> +
> +#define LOONGSON2_I2C_CR2_IRQ_MASK     (LOONGSON2_I2C_CR2_ITBUFEN | \
> +                                        LOONGSON2_I2C_CR2_ITEVTEN | \
> +                                        LOONGSON2_I2C_CR2_ITERREN)
> +
> +/* Bitfields of I2C status 1 register */
> +#define LOONGSON2_I2C_SR1_SB           BIT(0)
> +#define LOONGSON2_I2C_SR1_ADDR         BIT(1)
> +#define LOONGSON2_I2C_SR1_BTF          BIT(2)
> +#define LOONGSON2_I2C_SR1_RXNE         BIT(6)
> +#define LOONGSON2_I2C_SR1_TXE          BIT(7)
> +#define LOONGSON2_I2C_SR1_BERR         BIT(8)
> +#define LOONGSON2_I2C_SR1_ARLO         BIT(9)
> +#define LOONGSON2_I2C_SR1_AF           BIT(10)
> +
> +#define LOONGSON2_I2C_SR1_ITEVTEN_MASK (LOONGSON2_I2C_SR1_BTF | \
> +                                        LOONGSON2_I2C_SR1_ADDR | \
> +                                        LOONGSON2_I2C_SR1_SB)
> +#define LOONGSON2_I2C_SR1_ITBUFEN_MASK (LOONGSON2_I2C_SR1_TXE | LOONGSON=
2_I2C_SR1_RXNE)
> +#define LOONGSON2_I2C_SR1_ITERREN_MASK (LOONGSON2_I2C_SR1_AF | \
> +                                        LOONGSON2_I2C_SR1_ARLO | \
> +                                        LOONGSON2_I2C_SR1_BERR)
> +
> +/* Bitfields of I2C status 2 register */
> +#define LOONGSON2_I2C_SR2_BUSY         BIT(1)
> +
> +/* Bitfields of I2C clock control register */
> +#define LOONGSON2_I2C_CCR_CCR          GENMASK(11, 0)
> +#define LOONGSON2_I2C_CCR_DUTY         BIT(14)
> +#define LOONGSON2_I2C_CCR_FS           BIT(15)
> +
> +/* Bitfields of I2C trise register */
> +#define LOONGSON2_I2C_TRISE_SCL                GENMASK(5, 0)
> +
> +#define LOONGSON2_I2C_FREE_SLEEP_US    1000
> +#define LOONGSON2_I2C_FREE_TIMEOUT_US  5000
> +
> +/*
> + * struct loongson2_i2c_msg - client specific data
> + * @addr: 8-bit slave addr, including r/w bit
> + * @count: number of bytes to be transferred
> + * @buf: data buffer
> + * @stop: last I2C msg to be sent, i.e. STOP to be generated
> + * @result: result of the transfer
> + */
> +struct loongson2_i2c_msg {
> +       u8 addr;
> +       u32 count;
> +       u8 *buf;
> +       bool stop;
> +       int result;
> +};
> +
> +/*
> + * struct loongson2_i2c_priv - private data of the controller
> + * @adapter: I2C adapter for this controller
> + * @dev: device for this controller
> + * @complete: completion of I2C message
> + * @regmap: regmap of the I2C device
> + * @i2c_t: I2C timing information
> + * @msg: I2C transfer information
> + */
> +struct loongson2_i2c_priv {
> +       struct i2c_adapter adapter;
> +       struct device *dev;
> +       struct completion complete;
> +       struct regmap *regmap;
> +       struct i2c_timings i2c_t;
> +       struct loongson2_i2c_msg msg;
> +};
> +
> +static void loongson2_i2c_disable_irq(struct loongson2_i2c_priv *priv)
> +{
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I2C=
_CR2_IRQ_MASK, 0);
> +}
> +
> +static int loongson2_i2c_wait_free_bus(struct loongson2_i2c_priv *priv)
> +{
> +       u32 status;
> +       int ret;
> +
> +       ret =3D regmap_read_poll_timeout(priv->regmap, LOONGSON2_I2C_SR2,=
 status,
> +                                      !(status & LOONGSON2_I2C_SR2_BUSY)=
,
> +                                      LOONGSON2_I2C_FREE_SLEEP_US,
> +                                      LOONGSON2_I2C_FREE_TIMEOUT_US);
> +       if (ret) {
> +               dev_dbg(priv->dev, "I2C bus free failed.\n");
> +               ret =3D -EBUSY;
> +       }
> +
> +       return ret;
> +}
> +
> +static void loongson2_i2c_write_byte(struct loongson2_i2c_priv *priv, u8=
 byte)
> +{
> +       regmap_write(priv->regmap, LOONGSON2_I2C_DR, byte);
> +}
We usually put the write function after read, which means
loongson2_i2c_write_byte() should be after loongson2_i2c_read_msg().

> +
> +static void loongson2_i2c_read_msg(struct loongson2_i2c_priv *priv)
> +{
> +       struct loongson2_i2c_msg *msg =3D &priv->msg;
> +       u32 rbuf;
> +
> +       regmap_read(priv->regmap, LOONGSON2_I2C_DR, &rbuf);
> +       *msg->buf++ =3D rbuf;
> +       msg->count--;
> +}
> +
> +static void loongson2_i2c_terminate_xfer(struct loongson2_i2c_priv *priv=
)
> +{
> +       struct loongson2_i2c_msg *msg =3D &priv->msg;
> +
> +       loongson2_i2c_disable_irq(priv);
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C=
_CR1_OP_MASK,
> +                          msg->stop ? LOONGSON2_I2C_CR1_STOP : LOONGSON2=
_I2C_CR1_START);
> +       complete(&priv->complete);
> +}
> +
> +static void loongson2_i2c_handle_write(struct loongson2_i2c_priv *priv)
> +{
> +       struct loongson2_i2c_msg *msg =3D &priv->msg;
> +
> +       if (msg->count) {
> +               loongson2_i2c_write_byte(priv, *msg->buf++);
> +               msg->count--;
> +               if (!msg->count)
> +                       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR=
2,
> +                                          LOONGSON2_I2C_CR2_ITBUFEN, 0);
> +       } else {
> +               loongson2_i2c_terminate_xfer(priv);
> +       }
> +}
The same, loongson2_i2c_handle_write() should be after
loongson2_i2c_handle_read(), you have already done this in
loongson2_i2c_isr_event().

Huacai

> +
> +static void loongson2_i2c_handle_read(struct loongson2_i2c_priv *priv, i=
nt flag)
> +{
> +       struct loongson2_i2c_msg *msg =3D &priv->msg;
> +       bool changed;
> +       int i;
> +
> +       switch (msg->count) {
> +       case 1:
> +               /* only transmit 1 bytes condition */
> +               loongson2_i2c_disable_irq(priv);
> +               loongson2_i2c_read_msg(priv);
> +               complete(&priv->complete);
> +               break;
> +       case 2:
> +               if (flag !=3D 1) {
> +                       /* ensure only transmit 2 bytes condition */
> +                       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR=
2,
> +                                          LOONGSON2_I2C_CR2_ITBUFEN, 0);
> +                       break;
> +               }
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_OP_MASK,
> +                                  msg->stop ? LOONGSON2_I2C_CR1_STOP : L=
OONGSON2_I2C_CR1_START);
> +
> +               loongson2_i2c_disable_irq(priv);
> +
> +               for (i =3D 2; i > 0; i--)
> +                       loongson2_i2c_read_msg(priv);
> +
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_POS, 0);
> +               complete(&priv->complete);
> +               break;
> +       case 3:
> +               regmap_update_bits_check(priv->regmap, LOONGSON2_I2C_CR2,=
 LOONGSON2_I2C_CR2_ITBUFEN,
> +                                        0, &changed);
> +               if (changed)
> +                       break;
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_ACK, 0);
> +               fallthrough;
> +       default:
> +               loongson2_i2c_read_msg(priv);
> +       }
> +}
> +
> +static void loongson2_i2c_handle_rx_addr(struct loongson2_i2c_priv *priv=
)
> +{
> +       struct loongson2_i2c_msg *msg =3D &priv->msg;
> +
> +       switch (msg->count) {
> +       case 0:
> +               loongson2_i2c_terminate_xfer(priv);
> +               break;
> +       case 1:
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1,
> +                                  LOONGSON2_I2C_CR1_ACK | LOONGSON2_I2C_=
CR1_POS, 0);
> +               /* start or stop */
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_OP_MASK,
> +                                  msg->stop ? LOONGSON2_I2C_CR1_STOP : L=
OONGSON2_I2C_CR1_START);
> +               break;
> +       case 2:
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_ACK, 0);
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_POS,
> +                                  LOONGSON2_I2C_CR1_POS);
> +               break;
> +
> +       default:
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_ACK,
> +                                  LOONGSON2_I2C_CR1_ACK);
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_POS, 0);
> +       }
> +}
> +
> +static irqreturn_t loongson2_i2c_isr_error(u32 status, void *data)
> +{
> +       struct loongson2_i2c_priv *priv =3D data;
> +       struct loongson2_i2c_msg *msg =3D &priv->msg;
> +
> +       /* Arbitration lost */
> +       if (status & LOONGSON2_I2C_SR1_ARLO) {
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_SR1, LOONG=
SON2_I2C_SR1_ARLO, 0);
> +               msg->result =3D -EAGAIN;
> +       }
> +
> +       /*
> +        * Acknowledge failure:
> +        * In master transmitter mode a Stop must be generated by softwar=
e
> +        */
> +       if (status & LOONGSON2_I2C_SR1_AF) {
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONG=
SON2_I2C_CR1_STOP,
> +                                  LOONGSON2_I2C_CR1_STOP);
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_SR1, LOONG=
SON2_I2C_SR1_AF, 0);
> +               msg->result =3D -EIO;
> +       }
> +
> +       /* Bus error */
> +       if (status & LOONGSON2_I2C_SR1_BERR) {
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_SR1, LOONG=
SON2_I2C_SR1_BERR, 0);
> +               msg->result =3D -EIO;
> +       }
> +
> +       loongson2_i2c_disable_irq(priv);
> +       complete(&priv->complete);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t loongson2_i2c_isr_event(int irq, void *data)
> +{
> +       u32 possible_status =3D LOONGSON2_I2C_SR1_ITEVTEN_MASK;
> +       struct loongson2_i2c_priv *priv =3D data;
> +       struct loongson2_i2c_msg *msg =3D &priv->msg;
> +       u32 status, ien, event, cr2;
> +
> +       regmap_read(priv->regmap, LOONGSON2_I2C_SR1, &status);
> +       if (status & LOONGSON2_I2C_SR1_ITERREN_MASK)
> +               return loongson2_i2c_isr_error(status, data);
> +
> +       regmap_read(priv->regmap, LOONGSON2_I2C_CR2, &cr2);
> +       ien =3D cr2 & LOONGSON2_I2C_CR2_IRQ_MASK;
> +
> +       /* Update possible_status if buffer interrupt is enabled */
> +       if (ien & LOONGSON2_I2C_CR2_ITBUFEN)
> +               possible_status |=3D LOONGSON2_I2C_SR1_ITBUFEN_MASK;
> +
> +       event =3D status & possible_status;
> +       if (!event) {
> +               dev_dbg(priv->dev, "spurious evt irq (status=3D0x%08x, ie=
n=3D0x%08x)\n", status, ien);
> +               return IRQ_NONE;
> +       }
> +
> +       /* Start condition generated */
> +       if (event & LOONGSON2_I2C_SR1_SB)
> +               loongson2_i2c_write_byte(priv, msg->addr);
> +
> +       /* I2C Address sent */
> +       if (event & LOONGSON2_I2C_SR1_ADDR) {
> +               if (msg->addr & I2C_M_RD)
> +                       loongson2_i2c_handle_rx_addr(priv);
> +               /* Clear ADDR flag */
> +               regmap_read(priv->regmap, LOONGSON2_I2C_SR2, &status);
> +               /* Enable buffer interrupts for RX/TX not empty events */
> +               regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONG=
SON2_I2C_CR2_ITBUFEN,
> +                                  LOONGSON2_I2C_CR2_ITBUFEN);
> +       }
> +
> +       if (msg->addr & I2C_M_RD) {
> +               /* RX not empty */
> +               if (event & LOONGSON2_I2C_SR1_RXNE)
> +                       loongson2_i2c_handle_read(priv, 0);
> +
> +               if (event & LOONGSON2_I2C_SR1_BTF)
> +                       loongson2_i2c_handle_read(priv, 1);
> +       } else {
> +               /* TX empty */
> +               if (event & LOONGSON2_I2C_SR1_TXE)
> +                       loongson2_i2c_handle_write(priv);
> +
> +               if (event & LOONGSON2_I2C_SR1_BTF)
> +                       loongson2_i2c_handle_write(priv);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int loongson2_i2c_xfer_msg(struct loongson2_i2c_priv *priv, struc=
t i2c_msg *msg,
> +                                 bool is_stop)
> +{
> +       struct loongson2_i2c_msg *l_msg =3D &priv->msg;
> +       unsigned long timeout;
> +       int ret;
> +
> +       l_msg->addr   =3D i2c_8bit_addr_from_msg(msg);
> +       l_msg->buf    =3D msg->buf;
> +       l_msg->count  =3D msg->len;
> +       l_msg->stop   =3D is_stop;
> +       l_msg->result =3D 0;
> +
> +       reinit_completion(&priv->complete);
> +
> +       /* Enable events and errors interrupts */
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2,
> +                          LOONGSON2_I2C_CR2_ITEVTEN | LOONGSON2_I2C_CR2_=
ITERREN,
> +                          LOONGSON2_I2C_CR2_ITEVTEN | LOONGSON2_I2C_CR2_=
ITERREN);
> +
> +       timeout =3D wait_for_completion_timeout(&priv->complete, priv->ad=
apter.timeout);
> +       ret =3D l_msg->result;
> +
> +       if (!timeout)
> +               ret =3D -ETIMEDOUT;
> +
> +       return ret;
> +}
> +
> +static int loongson2_i2c_xfer(struct i2c_adapter *i2c_adap, struct i2c_m=
sg msgs[], int num)
> +{
> +       struct loongson2_i2c_priv *priv =3D i2c_get_adapdata(i2c_adap);
> +       int ret =3D 0, i;
> +
> +       ret =3D loongson2_i2c_wait_free_bus(priv);
> +       if (ret)
> +               return ret;
> +
> +       /* START generation */
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C=
_CR1_START,
> +                          LOONGSON2_I2C_CR1_START);
> +
> +       for (i =3D 0; i < num && !ret; i++)
> +               ret =3D loongson2_i2c_xfer_msg(priv, &msgs[i], i =3D=3D n=
um - 1);
> +
> +       return (ret < 0) ? ret : num;
> +}
> +
> +static u32 loongson2_i2c_func(struct i2c_adapter *adap)
> +{
> +       return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm loongson2_i2c_algo =3D {
> +       .master_xfer =3D loongson2_i2c_xfer,
> +       .functionality =3D loongson2_i2c_func,
> +};
> +
> +static void loongson2_i2c_adjust_bus_speed(struct loongson2_i2c_priv *pr=
iv)
> +{
> +       struct device *dev =3D priv->adapter.dev.parent;
> +       struct i2c_timings *t =3D &priv->i2c_t;
> +       u32 val, ccr =3D 0;
> +
> +       t->bus_freq_hz =3D I2C_MAX_STANDARD_MODE_FREQ;
> +
> +       i2c_parse_fw_timings(dev, t, false);
> +
> +       if (t->bus_freq_hz >=3D I2C_MAX_FAST_MODE_FREQ) {
> +               val =3D DIV_ROUND_UP(t->bus_freq_hz, I2C_MAX_FAST_MODE_FR=
EQ * 3);
> +
> +               /* Select Fast mode */
> +               ccr |=3D LOONGSON2_I2C_CCR_FS;
> +       } else {
> +               val =3D DIV_ROUND_UP(t->bus_freq_hz, I2C_MAX_STANDARD_MOD=
E_FREQ * 2);
> +       }
> +
> +       ccr |=3D FIELD_GET(LOONGSON2_I2C_CCR_CCR, val);
> +       regmap_write(priv->regmap, LOONGSON2_I2C_CCR, ccr);
> +
> +       /* reference clock determination the configure val(0x3f) */
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR2, LOONGSON2_I2C=
_CR2_FREQ,
> +                          LOONGSON2_I2C_CR2_FREQ);
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_TRISE, LOONGSON2_I=
2C_TRISE_SCL,
> +                          LOONGSON2_I2C_TRISE_SCL);
> +
> +       /* Enable I2C */
> +       regmap_update_bits(priv->regmap, LOONGSON2_I2C_CR1, LOONGSON2_I2C=
_CR1_PE,
> +                          LOONGSON2_I2C_CR1_PE);
> +}
> +
> +static const struct regmap_config loongson2_i2c_regmap_config =3D {
> +       .reg_bits =3D 32,
> +       .val_bits =3D 32,
> +       .reg_stride =3D 4,
> +       .max_register =3D LOONGSON2_I2C_TRISE,
> +};
> +
> +static int loongson2_i2c_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct loongson2_i2c_priv *priv;
> +       struct i2c_adapter *adap;
> +       void __iomem *base;
> +       int irq, ret;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base))
> +               return dev_err_probe(dev, PTR_ERR(base),
> +                                    "devm_platform_ioremap_resource fail=
ed\n");
> +
> +       priv->regmap =3D devm_regmap_init_mmio(dev, base,
> +                                            &loongson2_i2c_regmap_config=
);
> +       if (IS_ERR(priv->regmap))
> +               return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +                                    "devm_regmap_init_mmio failed\n");
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return -EINVAL;
> +
> +       priv->dev =3D dev;
> +
> +       adap =3D &priv->adapter;
> +       adap->retries =3D 5;
> +       adap->nr =3D pdev->id;
> +       adap->dev.parent =3D dev;
> +       adap->owner =3D THIS_MODULE;
> +       adap->algo =3D &loongson2_i2c_algo;
> +       adap->timeout =3D 2 * HZ;
> +       device_set_node(&adap->dev, dev_fwnode(dev));
> +       i2c_set_adapdata(adap, priv);
> +       strscpy(adap->name, pdev->name, sizeof(adap->name));
> +       init_completion(&priv->complete);
> +       platform_set_drvdata(pdev, priv);
> +
> +       loongson2_i2c_adjust_bus_speed(priv);
> +
> +       ret =3D devm_request_irq(dev, irq,  loongson2_i2c_isr_event, IRQF=
_SHARED, pdev->name, priv);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Unable to request irq %d\=
n", irq);
> +
> +       return devm_i2c_add_adapter(dev, adap);
> +}
> +
> +static const struct of_device_id loongson2_i2c_id_table[] =3D {
> +       { .compatible =3D "loongson,ls2k0300-i2c" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, loongson2_i2c_id_table);
> +
> +static struct platform_driver loongson2_i2c_driver =3D {
> +       .driver =3D {
> +               .name =3D "loongson2-i2c-v2",
> +               .of_match_table =3D loongson2_i2c_id_table,
> +       },
> +       .probe =3D loongson2_i2c_probe,
> +};
> +
> +module_platform_driver(loongson2_i2c_driver);
> +
> +MODULE_DESCRIPTION("Loongson-2K0300 I2C bus driver");
> +MODULE_AUTHOR("Loongson Technology Corporation Limited");
> +MODULE_LICENSE("GPL");
> --
> 2.47.3
>
>

