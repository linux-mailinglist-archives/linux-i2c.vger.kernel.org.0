Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E699B22968F
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 12:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgGVKqk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 06:46:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:52010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726390AbgGVKqj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 06:46:39 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D3B5920771;
        Wed, 22 Jul 2020 10:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595414799;
        bh=zMxayXnb+T8km0X7Uj3qdpIhgAE1GlzJu4QstLolnz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EhVpf+FpJNE/5E47yFwx7CYR5vDQ1ymQoiPzoUj02gzfilvvvNls+e8Vm7PfFdS+L
         SSyYNtnlzWOmClONmOZMs02AZR8OQf2iqNrgLiY79MEJUR5M2UsxP+TGJ/dZBJHiqd
         +hRa8hubeNlj3x5Bp6g7VzA9Pg/F8gCvjElkNs4I=
Date:   Wed, 22 Jul 2020 12:46:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] I2C: linux/i2c.h: drop duplicated word in a comment
Message-ID: <20200722104636.GL1030@ninjato>
References: <1d07a587-83b5-0bcb-2185-48ddb5dbc9d0@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4oF+6Ged69J0+4/e"
Content-Disposition: inline
In-Reply-To: <1d07a587-83b5-0bcb-2185-48ddb5dbc9d0@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4oF+6Ged69J0+4/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 04:38:15PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>=20
> Drop the doubled word "be" in a comment.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-i2c@vger.kernel.org

Applied to for-current, thanks!


--4oF+6Ged69J0+4/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YGQgACgkQFA3kzBSg
KbZffA//eZvnRc4my01DBH8ZF78vnulGtE0ksUnvvguffPhcstLCd/6oTYtqg69z
9PUei8yDFiD5RTajNLSsup4RxxvakXuYZpmTtXPWpcpXxf2Yzr7OeqxT5mFy0/Rw
XHwSyGJAtXSuRmXDK3kgBnfSbOqeIbP4YODxyy129let0Pi8SsGkyd6LSwXceJJ0
xfGWrEc8jkjsLaVV6Cdb96FoZxtY/rUKEHdvjGYGtAldtwEbTsiddiCum7bYj2tP
iR/csNlI0Tk5x6RpK7p+W/taSi/GUMcx4moSHlBmFSnL0I2Fq0bHT+j0hRmSNSoe
V+4z58hjm8mOhgBzSGctjEgW5jKvXrYLbWzXmaBPtdM9N6AcjTcjafaVu6SK2/Sd
YDnl4zHwL9uOOVv3hcyraljdmq59JlRq643V09PToiZBWl9aH+sxUqtdFgdk7m2r
DfK9J4XtlwSeQo8xOM8nWoQm9/rbdrbgJWzcDRm/G1H+zMQT4GIJgqQHxt7z3O2X
msYz3sCssqzb50UC5cFVNHrWNIRWQzri9KhbdNh57ZH59DdoPtVorP7pXejQPaWm
Vvvht42wYD/d/jlkqSTuCqrKIxxwFIAaibABg5v00fc0FsTZS3T0C+a+Obcv1sNY
0q7+xyrUSQTbAleKlhy9bQCAjEhpNBWtiRa3kmqUWL25sXs0c60=
=K1GN
-----END PGP SIGNATURE-----

--4oF+6Ged69J0+4/e--
