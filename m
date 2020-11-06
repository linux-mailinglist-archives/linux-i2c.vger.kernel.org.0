Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA412A97EE
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Nov 2020 15:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgKFOxV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Nov 2020 09:53:21 -0500
Received: from www.zeus03.de ([194.117.254.33]:58198 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgKFOxV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Nov 2020 09:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=r9NthCaw7FxdKafl3II/+dxrDj38
        rDzcvl6th0tpPn0=; b=ZaR1mcY4kwnx6x5yYTsa08guTyz6IGeSJsqsHK+oSC9D
        GLj9SrsCLESWNhtu87ScLrfaneergTndxhgJbRCcK5Zss8VrUdxME79EFsW08fnd
        47YNky0KvihH0LpSsX7/X5VYMLj5nVYMkOZD2N0iZW9qWXuTi5TBct9hE1c6elw=
Received: (qmail 982573 invoked from network); 6 Nov 2020 15:53:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 15:53:19 +0100
X-UD-Smtp-Session: l3s3148p1@nqaUX3GztKIgAwDPXxn+AAvEwmht7CYV
Date:   Fri, 6 Nov 2020 15:53:19 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v2 5/6] i2c: mlxbf: Update author and maintainer
 email info
Message-ID: <20201106145319.GF1059@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khalil Blaiech <kblaiech@nvidia.com>, linux-i2c@vger.kernel.org
References: <cover.1604432921.git.kblaiech@nvidia.com>
 <d13cc817ae2f5b6000d3e7b5a18da697ac8e1b69.1604432921.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V4b9U9vrdWczvw78"
Content-Disposition: inline
In-Reply-To: <d13cc817ae2f5b6000d3e7b5a18da697ac8e1b69.1604432921.git.kblaiech@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--V4b9U9vrdWczvw78
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 02:54:42PM -0500, Khalil Blaiech wrote:
> Correct the email addresses of the author and the maintainer
> of the Mellanox BlueField I2C driver.
>=20
> Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueF=
ield SoC")
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>

Applied to for-current, thanks!


--V4b9U9vrdWczvw78
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+lY18ACgkQFA3kzBSg
KbaN3xAAmyCaX7GinJ72caCaOckUBLUek0aRCXwHjA22ww9lJLD2qvV2FHm3nlqb
67wZvtdgQvrHEEKQJ5gaAmgucMgq3MtHtYkWxFCQFLWtI26eW5R2tpmgx2juRrr3
cUhtY4fxalmgHivDxcFJU91DpJFUAwbx2tKvnXEMbKOp7dadF8bq35BtM8hDJ5Cm
s7LDY2PSIZ2jVIQV8c1p8wOjntHso5e9aKl4I0KjnE5saO5dpqk18hJRoPPlwbqO
Kof6riLBJYr59ACHsC2zI04R9xm7jI1sdGy1nTLYYVevib5hLp6mCyHFQo0wGVGK
0NUGQgQ6CyC500mQhs1pACMCbGObzbxMi50LxJH4bIBIu+7zoqh8KFWsLaJ4PfNo
MW/ICTJRjkIRLfjHIvxdOpBu75FM7BjRuS0Xv05uPbReoGMfMAEqNYMq+kU2VXwO
8EPOrRXOeoF1RKTHAifQDUaJt6DKdc8gLtp9h5qa052Y4KDECZ5qbPnjeZeGsBbu
6SnRqewKI8H+Ydkn9uhaABMbmcu3ASNHrgerYewFpVZHOsxM6QKHhyujGeFDs7d8
7hUw1CmM7RG0MB+BEiiYdbw//wrHSemAk0yFt9Y8w7mSotZFBPIBngXwkPy0iJ5n
kVdMthlzI3asdE4r8dIwiKq4WfKVfLo1N0AtKBsVvGxxDHcnnuo=
=ctFM
-----END PGP SIGNATURE-----

--V4b9U9vrdWczvw78--
