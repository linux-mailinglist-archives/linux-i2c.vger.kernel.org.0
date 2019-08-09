Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C14B880A4
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 18:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407503AbfHIQ5e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 12:57:34 -0400
Received: from sauhun.de ([88.99.104.3]:39732 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407453AbfHIQ5e (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Aug 2019 12:57:34 -0400
Received: from localhost (p54B333D4.dip0.t-ipconnect.de [84.179.51.212])
        by pokefinder.org (Postfix) with ESMTPSA id CE01D2C3014;
        Fri,  9 Aug 2019 18:57:31 +0200 (CEST)
Date:   Fri, 9 Aug 2019 18:57:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, Russell King <linux@armlinux.org.uk>,
        Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/7] [RFC] ARM: remove Intel iop33x and iop13xx support
Message-ID: <20190809165731.GD5099@ninjato>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Content-Disposition: inline
In-Reply-To: <20190809163334.489360-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 06:33:15PM +0200, Arnd Bergmann wrote:
> There are three families of IOP machines we support in Linux: iop32x
> (which includes EP80219), iop33x and iop13xx (aka IOP34x aka WP8134x).
>=20
> All products we support in the kernel are based on the first of these,
> iop32x, the other families only ever supported the Intel reference
> boards but no actual machine anyone could ever buy.
>=20
> While one could clearly make them all three work in a single kernel
> with some work, this takes the easy way out, removing the later two
> platforms entirely, under the assumption that there are no remaining
> users.
>=20
> Earlier versions of OpenWRT and Debian both had support for iop32x
> but not the others, and they both dropped iop32x as well in their 2015
> releases.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Wolfram Sang <wsa@the-dreams.de> # for I2C parts


--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1NpfcACgkQFA3kzBSg
KbYo3xAAoUFahZppsWnQT+posnK7OdanH8eP9bFsX9jA3vLm1Z8xByrQrxVnTPYp
97VYfI7Czhue+5wf/ceACt4Q3XkAwKIQXkcqJgdBFfErPboWdL6yvrvIHhLbnfRr
HBw+/UiJSf7MisT3PutST0VFWRgJ0sv4LphNT+qbRDnX+3olTmhLax9NeETmzvBz
2MNNUTTerfJGsuORhlubz0TKccORwFqKERhq/NS48U4qdJnHcROBaMd/xyX37YEx
qBTS7eC5XWD4QiXyG6386DXhoLJi47uBdVuOTde1QF9Vuif/454Gg7uyenHpHndF
7hGT/5wSCKLFaFJJi1GABp2addD3DYdibkM2rueAbjCjb8d9g6YNFhuDOnSR2L+n
aV/QXEyTUe6j8JaX50cEeAPLAJ5MjqGRU9csYB16zfTpsty9aPkaEr75eiK+XTjt
wo6glb84+WYdsX7PZKbzYXmLpoFZAx1zkycp3Cf4DA0fxaDmYVDts0plkwQ7AR5D
jPG1Q8qxby/Y4yPceGfKHzV0MkMkrPSEDZEeg2NpnQiVRpvRR33okKu6xftMGxc1
4Z6ovgHtXBP9PUGOcdn0AmGHDNsHDYBEfCQDESQlwWaDEC9Q6IhGD9UTjsnUjLSj
AwXK137vfKLiWohLLeZbrWquBKJoV6vBJ9ByYrMtgRadv9qA5/Y=
=zEyv
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--
