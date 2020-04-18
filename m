Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4161AF535
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Apr 2020 23:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbgDRVoe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Apr 2020 17:44:34 -0400
Received: from sauhun.de ([88.99.104.3]:50748 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726459AbgDRVoe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 18 Apr 2020 17:44:34 -0400
Received: from localhost (p5486CFBC.dip0.t-ipconnect.de [84.134.207.188])
        by pokefinder.org (Postfix) with ESMTPSA id 69E872C1FB0;
        Sat, 18 Apr 2020 23:44:32 +0200 (CEST)
Date:   Sat, 18 Apr 2020 23:44:32 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        hdegoede@redhat.com, aisheng.dong@nxp.com, vigneshr@ti.com,
        ardb@kernel.org, gcherian@marvell.com,
        wsa+renesas@sang-engineering.com, krzk@kernel.org,
        alpawi@amazon.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v2] i2c: busses: remove duplicate dev_err()
Message-ID: <20200418214431.GD1293@ninjato>
References: <20200416152345.23077-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline
In-Reply-To: <20200416152345.23077-1-zhengdejin5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 11:23:45PM +0800, Dejin Zheng wrote:
> it will print an error message by itself when platform_get_irq()
> goes wrong. so don't need dev_err() in here again.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Suggested-by: Markus Elfring <Markus.Elfring@web.de>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Applied to for-next, thanks!


--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6bdL8ACgkQFA3kzBSg
KbbNHw//Vio1UHXaE3CLWBTRRDnO/kJpp4FVEejJ6IdeW+TCF2wpmCMP58PYhgam
mvh9Fg3//m0ibDrXcq7amauqck+t+QblumvJNnD4CDd1UNHfyFI7FQmz13dicivs
HbRB/pvw0YXCtGa3z3O48UOjODNwLg7JebcX2zNM95Xu0o57Bjo5y7F9BUL7eYTK
b5Ymt7tPd3D6qD0oNgosUY7qHOxVLum59IWI3L7PELM0xbVlqWHi/v99t4WWhLV/
PEQOvE8ZzuQgCew+XasMstSOOi+N4HTJ2Vc7f+zXcrSAcySDjksdaOmz6VGNRrXq
kL+T9CF7XL1qjY9ASgaTzm0fwhTOXyhVh84mFpNZVfWEmygnRYXjtKV1uW0WdKHi
aJMk2IkxIzkCIet6LRvMstyTiETvHZYOhw0nZfyu7x9G4iY0GR6yc+4edvZTtUHf
mfUm15jWuxGdMuNPz90N2rs41G13NlVF6IRjfKhaeh9xWXyrpmzhfQ7jLcy7Qonb
z3+5QbhuxboR56leCPxOtkbVStkSQvDB6KAIc2FR2o5QYcocFk1/Qe/9QWjUrwiY
N7uwVOy5Ty+Jd9tTbCei3sYi3muf1C5GbreUHe04oOBSbsqVX+LlCMLUGLyuyBNp
DJLbcAJHMwCXaCLxbi6kpWf680mK4XDNgSqwS7jQGAhsCvB/hN4=
=pn2L
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
