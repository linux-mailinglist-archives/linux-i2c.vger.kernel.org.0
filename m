Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82EFEA3709
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 14:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbfH3Mp5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 08:45:57 -0400
Received: from sauhun.de ([88.99.104.3]:53526 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727417AbfH3Mp5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 08:45:57 -0400
Received: from localhost (p54B335BE.dip0.t-ipconnect.de [84.179.53.190])
        by pokefinder.org (Postfix) with ESMTPSA id 2E6DC2C0095;
        Fri, 30 Aug 2019 14:45:55 +0200 (CEST)
Date:   Fri, 30 Aug 2019 14:45:54 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] rtc: max77686: convert to devm_i2c_new_dummy_device()
Message-ID: <20190830124554.GB2870@ninjato>
References: <20190820154239.8230-1-wsa+renesas@sang-engineering.com>
 <20190820154239.8230-2-wsa+renesas@sang-engineering.com>
 <20190829205752.GL21922@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Content-Disposition: inline
In-Reply-To: <20190829205752.GL21922@piout.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 10:57:52PM +0200, Alexandre Belloni wrote:
> On 20/08/2019 17:42:37+0200, Wolfram Sang wrote:
> > I was about to simplify the call to i2c_unregister_device() when I
> > realized that converting to devm_i2c_new_dummy_device() will simplify
> > the driver a lot. So I took this approach.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> > Build tested only, buildbot is happy, too.
> >=20
> > Please apply to your tree.
> >=20
>=20
> I'm confused because I already applied:
> https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit=
/?h=3Drtc-next&id=3D7150710f3084de8d35ce3221eeae2caee8813f92

The above was a mass conversion to i2c_new_dummy_device() to make sure
all in-kernel users use the API returning an ERRPTR. Mass conversion to
the devm_ variant of the same function was too troublesome.

With another series, I wanted to remove superfluous error checking of
i2c_unregister_device() because it is NULL-ptr safe, like here:

> > -	if (info->rtc)
> > -		i2c_unregister_device(info->rtc);

But for these two RTC drivers, I figured moving to devm_* is way easier
than fixing up the mass conversion result from coccinelle.


--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1pGoIACgkQFA3kzBSg
KbbdMQ//c3MTjmSg7hunKGDkz/mWkGCMB1YysqH/xm8AgkknadF9iWIjFxyuFMuB
Kt+rNP8b1oaJqoIHZw38IVcUsf0Z+kNjOWEeMGJU327atwSaOX9X4uTnxNoMDgBS
MiDsuaasGP9JnVeJbn4E4/bKuUUAGPGrz2cF2EvOO2qm55s3k1O4nT7NhrK0/Fla
Tw8cB4KoDN/+0UjxearL5RAXcbBv8XOPc2d2jrR586O/NFiFUOlsE5JbsGOwPD45
0X2SAKk4Ctka9jyI9C7yRB21tvLwelLOdHecb/Uh2pvnA+n08Z1PbWSnLa9nXPLa
RQBqc/0fP0aE/d1pUSIuO0S5tvnHEcJvd8kg3XTzwMUv/hAUT9fFiIXnh5mWyec4
agu2Yo39gLdlNiwPpvBewkPwrvjXIzdqAciQ9rg+sjDhfn/K0AWaSEQDL+bsp/Nq
mcqq8rh72t2EChBfdengI0f/Vrr8Js+/snGs9R56kNkHU2e1Q+Fyd9lhvCc6grkh
FwtL8z7jP2MF9DXS9Ivq9XggYOmey4BAiViu105Y/5C7ZOTWECOm6RUXUCEf/tZa
PvRpQI3qcyFjbANBhfPb+hoDO1XzzWfw5gLivrwTrGccNwuqAdeY93Mzvxnb7nE3
wVrQvSpAyEdwdNVvQjy1JnzZvAo6JM+iGnN4pMZoOPtEmaxUVEE=
=QT51
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
