Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE9934FB34
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 10:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbhCaIH0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 04:07:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:55470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234387AbhCaIHF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 04:07:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D49461957;
        Wed, 31 Mar 2021 08:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617178024;
        bh=Y7odu3gWfoFbX+gyh39LrT9JYQsI9QtVqTb3q08MgRU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mMmI7uRr/yVYfV1tSwGtA1yMGldK+smBQJVoriH5c6m3erkrhYX8b7a5as1XIsVU1
         NG8hoVds46bA0vWZx7zmIGtjVGjP4jI9cqg4e7fPAhrGuyPmcXulEClSF+wldQzGkt
         OOQDKAIH+971S6ARZHFmaIl35H8MWtYG2HM5fbKa8lUsxlkx5V1V6we3VDcolkR+Pi
         u/EF15egfxitmm/BmpZ0x+0zKsAVS+sBNtxRWTBUHHaKSBM3ndHzAL+dUKmvzWgLyA
         7VqNjnQpwwZsyZHxFVyXNG43WKy8hjB099x/xElG3b1RYC7BiqzyePwwrOPhAZ09B+
         Pqb+tAMUT3A1Q==
Date:   Wed, 31 Mar 2021 10:07:01 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hao Fang <fanghao11@huawei.com>
Cc:     thor.thayer@linux.intel.com, mani@kernel.org,
        bjorn.andersson@linaro.org, tiantao6@hisilicon.com,
        zhengdejin5@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, prime.zeng@hisilicon.com
Subject: Re: [PATCH] i2c: hix5hd2: use the correct HiSilicon copyright
Message-ID: <20210331080701.GI1025@ninjato>
References: <1617086234-35270-1-git-send-email-fanghao11@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v2/QI0iRXglpx0hK"
Content-Disposition: inline
In-Reply-To: <1617086234-35270-1-git-send-email-fanghao11@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--v2/QI0iRXglpx0hK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 02:37:14PM +0800, Hao Fang wrote:
> s/Hisilicon/HiSilicon/g.
> It should use capital S, according to
> https://www.hisilicon.com/en/terms-of-use.
>=20
> Signed-off-by: Hao Fang <fanghao11@huawei.com>

Applied to for-current, thanks!


--v2/QI0iRXglpx0hK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkLaUACgkQFA3kzBSg
KbbOUA//ZXB7/o6B7F4UBi7o66xRRvU53gSj+/48ouENxrrgxhSopHzNOEsnJuEQ
7G/xE4bqy6wj5MWGpfUTxXLqF/Zb7DrbTBzNcz0aWsVeQGbL0wQMK9r7ATxmJoLj
VblwnP5sixzDk0B+vrVvq9V+uYi/DircHhbujhmhpivnGgy6gIM0VjZRRDDOFo8O
6qrNZX/QRu6H4W5olcmXGx2n6w0kpw30LUOSP0Z4J57QYJYTVfIzeRmNbWPcvL1K
WklduYtPNqDarNHy3+XsA4ROKcSg7IIlVXi1kKlfSEKwFicVrNd1ISmyD6yOYn+A
nVKzMwnYubHnFM8VRqbS3VRbgmrNWlpctddMpCXfe66N/JJ3DdQuHQQLSkDNBNAu
Ez2fxyq4UDSXJxibZFCKGwBYY8j7AtTJMRCWgf8D/nTZYSoDvtZKDC9tNq9cZbcz
FJrTZJ6LsVkFi5UJdw8+UycngJ6/Qm4RCvc1vEqY8Wklcx0FB8t7AHBSgLLVR0XH
vphW1anBBgbD83K4LokPwJaHAdF2/Vk9qn6U8YfrotVaiwsU9jQ8XEeg/4V5ADVY
kUh729NUVWPQ98sVSwCRPuD7MMd03mJeSCoetAF1911pMBaZOxQwa5zuZU92Zj1R
1LTLorfJBH/EFgqdFNaDJENiz6PQwbY84uxeAujAo0lzBQzS0sk=
=bPY9
-----END PGP SIGNATURE-----

--v2/QI0iRXglpx0hK--
