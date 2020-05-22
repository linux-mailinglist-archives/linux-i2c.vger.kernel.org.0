Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D44E1DEB44
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 17:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731031AbgEVO7c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 10:59:32 -0400
Received: from sauhun.de ([88.99.104.3]:33244 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730068AbgEVO7c (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 10:59:32 -0400
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
        by pokefinder.org (Postfix) with ESMTPSA id 47E9E2C203F;
        Fri, 22 May 2020 16:59:30 +0200 (CEST)
Date:   Fri, 22 May 2020 16:59:29 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v15 1/2] dt-binding: i2c: add bus-supply property
Message-ID: <20200522145929.GE5670@ninjato>
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
 <20200519072729.7268-2-bibby.hsieh@mediatek.com>
 <20200519084800.GG1094@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kA1LkgxZ0NN7Mz3A"
Content-Disposition: inline
In-Reply-To: <20200519084800.GG1094@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kA1LkgxZ0NN7Mz3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 10:48:00AM +0200, Wolfram Sang wrote:
> On Tue, May 19, 2020 at 03:27:28PM +0800, Bibby Hsieh wrote:
> > In some platforms, they disable the power-supply of i2c due
> > to power consumption reduction. This patch add bus-supply property.
> >=20
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > Acked-by: Rob Herring <robh@kernel.org>
>=20
> Applied to for-next, thanks!

Reverted because of regression reports in linux-next.


--kA1LkgxZ0NN7Mz3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7H6NEACgkQFA3kzBSg
KbaxpBAAsjx3hatTWpodrRmQQZ8es1Fw3q4wtrSNpbXk4TIVy81BT2oCUzRmGBbe
NwF3tIJcdFWwJxoM1AeEwfrm+hoJSvDkc0IQW37AdJYTn5Y+L6hajUxDTB0AiCvf
9iArY7TyFLqbL7fPvFDL6w/s7AJMn/l0YxFuW7sOW4n2MK7iyvZdO7xkHpQpxed9
gH0qIH4wFbNiB8dXMyVs1uISNc10nbZUNiEZZC31CSD372181xKbD8s2+bZLVPz3
Zo24KO2TskgjsgrOOgpxvOVdUyoikYP9qnZq63LF9FJzpylBdelqVhMwFMg5PWQy
D7RslQ+SCLk4htvNy8p2h7JTZRestNoWLy+WK+FNSNGBbZZhQv/u1u/tbH+y1NHt
fqYVnhWPgauRxYMRwOL9e9UXEevT0mrTjTMl95twvqNPzhV/4fUq5GlqaPZR1d9t
rqr+IGhuSqjtg7V+4vReQxP7FybU/mrGPF9qLPhXDzaT+2gnuMKjWZicJlE0qh+N
IOjOx/bz8fi25ZN8HvWF10Tpm0D+dSatErk0e+WLCXjkSMPPIxwVwztAnNaynG+4
CoFke2gtwPsC370QaAdkDljOEkEZY/r9XLwBokHr6JeBBwJy7wWLxkEC/W1Tdgdp
fJt0AWczrIMhZr0MrwltKmL02qJaIV66ZQA4v+ZngHJuOn41VmU=
=YVXO
-----END PGP SIGNATURE-----

--kA1LkgxZ0NN7Mz3A--
