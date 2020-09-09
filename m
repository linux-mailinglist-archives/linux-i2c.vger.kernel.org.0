Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F74E2629FF
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 10:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIIISL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 04:18:11 -0400
Received: from sauhun.de ([88.99.104.3]:46454 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725826AbgIIISK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 04:18:10 -0400
Received: from localhost (p54b33098.dip0.t-ipconnect.de [84.179.48.152])
        by pokefinder.org (Postfix) with ESMTPSA id A12A82C082B;
        Wed,  9 Sep 2020 10:18:07 +0200 (CEST)
Date:   Wed, 9 Sep 2020 10:18:04 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [GIT PULL] at24: fixes for v5.9-rc5
Message-ID: <20200909081804.GB2272@ninjato>
References: <20200908124116.6163-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
In-Reply-To: <20200908124116.6163-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2020 at 02:41:16PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Hi Wolfram,
>=20
> Please pull the following fix for at24.
>=20
> Thanks,
> Bartosz
>=20
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-=
fixes-for-v5.9-rc5
>=20
> for you to fetch changes up to 45df80d7605c25055a85fbc5a8446c81c6c0ca24:
>=20
>   misc: eeprom: at24: register nvmem only after eeprom is ready to use (2=
020-09-01 09:49:55 +0200)
>=20

Applied to for-current, thanks!


--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9Yj7wACgkQFA3kzBSg
KbbGtQ//Y/YqRuC9dRK25ep+zqcoYj/EH5WxwzsN7zsblXhuGHe9APts1seqLvT2
gPylJ/pWhfPCtEUoMMISestg0d7eHDe7YgN9CKl4necZxAAc2PJjyi10HTwszoRN
Av5GNB5OqzSOvtIZZr3CcSv9Gl4NbtVwhe+MbNyLtYBvAOqtq1vhj3EJGHo3nyJK
Yj5PnQ5zWk0xOpvjBy3hpfKmXthFtnheX9ANHPHRUiO5oOa7rprfSq1+J3GbtFBF
mp86NYjCc4htHUyqdxVpgDORmsCU1B0OUJ61KxgwrwKBCR3KvV/uRmA93Kt/c+1F
GgHIU9GFwEyJfR6JCcpeGgb5nSSZfxzMrEi8kfxD3/e0ighX12l5MhyOcpxo5Icr
i0PzwGhD1JgDmbNqrMmT76eWBKVLyfN9JHe3WfBdYoBgXqV1NBS04SHkXe/3jZBQ
LngzVj012h/2k/KXbxim+KXxou0ybT/gBmkQP7mtE6BqecDOhAlr9s+J1qtJF/vE
ydv/xtJH+F3xwY9hwzMfuGCCl39pUKyT7qb4LACXG4LKzcZoCmW6aL5YW4YkG/Pm
9rAykiRP15x6R4MK6XlRpfXWz372uwa7PWf+ygw3i6wGfsGnG5uUWdRoTG+qZC5Y
g3lhBZVskZIiNDc6SV6g1jmUIP4RWIw/M0tzviik+l8NODMzu9s=
=m12M
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
