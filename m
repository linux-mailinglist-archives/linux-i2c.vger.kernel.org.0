Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90E36428ACA
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 12:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235859AbhJKKei (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 06:34:38 -0400
Received: from sauhun.de ([88.99.104.3]:53292 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235858AbhJKKei (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Oct 2021 06:34:38 -0400
Received: from localhost (p54b3315a.dip0.t-ipconnect.de [84.179.49.90])
        by pokefinder.org (Postfix) with ESMTPSA id 70FA92C00A6;
        Mon, 11 Oct 2021 12:32:37 +0200 (CEST)
Date:   Mon, 11 Oct 2021 12:32:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next 4/4] i2c: mlxcpld: Allow flexible polling time
 setting for I2C transactions
Message-ID: <YWQSxYt5iw/6szUG@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Vadim Pasternak <vadimp@nvidia.com>, peda@axentia.se,
        linux-i2c@vger.kernel.org
References: <20210823144504.1249203-1-vadimp@nvidia.com>
 <20210823144504.1249203-5-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FkGUNGELixLodsfl"
Content-Disposition: inline
In-Reply-To: <20210823144504.1249203-5-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FkGUNGELixLodsfl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 05:45:04PM +0300, Vadim Pasternak wrote:
> Allow polling time setting according to I2C frequency supported across
> the system. For base frequency 400 KHz and 1 MHz set polling time is set
> four times less than for system with base frequency 100KHz.
>=20
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied to for-next, thanks!


--FkGUNGELixLodsfl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFkEsAACgkQFA3kzBSg
KbYfrQ//QYSzxsezgMLxp8kLlm6zls4wiFz4RgWl6zDIbWJcWlBoCNxOaFzjIyXs
cntybAdGGWQ3T0Cp8omONVkEwT8hgNHSTB8PT5UGxNR/86s7wScggAkWXSIeD4RB
sG7Ll8KINVt2klXGelloIWr0Ci8kse5L5k6CIJrL8WvI0Ka5lpBsalvMxGArPlkM
BqyKbUOtBvEsTWRaA9001p0T2v+SPJRZSiJQ0GytDewSxxV9eSCTOk3k7zwUMP3n
33fljvQtvQgf+4UOGJE0TAtFqdIiM/CnWhN0g+upnYHqcD6ehiNfaol+Vgkuoy1r
2oA0MRv0y7BmuEvlC97SPooKka04Dx4AJHlXA/NDH5gy9Rp8PWVIiG6zEFLo82eR
a+rt3OHeNxvuUqnKfu/sHQM2GF+sofuEpTjpOUobo2Q2gE+3qUq2EqemwnMWVjw+
fXQSKxyOHyWDM860kSx5amaSXrkt355bgKRrnw/+BtCpICIKnLvvkcJy7ynjfFY/
zF7nDuRu/ZOg2d+H7MKhJRkBYOcErk1xzzDrZqNALc8taWAPjRO4oYAVPOC6brQI
DWXS3NXIgSC+EJY7KleLLxXIL5h9PFOn7I3rrSrbSXOX8ZcXF5Mqc7OTcYHy/Kfb
jrAzf8kVFt2cL/Kg5j44A0lBnfE4fxL1JID4vPol/V2+Lo2nX2g=
=VLAv
-----END PGP SIGNATURE-----

--FkGUNGELixLodsfl--
