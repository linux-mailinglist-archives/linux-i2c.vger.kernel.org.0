Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82F373A4FE
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Jun 2019 13:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbfFILFX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Jun 2019 07:05:23 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54485 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728095AbfFILFX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Jun 2019 07:05:23 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 362B4802CC; Sun,  9 Jun 2019 13:05:10 +0200 (CEST)
Date:   Sun, 9 Jun 2019 13:05:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/34] leds: leds-pca955x: simplify getting the adapter
 of a client
Message-ID: <20190609110519.GA2375@amd>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-5-wsa+renesas@sang-engineering.com>
 <e5a91999-a156-77b2-702b-8931140f0f8d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <e5a91999-a156-77b2-702b-8931140f0f8d@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2019-06-09 13:03:40, Jacek Anaszewski wrote:
> Hi Wolfram,
>=20
> Thank you for the patches.
>=20
> On 6/8/19 12:55 PM, Wolfram Sang wrote:
> >We have a dedicated pointer for that, so use it. Much easier to read and
> >less computation involved.
> >
> >Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >---
> >
> >Please apply to your subsystem tree.
> >
> >  drivers/leds/leds-pca955x.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> >index a9f5dad55956..460626d81c6a 100644
> >--- a/drivers/leds/leds-pca955x.c
> >+++ b/drivers/leds/leds-pca955x.c
> >@@ -432,7 +432,7 @@ static int pca955x_probe(struct i2c_client *client,
> >  	int ngpios =3D 0;
> >  	chip =3D &pca955x_chipdefs[id->driver_data];
> >-	adapter =3D to_i2c_adapter(client->dev.parent);
> >+	adapter =3D client->adapter;
> >  	pdata =3D dev_get_platdata(&client->dev);
> >  	if (!pdata) {
> >  		pdata =3D	pca955x_get_pdata(client, chip);
> >
>=20
> For both 4/34 and 5/34:
>=20
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

4 and 5:

Acked-by: Pavel Machek <pavel@ucw.cz>

But I wonder if it should go through the leds tree?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz85+8ACgkQMOfwapXb+vK6YQCfbTAciJbPFiikZaSzNawQ4CTP
iXgAn15Z789Y3jOmbvgrZWlNJ11pvPAE
=V47/
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
