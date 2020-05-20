Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A509E1DB54E
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 15:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgETNkY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 09:40:24 -0400
Received: from sauhun.de ([88.99.104.3]:37844 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726525AbgETNkV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 09:40:21 -0400
Received: from localhost (p5486cd24.dip0.t-ipconnect.de [84.134.205.36])
        by pokefinder.org (Postfix) with ESMTPSA id 22DCE2C1FD1;
        Wed, 20 May 2020 15:40:20 +0200 (CEST)
Date:   Wed, 20 May 2020 15:40:19 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
Message-ID: <20200520134019.GD5759@ninjato>
References: <20200515143924.1579055-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Content-Disposition: inline
In-Reply-To: <20200515143924.1579055-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 04:39:24PM +0200, Thierry Reding wrote:
> Hi,
>=20
> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314=
fd:
>=20
>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
5.8-i2c
>=20
> for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f0e:
>=20
>   i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:47:52=
 +0200)
>=20
> Thanks,
> Thierry
>=20

Thanks! I pulled it into my for-next branch to get some more testing of
all this. I can merge updated branches if that should be needed, of
course. I see there are still some on-going questions running but no
real show stopper AFAICS.


--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7FM0MACgkQFA3kzBSg
KbbKhw/+McTqb5AJW+ELMZ2xetjclfwgsGpmm+xLQoKIlu+nfGiGsijLQnl554s2
MKZo7xmtSbMAgYBP6zFeAPRxtZf2jOi9aNrPH0QSa/2pKEiFfbmjYoUBI9fAQN0u
ur8t/Bswn8j2NyV1/ugaRfTuGk2anrtF2jnjGIXhSPZ/aRyo99s2UYh93aM39HfN
r8bIY3ziLyrBuQAIPvYcYCa0LQLnKhHVYsUeJ30NsKhxQTWdct3MqmVJgwarBf2L
cKHnDU0T8LNGlOXROpviwyZPP1805PicwsT/YuZvAB/tQkMT2ZB8+IZozdQFj4cq
4sGn6Uolt93jEJru0JDTbCz/Y6G1PLl9WaRNdpngyfRMkNZzap3eMv6rkjOixr+o
BOjuvD49h3bvfJlyIRCuNNyjtTvIpDKZeQdfBCfUk/XFd5YyCInGSbgslFg+75lk
Fij+cROTqB7/DgYuR2a0zR4zDi28rJPMtrTjNHulyKScsruPsI5kXT1sitwJ+ZID
0NxSbGOn0qJN9uvzU4nhzQTNO3jIVtqb8H+PFaMve1pAZciVpD9qC1LlmtGkqKHR
AEsPjVgKZ8xTRt/+wB2SYZxV/OsKUnk8K1pKL/298S0UL5UweImY11QaltOCjrbu
Li5zlmZX1eaSyZOzfM4swOUoKEPDPyApmV6Hiuhln8hWbwP5wsg=
=fPzw
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--
