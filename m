Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7453C1D926A
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 10:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbgESIsf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 04:48:35 -0400
Received: from sauhun.de ([88.99.104.3]:51902 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726466AbgESIsf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 04:48:35 -0400
Received: from localhost (p5486ceca.dip0.t-ipconnect.de [84.134.206.202])
        by pokefinder.org (Postfix) with ESMTPSA id 9FC2E2C1FA8;
        Tue, 19 May 2020 10:48:33 +0200 (CEST)
Date:   Tue, 19 May 2020 10:48:33 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v15 2/2] i2c: core: support bus regulator controlling in
 adapter
Message-ID: <20200519084833.GH1094@ninjato>
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
 <20200519072729.7268-3-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qM81t570OJUP5TU/"
Content-Disposition: inline
In-Reply-To: <20200519072729.7268-3-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qM81t570OJUP5TU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 03:27:29PM +0800, Bibby Hsieh wrote:
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>=20
> We get and enable bulk regulator in i2c adapter device.
>=20
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

Applied to for-next, thanks! I added Tomasz Rev-by: for you.


--qM81t570OJUP5TU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7DnWEACgkQFA3kzBSg
KbbJLg/7BXXjQ4Az/ycfYqTBAbDDrlnurYpy3y24TWlspIcLC0ocY6GkUl1KV1es
m/EcxbmqbE0piB3BCgjazedtDgn0YctP7/fdm3WhE7AXYIih/6oOdii5TegzcPK4
YY6f+5tRprR2MJVZzdRzXHYul6AomR8uxrNmXX/pm3vMzHLbziE0NbR6AtiRBkPt
DoEFBvlmaSrLSGmdVXdky7GwZZK7wPIkGxKOgj6jtITBaBHpxbynVKr87aj84tCy
LddMyvpYO8hXN5+RSjH2tttp7BXF4oMzMKCyTyDF61K18Yde4d1hQvNLeySAZ6Bo
+M3yD68rj2ry34hIJdzvYOKoS7tNwJenEBpyqDGd8DNQpfqtSHuWEBoOU7zuBkQn
uV+V4UWT/TjPXuonoFRrmkoZ0kx6pkV4XXKGbFhwrUQ5nXIr3EcrGYxlVSPUE2jo
iBtjmXjzCurOMBJjGPWMY7ZEFb9snK8fm8cK8O+YqpMuDZWX5Y1+CLF7s1ALpeIj
MOtUNu9gr+Mk8bzQ6BFaw9lje26DS1BdMTU7zAQrVY+NtdxvKP0T+H0ES4ZJYOCa
WSRXHZ4PDPIWXwEYVivc74JWSomtb197pt1r30FBrOHQtEzQYlrKk+PNFrb0mLTo
03K3x/Inm0fDF0NknfFLUV3ptL1QonprijhyTHl3956bmq72tcM=
=BaV+
-----END PGP SIGNATURE-----

--qM81t570OJUP5TU/--
