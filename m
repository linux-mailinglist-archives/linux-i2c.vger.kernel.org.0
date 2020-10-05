Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 642A82841D6
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Oct 2020 22:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgJEU4t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 16:56:49 -0400
Received: from www.zeus03.de ([194.117.254.33]:36310 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbgJEU4t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Oct 2020 16:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=GH6IZz2J0smnvYp4WcPnt8raTfHb
        dLF0TuAgYRXbQD8=; b=eBguSYhLlL6WW7j+nMtS01HSR0eoaBLMdsoWvrcp4fYJ
        3IZmDHZnWcB4t+YGSar7qNJ8ahxXF2BoE2KPeRCckcbf2UaJeCBwuMxxWkbF+HoS
        WHBsAoZMtjFVvJRENSVOfvsApKz+sz/Jg6VTiA8ws83bcGe2/vm/ylEiQRcoED8=
Received: (qmail 2370149 invoked from network); 5 Oct 2020 22:56:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Oct 2020 22:56:48 +0200
X-UD-Smtp-Session: l3s3148p1@ZqWHuPKwhrYgAwDPXwUgANl8elq/Sjdv
Date:   Mon, 5 Oct 2020 22:56:47 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] Documentation: i2c: add testunit docs to index
Message-ID: <20201005205647.GD1397@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20201002124458.3059-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5gxpn/Q6ypwruk0T"
Content-Disposition: inline
In-Reply-To: <20201002124458.3059-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5gxpn/Q6ypwruk0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2020 at 02:44:58PM +0200, Wolfram Sang wrote:
> Fixes: a8335c64c5f0 ("i2c: add slave testunit driver")
> Reported-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--5gxpn/Q6ypwruk0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl97iI8ACgkQFA3kzBSg
KbYCvg//YaXGDmY7UkBI503/3KZDhw7+rejwjAyFrlAFMJ3Z1DkLdhaBuUNFJL9+
CzIfZVi0VykgQoIMuRKw6Cdp+GxLFHWPSeUZ1zjOjZ4e2YVzQfWJm/JGnU0Zh2V2
W2mL8bmu80hzXrIx8neITUqgP051jJYGl3sUfIxHGKTPNWsto1pQQs289BrunyCP
3g5BIHms0667PsPJGUtm/YsfxIXbg0Ec2rqpIWxu5SBzP7z6P1AX4yVFQ2rHtfZE
KLhFlzvK2c0GjaezrQl9dhMXMOaH+/KZlR9/QItJH6d1sva+Z6BQ1YY/MRxr/hv9
LYA+ygN/jF8kbm+6EHq1xSLSIT9uHmXQpTLhC0CZ28ZHKjhquqUJzFsL1KYtGhUa
VVXlMhb7s6Fz1u2/oqKCnpG3HRVAHEwawUxR8dTrkpWHFogSGB6tz3LcMAZipHay
TASWQyuZv9UGYGkXU5BQtaSUsjJsdu5AlGbV8Sj4JNrkfB90aWovqN5Z4SYTS9P0
2HOVvB+gfT43DE5Iri1h+tCqeHzgNjfGt4jvkWjuFV3mGnEpeXZkjq90aXGs3/aT
4ZbS41gp2zlNQTsS7+elz2wGh86jZuqlES3QpgANHFm/QI8b5IYTLMTABDKCKABd
12XgaFiFQwkNWir0ISfB0wv1McCXH3c+ww8Cd28d5+DMZ+vpadE=
=17li
-----END PGP SIGNATURE-----

--5gxpn/Q6ypwruk0T--
