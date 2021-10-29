Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3634E4403A3
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 21:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhJ2T64 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 15:58:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:35670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229886AbhJ2T6z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Oct 2021 15:58:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55149603E5;
        Fri, 29 Oct 2021 19:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635537387;
        bh=ODAX8+zlFOS3VzXE/cJ9CfQfhPd1058qUEM92Yfdeho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q1HhJmzqETOHFeQgalcjCTa0xOTGQZ4pdfbf3RscXWNV6i04U1jIj8xgMXLucOwcF
         i6bqcEt02FnUKjXZInf/lK6/qXxxBuUcLK061tL/aICoDBoOlXbnPSz6dMBV1QIvrV
         gtTGVVnDSHWQ5rbLpvgIuR+IJtO9Kive7Tgjn33xVtXwueE3TJwss+rNBggtfWfQli
         acCO8oJIE3IWZW1On2GtfM7D1YWYzw39jLDp1nBH+3r7iR0klw95cmpeAiexTvPNP2
         Lck04pMYa5LMQx803O65gb51fIqfb9g7mNx3vUbCIjyy0GStB9K9uJYLBBNe7opHFA
         iP+bsmvrNqmpQ==
Date:   Fri, 29 Oct 2021 21:56:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-i2c@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: fix a trivial typo
Message-ID: <YXxR57IqlMfKFfYH@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-i2c@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
References: <20211025050313.32409-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BAizD7Sx6watkDbG"
Content-Disposition: inline
In-Reply-To: <20211025050313.32409-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BAizD7Sx6watkDbG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 24, 2021 at 10:03:13PM -0700, Randy Dunlap wrote:
> Correct the typo of "reamining" to "remaining".
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org

Applied to for-next, thanks!


--BAizD7Sx6watkDbG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmF8UecACgkQFA3kzBSg
KbYjARAAr4Ju9N8h3XFjvLYCC9t6xTjQBw2y4SZkcKFvsS0e7prmwLO5Ol70LLma
wU+uRpIZSOpuPbrtX4s+5FKO52IjhRkkWMNd+ARebOOrGZ9rPYZEHUQP/0H+mW7V
Ydp9GcH07ubzsAI5vR1H8WtXLx0QSKpwR/Ch0EBhjH4VFmkF/Gy7wXiBQQC0zWeH
v/rPqGan1rxH+lDQMEYo3K8id8L3e5vVcBlYWnwQDslBjXZEvPgB5JBYYYl7sBi3
igcdYUPmn5rwYBD0zmfqLhE46l3a/uZtSbOVXO2hq6TsXhYkFaysgRD10vpEFMao
MuiwnoWUcnBBqXUhZ5ZDvkJxucpVsVnSmBWIHthq9JttObrEmYHgQy+WcqHbBoh4
EJjYGrAc/GnaTe/4XGoMrIni8gE82M2fzc2iN4KpyZlKFHjIfHOgpKqqX0lL+zoz
mCmg6tagVkzLm9+cj8AnlQ/SRySBJIeI8MoSsN6D+szBybrkenv3vOpJDBn+5JCY
PHgSqeE/XZfXKgQY87R/0UinzWiM/pvJHrIQg4PDTUgqtwLHXro8bBcTmT59JyLs
YPtyZTBw2dGRXDOD2tgxJb9J3H1kACA5J7LB3jXtGRy2y1jftKs+KSrLoMf532ba
6v4BUDXb+JnLlWI+Q1RrVd+jJbPgrq2/11bENS9I4oPAJKiuBpQ=
=ETIs
-----END PGP SIGNATURE-----

--BAizD7Sx6watkDbG--
