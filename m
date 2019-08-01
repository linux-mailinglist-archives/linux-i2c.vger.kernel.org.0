Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C237DAFA
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 14:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbfHAMJ5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 08:09:57 -0400
Received: from sauhun.de ([88.99.104.3]:52204 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729071AbfHAMJ5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 08:09:57 -0400
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
        by pokefinder.org (Postfix) with ESMTPSA id 2CB262C2817;
        Thu,  1 Aug 2019 14:09:56 +0200 (CEST)
Date:   Thu, 1 Aug 2019 14:09:55 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: fixes for v5.3-rc3
Message-ID: <20190801120955.GB1659@ninjato>
References: <20190730092241.30185-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
In-Reply-To: <20190730092241.30185-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2019 at 11:22:41AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Hi Wolfram,
>=20
> please pull the following fix for at24.
>=20
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca=
4b:
>=20
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git at24-v5.3-=
rc3-fixes-for-wolfram
>=20
> for you to fetch changes up to 25e5ef302c24a6fead369c0cfe88c073d7b97ca8:
>=20
>   eeprom: at24: make spd world-readable again (2019-07-28 18:49:20 +0200)

Thanks, pulled!


--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1C1pMACgkQFA3kzBSg
KbaLJw/+MCbYtArxKSrEt5gX6SzhUuLOromV7yCcnD9e70nqsMNmPY2QosVrfE30
j8uMSGDdSbcbdxIf2ftjvbOnlYGoFzQLAvv/xUXuYJWmW0ywxD/lZCUSDcrMzsN4
9QEpYfr7ZOvqdzcRttRqNlVHUne/7hu7pNs039mW1bEuPeMFcZo62V/8VCqipC8o
CP2xuO1sUYarwCc6z9+G5MwIfoEGuO6tcLDVM8hL8qa10l1LZAZ9WMdwtcjXj6gk
+HoH0ij/HC68/YSRqbE3m1BWtr895TpUA7/uTL0kA30jFVxAcil0Vbm6PqCwGr37
qj+eYVs5aYgw+880wgYFE3oIK97ax1HhUsJLzVwctAjCxqW+A5SrHMxCrfS05/mw
zelsrkmzKM54bfo+lJAS//RcGrhGenJC739fziGhTqVUt32g8fsyvqonoEOH+WiN
yQd+l/Ss/SZl3/ieIFFCdl39681CTTQScNO/CxnE7Nk76kba2jv0/mst9zNiDwpW
7RUW4TQvuIyYxIbIZcS+U5rVB9HQNyRk3fw3CNp5aQK2C3iEBHZzN1LIhLywSJDz
UjuH0OdqygqZdhRgAIXle2fJGBQTumHHp64ZZ1ItWThD9JMGSo6cn+A+Ppp+JVsl
VnFhHUJqpXCRy5K1qcEIjnmUDACFJu62TvNzt+H2XXuMpJL3y0U=
=ru06
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
