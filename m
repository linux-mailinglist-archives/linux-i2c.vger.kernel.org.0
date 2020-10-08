Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D4328721F
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 12:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbgJHKAh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 06:00:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:46090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728996AbgJHKAh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 06:00:37 -0400
Received: from localhost (p54b33b8c.dip0.t-ipconnect.de [84.179.59.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 53D0D21531;
        Thu,  8 Oct 2020 10:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602151236;
        bh=kwRH1QK6Fs+DfNVNyrY7CHL9LahyFMQ7dMN4dzS0ecQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oU00eeBDHXCALTjkcCwhe7LCaivJgZAa6wuICr8wK6iElAoA9Drel1UEUEvAhOBym
         wgR31pnIfRWN4TXYmH060fD1Q5UqPnCV2vCOHjok6PA0QrVh5A4Kr0s72qDC7/rc16
         x+qFEgrSZkjDtaZMO80hkJkx4l7+HznO3UsfiWF0=
Date:   Thu, 8 Oct 2020 12:00:34 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Nicolas Belin <nbelin@baylibre.com>, linux-i2c@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: meson: fixup rate calculation with filter delay
Message-ID: <20201008100034.GE76290@ninjato>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
 <20201007080751.1259442-4-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Content-Disposition: inline
In-Reply-To: <20201007080751.1259442-4-jbrunet@baylibre.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 10:07:51AM +0200, Jerome Brunet wrote:
> From: Nicolas Belin <nbelin@baylibre.com>
>=20
> Apparently, 15 cycles of the peripheral clock are used by the controller
> for sampling and filtering. Because this was not known before, the rate
> calculation is slightly off.
>=20
> Clean up and fix the calculation taking this filtering delay into account.
>=20
> Fixes: 30021e3707a7 ("i2c: add support for Amlogic Meson I2C controller")
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to for-current, thanks!


--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9+40IACgkQFA3kzBSg
KbbICg//RfLRRrULQyOC6wMvX6Ywzuc2+08+lufGhqC7qTce94CDoF/k+KCYp/CO
r5VXowQjRhiDFxeEHJ5s3aM32vjqb+/pKrhEXunqfAtJl5xhbVkbEeBbnAPp7LaO
p6vSGleKxintQsCIkJXZD3HZJlzw+8CPBPV30HW7lO9VefwnyiV+LO7DUWM09Zfx
C5FtjGK34YQNmGuTkLYwDuelHTj0l/jR0mwRGInESnKODvVBMCTK4uTgQVM4jRJb
RF/rRQSJV4IkFiNyyk2LFK3phTUnSgeG8RIl0B5u3hkrf1WwDoUAayPSXh0qaKF9
qdpXkUa5twjEOasJLIqorTPTyNNJp0kOFK61CaeISz6S5mNtibrpGggHb9iEfGX8
wGNzcUKLbDTma80XJ1A/1RZ/buOfl8RzAPngG2xxMlxWDLZrFIIkQFcDSeE5P2vL
sLtW6gI8IWAdP8igtdmASm+dvHS4onXBgbc5j8m6xavVTIL5spVXuL79NN0y2ZI1
zPryRpRfMR6bRZSKY97OXYR2g6OHFLbrayz5HfNnk63lZj6K38mHNuZ9IPj1nuPI
aM/hCFtwW5d0j51ZYu2a2hKYbjux19bUz2BSFSM/9g8kfMOZaPXS30e0jbI76E0F
fsbBIGFsRAUlHO41anqbity6+xI9FE7MxovWMdD3JNJ7qNqj5l0=
=fgLn
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
