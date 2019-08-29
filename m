Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE689A27BD
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 22:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbfH2UK0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 16:10:26 -0400
Received: from sauhun.de ([88.99.104.3]:43096 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbfH2UK0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 16:10:26 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id DBCF32C0021;
        Thu, 29 Aug 2019 22:10:24 +0200 (CEST)
Date:   Thu, 29 Aug 2019 22:10:24 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v1] i2c: designware: Fix optional reset error handling
Message-ID: <20190829201024.GO3740@ninjato>
References: <20190819103130.73999-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0u4QAjBqqw4+MLTw"
Content-Disposition: inline
In-Reply-To: <20190819103130.73999-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0u4QAjBqqw4+MLTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 01:31:30PM +0300, Andy Shevchenko wrote:
> The commit bb475230b8e5 ("reset: make optional functions really optional")
> brought a missed part of the support for an optional reset handlers.
>=20
> Since that we don't need to have special error handling in the driver.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--0u4QAjBqqw4+MLTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oMTAACgkQFA3kzBSg
KbZQaw/+JEHL1TbQPlPu1ID23HNC8T9a5ysP8wo/dtj6qeuo5hys4xQ5XNZtPLbo
xQxY7kKKC707JFwvim9n/OrDsHPD4foOaMEAkMhsWCic8t8bkUPh8K6NXi748r/b
Kc5zCW1e5M548g3Lk2pLjF+qV645jBCRbDN+KzeeWvgN7dDXKZs8jS2Wm2xd+lqE
F0hv7cQAZSL4/W4F+gx36CEcpCLGX3Dg6OcoyHghExp68fPNH5ipq4eRvFLt8okr
vY04ePnuKg9Ha3ysmjlGMDkgN1052Fucc9ATsq/6jD7tXEgyqCPkavIBX3NhsV/4
c1TPjWwZc9TzvPcvioynGqTYhDQ+afxBzJ7x34gFClRTb26XZO2EtflvWcFuStPK
XX4cWfXU1wbzNXnqo86oqTs1JrWI2dgVw6YecJFl9K6mzpEgP0amGQbttXZhMaLi
dogqGe13xp8Q7GbsEUCsD1HgA293gO0/KXQ3JPKxI3HUDv+hMPNH+2+0Xu7NJH+L
fxOHfZORBmsAxij6PshUkQUa2hVMX6I4EfkdoI51Nqfbx7r//akVYM033PjaUkxO
CbBaGPwIE8imauuDyB2j0JrWcmQ1EnxatEqHfkmD6uq5cNjChuJL25JvYWK3/J65
loHliUJObpvt9jH/TWda+e+LNlTw7TOSfI3GV2UIMZsSZDC0Yxg=
=HJD2
-----END PGP SIGNATURE-----

--0u4QAjBqqw4+MLTw--
