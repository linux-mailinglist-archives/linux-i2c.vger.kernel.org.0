Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48CA413CB33
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 18:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgAORnA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 12:43:00 -0500
Received: from sauhun.de ([88.99.104.3]:38990 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgAORnA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 12:43:00 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id E23862C0742;
        Wed, 15 Jan 2020 18:42:57 +0100 (CET)
Date:   Wed, 15 Jan 2020 18:42:57 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v2 4/4] i2c: stu300: Use proper printk format for iomem
 pointer
Message-ID: <20200115174257.GG1239@ninjato>
References: <1578992765-1418-1-git-send-email-krzk@kernel.org>
 <1578992765-1418-4-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Content-Disposition: inline
In-Reply-To: <1578992765-1418-4-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2020 at 10:06:05AM +0100, Krzysztof Kozlowski wrote:
> iomem pointers should be printed with pointer format to hide the
> actual value and fix warnings when compiling on 64-bit platform (e.g. with
> COMPILE_TEST):
>=20
>     drivers/i2c/busses/i2c-stu300.c: In function =E2=80=98stu300_wait_whi=
le_busy=E2=80=99:
>     drivers/i2c/busses/i2c-stu300.c:446:76: warning:
>         cast from pointer to integer of different size [-Wpointer-to-int-=
cast]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20

Applied to for-next, thanks!


--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fTyEACgkQFA3kzBSg
KbZyqg//Sd09BN4OeELDVsiOiLzCCJ9pCfgSbHMr566NeJZRmzZzmHqnwPM45c/T
vPXIMFK2tA9l+WUfEL56leAbrzjuy9O5dK0TVGZsuCFTXunT/5eB4/rWcWCii+wu
rVXsA+nfIKrWNskbUC/Mic+5aERwBQvkWoHAKV2j5A0N/r77cO+i7bpWF3JccDRc
Cqq7SwXCsEB92MZRzG4JyhI0iyFQDIT/tEfXo1lMQ9Iyx7fVeiudGdo+YEfiQ4lZ
9VwOX5+5pmjgJ+4BLsXXDf3ulrnL/l6njjfKyRQ1WaFFiA9Em9gb9D7+ZkxN7rPt
vw7izfwLcmVEe0vlLBsOICMjRHLqNUqo4iJiMO7PUexQXfqbLX902mtO9Jf8GUhb
liKrVPl687LYO32qQHi5Td4A/D8kdmqsvFc8MemJaWw61nSoOxpdjpIgvy4efRKA
LrS8Hjd9rjABO5l4ITAU6zY5gVNbMjsBGX8jXtwqNK5fSz0enUh2eDz9gjxbFgGq
Oso9n3obhqedeFP4gp331wm80OycBEbuwE3slw/sUEgVkR9FsldgK9ybJNoRrlkP
i/4uAYQYnxXf5fXSIzK9/vY2F35bie1hGYt3sOpULaqAOMmvgBxh6bAzNGdZLbxW
xzY+WdHBSG38zYsa5PxdFw4TfBELbMmeMF3GRYmFQHGLNwfa66A=
=MOaJ
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--
