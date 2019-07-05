Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3B460B6F
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 20:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfGESbK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 14:31:10 -0400
Received: from sauhun.de ([88.99.104.3]:53420 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727090AbfGESbK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jul 2019 14:31:10 -0400
Received: from localhost (p54B334DF.dip0.t-ipconnect.de [84.179.52.223])
        by pokefinder.org (Postfix) with ESMTPSA id 14DA12C0398;
        Fri,  5 Jul 2019 20:31:09 +0200 (CEST)
Date:   Fri, 5 Jul 2019 20:31:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: i801: Documentation update
Message-ID: <20190705183108.GD4717@kunai>
References: <20190704113402.3ade31cb@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline
In-Reply-To: <20190704113402.3ade31cb@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2019 at 11:34:02AM +0200, Jean Delvare wrote:
> The i2c-i801 driver documentation needs some dusting:
> * Mention disable_features flag 0x20.
> * The i2c_ec driver has been removed from the kernel long ago. Driver
>   i2c-scmi serves the same purpose for more recent hardware.
> * Replace obsolete /proc paths with equivalent /sys paths.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>

Applied to for-next, thanks!


--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0fl2wACgkQFA3kzBSg
KbZuNxAArffPaJ/etunu+i6uGYQY91ZurcFEgfTz5yxktf4jCanw6HtGlx4901BR
5DbM+oykE/IAj5Hvq6OjCI9KwvQz09zGG0Hn4XkswJ2ABCoJBCk/lx3l6BanLnYU
XJ84opqnOqVIpRAVxB0CHZTfZKLH7aV1kkGZoSWc5zt+0A+XFZIxWoIHu+b9sex9
JYAztSWHQhHYQ6F3mtyyje1CwYn0JxaMvSJMlPN0jmlYB+VyIP4IZ8PCcdgWofrH
J3Q/+69l1AfJneWvmRw2K6FLHdF6TY7ky/ZIjJAKqFAeeaMbfngNNTvoV5UAMYFw
DBjWDdh06kB5SvNLIJj5QZ+TbF5b9+Odgzst/o4LTqjSd+jreKMqX4lg5RHZnIf+
wMry+MspmOX16+SBSVwifN8RJiOugF3tkA4Gh+bNJKPwnVcw+mFwdRa9L7t2ImGH
0cxzQVLMmczaSIEH3WMDJ5x0tuvuwsxH4bbh2xOvO/ANVpLhUeS/8+QhMYgTnOH5
F3JoTwK1Ck7IIoClMLVMB7Y6kwAPldZh6lAKe09MAO3D/K2Rv5F180IShB06wSTn
8VmxALt9g/pq8n5sTsWO/EY+DfcdV75+tomY6WoPEXgFjsVGWVkJDzXnzyazBDHq
ocGc/7nXBL+FmFpIGwN1R8mShKJkDa2f+DKw6rwe3T3aww/CMOQ=
=h74d
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
