Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C5B287218
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 11:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729255AbgJHJ7w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 05:59:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:45634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgJHJ7v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 05:59:51 -0400
Received: from localhost (p54b33b8c.dip0.t-ipconnect.de [84.179.59.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7304D2083B;
        Thu,  8 Oct 2020 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602151191;
        bh=jfNXs9KbJzkZ3fc9g3oTXmIXRmuu5c92dx3Jl/2RpgY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CNGAL6j8igMV89bdX5ykmhi6PnoJUrd72/SzoGs7aNAvn8tp89a3Kg1BL0usGmVG4
         j/bCCqctjOT4t1cHVpUH4f2b+n5fqqAXVCN995Sh+ez9TJlzV7DNmWtiUdtAc/DjAQ
         jiFCmwDbUHlejccXiqJDVi8NBw3e7hHFZcTVzvXY=
Date:   Thu, 8 Oct 2020 11:59:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Nicolas Belin <nbelin@baylibre.com>, linux-i2c@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: meson: fix clock setting overwrite
Message-ID: <20201008095947.GC76290@ninjato>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
 <20201007080751.1259442-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline
In-Reply-To: <20201007080751.1259442-2-jbrunet@baylibre.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 10:07:49AM +0200, Jerome Brunet wrote:
> When the slave address is written in do_start(), SLAVE_ADDR is written
> completely. This may overwrite some setting related to the clock rate
> or signal filtering.
>=20
> Fix this by writing only the bits related to slave address. To avoid
> causing unexpected changed, explicitly disable filtering or high/low
> clock mode which may have been left over by the bootloader.
>=20
> Fixes: 30021e3707a7 ("i2c: add support for Amlogic Meson I2C controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to for-current, thanks!


--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9+4xMACgkQFA3kzBSg
KbaPtBAAkuHWLMNn0jybEmjAKZBIbOlz+CXWeIoCShoBnN4pte2ywTTjm5sgkF3u
Uxkuo8wH1v6eirOOEO3lXuxO8pXuLNZOqKZCzX+7ReRqA4SaXQQioPKhd8drY+Ia
Om8OvYsH236YSV1njL2L4CiQ/WWZlbKo2WiQKeR21qyWrUvAiv3xDf99KkOKzGx+
Lg1KPZdyIHOwi7jZSr2oq84Rch9pm0YAH0kfVYV+v2WhoyQvZyQ7vd9w5lpdTzVM
L3Rdr6ssn2Jf84t91tz0uA1TiSD70G9PYN2skl9zDdJIPNUy9xhC/DbeU4JUGnox
SI09i14u3f5wSEFnQBQs23mMB+oMlQ8dhc+gnNUyq5RUlfNy5ScdwHYkOv+BWSel
Pr30tSS8kosB+JGc1Sz7J367UoTLaHjcKJuCZW9c0Bs5SR9FamtO4N3iEve7JPBN
HHqPx3qJanf12ekXN0DZmt0gg9kwxf5G2hmZq7V2dV537/nAGQIh9e6CJTcsBdiu
V30cL3q764QUjg61J1IbLW1+9L/gCQ6PuA5ND4tcpl/3rjtqJxWqhgKrDQL2+Q+K
WSTyND9YyLFk1cd/QU7AVtOlpNoE0xPVxlRaRE+Yr1TBaS57hsTJX+tum9tzvTEc
pmjsfWCQREYH3Rl7aJ8qoMJmP4MQLcxAmcn7Qn7Tb+BxTGK18Ho=
=dWyY
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
