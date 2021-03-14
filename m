Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A365933A503
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Mar 2021 14:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhCNNba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 14 Mar 2021 09:31:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:52180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230078AbhCNNbK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 14 Mar 2021 09:31:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABAB064E90;
        Sun, 14 Mar 2021 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615728670;
        bh=fpeXms2XysKoPhdleqm3dgdDokeUjvQH+YSalvw4ZtQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SNlHqofY0tEIg2fjBDh5s4uX3UaNV8nfajt8IldrgKnCBwqGYgkXY0uSoMw3uEKCy
         kCGeofkYSOweaCsVe2/CR8uzRTMIFwrWxnq76Q+AM2LQIMu4ZnmfGjJr/H0RxqdKc1
         7bY2yt84zfY/u7a6dLjiAAfJR4KynDPLX7c0umzEJK/KdW6D8MlInzj+LCzD+NY8K4
         TgsKhqPluwiUhcqG0486oyfyLEwCRu9DKY8gdkJBHPcUc/UB88f++8rpMCAzoGLFBY
         xKQXY2BWq+LZiSHroY6g/C905RBmOg4MiFcelzQFMl3sDr0DBR75f6oiQ4JoPivkEg
         3JINZBGeq93BA==
Date:   Sun, 14 Mar 2021 14:31:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] Adding i2c-cp2615 driver
Message-ID: <20210314133106.GB913@ninjato>
References: <CACCVKEHLHJom4k7YEh2ZRfd-yY9FqLskKmjvcAvYkXLeAaiZ0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline
In-Reply-To: <CACCVKEHLHJom4k7YEh2ZRfd-yY9FqLskKmjvcAvYkXLeAaiZ0Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Feb 10, 2021 at 10:08:54PM +0100, Bence Cs=C3=B3k=C3=A1s wrote:
> For a hardware project, I need the I2C master of SiLabs' CP2615 chip
> to be visible from under Linux. This patchset adds i2c-cp2615, a
> driver which sets up an i2c_adapter for said chip.
>=20
> This is my first contribution, so forgive me (but do let me know) if
> I've broken habit.

Thank you for your contribution and sorry for the delay (which is
only because of not enough time and not because of no interest).

First thing is that patch 1 & 2 should be squashed into one patch.


> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <bence98@sch.bme.hu>
> ---
>  drivers/i2c/busses/cp2615_drv.c | 150 ++++++++++++++++++++++++++++++++
>  drivers/i2c/busses/cp2615_iop.c |  32 +++++++
>  drivers/i2c/busses/cp2615_iop.h |  60 +++++++++++++

Then, all these files should go into one file named "i2c-cp2615.c". We
can factor out stuff later if another user turns up. But for starters,
all in one file is more convenient.

