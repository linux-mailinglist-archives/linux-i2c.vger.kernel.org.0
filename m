Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A173936D5
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 22:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235508AbhE0ULH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 16:11:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235753AbhE0ULG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 16:11:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55E12613CC;
        Thu, 27 May 2021 20:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622146173;
        bh=MD4J2hpk1xeU5cl0nEaJO2dPSwTZQkm0OHsvyW7KBjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aN8V4ufVBu0eueuZ2UlQIzQ+cVPjxlYfThohv/w/dGFbIm4ncmuY5PEoROltvyK+h
         adSDHexpfqhtWpPiQxajvLJaOnKvC0rZbdRE21MdaWswVizvnUDj5P93xz8en2Q1XA
         83aPgHhiHK039mtOXsWya6hRdATAhztsNGHC35JVzHZwfV8i+zrPtW8FMO2zrP/kcj
         hSbnQHHpXkHI6VHo+siruekRATxzZtCBkbtv8TXmmaGp3ByijvCrTZJsLhPsM32nfJ
         VUMKb4zNOLxogXf6SyxypGZ5xcXE2A4id8rfdyvW0GnpAqdr9FtpEHL+6mMBNBBNdG
         GhxvAHTUOFGnw==
Date:   Thu, 27 May 2021 22:09:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: i801: Replace waitqueue with completion API
Message-ID: <YK/8ev7JeGSE/HZu@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <561b74ab-b020-b0c7-c1ad-b7c3326245e3@gmail.com>
 <1d1054de-8b47-a6bb-a264-8456705e5875@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="09G5ccVIPj4rFcDU"
Content-Disposition: inline
In-Reply-To: <1d1054de-8b47-a6bb-a264-8456705e5875@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--09G5ccVIPj4rFcDU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 22, 2021 at 12:02:43AM +0200, Heiner Kallweit wrote:
> Using the completion API is more intuitive and it allows to simplify
> the code. Note that we don't have to set priv->status =3D 0 any longer
> with the completion API.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--09G5ccVIPj4rFcDU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv/HoACgkQFA3kzBSg
KbatQw/8DBNJjvw+XgoG5dBxdGGPWghwG4Ktq5bn5VCQ0E2Zum0vKr3FGo+cS5+A
+yW7FreZSRZi1ZyysHDSLdF1/FUKjxTJvnu22wk4YYgUfNlNcSZwgHQrQOFh5KIg
NT+hK1wGNR3SHiafLagMw8SM7nBd8owTKS788GgIuxHTxvK0iNUtEe1g7vVB+oKh
NGlymMSBHHcen5RDo85Ipd3kKfzUxZRKtZpHD3SHrYub9ZktC2w1Jf+ad5D5uQQY
eIa/Hg0LaZ+gIVlUkEjD6OPDH/SaN+BTWXxa9v6kMoiS+isriA11Yu06B3ftt73k
VbdtBhMgWWI6FmGR0Nw4OhoMbz20PhoMXQE3lWEQvqrLm/36+Qk0VX4SU0D6r7lv
yDS9YBS9mPXb+xzyHtfh/f9xdk0epsBJQoecPoccMuZhqwJx1J95Mk8RFpKYN/9E
Xz+yZlPuRcBbUAPML8lEtabtQzWFEHFtJArZi1JXxk+W/YGkn+ol3TuCsws5xkl+
zBjyRisnGIjny1LiAQakkgS58wZ6Lb4hVVrj+hC+XA301sqqBMFyP3InUgNQJuZZ
LmLu48MM17riUnn19k8Rf8WLb7s9kb5R3lWBqpaMnfOi+KJjan1uzdL9h5rdMjYp
2ZFWMo0045lnmnUsQb8iQ+KUKCo7XE99cbP/4dSdIQx7tns1HLA=
=+IuX
-----END PGP SIGNATURE-----

--09G5ccVIPj4rFcDU--
