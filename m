Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B311845A21D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Nov 2021 13:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236446AbhKWMEE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Nov 2021 07:04:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:43232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232056AbhKWMEE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 23 Nov 2021 07:04:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 404E460F42;
        Tue, 23 Nov 2021 12:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637668856;
        bh=XxhDFMcZhTax+AsIJ0o3A9i6f/HhED/LPUXrzhOhYgY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FkBCpgy3XTDfdK1H7kIXQgrrcRdhV8BQwhtn5aJ6Lc/7YUt6MzApJwdf7vbDsaeuA
         vfPEXjikeno6XA7fzUyZIYbM99by3ouLZPTl3GDKGdCD4hOKdOr/7ExfKL2j/vv/at
         z3NmT5DJRZw3uAlS6YM3xGeTQhHez8FYe6KRhUYbxvd9Sa4o4FWOcMk8LDsvHqf/aw
         jLk6Kt/NU83x4puAf1kAKeXdF3/HLimJr+kENO96sM1YxVlN8MUV9NOuGX36b3i/Dp
         N4b1m6VsBv+0sV0A0V73iAUHvdgmWL2GWDt/ezVsDDOmWZMIN7JM6PHEkdtbWKxyvJ
         4FuJRyxDeEabA==
Date:   Tue, 23 Nov 2021 13:00:51 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: i2c: smbus-protocol: mention the repeated start
 condition
Message-ID: <YZzX8xcrKTpgWrWa@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211115110818.888974-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ttFUsFYF9BeXr5cQ"
Content-Disposition: inline
In-Reply-To: <20211115110818.888974-1-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ttFUsFYF9BeXr5cQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 12:08:18PM +0100, Miquel Raynal wrote:
> Sr is a repeated start, it is used in both I2C and SMBus protocols.
>=20
> Provide its description and replace start ("S") conditions with repeated
> start ("Sr") conditions when relevant. This allows the documentation to
> match the SMBus specification available at [1].
>=20
> [1] http://www.smbus.org/specs/SMBus_3_1_20180319.pdf
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to for-current, thanks!


--ttFUsFYF9BeXr5cQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGc1+8ACgkQFA3kzBSg
KbbcPBAAhHghR/CNJWBHv4CN7ZhFeSFkZrVw8eKCuIQrpUssuJwj733eaR6hA0Dp
ZhiOP8gL13hdvyy5LdHOoGY48LHWFzOM3oVSo47vNvu0weWZJ2fTtsJgKtS84JPZ
Bo/cQ17b9AfoJRu2lXz947n0+d7hqbUpfkRRO50oFziJZ8ytuGhrNUQT30vWxXUR
h5KFdYxWotqAKAX0MJXN1xnUmZhWwX556O3urR29QC9VYAqwSsTXMQ4w/Sgk0ieJ
eYptUQALV1EREjBpbtvUgnWYR0VZdIsAvkgBNfn1gpy9MiMc8MgpCDtLYKzmXkWp
EUT3g6Q+ylyCWKk474nmz/qNm5HPYQkHaZbdDzKbKmJ5TS1rbOubLEawIHwoc14C
spJWbL4CMukFlC0TIivHpsLx+y6SKS0MKZZmFblVgQVbKOxU31jscHwTOiZrYRsX
qIc3YTtHM6Tn5MtwrXK+y9FwAg32uEGxvO4zbT4iGjuybAnNe+hCb6qvSVlWQ6zk
QQQz1xqYIRXSwGOA4fqgwlkFtT0HCGKQkvZf7Og+hMAXRC1ONIKbeHhpkv05yLXb
gWOsKRg/YRs1PwODaLeXCC87R3ONr+TaEqMBILGsTJS1xUayY+npjF/ddN2gKCFn
391Xvvmw/nC+vDgDd5ZMrOtVA1l+xBuvs7fg1MMvrxGff5Cfawg=
=dQAI
-----END PGP SIGNATURE-----

--ttFUsFYF9BeXr5cQ--
