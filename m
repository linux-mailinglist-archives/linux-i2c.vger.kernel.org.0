Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 244A618D15F
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Mar 2020 15:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgCTOpo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Mar 2020 10:45:44 -0400
Received: from sauhun.de ([88.99.104.3]:49222 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726869AbgCTOpo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 20 Mar 2020 10:45:44 -0400
Received: from localhost (p54B33339.dip0.t-ipconnect.de [84.179.51.57])
        by pokefinder.org (Postfix) with ESMTPSA id 08C582C08E7;
        Fri, 20 Mar 2020 15:45:43 +0100 (CET)
Date:   Fri, 20 Mar 2020 15:45:42 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 1/6] i2c: core: Provide generic definitions for bus
 frequencies
Message-ID: <20200320144542.GB1282@ninjato>
References: <20200316154929.20886-1-andriy.shevchenko@linux.intel.com>
 <20200319171913.GM1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline
In-Reply-To: <20200319171913.GM1922688@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 07:19:13PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 16, 2020 at 05:49:24PM +0200, Andy Shevchenko wrote:
> > There are few maximum bus frequencies being used in the I=C2=B2C core c=
ode.
> > Provide generic definitions for bus frequencies and use them in the cor=
e.
> >=20
> > The drivers may use predefined constants where it is appropriate.
> > Some of them are already using these under slightly different names.
> > We will convert them later to use newly introduced defines.
> >=20
> > Note, the name of modes are chosen to follow well established naming
> > scheme [1].
> >=20
> > These definitions will also help to avoid typos in the numbers that
> > may lead to subtle errors.
>=20
> Wolfram, is any chance to get applied at least 1, 5 and 6 from this serie=
s?

Yes, just make sure v4 is based on i2c/for-next to minimize merge
conflicts.


--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl501xYACgkQFA3kzBSg
KbYKqQ//c0bNBAkMVf0XAo7X8M8t/bKAHFKoywqtU2aGGMavAe7yHbQvXSIak5b4
ROhZWt80QMU3hnk0gjIJL1WyzCG2WYTLHrillrBQImN5w1+DzWAIAtu6iuFvgljh
nP0Gm8GV9yXvgXYYQx+RAYkPAPmTlEUMVpten4WfPc/NJ/jhs8UH82eBOYkHhHHs
vRkjSpf/GfUiODvBo4tDY/WmFQtu5v9zE1fwFy5gaqO6P+zG3BmIleHHvwuP1W86
rwxjNfMLOE9IL3e3N8JKrM/ex98ZUFcIRlPYoEoxOqcTWM//sm9Kvfh56cHgZSZU
2zxxGqYsERmbO+BAeRaOF+veypfL9lPc3ui2EX1AeA5zA7xMpiLpd4t2ZgFEf9LQ
gxNp4GMRS9MDLqQj8RhtBn5FkiQxQIRN8zhe7UKsSbD2G6AfUYljIupVr+AtHBWz
K8XgbYQe7ReWVhSE/cfeZbe5FbO4m5G2fUvk2fDWLeNB9dbVjESmp7+xX5Uuy0D1
6KbPYroMv1VMu0h5WDzgtu9abxNfKJ4JtiAc7YfgQV/QKeonM0e1wuBO/ZvCKbDf
K5/LywdrwBjrqWA0GjOgZ3pLN8fSAzuCGKB14k++pxbCRwEMbJGZUnQ++QGREGT8
78EitzEjZj4CDehHLYNrR07SCA9TqmT4herJi+PHVr/b1/DhkVM=
=JNSv
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
