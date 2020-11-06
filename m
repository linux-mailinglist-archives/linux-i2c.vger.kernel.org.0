Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C752A97EB
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Nov 2020 15:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbgKFOxI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Nov 2020 09:53:08 -0500
Received: from www.zeus03.de ([194.117.254.33]:58128 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726694AbgKFOxG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Nov 2020 09:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=xwj0jKtQyD70IYsPun4IcE16oYiw
        vWfgQMl35vJpdWw=; b=ma0E3csqPfYJPwN+Y9v3QqWQor5epf9RLPU3ooYNN2Si
        CxMAregPgB5zhXvU0oIVZrPymSQGx6s4PyVFEk3235IIJKugfVOfiFM1rh7ikjMA
        gpKp1C8U59MNplSKBP5Co35rT3m5UblWGtJ3kkZANgA3JNPt5UzKUilysKZreuk=
Received: (qmail 982380 invoked from network); 6 Nov 2020 15:53:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 15:53:04 +0100
X-UD-Smtp-Session: l3s3148p1@oumpXnGzrqIgAwDPXxn+AAvEwmht7CYV
Date:   Fri, 6 Nov 2020 15:53:04 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v2 2/6] i2c: mlxbf: Fix resrticted cast warning
 of sparse
Message-ID: <20201106145304.GC1059@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khalil Blaiech <kblaiech@nvidia.com>, linux-i2c@vger.kernel.org
References: <cover.1604432921.git.kblaiech@nvidia.com>
 <dbc627e710b7eb6e5127245c33a4e83ab8e5f21a.1604432921.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Content-Disposition: inline
In-Reply-To: <dbc627e710b7eb6e5127245c33a4e83ab8e5f21a.1604432921.git.kblaiech@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 02:54:39PM -0500, Khalil Blaiech wrote:
> Address warnings "warning: cast to restricted __be32" reported
> by sparse.
>=20
> Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueF=
ield SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>

Applied to for-current, thanks!


--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+lY1AACgkQFA3kzBSg
KbaFbA/+OaRKf26wttnvSCnv1RC4XKgKpvARBS6jpIpM4bi0KJbig+CclvrEIEmn
ynbPb9VqO57A5cCVd4wr7As4XZ4H85Cnv0kQjRy2xpboFlXpof/jyvsB8a1jLnCO
q3SLrqOFFxjF03lDwrL3LbSgRZPuejpDh2yzzsDthxyIMhbgWnMyxqSWxkkrmBp9
ZqvuDTem6B+ddwile+nUI87iMYJdxARIQPjMIApBdFuuPz/3pyCowntpiKRcDbm4
+nQvT0awX6vtbJQkNLKGcVc+5vVRkkXXwWdHTXWCyojbZgvF/mMFT63XhUJmPRNL
vijl0ZEcXyKhH2GHzq9jsjgIEIVuU9t3hy3/+Se9mlUezB95Z9bILzzEXRx+D/YY
OyXtM8baFxELtV/U8UCsdr8PI7VPpEFHWiJh57xmxustMRiRmqiqbvvLOu41LT9j
ZARd15+ot3wCdLQAufJGbBex+/DUpOP5B4v6N1+JxLaTEuD9qWk5cHkXKcqUbiK0
KvdextEgoyQssXKKM06RkhFRL3btTQP+Bv75EQDZAYMgyJNP0DAwt4N/a2UjyI0I
GB7LL4z/5ErrvmA8TC1+p0lR+PS2zpqYTSOf8phGLP5xJNb5agWYQ+XLpfh8rBeF
Y7nBSk1fCd1hc48QnWe8MmIy929Mk+v9hce8tiUNsRxR7VNtKEs=
=KUYZ
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
