Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F6D52FC46
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 14:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239810AbiEUMDx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 08:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239289AbiEUMDt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 08:03:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA53E393C2;
        Sat, 21 May 2022 05:03:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4F42060B10;
        Sat, 21 May 2022 12:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82EAC385A9;
        Sat, 21 May 2022 12:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653134624;
        bh=YM5DKeCTB5HQbOoCwtl03Mo0hTo1psvio2W2JuRy1VY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r+Z5Qbvnzdqx4iyIsyprDVrcn3TLFQm5AjFHbOe4AzH0vufySiSygpAZNEPHlBNrG
         /YnjEE3Yuo472HoH7x2IAnaVZVGS66bnDIYxpnAEfjGZxVDyIgbFL2CJgsieATCzo7
         Cj/Y71S+96cERy5vmrYdtprwVaOAxAkXSRwiJxc23ohApnbrytAA6PFgfMz1oObtBy
         ClWMkU8uok4u/WbsNkDksK8ztPdNBK/pGiWLM1I/ghecYGmLNQmdBUsQNmK2EKf2Mc
         FnocTTnbEiGKxp6xdmqHC4/4qo83I5VmTPQaywqEBsysN3Edifhz/JUdJIU9Ytf1GP
         /P9vG6Urn812g==
Date:   Sat, 21 May 2022 14:03:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     frank zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 3/3] i2c: ch341: add I2C MFD cell driver for the CH341
Message-ID: <YojVHBofkBOFVYap@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        frank zago <frank@zago.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20220401023306.79532-1-frank@zago.net>
 <20220401023306.79532-4-frank@zago.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H4Fcr/HIYyvCKkRR"
Content-Disposition: inline
In-Reply-To: <20220401023306.79532-4-frank@zago.net>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H4Fcr/HIYyvCKkRR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Frank,

I am not super familiar with USB drivers, so mostly some high level
review questions first:

On Thu, Mar 31, 2022 at 09:33:06PM -0500, frank zago wrote:
> The I2C interface can run at 4 different speeds. This driver currently
> only offer 100MHz. Tested with a variety of I2C sensors, and the IIO

100kHz.

> subsystem.
>=20
> Signed-off-by: frank zago <frank@zago.net>

=2E..

> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a1bae59208e3..db9797345ad5 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1199,6 +1199,16 @@ config I2C_RCAR
> =20
>  comment "External I2C/SMBus adapter drivers"
> =20
> +config I2C_CH341
> +	tristate "CH341 USB to I2C support"
> +	select MFD_CH341

Hmm, it selects a symbol which depends on USB. Not good AFAIK. I think
this driver should depend on MFD_CH341.

> +	help
> +	  If you say yes to this option, I2C support will be included for the
> +	  WCH CH341, a USB to I2C/SPI/GPIO interface.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-ch341.
> +
>  config I2C_DIOLAN_U2C
>  	tristate "Diolan U2C-12 USB adapter"
>  	depends on USB

=2E..

> diff --git a/drivers/i2c/busses/i2c-ch341.c b/drivers/i2c/busses/i2c-ch34=
1.c
> new file mode 100644
> index 000000000000..3da11e358976
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ch341.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * I2C cell driver for the CH341A, CH341B and CH341T.
> + *
> + * Copyright 2022, Frank Zago
> + * Copyright (c) 2016 Tse Lun Bien
> + * Copyright (c) 2014 Marco Gittler
> + * Copyright (C) 2006-2007 Till Harbaum (Till@Harbaum.org)
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/usb.h>
> +
> +#include <linux/i2c.h>
> +
> +#include <linux/mfd/ch341.h>

Please sort the includes. No need for emtpy lines.

> +
> +/* I2C bus speed. Speed selection is not implemented. */
> +#define CH341_I2C_20KHZ  0
> +#define CH341_I2C_100KHZ 1
> +#define CH341_I2C_400KHZ 2
> +#define CH341_I2C_750KHZ 3
> +
> +/* I2C chip commands */
> +#define CH341_CMD_I2C_STREAM 0xAA
> +#define CH341_CMD_I2C_STM_END 0x00
> +
> +#define CH341_CMD_I2C_STM_STA 0x74
> +#define CH341_CMD_I2C_STM_STO 0x75
> +#define CH341_CMD_I2C_STM_OUT 0x80
> +#define CH341_CMD_I2C_STM_IN 0xC0
> +#define CH341_CMD_I2C_STM_SET 0x60
> +
> +/*
> + * The maximum request size is 4096 bytes, both for reading and
> + * writing, split in up to 128 32-byte segments. The I2C stream must
> + * start and stop in each 32-byte segment. Reading must also be split,
> + * with up to 32-byte per segment.
> + */
> +#define SEG_COUNT 128

You mean between every 32 bytes, there is a START and STOP condition on
the bus? Then, the maximum message size is 32 byte only, sadly. Or did I
misunderstand?

Can the driver send an arbitrary number of messages within one transfer?
E.g. write, read, read, write, read? All connected with a REPEATED START
and not with STOP and START?

=2E..

> +static u32 ch341_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}

Have you also tested zero length messages AKA SMBus Quick commands?

=2E..

> +
> +MODULE_AUTHOR("Various");

Please name the relevant authors. Only the ones which directly worked
on this driver.

> +MODULE_DESCRIPTION("CH341 USB to I2C");
> +MODULE_LICENSE("GPL");

SPDX header says "GPL v2".

So much for now, thanks for your submission!

   Wolfram


--H4Fcr/HIYyvCKkRR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKI1RcACgkQFA3kzBSg
KbZK9g/+Mu+GYUFTtwq+Qc6zzfGI+m6UN29ptl8vCL2v59XpLItqJdhtjzMIxq+O
nWEy1W9THhJVHRSQXeMUE9QLh2k1sdf4LuFgd4JOERxkJkuMZoMpr1y+0U5zJnL1
laZSWLOi6uDrG3gvn2Oz48w02Fd3wIeQBIiV/Ts1t0xRQ6dh2gGUw5Pyl/jIFIj3
alpQ6yrr06XA8MGnnBDn6IkoQoTZRwyDovQFYiqANCtSAWTnimqNXn9rqq3VP49Q
bAs96eKvedC67D07tfS0PR1BzSyse+b5ZY+0wupYwRxn0RcK9qSP9Ik3U2CHxdks
WKCRjUMh1+RGPX62lAgj+vzTO+JkchabQj4WgiEqo4T7ib5wpnTPDfdcG6ier0fr
Jt7NvA+KsvolkOFOfosnHMELePD7+6GXl96DL/AAeXcp1qX+PmLNCBnRXX4IelYA
ZxpkEzDbB5bPFhNcZq7ueiu8Ld0RfKwwbqaDa6yymIFBU2jTonnRVtdxfpJsWT98
eb8qRh9l719RGNE6V+zfyxtEScr+tTs8M11uxd+241xy03DvANoLK7fFP9o5eLQk
ZNStkV8n4OL8FPTm8553qz049CZK6tNYp8JfZfGvA51RtHiSeqtPe5JNFK4lRcuU
0PyIHjTeb/eMe7sU5ySIJ4uEoawPEotsbEM2EM7MKqZW8m3Ka6A=
=Cgps
-----END PGP SIGNATURE-----

--H4Fcr/HIYyvCKkRR--
