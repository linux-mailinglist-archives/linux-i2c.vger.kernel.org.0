Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACDB55B8936
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Sep 2022 15:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbiINNef (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 09:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiINNed (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 09:34:33 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6321325E
        for <linux-i2c@vger.kernel.org>; Wed, 14 Sep 2022 06:34:27 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 994621FA72;
        Wed, 14 Sep 2022 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1663162466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/hb+NGcxWta8sRvrmcWEhP1MdMiJdiAOWMIxhv2/AK0=;
        b=o3VGeoKxe8lajc/+w88kRUQqBwTbt96dLIxBp9XzBwrQHZzQDlY51fWrdkObY4mYkCqXMj
        KMMtW+A8yt0tMEVf/QjU099zxXHL59MdwWi64MlhhQFZhFnnXbhFpAub97mZ28ou5ydyi5
        EupT5YXTG4namkjn6l56L57/kRfXS5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1663162466;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/hb+NGcxWta8sRvrmcWEhP1MdMiJdiAOWMIxhv2/AK0=;
        b=OHKYstZZ/PnPtbCvjo0093p5/UeSpkkszHKH71iW2Pl3cUFqUFou7BMGwgQvEXisANa+7k
        gNI/kGAAqBfPgNDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D4B113494;
        Wed, 14 Sep 2022 13:34:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id XIwdGWLYIWPvHQAAMHmgww
        (envelope-from <jdelvare@suse.de>); Wed, 14 Sep 2022 13:34:26 +0000
Date:   Wed, 14 Sep 2022 15:34:24 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Adam Honse <calcprogrammer1@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] i2c: New driver for Nuvoton SMBus adapters
Message-ID: <20220914153424.63c957f4@endymion.delvare>
In-Reply-To: <20220907020651.2309354-1-calcprogrammer1@gmail.com>
References: <20220907020651.2309354-1-calcprogrammer1@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Adam,

On Wed,  7 Sep 2022 02:06:51 +0000, Adam Honse wrote:
> This patch introduces a new driver for the SMBus adapter that is built in
> to most Nuvoton Super-IO chips.  This SMBus adapter is used for RGB
> lighting control on some ASUS motherboards with Intel chipsets.
>=20
> The interface's register description is available in the supported
> devices' datasheets.  Operation of this interface has been verified
> with OpenRGB on an ASUS PRIME Z270-A motherboard.

Care to point me to one such datasheet?

The following errors are reported by ./scripts/checkpatch.pl (which I
invite you to run before posting any patch):

RROR: "foo * bar" should be "foo *bar"
#452: FILE: drivers/i2c/busses/i2c-nct6793.c:295:
+static struct i2c_adapter * nct6793_add_adapter(unsigned short smba, const=
 char *name)

ERROR: trailing whitespace
#526: FILE: drivers/i2c/busses/i2c-nct6793.c:369:
+^I^I$

ERROR: space required before the open parenthesis '('
#527: FILE: drivers/i2c/busses/i2c-nct6793.c:370:
+		if(IS_ERR(sio_data->adapter))

Please fix before resubmitting.

Also, would you consider declaring yourself the maintainer of this new
driver? If so, please add a new entry in MAINTAINERS and add yourself
there. You can use the "I2C/SMBUS ISMT DRIVER" entry as an example.

If not, no worry, I'll add the driver to my own list.

I see that there already seem to be a driver for the SMBus interface of
Novoton Super-I/O chipsets:

drivers/hwmon/nct6775-i2c.c

However that driver seems to be fairly limited in capabilities (on
purpose). I'm adding the author of this driver and the maintainer of the
hwmon subsystem to Cc. How do the two drivers relate to each other? Are
they for the same, or different interfaces? If different, we need to
come up with names to designate them unambiguously. If the same, then
I'm afraid both drivers will step on each other's toes?

Anyway, here's my review of your driver, inline below.

> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
> ---
>  drivers/i2c/busses/Kconfig       |   9 +
>  drivers/i2c/busses/Makefile      |   1 +
>  drivers/i2c/busses/i2c-nct6793.c | 550 +++++++++++++++++++++++++++++++
>  3 files changed, 560 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-nct6793.c
>=20
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a1bae59208e3..ef679c5141e5 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -227,6 +227,15 @@ config I2C_CHT_WC
>  	  combined with a FUSB302 Type-C port-controller as such it is advised
>  	  to also select CONFIG_TYPEC_FUSB302=3Dm.
> =20
> +config I2C_NCT6793
> +	tristate "Nuvoton NCT6793D and compatible SMBus controller"
> +	help
> +		If you say yes to this option, support will be included for the
> +		Nuvoton NCT6793D and compatible SMBus controllers.
> +
> +		This driver can also be built as a module.  If so, the module
> +		will be called i2c-nct6793.
> +
>  config I2C_NFORCE2
>  	tristate "Nvidia nForce2, nForce3 and nForce4"
>  	depends on PCI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 479f60e4ee3d..ab3506e40ecf 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_I2C_CHT_WC)	+=3D i2c-cht-wc.o
>  obj-$(CONFIG_I2C_I801)		+=3D i2c-i801.o
>  obj-$(CONFIG_I2C_ISCH)		+=3D i2c-isch.o
>  obj-$(CONFIG_I2C_ISMT)		+=3D i2c-ismt.o
> +obj-$(CONFIG_I2C_NCT6793)	+=3D i2c-nct6793.o
>  obj-$(CONFIG_I2C_NFORCE2)	+=3D i2c-nforce2.o
>  obj-$(CONFIG_I2C_NFORCE2_S4985)	+=3D i2c-nforce2-s4985.o
>  obj-$(CONFIG_I2C_NVIDIA_GPU)	+=3D i2c-nvidia-gpu.o
> diff --git a/drivers/i2c/busses/i2c-nct6793.c b/drivers/i2c/busses/i2c-nc=
t6793.c
> new file mode 100644
> index 000000000000..dfb2e7748cf9
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-nct6793.c
> @@ -0,0 +1,550 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * i2c-nct6793 - Driver for the SMBus master functionality of
> + *	       Nuvoton NCT679x Super-I/O chips
> + *
> + * Copyright (C) 2022  Adam Honse <calcprogrammer1@gmail.com>
> + *
> + * Derived from nct6775 hwmon driver
> + * Copyright (C) 2012  Guenter Roeck <linux@roeck-us.net>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/err.h>
> +#include <linux/delay.h>
> +#include <linux/ioport.h>
> +#include <linux/i2c.h>
> +#include <linux/acpi.h>
> +#include <linux/io.h>
> +
> +#define DRVNAME "i2c-nct6793"
> +
> +/* Nuvoton SMBus address offsets */
> +#define SMBHSTDAT       (nuvoton_nct6793_smba + 0x0)
> +#define SMBBLKSZ        (nuvoton_nct6793_smba + 0x1)
> +#define SMBHSTCMD       (nuvoton_nct6793_smba + 0x2)
> +#define SMBHSTIDX       (nuvoton_nct6793_smba + 0x3)
> +#define SMBHSTCTL       (nuvoton_nct6793_smba + 0x4)
> +#define SMBHSTADD       (nuvoton_nct6793_smba + 0x5)
> +#define SMBHSTERR       (nuvoton_nct6793_smba + 0x9)
> +#define SMBHSTSTS       (nuvoton_nct6793_smba + 0xE)
> +
> +/* Command register */
> +#define NCT6793_READ_BYTE		0
> +#define NCT6793_READ_WORD		1
> +#define NCT6793_READ_BLOCK		2
> +#define NCT6793D_BLOCK_PROC_CALL	3
> +#define NCT6793_PROC_CALL		4
> +#define NCT6793_WRITE_BYTE		8
> +#define NCT6793_WRITE_WORD		9
> +#define NCT6793_WRITE_BLOCK		10
> +
> +/* Control register */
> +#define NCT6793_MANUAL_START		128
> +#define NCT6793_SOFT_RESET		64
> +
> +/* Error register */
> +#define NCT6793_NO_ACK			32

