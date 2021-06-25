Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6736F3B4655
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 17:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbhFYPJQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 11:09:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:40814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229940AbhFYPJQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 11:09:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EE1961864;
        Fri, 25 Jun 2021 15:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624633615;
        bh=3M6hOEudsa3zpAGE0XHKdEdXHDXXzYPykDLAUeK/pNU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ILrl/wVuUFiZOMBqZDxWBAvg/XYXOSF/O57L7t4wKNBRja/6kkChofS5kUC6K9KKv
         jX+Hdc5kyLSgkOk6B2deuVOz+AsqHI+GuXZJxH2aayE4kniQXjUH0NnYkq1lYaGKng
         LyRl+yw1nPfjFdkwOlI1meLu2CifOFGbCc5Rd7UNSu5s6jbQ4+HniI/rNKsyG7JWfj
         sjnwzz5xwbUpjmKh/IZiyI1baycaLpMiLDx1YEJxsjN7SYi/6JWGJ91dYMa7W+1H6U
         m0/6oh64f2DPDW2ifddF/hrdlha40L1+6bnSUf2vtUcfpFByDz8qeFw38G68NbEElL
         rXI7BKMgrb94Q==
Date:   Fri, 25 Jun 2021 17:06:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Matt Johnston <matt@codeconstruct.com.au>
Cc:     linux-i2c@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: core: export i2c_smbus_pec()
Message-ID: <YNXxDPIBQx92HbxE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Matt Johnston <matt@codeconstruct.com.au>,
        linux-i2c@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>
References: <20210517031138.133934-1-matt@codeconstruct.com.au>
 <YLCs5kPBicVLIpCB@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q11c4jHp0mTGrIO2"
Content-Disposition: inline
In-Reply-To: <YLCs5kPBicVLIpCB@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Q11c4jHp0mTGrIO2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2021 at 10:42:14AM +0200, Wolfram Sang wrote:
> On Mon, May 17, 2021 at 11:11:38AM +0800, Matt Johnston wrote:
> > I2C slave interface drivers have to calculate the PEC themselves
> > in the i2c slave event handler. This will be used for an in-progress
> > driver for MCTP I2C transport.
> >=20
> > Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
>=20
> This is fine per se. Yet, there should be a user if we export it. So,
> I suggest to resend it together with the slave driver using it and I
> will ack this then.

Okay, there was another user requesting this feature with a patch. It
also provided kdoc for i2c_smbus_pec. This, together with the simplified
dependencies of two users in flight, made me apply the other patch, so
you can base your work on top of for-next or 5.14 now. I added you with
an acked-by tag to have you credited, too. I hope you are fine with this
approach.

http://patchwork.ozlabs.org/project/linux-i2c/patch/20210519074934.20712-2-=
quan@os.amperecomputing.com/


--Q11c4jHp0mTGrIO2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDV8QgACgkQFA3kzBSg
KbZFfw/+LwdLtqPoNj0oOU2dw1slucWXHqc+xrs/RlsiJDhNqpRK5WOr8usP//3w
RyILhvNjuU/fXbhBLtsVkdUgXNargq/wPd5sOYLTPX3us4jxluaJFqj1bRws0CN1
ptxlTl4CZgYXbSp1njcXrTxZRZGWPdY/HE2BN1Fc++4a/CclKGnCx+J6EL+VLChu
b844qpoRaN3EiMNiE23U8Owk/3WQF0ZqvF1DvwAJz+vMvSNqZjazG2irYK+yTEtW
H/UdUkaPRB+lGV1k8+J/150cFmgZuzCdRoEx+/FcYgXBjTuIBv3mXEKARttDofDU
zhpMWHx4M7JvLhD5y3Q8+rlh4YRO3hH01B5ycKWZHBR/e73RwFjVoUoitmp+462C
Y9QnyfBN6Cr+WQwR2vR+aK0V+VMO0fXnFk8RiJILp7ktWGtMnT2q655RyZl0MvIG
p4bVjcGDX8KO/2EXGip8LV8hazC4eKEBPsFSGi5vLZwawauBXCmY80BZNmvq+gW8
SdMKag0txg8tleS1hIbXTbycjm2Gq0d06H1LhbCJHfwIvfUE6RrY+rBNFVZ2G5//
HlrdEybhHWsU40RCfysy7xy7jW7+7n2PGFqc+ZqIxEzZPjRAPSXvmgHsGb3ohPxN
LZhX6pCc/Q/ia4lstUzjxGvMXTWCBF57AzBFcLeEnuEWiycPnm8=
=8ydR
-----END PGP SIGNATURE-----

--Q11c4jHp0mTGrIO2--
