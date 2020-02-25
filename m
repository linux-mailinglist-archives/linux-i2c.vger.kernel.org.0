Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1156316C43D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730710AbgBYOls (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:41:48 -0500
Received: from sauhun.de ([88.99.104.3]:39658 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730532AbgBYOls (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:41:48 -0500
Received: from localhost (p5486CE6D.dip0.t-ipconnect.de [84.134.206.109])
        by pokefinder.org (Postfix) with ESMTPSA id 032FD2C1F2F;
        Tue, 25 Feb 2020 15:41:46 +0100 (CET)
Date:   Tue, 25 Feb 2020 15:41:46 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
Message-ID: <20200225144146.GG3677@ninjato>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <481fe028-0ec6-eca3-7436-ebbb8527f3d8@xilinx.com>
 <AM0PR06MB518514EE9C057CB129079825D4ED0@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200225141357.GE3677@ninjato>
 <AM0PR06MB5185341478B6919A9CC22271D4ED0@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200225143245.GF3677@ninjato>
 <431d520b-24a1-687c-1f4b-4ebe95181a2b@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline
In-Reply-To: <431d520b-24a1-687c-1f4b-4ebe95181a2b@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 03:37:21PM +0100, Michal Simek wrote:
> On 25. 02. 20 15:32, Wolfram Sang wrote:
> >=20
> >>> My favourite is to change alignment to be just one space. Then, we ha=
ve
> >>> a bit of overhead now, but never again in the future.
> >>
> >> Ok, I will add that change as separate patch to V2 patch series.
> >=20
> > Perfect, thanks!
> >=20
>=20
> Wolfram: Any option about that multi-master property?

Not yet.


--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5VMioACgkQFA3kzBSg
Kba8Bg//cNqR+XPmJoJ9oCzHksFLAsZ6cs6n7/jed+osp+Zyu7nfVFrXhVsZWn+H
xoAIn32vhN3oqTbQl4QPkPsiq9GeDfahg6U5rANYWStwP7RABLKkVEJwSf8TjMG9
cZs+UM+zklSX8jJJvfybmJ0CEg0jPg8ivFQCGEva9v3BOIUT028q9o69jYLbfGQu
FvK8PbFA/f5iwF/CJZaueVs+trantc8mAF6DKZtuD3QRr/so039ZBuiYPfd/tSKa
I/698hEXt8b00Y3CrcEoyZF+4D7+33RJW6LVOsJ7DIyUqaKqLLQD1PVwAJg80e+B
+xKOzL9pLlPHHKFmpBOSNhY9uXs+aishDRwimtpu9VAcKieR0JzefWYr7WHiPhNt
I4UmFTFb3ijegTaoAjKLfMd6KDumwYe0Rcxv96ezD0Dgj5vq2D6pa7sfVyiAwRCp
+wqdNLvXSlk6wkX0KBTCxRFvCbWA3jyVQCB8VCBvKWwy3ZxxoFdg6mc+bVn1JA+U
Z2JVRrZH9zQ6G8mv8SskQPoF4gQTBO/zgnFYMSAFTY+SPtjjse+W/a55fol62N1k
jJUBjDLm60C3MB8neaVnbqHtQpaiTqKN8hbQiDPPwHuHAeJM8Dv8yiZEvmI0MBmj
OcKW0v6cKfjW30tOppX2EsdRYgc60wZ3KgT7iPHQwmIqgMw1su8=
=dwfe
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
