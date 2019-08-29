Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC05A27A4
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 22:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfH2UEa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 16:04:30 -0400
Received: from sauhun.de ([88.99.104.3]:42998 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbfH2UEa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 16:04:30 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 27B5D2C0021;
        Thu, 29 Aug 2019 22:04:29 +0200 (CEST)
Date:   Thu, 29 Aug 2019 22:04:28 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] i2c: designware-pci: Add support for Elkhart Lake
 PSE I2C
Message-ID: <20190829200428.GL3740@ninjato>
References: <20190815142944.18334-1-jarkko.nikula@linux.intel.com>
 <20190815142944.18334-2-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lR6P3/j+HGelbRkf"
Content-Disposition: inline
In-Reply-To: <20190815142944.18334-2-jarkko.nikula@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lR6P3/j+HGelbRkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 05:29:44PM +0300, Jarkko Nikula wrote:
> Add support for Intel(R) Programmable Services Engine (Intel(R) PSE) I2C
> controller in Intel Elkhart Lake when interface is assigned to the host
> processor.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--lR6P3/j+HGelbRkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oL8wACgkQFA3kzBSg
Kba9tA//UmF2x1RTRm7eA/WfXwlc8CF2Z1yyaFvhYy0coj6JotYNS8Bg8bskRF5W
SAwIJXV8z99fkWpPfsLuCYQWig0YmTjUtNtzSqmwY7TBZ63FSZRJKgy+KFrOlwaM
BL3/+G7OlSuKmFBTLK2hHlElhDv6FLnm39C8Dki2HV5m71wSOJeSRYSu0QlQNQOB
j2jZ38m0c2bHkKuvR146Zc356FXXiV3JBuJWwjBOgSRlcQAl3dQbeeH+tMCDmZHn
rKSnQkzwAuswv0OeQgBLeyurycWHyjnC6WaMKFniuiH0tS0UBTUFgV7QM4aXH5ek
IFBa6czFeLhu9m8d+ahuJe97c3z5q34HxWlkycWmfFCM1n0NGi76IlMoTZGvF72S
nhN3nhlgVfTLpzVeW+qPoRulC6MpUjPlzGUJziHF/KX+eu+XhbGF1RzC9Lpttp0j
Ah6KpToq+R6BmNHwn46t6PyDsXpT2sAQhMpFmhZSYx2o/0xqasSmLHnme/kJOzLL
OOoNuvdQ2J+2WXeqjXDZSD5xdwEuc3H/+FFuE6VEYzjzGqmAol9tt/vUiR8cwI/y
E/8Mk+z5jn725WOd+VhirJC9VZs4lS1dRcauZ91WX0yK2kLFOxJ4IQjO75Z3cT5S
dFqgTgrKC1hNTu9N4HuoSWGWkWmqVX6WR0VwVGCToQaWvBh6/bk=
=jgR2
-----END PGP SIGNATURE-----

--lR6P3/j+HGelbRkf--
