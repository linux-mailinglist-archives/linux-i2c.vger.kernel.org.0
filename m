Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AE933F06B
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 13:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhCQMeN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 08:34:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:59498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229703AbhCQMds (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 08:33:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C198164F4D;
        Wed, 17 Mar 2021 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615984427;
        bh=13fBqZM159Nk15DrGKOe4nVJ9qsh15FcP3YLOpwqJs0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XWsLKZyCZ1jAGhiE3c0EEV05gM0LZGNOO4JnqrF7EEkCg5RCgKgzCuVdVkpG2ElIL
         +7uavLxuzO1arVHu1lL/WMBvUI1cHNGSR7HDEwl+kzE+GvL6SZmTKjSUNxrvSzR0dP
         vD/iVm734LePv43SkjxRWVKf1zvgA0XZ40HFZFeEDE+vd57pRbtCtZai29V0075Zti
         edpE9rXbq0YCyKSM/H8NFphoUK7dKobYmbTFa96PjzmMmsSqknubztvz5AwFWBsnBr
         mCAfbvmCS6XnPmGFGX2B7BGQ2+4v35xXS/s2/I/hCTYjMalzVel/net4nfwNon11WG
         vPZZKcGruMRGg==
Date:   Wed, 17 Mar 2021 13:33:44 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Adding i2c-cp2615: i2c support for Silicon Labs'
 CP2615 Digital Audio Bridge
Message-ID: <20210317123344.GD1315@ninjato>
References: <20210317103021.1913858-1-bence98@sch.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Content-Disposition: inline
In-Reply-To: <20210317103021.1913858-1-bence98@sch.bme.hu>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 10:30:21AM +0000, Bence Cs=C3=B3k=C3=A1s wrote:
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <bence98@sch.bme.hu>

Thanks, this looks good now and I think we are very close.

> ---

Next, time please provide a small summary of changes since last version.
I get enough patches that it becomes confusing otherwise.

> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-cp2615.c
> @@ -0,0 +1,282 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

If you want GPL v2 only, then you need to say in MODULE_LICENSE also
"GPL v2".

> +#include <linux/string.h>
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/usb.h>

Please sort this to avoid double entries get added in the future.

> +enum cp2615_iop_msg_type {
> +	iop_GetAccessoryInfo =3D 0xD100,
> +	iop_AccessoryInfo =3D 0xA100,
> +	iop_GetPortConfiguration =3D 0xD203,
> +	iop_PortConfiguration =3D 0xA203,
> +	// ...

This comment can go?

> +/** Possible values for struct cp2615_i2c_transfer_result.status
> + *
> + *  Values extracted from the USBXpress(r) SDK
> + */

I'd think this can go, too.

> +int cp2615_init_iop_msg(struct cp2615_iop_msg *ret, enum cp2615_iop_msg_=
type msg, const void *data, size_t data_len)

Please break it into two lines. And please run 'checkpatch --strict' on
your patch to find things like too long lines and spaces around
operators etc... I will skip pointing them out here.

> +{
> +	if (data_len > MAX_IOP_PAYLOAD_SIZE)
> +		return -EFBIG;
> +
> +	if (ret) {

Minor nit:
	if (!ret)
		return -EINVAL;

and then save the indentation for the main code path.

> +		ret->preamble =3D 0x2A2A;
> +		ret->length =3D htons(data_len+6);
> +		ret->msg =3D htons(msg);
> +		if(data && data_len)
> +			memcpy(&ret->data, data, data_len);
> +        return 0;
> +	} else {
> +        return -EINVAL;
> +	}
> +}
> +
> +int cp2615_init_i2c_msg(struct cp2615_iop_msg *ret, const struct cp2615_=
i2c_transfer *data)
> +{
> +    return cp2615_init_iop_msg(ret, iop_DoI2cTransfer, data, 4 + data->w=
rite_len);
> +}

I'll leave it to you but maybe this function can go and
cp2615_init_iop_msg can be used directly? Both are only called once.

> +
> +/* Translates status codes to Linux errno's */
> +int cp2615_check_status(enum cp2615_i2c_status status)
> +{
> +	switch (status) {
> +	case CP2615_SUCCESS:
> +			return 0;
> +	case CP2615_BUS_ERROR:
> +		return -ECOMM;

-EIO probably.

We have 'Documentation/i2c/fault-codes.rst' as a guide.

> +	case CP2615_BUS_BUSY:
> +		return -EAGAIN;
> +	case CP2615_TIMEOUT:
> +		return -ETIMEDOUT;
> +	case CP2615_INVALID_PARAM:
> +		return -EINVAL;
> +	case CP2615_CFG_LOCKED:
> +		return -EPERM;
> +	}
> +	/* Unknown error code */
> +	return -EPROTO;
> +}
> +

=2E..

> +/*
> + * This chip has some limitations: one is that the USB endpoint
> + * can only receive 64 bytes/transfer, that leaves 54 bytes for
> + * the I2C transfer. On top of that, EITHER read_len OR write_len
> + * may be zero, but not both. If both are non-zero, the adapter
> + * issues a write followed by a read. And the chip does not
> + * support repeated START between the write and read phases.

Good and useful paragraph!

> + * FIXME: There in no quirk flag for specifying that the adapter
> + * does not support empty transfers, or that it cannot emit a

Can't we use I2C_AQ_NO_ZERO_LEN here?

> + * START condition between the combined phases.

True! But it makes sense, so we can fix that. We just need to add
I2C_AQ_NO_REP_START and a short explanation to i2c.h. If you want, you
can do it in a seperate patch. I can do it, too, if you prefer.

> + */
> +struct i2c_adapter_quirks cp2615_i2c_quirks =3D {
> +	.max_write_len =3D MAX_I2C_SIZE,
> +	.max_read_len =3D MAX_I2C_SIZE,
> +	.flags =3D I2C_AQ_COMB_WRITE_THEN_READ,
> +	.max_comb_1st_msg_len =3D MAX_I2C_SIZE,
> +	.max_comb_2nd_msg_len =3D MAX_I2C_SIZE
> +};

quirks struct looks good otherwise!

> +static const struct usb_device_id id_table[] =3D {
> +	{ USB_DEVICE(CP2615_VID, CP2615_PID) },

Maybe skip the defines for VID and PID and use the values directly?
I am not a USB expert, not really sure what the consistent way is.

So, this and the checkpatch issues and I think we are done.

Thanks,

   Wolfram


--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBR9yQACgkQFA3kzBSg
KbY9BxAAgLRxnfLHdIVkAw70WYTSsE3apAqqQbhrErNvoAUYyBnENdPVZa87x0qG
G57gd++RLJGXUSEQX1pZyWqF+LzS8Gagyhkwr7wV6b/wXeW86z5PleyGZXgnJD6u
zLVAbaKCb5tNqCI0qpMyZhNbVPoXhdW74fneGu+Js6iUraWozZh129abs/kFF3ts
ah/jUhG0U3FgD9cu61yz4bqSmRhw6OMqF59N2TW6RPKgqxtbq0uQSJ0tkrC88wX+
OH8yZAXCR7/HsAhSAOOW+GZ18trJs5HCP++UJ9r26TxxxPrjQg0biMwx5rEwCyZL
irOeIOhiGvMNzOS2hggXng4yqnUErTwkL2/T96NgS+Ngsr0GXMPL+/uxt5kX0avL
vhNvf1Vh1vTtoK2ozhTno1bEUJXI7+0TPmQ6f/QqkwlRFVNuEp+LU85LhxMVYub7
0X30r0iS2D+fXeW5MvNUf4N+0XYhS5MZS4S1woClbdRnyOKcm4pi/Gyip+8sMOTN
iM4nKfHb9/Y9nDj6EQHADb/i071aDk1Poo0oR3kABBhGK9k+UfCzZZ/b4O9KE+X8
OmQtW+kYz+iUdmLPm7IdrX5yhy3t3q+aC+9qYyzi0QVCgiLjcUYlZi7wsgMx7wdH
Iyuljbr06ak1jMEuuT/PsCFcgF6pbEOO+cS5CowpUfkN97fCkvw=
=x0ac
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--
