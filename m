Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949B318EA40
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 17:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgCVQVM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 12:21:12 -0400
Received: from sauhun.de ([88.99.104.3]:51450 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726538AbgCVQVM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 22 Mar 2020 12:21:12 -0400
Received: from localhost (p54B33042.dip0.t-ipconnect.de [84.179.48.66])
        by pokefinder.org (Postfix) with ESMTPSA id 260382C0064;
        Sun, 22 Mar 2020 17:21:10 +0100 (CET)
Date:   Sun, 22 Mar 2020 17:21:09 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 13/17] i2c: include/linux/i2c.h: fix a doc warning
Message-ID: <20200322162109.GD6766@ninjato>
References: <cover.1584456635.git.mchehab+huawei@kernel.org>
 <24cbf9166b21531186e5b6d37a3f9201f957abef.1584456635.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline
In-Reply-To: <24cbf9166b21531186e5b6d37a3f9201f957abef.1584456635.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2020 at 03:54:22PM +0100, Mauro Carvalho Chehab wrote:
> Don't let non-letters inside a literal block without escaping it, as
> the toolchain would mis-interpret it:
>=20
> ./include/linux/i2c.h:518: WARNING: Inline strong start-string without en=
d-string.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Applied to for-current, thanks!


--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl53kHUACgkQFA3kzBSg
KbaR/g//XGC6Arwv37/lpyGmllIA2LKJ9gXePjLavzZUFPQk6zXot7DD68Y9wTyj
TyOyRYEhNB2wuv8W2HHvqQLzBav/vd85qNOkq72aoCdoYNPWBCP93pbx2sfcqO+F
Uf7hwToamo9VBzbw/DdNCDj9ChnmOjfSgdy94vQr7NNCfwqcHTqMwj9ZC4oLHWk/
XU961lX9rRO6UDQ57WtyVFw62SA6NffupUm0iOU6o1ITjzCQIM5fi+7xxM/JcLR7
LQpm0vxljUabEHBUbNsHyOFj/NcysWwBV1sbz8rxUJsBg6lWx6qO3n3ZZgudsm9X
72A6boD4FTK7TMVkyt+KOHV6qU7L6fjVqMfihJDu/1xI79sI5NiffakpCYkVIN5B
ZnOBKJ7QmUN3yDK93ts/eL9XcCG1mV9v9ExAVBUL0cefsjlQPLI4TminofRmYSDH
3xHxoTpWWZ824KmbTAqPuXMJLFwdBaQgwc6n4YiKhKiLgpWrp4H2VnysLaGuruXg
udnNvKYxKXEA78lpZroUapYw0gyxk3YLXRd/h2GN5m6wbrr+CcTGxpOjSSaBGGgc
18cnqaeWIuZb9rkLqLC2tUN9GW5KxL7KfOiTLH05LZ/0MV7rbNkhH7YJzx0FcFrn
fV/GL6MCFVrmORzy53T7qwOBCKwcmd/z5Q1/3G1M+h03r/1w9TQ=
=8TIH
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
