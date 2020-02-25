Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA22F16C455
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 15:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgBYOsX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 09:48:23 -0500
Received: from sauhun.de ([88.99.104.3]:39822 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730803AbgBYOsX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 09:48:23 -0500
Received: from localhost (p5486CE6D.dip0.t-ipconnect.de [84.134.206.109])
        by pokefinder.org (Postfix) with ESMTPSA id D6A922C1F2F;
        Tue, 25 Feb 2020 15:48:21 +0100 (CET)
Date:   Tue, 25 Feb 2020 15:48:21 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
Message-ID: <20200225144821.GH3677@ninjato>
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
 <481fe028-0ec6-eca3-7436-ebbb8527f3d8@xilinx.com>
 <AM0PR06MB518514EE9C057CB129079825D4ED0@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200225141357.GE3677@ninjato>
 <AM0PR06MB5185341478B6919A9CC22271D4ED0@AM0PR06MB5185.eurprd06.prod.outlook.com>
 <20200225143245.GF3677@ninjato>
 <431d520b-24a1-687c-1f4b-4ebe95181a2b@xilinx.com>
 <20200225144146.GG3677@ninjato>
 <4557a127-833d-d829-1490-e76912f099dd@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Content-Disposition: inline
In-Reply-To: <4557a127-833d-d829-1490-e76912f099dd@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> Wolfram: Any option about that multi-master property?
> >=20
> > Not yet.
>=20
> What does that mean? Do you need time to dig into it or you don't mind?

Need more time.


--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5VM7UACgkQFA3kzBSg
KbZgiBAAqB98meLh2mfZKZNoHhyfAsvidvosFAieRPv9MjaJ2U0Qms0Ffy1uWyC2
92RMYczi8KCA5pX+z+53rNZZVsUARC9CMwx6YF0h9NLjdhowYijWjQP8TYxj1+4O
rXoB091eUPQuGtqg3ltHCZBso3+Nm2FvSCMly2fZRSDjH6bsxpJCZllu59CCdbMC
pb9J+E/e7qHtV5eQR5aRe4NIqGKwN93ugJL8J949gHWloi90doZfnFY2EeyQeae4
t/2sqI3OFSUjI+B9+GaU4R0CLsy9AkTxEypGRf2UYqBpqHldf376Lfozw7o2BZ9Z
qWzOUhj4RxjV8ZzRHMt2c47rcO1tmwVFsoj1Oyoz9pLlvida3BAWWJjZl6PAc3zD
pyzqZs7YB/HKIS2QYsCulQ4f9QbbOVxSmr+bEJEBfFkJWQ/4cEu5y71JzrpgYEgv
J7lC9lWczJTFm69W73lAyLuvea+ZNcfP2HFcUslLC+ZvdUL9Q44dkvrLR6g2YCD0
l9+2wW5wqabWZI/GFZ2eqVgoYejCQqX048M5SoWyWc+lZGCqT1mKxaBuin3+W3Wg
47jG8cci6BmWAIFI+9EmJbrPIA/If22/d1QfFzrZs8wCT7LYFUyT+XZ8jSzDKn5S
sD51U6awtbhQXb+yC6qBjM+Luqr3OL3ssl9IQya1ZUQRMa9S8Bs=
=t2R2
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--
