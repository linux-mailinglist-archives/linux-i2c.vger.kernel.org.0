Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9437319CB9
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Feb 2021 11:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230387AbhBLKhS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Feb 2021 05:37:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:53456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229653AbhBLKgy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Feb 2021 05:36:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AB8B64E6C;
        Fri, 12 Feb 2021 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613126172;
        bh=l1HVYolc9K5zoog78E0hg6Q9NscFKBn5UiLoKkcCsIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bm+6w43eahWDKpTKO5a8Ic37OrDmUsbmK9OwoGL2tGsLEcoAJV/BsN9fl7bLGkGpu
         AGS+ZlMBfZWAhCeBUHiJqcFi3I+2sPo9yUkD8qfguMQAgTMBMa+AJoqV94BTuuFuJJ
         qEc4D+OJtZfq5J+MEcPk6dmMOKD1tNIcF7cVQ06bpIki++3wVeDl7XlezODsQ6aUns
         KsZkaOlIP6UmUx5K+7VX0+fITHQcWS2UkhiWN6JqVbDCKi99gXjAea4SpyPJ5H7zIy
         rd86qUF195JJ5tpMVNUXuIJ8R0dSwqVccHdfpPZUBRRd83WLWw54DGVTWp+oEfcc/j
         1/oM9yEyV+3Og==
Date:   Fri, 12 Feb 2021 11:36:07 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
Subject: Re: [PATCH 1/5] i2c: stm32f7: fix configuration of the digital filter
Message-ID: <20210212103607.GC8038@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-2-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline
In-Reply-To: <1612515104-838-2-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 09:51:40AM +0100, Alain Volmat wrote:
> The digital filter related computation are present in the driver
> however the programming of the filter within the IP is missing.
> The maximum value for the DNF is wrong and should be 15 instead of 16.
>=20
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-current, thanks!

The rest will go in within the next cycle.


--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAmWhcACgkQFA3kzBSg
KbYsWA/9GOAvOK+8eTc0vi7v5AZ7i77HxG3vZXq6Bm4XBBtXmV0eqg/U+Mr3IIC5
m6eq7LSkVtalSlJFl1penaXyJ+/d8EEWsZ2sPAFtolODkx5qzL7tZuyT3eu7br0H
VBSmAJeXUzqfdv96xL5WO2ypeMH8WljsClbp57fUxVqePxZQ9Tq0RVUD0ayyiwG+
m7tA1uMjQNn+RpYUxF7XdO7TmmN4SHqojOvGYX9qZytKXhD9Ytiw+490a31N2f9r
dHR/HN4CQdP1kIK0lKPvgQzd2b8/WuBokde7TA3fTwMog0C0Ywe0mPYjRYDwg126
znIoc646reRXWDNIAdr3g7BiZrDI1E76LzCsqaypoo5E3hz8pkPuo5gO8Mrrt6wN
aPOf6n8DxTFLvUi6XCDTpbItWC8L2Wi/XRj1gwHS0i67KHh9LZuMns6KDK6JxGyT
ve4dfYZgG4B0KTdwTrX+EfTLkAQWpr/szYaxqtfg2L//62feBuF98A4IyXJ6eQkB
mDCYjrQ8ZKGmnEHWV1+dr26M21WeoLcq6eDMOntne4zCEKOCxndtkZTCnDWUS7A/
FXTWHU3TEIYHaVuDhpqEs4ulCEITApDkNseJToMjbAWaxVmQ4xBetlJ44F4+ZTrs
YYERqcUpxvea2Iz07wgqChCMCurqPNxrKPivgn+6KKePfx634/o=
=RiX0
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
