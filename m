Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D3D251314
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 09:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgHYHXS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 03:23:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:56650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729363AbgHYHXS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 03:23:18 -0400
Received: from localhost (p54b333df.dip0.t-ipconnect.de [84.179.51.223])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82CF720578;
        Tue, 25 Aug 2020 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598340197;
        bh=LF/riJpBXNMpway3mbGQoOMX5wOBY2xA9GK//UrXxgE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nbSVoNEVuA53O+cqj/7HUS+eazanlFJ9Vh+Mt83yv8USlUlrq4mBy8J1Ps20q2kjF
         EZcs4vU9EsS0UJzV7rT6mzRmih1wV9XoWp5ngxgA2FKv8Ct5PJsvmG1HqI4N4jhOdK
         7xQcK3IJfk/2GAJ3YFDb5lKlaMPrBS5VdKRiKWbw=
Date:   Tue, 25 Aug 2020 09:23:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i2c: core: Don't fail PRP0001 enumeration when no
 ID table exist
Message-ID: <20200825072314.GD1861@ninjato>
References: <20200821170334.43555-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline
In-Reply-To: <20200821170334.43555-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2020 at 08:03:33PM +0300, Andy Shevchenko wrote:
> When commit c64ffff7a9d1 ("i2c: core: Allow empty id_table in ACPI case
> as well") fixed the enumeration of I=C2=B2C devices on ACPI enabled platf=
orms
> when driver has no ID table, it missed the PRP0001 support.
>=20
> i2c_device_match() and i2c_acpi_match_device() differently match
> driver against given device. Use acpi_driver_match_device(), that is used
> in the former, in i2c_device_probe() and don't fail PRP0001 enumeration
> when no ID table exist.
>=20
> Fixes: c64ffff7a9d1 ("i2c: core: Allow empty id_table in ACPI case as wel=
l")
> BugLink: https://stackoverflow.com/q/63519678/2511795

You are monitoring SO? Nice.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-current, thanks!


--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9EvGIACgkQFA3kzBSg
KbbH3A/+OFM+o/7X628hxhN9eGR3FR2mqggzlIBkNcrjEX1j4geyBho8FfUpxrzi
vReyRYyFnDdquXnQ/oGL4Qj/JgLIF18dOC5oKR31N/dK4wpSGmEy5kGXSt7d3w9N
Oh+vXhTYRfYclYnPUU2w2ti6yyQeLpcd0TG2cz+HiTKK9jCkjSJML+zCBOAszYKP
zft5Rs4AeYpOBYbtj/sUh2pmhkuO7KYqB6WdM1ku4y2eoiwAkC3KGHRFDpEiEljs
Ja88Eejciv/8goMxSRVlTeAc5jkHFkl6DBqvD+2X6GIUBcuCd5R9O3aWi8/oJX4e
g/ptQOOnmZ+AuZlMuSom5aoJP6n7AYgt2ptCMbf24jsdEQmXBKhdovu0hJX/FTQI
6SOJ8Ptfedm/tvQfp3QKSPKR6pnQB36CrisXXHcDfrpvH0eu1N/bpkSEbcmFbQzj
Tqnob612Y1f8wpD23UCE6BOJ84ir7/mk/Ejuqy05AuZVO04BFFmNi3E1JvkFrHPk
abJyrTo45z+Y8cbrtQSsNjg3GFshVioWQr5dIEo3+hhR0lUq+DjtVYdjxLh77Ps/
44BGdwncMyvVuvGVqa9fGtY9xt7RTzl0Tv11NUwv9yXCuUA4m69Dk2lHI+b3EWI0
nWEAv+SXVazFFr1I+eg9+vC6EPuVqDjhBZpvnW8cTvucJDZl70c=
=wSZV
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
