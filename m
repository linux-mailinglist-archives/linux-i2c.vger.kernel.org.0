Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62642EB06B
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 17:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbhAEQpx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 11:45:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:43308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbhAEQpw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 11:45:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD7D922CE3;
        Tue,  5 Jan 2021 16:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609865112;
        bh=+Njw+SDMtA1uU4UfzsqCVDY89V5vyYunbXDgVc/ltTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FmwesuG5GCdu3fj9lCxg8tDlRKXGTI9LinuChq9TlmCGJA48rsjsG9aYmg96xb5A0
         QD1WkZHTtkdNWAE8WzwIMg4PUyMXNJXV68piW8er4r6fWdj14UH1z+jQLhg86JFHck
         VBVs9/7damekfKXM5hc90zK2Jbrr6l8CuDWti58WJVHqbHCSoIVwER0jA3sNClID94
         /X9nxjv+W4QP0mtOC8X0RxDSVMlyqBULzZ6xFW2grnOoMZMbSGVpinJUrSM74kkWd6
         kgmNoBN8oUECMi3RA5e3zawC515Mh6qx5pzg4/Ff+uotn/p4yZmQciBxjANtLdLFe+
         YSFc3vwEeP8Ug==
Date:   Tue, 5 Jan 2021 17:45:09 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux@rempel-privat.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com
Subject: Re: [PATCH -next] i2c: busses: use DIV_ROUND_UP macro to do
 calculation
Message-ID: <20210105164509.GM1842@ninjato>
References: <20201222133131.19525-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XRwESHC7KXlqFpSs"
Content-Disposition: inline
In-Reply-To: <20201222133131.19525-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XRwESHC7KXlqFpSs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2020 at 09:31:31PM +0800, Zheng Yongjun wrote:
> Don't open-code DIV_ROUND_UP() kernel macro.
>=20
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Applied to for-next, thanks!


--XRwESHC7KXlqFpSs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0l5UACgkQFA3kzBSg
KbZgJRAAirRW3zmjJd7w5lwwIKktCVMzrw1sHbY+PGj9hAyMOoutJP0BmxZOR1gk
nVx1cVW/33pf1lpOKidKKjExkEYU5pvZwjE/5UlexdZuDLx2x/19hpIR3VSzu8IZ
wxMo4Ln308xhQKW77FhLEE82ZQjEXrxSHFhNATr+2zmW0Q80FYkHlC5qtm6L0yaA
5mgNSWLBpo865po8UTXJ8eCdwsL1/hU5lAkOrf+jYTdDYokJdgJgxCNyLR2cft8p
EiQXzP2J6Ap+we+aw7ZWE/zO+DTWr31BDBx4REK9esOwVTe4mx6QR5DWi5uXKNg7
8x5HtKlYYbcrhhCKiVUN78KiSgKoJ+5LRkVbgRDVF5Ox3/a8xw8H8FFupCG0ZAyM
bo1j8e9JguclTqsSVIqMygjrXGtHpqYvnsF68r+zb2jWnsH2JZT6DgmGkcGwiGXT
CEEkj1oaF8nOq+yfYjjIxuYw5QHYCbXNTxLzfmyn5eprET5oJFbMScrtUtO02oFc
kFbHY4vsFQ3aZ8KI++Nmkb5sCxyx+jwq9cXcTKLOI11FgogAJRHnjwj1wZd0Mf5m
tmREYGoJ2d+kfH2h/CGOvRlZprV+crsvhjHCTAPNlwwgcofs1FS3GkEpQByvytDd
7O746nZHRNRKIySlYcE/JXmjAgFD8MU2ooP92RFGhOrNZ/FV4Lk=
=euB4
-----END PGP SIGNATURE-----

--XRwESHC7KXlqFpSs--
