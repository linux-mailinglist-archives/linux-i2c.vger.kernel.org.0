Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B47B2FFED0
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jan 2021 09:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbhAVI5B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jan 2021 03:57:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:55398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727115AbhAVI4s (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Jan 2021 03:56:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4204B236F9;
        Fri, 22 Jan 2021 08:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611305767;
        bh=pRam4RRPk7bs5HWbgv9qL+rMAeIAaAefaxRUheReTZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K1QGFF76BVarGNqAwldxrfiPLejxKX/t045GjiiK/++/pCGekQo2AHiZ12pAEoYX8
         ZfqWd9+Ams/9lBo3+bgbOtVzfZLV+mJ09ET0aMSu2URsT7PFWsyM2rEVGXExn1q073
         RvZOlnVs4Ya0TSA4g98PgBAkzBb69jlZ6GLuvNu5aY1VtQzwoBmHF3bVVHPAnsXRYd
         CqB+UWfIsXG2I7HZv1/wyCx4+mH62VVjKWCMvIPbRdaKxpfRZTmbYj3ye7c1kYRQcS
         j5CFWohxfJ1ZAyi+OCtfzATVABNoxvqEWOKGFnoci1+hERr7Nk99xzBQ7WpWGvHyzu
         f7GlDQhuGeO2Q==
Date:   Fri, 22 Jan 2021 09:56:04 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Barry Song <baohua@kernel.org>
Subject: Re: [PATCH 1/3] i2c: remove sirf bus driver
Message-ID: <20210122085604.GC858@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Barry Song <baohua@kernel.org>
References: <20210120132834.2375048-1-arnd@kernel.org>
 <20210120132834.2375048-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YD3LsXFS42OYHhNZ"
Content-Disposition: inline
In-Reply-To: <20210120132834.2375048-2-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YD3LsXFS42OYHhNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 02:28:32PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The CSR SiRF prima2/atlas platforms are getting removed, so this driver
> is no longer needed.
>=20
> Cc: Barry Song <baohua@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to for-next, thanks!


--YD3LsXFS42OYHhNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAKkyQACgkQFA3kzBSg
KbZmEQ/+OuZ9iAIlgmhtK+JeGO5Dv4dmlGVhEbQBOrihaBUROjM+z8ZhCoOn7d6Y
I2ERvIMrNUqMUG/dgo8aE1z3MKeUKbHCVcoNJt/CsvdkGgrCz+krJW+9bThQ3eiz
oc5+8jKIif6JlpSYVmp2+x9oE1BIzQY0sFEDO55Kb9bcwR1O6i5/grc40g2mg3Hc
voDjjA8orelvtM5DhucCIMtX1/hgHkme0V1ujbmLt1tYoGXSw6AoF2z3rMlNeijL
lfGlaFmfRuXgksXHX9IQ9M9V5TElhy2V33yqzj/barqo7UDUNIO9PJEoQGHE5PNL
yXUNFoDnmz/YufmrH0Dadnqk///fm4sbj9suqZHd49vySdEgCm6lPNOWCy7VX3tf
LZi5sVH5Bnof/gdiz4R7ajbD4Ehnit+kPHMLmJp6ToAtmFmmbQHHkAmrJAB4m3So
Ilm7mMLXQqDlNYU8/MtqAP2ezDjZklKFqmIEdzl67fU2Z7F/9wDuqYHJweWcmrYT
bDR3ca1Bnw1WdwySRrjHgwtggrNu5X6XHT1rsQ16LWFAXVJvDtVVlGMWjeBga3AN
f+RX2EC6ARaYrffs/4SL7JnkscFRdON8Nkj0hE9zL0sKBhN1PYIJh8rTJ9E6DJ5F
Z7Tt2eQBMuCqLpGtTN9WhegirSL5FfamXA2wDEiGI/h9ZseTCtM=
=eOmQ
-----END PGP SIGNATURE-----

--YD3LsXFS42OYHhNZ--
