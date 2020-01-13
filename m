Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9FD139BE9
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2020 22:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgAMVxo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 16:53:44 -0500
Received: from sauhun.de ([88.99.104.3]:42866 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728802AbgAMVxn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Jan 2020 16:53:43 -0500
Received: from localhost (p54B332D5.dip0.t-ipconnect.de [84.179.50.213])
        by pokefinder.org (Postfix) with ESMTPSA id B54BC2C06DA;
        Mon, 13 Jan 2020 22:53:41 +0100 (CET)
Date:   Mon, 13 Jan 2020 22:53:41 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/8] NVIDIA Tegra I2C driver fixes and improvements
Message-ID: <20200113215341.GA2689@ninjato>
References: <20200112171430.27219-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <20200112171430.27219-1-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2020 at 08:14:22PM +0300, Dmitry Osipenko wrote:
> Hello,
>=20
> This patchset adds support for atomic transfers which are required for
> shutting down machine properly. Secondly, a (not)suspending I2C and some
> other things are fixed/improved by this small series as well. Please revi=
ew
> and apply, thanks in advance!
>=20
> Changelog:
>=20
> v4: Removed the "clk: tegra: Fix double-free in tegra_clk_init()" patch
>     from this series, which was added by accident in v3.
>=20
>     Added Thierry's tested-by to the patches.

Looks good to me. I think all these patches should go to v5.6, let me
know if patches 1 and/or 2 should go to v5.5?


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4c5uEACgkQFA3kzBSg
KbaNOg/8Djo9bVYyGrlZcv32vzUo/Ey82Z5EzFt9OvJt3HJZjk9P0968XqubSUDM
avR6DhJR9xaVLfgqJRmQvxA3nnNm4N1k4ezckknwoDeiWdUNqt4MWWFxJuc7ropM
ehzoaGRgp+Q8ERRHdo/dJtJcrvl/IkanWZWik9VbhrtsTexKXwpGV0hx8KvkqOhP
HU3bO/WJR1s7bfrxPHvMmp0GYcqEsqiZ1R910oYka0QDo4cAc3HjLllN5IpnfKo7
azK1cd70TjVzYoFXHX+wrU0n+8XqoRLRjZxVEoLAMt+UpS+LBXNI+29xB0jkx2+m
/EFg2yaS65zltyvhnR/eMiFj2qrVZ+Rx8oz8ZJOYVlw5pZkWN1SbbBZg+s7G/NCq
TDFzkCtyprj9KDDdH9Vu+ahChiEm9X2+LkG0jKAo/c/GGXgyRjv6DqIJshPD+T7z
h1+IuakJCUd2HAVcL5hjKLfg4QpbKGn2DJhV3AnjbLTIhTrVujv/8KWtgNj+c7JQ
UoEPA1g5j6CXe5jxWNV7eO9hlkaZSekZ17kQ3y5/3hf0ZbqVU95ffiWHAv/KFMC+
zlLSXD6iZznJUX44mBoLaRltNJn6KFAhL1kU7q8lePCbRbSIcdaVkofJ16Kbr/tv
ExY+wXPXhu39HstjFveuKcC0L9zm5bTBBu3zw12zE9uxfXUHRjI=
=qKVs
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
