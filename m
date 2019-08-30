Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 218ABA3773
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 15:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbfH3NAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 09:00:38 -0400
Received: from sauhun.de ([88.99.104.3]:53716 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbfH3NAi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 09:00:38 -0400
Received: from localhost (p54B335BE.dip0.t-ipconnect.de [84.179.53.190])
        by pokefinder.org (Postfix) with ESMTPSA id 350732C0095;
        Fri, 30 Aug 2019 15:00:36 +0200 (CEST)
Date:   Fri, 30 Aug 2019 15:00:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: max77686: convert to devm_i2c_new_dummy_device()
Message-ID: <20190830130035.GF2870@ninjato>
References: <20190820154239.8230-1-wsa+renesas@sang-engineering.com>
 <20190820154239.8230-2-wsa+renesas@sang-engineering.com>
 <20190829205752.GL21922@piout.net>
 <20190830124554.GB2870@ninjato>
 <20190830125338.GP21922@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8JPrznbw0YAQ/KXy"
Content-Disposition: inline
In-Reply-To: <20190830125338.GP21922@piout.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8JPrznbw0YAQ/KXy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > I'm confused because I already applied:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/co=
mmit/?h=3Drtc-next&id=3D7150710f3084de8d35ce3221eeae2caee8813f92
> >=20
> > The above was a mass conversion to i2c_new_dummy_device() to make sure
> > all in-kernel users use the API returning an ERRPTR. Mass conversion to
> > the devm_ variant of the same function was too troublesome.
> >=20
> > With another series, I wanted to remove superfluous error checking of
> > i2c_unregister_device() because it is NULL-ptr safe, like here:
> >=20
> > > > -	if (info->rtc)
> > > > -		i2c_unregister_device(info->rtc);
> >=20
> > But for these two RTC drivers, I figured moving to devm_* is way easier
> > than fixing up the mass conversion result from coccinelle.
> >=20
>=20
> Ok so should I drop the previous patches and apply those instead?

Nope, they should be incremental, aren't they?


--8JPrznbw0YAQ/KXy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1pHfMACgkQFA3kzBSg
Kban+hAApng8jeSWw1/5/K5+lAqBCFLu2mmoMYDvy4I/4VOaGWO1cGYs37e148zQ
fJJdGKs0B8gb02s08/8CqJEEJLNPBHhOVfUZPo5KVDsSBBQbTvh3Sv8gmOobM5SL
36Bk55Vj6aWzOEoKh6jMkJyDv8q4D4/HR1V6TpiaIPG5dObx7OiUoCccXvQRK1e3
STVcZxvay6E/43v5rk+eUhdjyTIZkqnTcMXtpg0e7sM1/Jyr1j6mKfUWWTu8C+in
c67WXyhcWXrHckhjQRhpKDYuYHeawjvUMmycjOyInRnrwtBR2qJRGmQxExDGztDH
pxijj2T1WdgP3kvHWIWeDudr7CaCZaGpv4jTiA5f2OD5fpdyas9lq8E2CMiqDnRX
oDku3RdCInTfOeJGXQGUs62jm7S4xjWalINl9yWx4VBOq+bnt4HF1RDDfGY3Tt62
4Sri2fHZdk65czsTWu4jutU1BcWO2rdjBs8XDvpbTKjhTDWJnX/Ef4Eph6j8RzXS
sQ6TNPJQVmr9wS1iV9pfsgaiVaxDEB3vaLCbOMGw9EJkSuRNvfJBtfkQ93p1TEiu
6tMZIpceVFkmfTKj6Zn3DNS3SPTUO9meWEXwpJOtRBZaH/74uQeKdRs3P1/j9rzF
K31G5lv4wyHlJCSE0FKiuMWFfOeiN9mxXT+1bgdDY4BKuzINONU=
=9bct
-----END PGP SIGNATURE-----

--8JPrznbw0YAQ/KXy--