> +static int
> +cp2615_i2c_send(struct usb_interface *usbif, struct cp2615_i2c_transfer =
*i2c_w)
> +{
> +    struct cp2615_iop_msg *msg =3D kzalloc(sizeof(struct
> cp2615_iop_msg), GFP_KERNEL);

The patch look garbled with broken lines; are you using gmail WEB UI?
Hopefully, this document can help you:

	Documentation/process/email-clients.rst

If it is not garbled, then I can review it better. Some things already.

> +struct i2c_adapter_quirks cp2615_i2c_quirks =3D {
> +    .max_write_len =3D MAX_I2C_SIZE,
> +    .max_read_len =3D MAX_I2C_SIZE,

Yes, good, we need quirks. But IIUC these also on top:

	.flags =3D I2C_AQ_COMB_WRITE_THEN_READ,
	.max_comb_1st_msg_len =3D MAX_I2C_SIZE,
	.max_comb_2nd_msg_len =3D MAX_I2C_SIZE,

because the datasheet says "The transfer consists of a write cycle
followed by a read cycle." BTW this is kinda bad for multi-master:
"Repeated start between the write and read cycles is not supported". But
I guess this bus will not be really used in multi-master setups.
However, it should be commented somewhere.

> +static void
> +cp2615_i2c_remove(struct usb_interface *usbif)
> +{
> +    struct i2c_adapter *adap =3D usb_get_intfdata(usbif);
> +
> +    usb_set_intfdata(usbif, NULL);
> +    i2c_del_adapter(adap);
> +    kfree(adap);
> +    dev_info(&usbif->dev, "Removed CP2615's I2C bus\n");

This dev_info can go.

> +}
> +
> +static int
> +cp2615_i2c_probe(struct usb_interface *usbif, const struct usb_device_id=
 *id)
> +{
> +    int ret =3D 0;
> +    struct i2c_adapter *adap;
> +    struct usb_device *usbdev =3D interface_to_usbdev(usbif);
> +
> +    ret =3D usb_set_interface(usbdev, IOP_IFN, IOP_ALTSETTING);
> +    if (ret)
> +        goto out;

'return ret;' instead of 'goto out;' here and later.

> +
> +    adap =3D kzalloc(sizeof(struct i2c_adapter), GFP_KERNEL);

devm_kzalloc? Then you can leave out the kfrees.

> +    if (!adap) {
> +        ret =3D -ENOMEM;
> +        goto out;
> +    }
> +
> +    strncpy(adap->name, usbdev->serial, sizeof(adap->name));
> +    adap->owner =3D THIS_MODULE;
> +    adap->class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;

I guess you instantiate client devices via sysfs? Then, this line can
go, too.

> +    adap->dev.parent =3D &usbif->dev;
> +    adap->dev.of_node =3D usbif->dev.of_node;
> +    adap->timeout =3D HZ;
> +    adap->algo =3D &cp2615_i2c_algo;
> +    adap->quirks =3D &cp2615_i2c_quirks;
> +    adap->algo_data =3D usbif;
> +
> +    ret =3D i2c_add_adapter(adap);
> +    if (ret) {
> +        kfree(adap);
> +        goto out;
> +    }
> +
> +    usb_set_intfdata(usbif, adap);
> +    dev_info(&usbif->dev, "Added CP2615's I2C bus\n");

This dev_info can go.

> +out:
> +    return ret;
> +}
> +
> +static const struct usb_device_id id_table[] =3D {
> +    { USB_DEVICE(CP2615_VID, CP2615_PID) },
> +    { }
> +};
> +
> +MODULE_DEVICE_TABLE(usb, id_table);
> +
> +static struct usb_driver cp2615_i2c_driver =3D {
> +    .name =3D "i2c-cp2615",
> +    .probe =3D cp2615_i2c_probe,
> +    .disconnect =3D cp2615_i2c_remove,
> +    .id_table =3D id_table,
> +//    .dev_groups =3D cp2615_groups,

This should go.

> +};
> +
> +module_usb_driver(cp2615_i2c_driver);
> +
> +MODULE_AUTHOR("Bence Cs=C3=B3k=C3=A1s <bence98@sch.bme.hu>");
> +MODULE_DESCRIPTION("CP2615 I2C bus driver");
> +MODULE_LICENSE("GPL");

Please also add an SPDX header at the top. Check other i2c drivers for
an appropriate.

> +    if (ret) {
> +        ret->preamble =3D 0x2A2A;
> +        ret->length =3D htons(data_len+6);
> +        ret->msg =3D htons(msg);
> +        if(data && data_len)
> +            memcpy(&ret->data, data, data_len);
> +        return 0;
> +    } else
> +        return -EINVAL;

Curly braces around 'else' branch. Please run 'scripts/checkpatch' on
your patch.

> +enum cp2615_iop_msg_type {
> +    iop_GetAccessoryInfo =3D 0xD100,
> +    iop_AccessoryInfo =3D 0xA100,
> +    iop_GetPortConfiguration =3D 0xD203,
> +    iop_PortConfiguration =3D 0xA203,
> +    // ...

This should go.

> +    iop_DoI2cTransfer =3D 0xD400,
> +    iop_I2cTransferResult =3D 0xA400,
> +    iop_GetSerialState =3D 0xD501,
> +    iop_SerialState =3D 0xA501
> +};
> +struct cp2615_i2c_transfer {
> +    unsigned char tag, i2caddr, read_len, write_len;
> +    char data[MAX_I2C_SIZE];

u8?

> +};
> +
> +struct cp2615_i2c_transfer_result {
> +    unsigned char tag, i2caddr, status, read_len;
> +    char data[MAX_I2C_SIZE];

u8?

> +};
> +

I am not a USB expert, but maybe someone else can have a look on your
updated patch.

Despite the comments, looks quite good already.

Happy hacking,

   Wolfram


--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBOEBYACgkQFA3kzBSg
Kbaslw/6AiYvZGVp4e+OPf4lDYCncc1hRR3Feb/LZMYdG2XpPyH/71PIflxuYVUs
R6gdd2FchWXL5IFZXwXOBsSEG8L6x9c5UM7JuQC+yKP40Wg9FsrIihEuSCG8tXWo
/W1SsBJ+CNmu1Dw3f8Mt0rj2Vo+G8EC7QaGc6OaG35XxfUFCQdXqIn/CZR+kpKdU
3bHrbSmS27WLeQeGnVo26MnlzfbLhgunHgTmntUZLqKnov7eNSS+Tr+WDvNGraaL
OXcPqGk9ayBUNnYeW/FcUOK4gOcZ90QFTGWaOxEisiEKANevFmdc/xngBo4UbzwG
jq5IB4iAEA+0UHIeB3RYbbgozqzPDAS8dox8jvZZ40wLo+PnSZ3Ljlyr2MYmEOt5
3ulDy65LdjzbpQQGa+Ioy3CU9Kb6/y1IBkZ5BO5m7uCYbG5+b1ndPFPagRGu3CkL
snS/GAR1THWoBzfczdceEqJE8fQ4hwWlF/FbaAr+FDkkfs12pgk3CGIiP3BryoeI
4C4LB3k4jVaED6o2/cvJvco/ip2YRwjYU6/7MMX7ezVeiX3zmB96RcX10hT4gdN9
+ZSLttSKGkkuU0aD6Veild91/qq5ERTCfCHgdQPsfhaKaCrQS+NnvWxFnxhKl5LA
hzgkrpinSNNwMDIVIFw2OpaYr3G7ffgHir2WQJdXTDFgE9PjGAs=
=XdY0
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