The 3 values above are clearly bits, so why don't use BIT() as below?

> +
> +/* Status register */
> +#define NCT6793_FIFO_EMPTY		BIT(0)
> +#define NCT6793_FIFO_FULL		BIT(1)
> +#define NCT6793_MANUAL_ACTIVE		BIT(2)
> +
> +#define NCT6793_LD_SMBUS		0x0B
> +
> +/* Other settings */
> +#define MAX_RETRIES			400
> +
> +enum kinds { nct6791, nct6792, nct6793, nct6795, nct6796, nct6798 };
> +
> +struct nct6793_sio_data {
> +	int sioreg;
> +	enum kinds kind;
> +	struct i2c_adapter *adapter;
> +};
> +
> +static const char * const nct6793_sio_names[] =3D {
> +	"NCT6791D",
> +	"NCT6792D",
> +	"NCT6793D",
> +	"NCT6795D",
> +	"NCT6796D",
> +	"NCT6798D",
> +};

Maybe it would make sense to list these devices in the Kconfig entry?

> +
> +#define SIO_REG_LDSEL			0x07	/* Logical device select */
> +#define SIO_REG_DEVID			0x20	/* Device ID (2 bytes) */
> +#define SIO_REG_SMBA			0x62	/* SMBus base address register */
> +
> +#define SIO_NCT6791_ID			0xc800
> +#define SIO_NCT6792_ID			0xc910
> +#define SIO_NCT6793_ID			0xd120
> +#define SIO_NCT6795_ID			0xd350
> +#define SIO_NCT6796_ID			0xd420
> +#define SIO_NCT6798_ID			0xd428
> +#define SIO_ID_MASK			0xFFF0
> +
> +static inline int
> +superio_inb(int ioreg, int reg)
> +{
> +	outb(reg, ioreg);
> +	return inb(ioreg + 1);
> +}
> +
> +static inline void
> +superio_select(int ioreg, int ld)
> +{
> +	outb(SIO_REG_LDSEL, ioreg);
> +	outb(ld, ioreg + 1);
> +}
> +
> +static inline int
> +superio_enter(int ioreg)
> +{
> +	/*
> +	 * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
> +	 */
> +	if (!request_muxed_region(ioreg, 2, DRVNAME))
> +		return -EBUSY;
> +
> +	outb(0x87, ioreg);
> +	outb(0x87, ioreg);
> +
> +	return 0;
> +}
> +
> +static inline void
> +superio_exit(int ioreg)
> +{
> +	outb(0xaa, ioreg);
> +	outb(0x02, ioreg);
> +	outb(0x02, ioreg + 1);
> +	release_region(ioreg, 2);
> +}
> +
> +/*
> + * ISA constants
> + */
> +
> +#define IOREGION_ALIGNMENT	(~7)
> +#define IOREGION_LENGTH		2
> +
> +struct i2c_nct6793_adapdata {
> +	unsigned short smba;
> +};
> +
> +/* Return negative errno on error. */
> +static s32 nct6793_access(struct i2c_adapter *adap, u16 addr,
> +		 unsigned short flags, char read_write,
> +		 u8 command, int size, union i2c_smbus_data *data)
> +{
> +	struct i2c_nct6793_adapdata *adapdata =3D i2c_get_adapdata(adap);
> +	unsigned short nuvoton_nct6793_smba =3D adapdata->smba;
> +	int i, len, cnt;
> +	int timeout =3D 0;
> +
> +	outb_p(NCT6793_SOFT_RESET, SMBHSTCTL);
> +
> +	switch (size) {
> +	case I2C_SMBUS_QUICK:
> +		outb_p((addr << 1) | read_write,
> +				SMBHSTADD);

Do you have any reason to use slow I/O functions (*b_p) here? If not,
please switch to the non-paused functions.

Is the SMBus Quick transaction really supported? There is no SMBHSTCMD
value for it, which is kind of suspicious.

> +		break;
> +	case I2C_SMBUS_BYTE_DATA:
> +		fallthrough;
> +	case I2C_SMBUS_BYTE:
> +		outb_p((addr << 1) | read_write,
> +				SMBHSTADD);
> +		outb_p(command, SMBHSTIDX);
> +		if (read_write =3D=3D I2C_SMBUS_WRITE) {
> +			outb_p(data->byte, SMBHSTDAT);
> +			outb_p(NCT6793_WRITE_BYTE, SMBHSTCMD);
> +		} else {
> +			outb_p(NCT6793_READ_BYTE, SMBHSTCMD);
> +		}
> +		break;

The SMBus Receive Byte and Read Byte transactions are different on the
wire, so you can't possibly implement both with exactly the same code.

=46rom the list of command register values, I suspect that I2C_SMBUS_BYTE
is not actually supported.

> +	case I2C_SMBUS_WORD_DATA:
> +		outb_p((addr << 1) | read_write,
> +				SMBHSTADD);
> +		outb_p(command, SMBHSTIDX);
> +		if (read_write =3D=3D I2C_SMBUS_WRITE) {
> +			outb_p(data->word & 0xff, SMBHSTDAT);
> +			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT);
> +			outb_p(NCT6793_WRITE_WORD, SMBHSTCMD);
> +		} else {
> +			outb_p(NCT6793_READ_WORD, SMBHSTCMD);
> +		}
> +		break;
> +	case I2C_SMBUS_BLOCK_DATA:
> +		outb_p((addr << 1) | read_write,
> +				SMBHSTADD);
> +		outb_p(command, SMBHSTIDX);
> +		if (read_write =3D=3D I2C_SMBUS_WRITE) {
> +			len =3D data->block[0];
> +			if (len =3D=3D 0 || len > I2C_SMBUS_BLOCK_MAX)
> +				return -EINVAL;
> +			outb_p(len, SMBBLKSZ);
> +
> +			cnt =3D 1;
> +			if (len >=3D 4) {
> +				for (i =3D cnt; i <=3D 4; i++)
> +					outb_p(data->block[i], SMBHSTDAT);
> +
> +				len -=3D 4;
> +				cnt +=3D 4;
> +			} else {
> +				for (i =3D cnt; i <=3D len; i++)
> +					outb_p(data->block[i], SMBHSTDAT);
> +
> +				len =3D 0;
> +			}
> +
> +			outb_p(NCT6793_WRITE_BLOCK, SMBHSTCMD);
> +		} else {
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	outb_p(NCT6793_MANUAL_START, SMBHSTCTL);
> +
> +	while (size =3D=3D I2C_SMBUS_BLOCK_DATA && len > 0) {
> +		if (read_write =3D=3D I2C_SMBUS_WRITE) {
> +			timeout =3D 0;
> +			while ((inb_p(SMBHSTSTS) & NCT6793_FIFO_EMPTY) =3D=3D 0) {
> +				if (timeout > MAX_RETRIES)
> +					return -ETIMEDOUT;
> +
> +				usleep_range(250, 500);
> +				timeout++;
> +			}
> +
> +			/* Load more bytes into FIFO */
> +			if (len >=3D 4) {
> +				for (i =3D cnt; i <=3D (cnt + 4); i++)
> +					outb_p(data->block[i], SMBHSTDAT);
> +
> +				len -=3D 4;
> +				cnt +=3D 4;
> +			} else {
> +				for (i =3D cnt; i <=3D (cnt + len); i++)
> +					outb_p(data->block[i], SMBHSTDAT);
> +
> +				len =3D 0;
> +			}
> +		}
> +	}
> +
> +	/* Wait for manual mode to complete */
> +	timeout =3D 0;
> +	while ((inb_p(SMBHSTSTS) & NCT6793_MANUAL_ACTIVE) !=3D 0) {
> +		if (timeout > MAX_RETRIES)
> +			return -ETIMEDOUT;
> +
> +		usleep_range(250, 500);
> +		timeout++;
> +	}
> +
> +	if ((inb_p(SMBHSTERR) & NCT6793_NO_ACK) !=3D 0)
> +		return -ENXIO;
> +
> +	if (read_write =3D=3D I2C_SMBUS_WRITE || size =3D=3D I2C_SMBUS_QUICK)
> +		return 0;
> +
> +	switch (size) {
> +	case I2C_SMBUS_BYTE_DATA:
> +		data->byte =3D inb_p(SMBHSTDAT);
> +		break;
> +	case I2C_SMBUS_WORD_DATA:
> +		data->word =3D inb_p(SMBHSTDAT) | (inb_p(SMBHSTDAT) << 8);

I am no C language nor compiler expert, but is there any guarantee that
the left-hand side inb will be evaluated before the right-hand side inb
with the construct above? I think it would be safer to separate into 2
operations, to guarantee which byte will be read first.

> +		break;
> +	}
> +	return 0;
> +}
> +
> +static u32 nct6793_func(struct i2c_adapter *adapter)
> +{
> +	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
> +	    I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
> +	    I2C_FUNC_SMBUS_BLOCK_DATA;

You should definitely use I2C_FUNC_SMBUS_WRITE_BLOCK_DATA instead of
I2C_FUNC_SMBUS_BLOCK_DATA, as function nct6793_access() explicitly
rejects SMBus Read Block transactions.

You may have to remove I2C_FUNC_SMBUS_QUICK and I2C_FUNC_SMBUS_BYTE
from the list, given the concerns I expressed above.

> +}
> +
> +static const struct i2c_algorithm smbus_algorithm =3D {
> +	.smbus_xfer	=3D nct6793_access,
> +	.functionality	=3D nct6793_func,
> +};
> +
> +static struct i2c_adapter * nct6793_add_adapter(unsigned short smba, con=
st char *name)
> +{
> +	struct i2c_adapter *adap;
> +	struct i2c_nct6793_adapdata *adapdata;
> +	int retval;
> +
> +	adap =3D kzalloc(sizeof(*adap), GFP_KERNEL);
> +	if (adap =3D=3D NULL)
> +		return ERR_PTR(-ENOMEM);
> +
> +	adap->owner =3D THIS_MODULE;
> +	adap->class =3D 0;

adap is already zeroed by kzalloc, so you can omit this statement.

> +	adap->algo =3D &smbus_algorithm;
> +
> +	adapdata =3D kzalloc(sizeof(*adapdata), GFP_KERNEL);
> +	if (adapdata =3D=3D NULL) {
> +		kfree(adap);
> +		return ERR_PTR(-ENOMEM);
> +	}

Consider using devm_kzalloc() so you don't have to deal with the
freeing.

> +
> +	adapdata->smba =3D smba;
> +
> +	snprintf(adap->name, sizeof(adap->name),
> +		"SMBus NCT679x adapter %s at %04x", name, smba);

The resulting string will have some redundancy. What about:

		"SMBus %s adapter at %04x"

> +
> +	i2c_set_adapdata(adap, adapdata);
> +
> +	retval =3D i2c_add_adapter(adap);
> +	if (retval) {
> +		kfree(adapdata);
> +		kfree(adap);
> +		return ERR_PTR(retval);
> +	}
> +
> +	return adap;
> +}
> +
> +static void nct6793_remove_adapter(struct i2c_adapter *adap)
> +{
> +	struct i2c_nct6793_adapdata *adapdata =3D i2c_get_adapdata(adap);
> +
> +	i2c_del_adapter(adap);
> +	kfree(adapdata);
> +	kfree(adap);
> +}
> +
> +/*
> + * When Super-I/O functions move to a separate file, the Super-I/O
> + * bus will manage the lifetime of the device and this module will only =
keep
> + * track of the nct6793 driver. But since we use platform_device_alloc()=
, we
> + * must keep track of the device.
> + */
> +static struct platform_device *pdev[2];

Please come up with a different name, so that local variable or
function parameter "pdev" does not shadow this array.

> +
> +static int nct6793_probe(struct platform_device *pdev)
> +{
> +	struct i2c_adapter *adap;
> +	struct device *dev =3D &pdev->dev;
> +	struct nct6793_sio_data *sio_data =3D dev_get_platdata(dev);
> +	struct resource *res;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (!devm_request_region(&pdev->dev, res->start, IOREGION_LENGTH,
> +				 DRVNAME))
> +		return -EBUSY;
> +
> +	switch (sio_data->kind) {
> +	case nct6791:
> +	case nct6792:
> +	case nct6793:
> +	case nct6795:
> +	case nct6796:
> +	case nct6798:
> +		adap =3D nct6793_add_adapter(res->start, nct6793_sio_names[sio_data->k=
ind]);
> +	=09

No blank line between assignment and test.

> +		if(IS_ERR(sio_data->adapter))
> +			return -ENODEV;

Please return the actual error code.

> +
> +		sio_data->adapter =3D adap;
> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct platform_driver i2c_nct6793_driver =3D {
> +	.driver =3D {
> +		.name	=3D DRVNAME,
> +	},
> +	.probe		=3D nct6793_probe,
> +};
> +
> +static void __exit i2c_nct6793_exit(void)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(pdev); i++) {
> +		if (pdev[i]) {
> +			struct device *dev =3D &pdev[i]->dev;
> +			struct nct6793_sio_data *sio_data =3D dev_get_platdata(dev);
> +
> +			if (sio_data->adapter)

Is this not pretty much guaranteed to be true?

> +				nct6793_remove_adapter(sio_data->adapter);
> +
> +			platform_device_unregister(pdev[i]);
> +		}
> +	}
> +	platform_driver_unregister(&i2c_nct6793_driver);
> +}
> +
> +/* nct6793_find() looks for a compatible Nuvoton chip in the Super-I/O c=
onfig space */
> +static int __init nct6793_find(int sioaddr, struct nct6793_sio_data *sio=
_data)
> +{
> +	u16 val;
> +	int err;
> +	int addr;
> +
> +	err =3D superio_enter(sioaddr);
> +	if (err)
> +		return err;
> +
> +	val =3D (superio_inb(sioaddr, SIO_REG_DEVID) << 8) |
> +		superio_inb(sioaddr, SIO_REG_DEVID + 1);
> +
> +	switch (val & SIO_ID_MASK) {
> +	case SIO_NCT6791_ID:
> +		sio_data->kind =3D nct6791;
> +		break;
> +	case SIO_NCT6792_ID:
> +		sio_data->kind =3D nct6792;
> +		break;
> +	case SIO_NCT6793_ID:
> +		sio_data->kind =3D nct6793;
> +		break;
> +	case SIO_NCT6795_ID:
> +		sio_data->kind =3D nct6795;
> +		break;
> +	case SIO_NCT6796_ID:
> +		sio_data->kind =3D nct6796;
> +		break;
> +	case SIO_NCT6798_ID:
> +		sio_data->kind =3D nct6798;
> +		break;
> +	default:
> +		if (val !=3D 0xffff)
> +			pr_debug("unsupported chip ID: 0x%04x\n", val);

Please include:

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

at the top of the file, otherwise nobody can figure where this debug
message comes from.

> +		superio_exit(sioaddr);
> +		return -ENODEV;
> +	}
> +
> +	/* We have a known chip, find the SMBus I/O address */
> +	superio_select(sioaddr, NCT6793_LD_SMBUS);
> +	val =3D (superio_inb(sioaddr, SIO_REG_SMBA) << 8)
> +	    | superio_inb(sioaddr, SIO_REG_SMBA + 1);
> +	addr =3D val & IOREGION_ALIGNMENT;
> +	if (addr =3D=3D 0) {
> +		pr_err("Refusing to enable a Super-I/O device with a base I/O port 0\n=
");
> +		superio_exit(sioaddr);
> +		return -ENODEV;
> +	}
> +
> +	superio_exit(sioaddr);
> +	pr_info("Found %s or compatible chip at %#x:%#x\n",
> +		nct6793_sio_names[sio_data->kind], sioaddr, addr);
> +	sio_data->sioreg =3D sioaddr;
> +
> +	return addr;
> +}
> +
> +static int __init i2c_nct6793_init(void)
> +{
> +	int i, err;
> +	bool found =3D false;
> +	int address;
> +	struct resource res;
> +	struct nct6793_sio_data sio_data;
> +	int sioaddr[2] =3D { 0x2e, 0x4e };

Can presumably be const?

> +
> +	err =3D platform_driver_register(&i2c_nct6793_driver);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * Initialize sio_data->kind and sio_data->sioreg.
> +	 *
> +	 * When Super-I/O functions move to a separate file, the Super-I/O
> +	 * driver will probe 0x2e and 0x4e and auto-detect the presence of a
> +	 * nct6775 hardware monitor, and call probe().
> +	 */
> +	for (i =3D 0; i < ARRAY_SIZE(pdev); i++) {
> +		address =3D nct6793_find(sioaddr[i], &sio_data);
> +		if (address <=3D 0)
> +			continue;
> +
> +		found =3D true;
> +
> +		pdev[i] =3D platform_device_alloc(DRVNAME, address);
> +		if (!pdev[i]) {
> +			err =3D -ENOMEM;
> +			goto exit_device_unregister;
> +		}
> +
> +		err =3D platform_device_add_data(pdev[i], &sio_data,
> +					       sizeof(struct nct6793_sio_data));
> +		if (err)
> +			goto exit_device_put;
> +
> +		memset(&res, 0, sizeof(res));
> +		res.name =3D DRVNAME;
> +		res.start =3D address;
> +		res.end =3D address + IOREGION_LENGTH - 1;
> +		res.flags =3D IORESOURCE_IO;
> +
> +		err =3D acpi_check_resource_conflict(&res);
> +		if (err) {
> +			platform_device_put(pdev[i]);
> +			pdev[i] =3D NULL;
> +			continue;

This looks wrong. The platform device is still registered and will
never be freed?

Shouldn't you check for the conflict first?

> +		}
> +
> +		err =3D platform_device_add_resources(pdev[i], &res, 1);
> +		if (err)
> +			goto exit_device_put;
> +
> +		/* platform_device_add calls probe() */
> +		err =3D platform_device_add(pdev[i]);
> +		if (err)
> +			goto exit_device_put;
> +	}
> +	if (!found) {
> +		err =3D -ENODEV;
> +		goto exit_unregister;
> +	}
> +
> +	return 0;
> +
> +exit_device_put:
> +	platform_device_put(pdev[i]);
> +exit_device_unregister:
> +	while (--i >=3D 0) {
> +		if (pdev[i])
> +			platform_device_unregister(pdev[i]);
> +	}
> +exit_unregister:
> +	platform_driver_unregister(&i2c_nct6793_driver);
> +	return err;
> +}
> +
> +MODULE_AUTHOR("Adam Honse <calcprogrammer1@gmail.com>");
> +MODULE_DESCRIPTION("SMBus driver for NCT6793D and compatible chips");

Please include "Nuvoton" in the description.

> +MODULE_LICENSE("GPL");
> +
> +module_init(i2c_nct6793_init);
> +module_exit(i2c_nct6793_exit);


--=20
Jean Delvare
SUSE L3 Support
