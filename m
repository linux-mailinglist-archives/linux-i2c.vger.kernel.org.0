Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C5A23F318
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 21:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgHGTdC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 15:33:02 -0400
Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61]:51796 "EHLO
        2.mo178.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgHGTdC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Aug 2020 15:33:02 -0400
X-Greylist: delayed 797 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Aug 2020 15:33:00 EDT
Received: from player715.ha.ovh.net (unknown [10.110.115.143])
        by mo178.mail-out.ovh.net (Postfix) with ESMTP id 773BCAC1D2
        for <linux-i2c@vger.kernel.org>; Fri,  7 Aug 2020 21:07:20 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player715.ha.ovh.net (Postfix) with ESMTPSA id 76BA814E9C8DB;
        Fri,  7 Aug 2020 19:07:13 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-100R0038ca687ab-4f78-4da8-bbe2-7590c3ca912e,
                    B1FDDFD4E508142116FDFB9194C63E8FBE397CFD) smtp.auth=steve@sk2.org
Date:   Fri, 7 Aug 2020 21:07:07 +0200
From:   Stephen Kitt <steve@sk2.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3] hwmon/pmbus: use simple i2c probe function
Message-ID: <20200807210707.7dd1d9b9@heffalump.sk2.org>
In-Reply-To: <20200807173231.GA47449@roeck-us.net>
References: <20200807173231.GA47449@roeck-us.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/ZFB90kCEm=UKbNJ8Un9J6qQ"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 11990834011428048142
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedvgdduvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtsehgtderreertdejnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeevledvueefvdeivefftdeugeekveethefftdffteelheejkeejjeduffeiudetkeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--Sig_/ZFB90kCEm=UKbNJ8Un9J6qQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Aug 2020 10:32:31 -0700, Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, Aug 07, 2020 at 06:28:01PM +0200, Stephen Kitt wrote:
> > =20
> > -static int ltc2978_probe(struct i2c_client *client,
> > -			 const struct i2c_device_id *id)
> > +static int ltc2978_probe(struct i2c_client *client)
> >  {
> >  	int i, chip_id;
> >  	struct ltc2978_data *data;
> > @@ -670,10 +669,10 @@ static int ltc2978_probe(struct i2c_client *clien=
t,
> >  		return chip_id;
> > =20
> >  	data->id =3D chip_id;
> > -	if (data->id !=3D id->driver_data)
> > +	if (strcmp(client->name, ltc2978_id[data->id].name) !=3D 0) =20
>=20
> I was about to apply this patch, but this is problematic: It assumes that
> __stringify(id) =3D=3D ltc2978_id[id].name and that ltc2978_id[id].driver=
_data
> =3D=3D id. While that is curently the case (as far as I can see), it is s=
till
> unsafe. I think it would be much safer to use i2c_match_id() here.

I=E2=80=99m not following the __stringify assumption, but I do get your poi=
nt about
the driver_data being a valid index into the array; that was already baked
into the code, as

		dev_warn(&client->dev,
			 "Device mismatch: Configured %s, detected %s\n",
			 client->name,
			 ltc2978_id[data->id].name);

but I=E2=80=99ll fix both.

Similar assumptions are present in other drivers here IIRC, I=E2=80=99ll fi=
x those
too.

Regards,

Stephen

--Sig_/ZFB90kCEm=UKbNJ8Un9J6qQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl8tplsACgkQgNMC9Yht
g5zbIA//S0DouNct8J2rS/6Fe3PdwZrMiAJ7FNNKqTzQDbt7Il2R8rcdXM9HVPbH
sxloEI7MB+HbiQFRFIXlHL5xR5oBb3cUkZzstyc+SvXo+AVjYV9B+v9vjWHKAP9Z
GgWV65P20HCtbLAat9hDMFzTGaDcoEbBzrPOdCodPrT/mA+E287tLaubw97+uWWz
aGaoub1huJvS4HO+DTNVX6uUBslilnZXhn/LKLDvgDOqtUMnsBIdrSI7b6bgO78r
MVou0LxSaPOxl2+nr2xJDnQILUxzsWtOROIYWgGpU/K/xpufgHWmqk1ia0iV8lUE
BVkF/C6uduW1Zip8QcG17c/eorIfFkkzstntnQGuicbSOWHlzvuomtUn64/zC54h
u5gncBtmrF52+sp8YbLvhyT5EgyDDS6DY0QnPg31K+V2sfGQDACCNGeLuTGaXO5N
qYhSzCbhYsnO4sAqonhFw4Jbyt6hbf0tLEz5ikEejRCj+7vL0BPiZYYkzEvV3qxy
YoVDJyunjR9BIEn7DuxBRcr837TXL6gMU2ZyXB4Vu1NM/gv2VOwLoW+Ey8JcCNX9
t4lszJmVaRseXHaNtxff0Yzp8JaLUK3v1t3NXSCsno5hGE4qTg84o9MLrW/yRGZu
QcTEwA+udmbU8nX/Wdlm6Fih+31H95mO0ElljLfjgsUrKUP2fX8=
=XC8G
-----END PGP SIGNATURE-----

--Sig_/ZFB90kCEm=UKbNJ8Un9J6qQ--
