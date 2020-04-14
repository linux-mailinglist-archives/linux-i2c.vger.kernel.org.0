Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BADD11A78A4
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Apr 2020 12:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438543AbgDNKnn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Apr 2020 06:43:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41694 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438540AbgDNKnh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Apr 2020 06:43:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 260612A186E
Received: by earth.universe (Postfix, from userid 1000)
        id E27743C08C7; Tue, 14 Apr 2020 12:43:30 +0200 (CEST)
Date:   Tue, 14 Apr 2020 12:43:30 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Adam Honse <calcprogrammer1@gmail.com>
Subject: Re: [PATCH] i2c: piix4: Add second SMBus for X370/X470/X570
Message-ID: <20200414104330.k46jemtlkmxdrm62@earth.universe>
References: <20200413150634.474842-1-sebastian.reichel@collabora.com>
 <20200414094158.089dd5ea@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g7bibnhk6q2xn6m4"
Content-Disposition: inline
In-Reply-To: <20200414094158.089dd5ea@endymion>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--g7bibnhk6q2xn6m4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 14, 2020 at 09:41:58AM +0200, Jean Delvare wrote:
> On Mon, 13 Apr 2020 17:06:34 +0200, Sebastian Reichel wrote:
> > The second interface can be found on X370, X470 and X570 according
> > to the bugzilla entry. I only tested with X570 on an ASRock X570
> > Taichi:
> >=20
> > $ lspci -nnv -d 1022:790b
> > 00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus Cont=
roller [1022:790b] (rev 61)
> > 	Subsystem: ASRock Incorporation FCH SMBus Controller [1849:ffff]
> > 	Flags: 66MHz, medium devsel
> > 	Kernel driver in use: piix4_smbus
> > 	Kernel modules: i2c_piix4, sp5100_tco
> >=20
> > Before the patch:
> >=20
> > $ i2cdetect -l | grep PIIX4
> > i2c-1	unknown   	SMBus PIIX4 adapter port 2 at 0b00	N/A
> > i2c-0	unknown   	SMBus PIIX4 adapter port 0 at 0b00	N/A
> >=20
> > After the patch:
> >=20
> > $ i2cdetect -l | grep PIIX4
> > i2c-1	unknown   	SMBus PIIX4 adapter port 2 at 0b00	N/A
> > i2c-2	unknown   	SMBus PIIX4 adapter port 1 at 0b20	N/A
> > i2c-0	unknown   	SMBus PIIX4 adapter port 0 at 0b00	N/A
> >=20
> > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D202587
> > Reported-by: Adam Honse <calcprogrammer1@gmail.com>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> > Hi,
> >=20
> > The Bugzilla entry contains a second change, which reduces the timeouts
> > for quicker operation. I did not include that change, since I do not kn=
ow
> > if this is a good idea for all devices supported by this driver. In any
> > case it should be a separate patch. Let's get the interface working for
> > now.
> >=20
> > -- Sebastian
> > ---
> >  drivers/i2c/busses/i2c-piix4.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-pi=
ix4.c
> > index 30ded6422e7b..3e89143a0ecf 100644
> > --- a/drivers/i2c/busses/i2c-piix4.c
> > +++ b/drivers/i2c/busses/i2c-piix4.c
> > @@ -976,9 +976,11 @@ static int piix4_probe(struct pci_dev *dev, const =
struct pci_device_id *id)
> >  		}
> >  	}
> > =20
> > -	if (dev->vendor =3D=3D PCI_VENDOR_ID_AMD &&
> > -	    dev->device =3D=3D PCI_DEVICE_ID_AMD_HUDSON2_SMBUS) {
> > -		retval =3D piix4_setup_sb800(dev, id, 1);
> > +	if (dev->vendor =3D=3D PCI_VENDOR_ID_AMD) {
> > +		if (dev->device =3D=3D PCI_DEVICE_ID_AMD_HUDSON2_SMBUS ||
> > +		    dev->device =3D=3D PCI_DEVICE_ID_AMD_KERNCZ_SMBUS) {
> > +			retval =3D piix4_setup_sb800(dev, id, 1);
> > +		}
> >  	}
> > =20
> >  	if (retval > 0) {
>=20
> Adam just sent pretty much the same patch:
>=20
> https://patchwork.ozlabs.org/project/linux-i2c/patch/20200410204843.3856-=
1-calcprogrammer1@gmail.com/
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>=20
> I'll leave it to Wolfram which one he wants to apply.

Ok, I wasn't aware of that and thought this patch was forgotten. In
that case Adam should receive all the credits of course. Feel free
to take over anything usable from my commit message. The patch from
Adam is

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thanks,

-- Sebastian

--g7bibnhk6q2xn6m4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl6Vk8sACgkQ2O7X88g7
+pqQ9A/7BwSHbsoaxkGwMB05DN/hCXdFhZ6J0a1e82CQO0cAkivFUFx20qiXZGeV
5QexoxYj2SW/uHX7zyl9hMCb/iKtf2GqIvSDSQLO7QuZBvc1/9hVX1B3X70CrLH0
rtWXCHuxdu2OS24Ym6qGYO86NdAI58Dr8amfxOvueBBhSGE4EI6LjsMX7KCKVqof
IDI7G1hHz2E5cLmvdB07USd+79CnnWMCZTLnOgcRQelkkSaJi732yZyLkJrbmwIN
Wr+TbVPvOIXE3I4oc9XmgDxFMyB3KN+/aQtOOovmesGDGaI6uhBlh/6eGkMuHR91
QfyU4Q9v7AS/uVPPHFOtEc8cssNL5lU6thBnp4KV9grioliygX0menXaVitEWSl/
LLeSkfqARRkSSQtddFZkPQqYM89aoWOgPbhcRnRcM/+K4num6IvIaM2tZIZq01lN
7KM+a9qF5bLqfxXrQmAGHrmgr0/WbY2akP+3fKnIcP0ZU/r4MQkzMiHtfPAiVOO4
8AxNDkDjC/PoOFA/eZoVwaO11T/WZCXriWuL5ISr6ykO4KhAZHKpgKnXPUkWoreZ
mc0X/FR6aOhZ6zygzOZR04yhDAX0QpqygiMiq8ow/Nt/6z2JqXfdo8sqpTEGwNWf
qq5AQ4D4jnNzfA/RY1BhYFfZsBZaymW0rckKwLwM0by10DBtZcE=
=7zje
-----END PGP SIGNATURE-----

--g7bibnhk6q2xn6m4--
