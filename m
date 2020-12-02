Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEE22CC12F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Dec 2020 16:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbgLBPpq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Dec 2020 10:45:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:35944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgLBPpp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Dec 2020 10:45:45 -0500
Date:   Wed, 2 Dec 2020 16:45:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606923904;
        bh=g/DeM9xoCwe0uYwAa4AHbnidtnx3uC8dwHcC0mG2gJo=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=tugMgC45TTyVgssMBa8qxnWmUNxZL2P+4matOOIgtquuPLr0faKrntrr+44fvrD7I
         khnlsi7LSjq3Am7x/ZNf8OtHZ5Q9kDJ6yayBST1s6TYAi7BEzs0CXBfCLQTv/tCr0F
         y+1kY7nWerutmFPrB1f++I4Vslc/gHlTC8tmYStc=
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
Subject: Re: [PATCH v1] i2c: ismt: Adding support for
 I2C_SMBUS_BLOCK_PROC_CALL
Message-ID: <20201202154501.GB13425@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Seth Heasley <seth.heasley@intel.com>,
        Neil Horman <nhorman@tuxdriver.com>, linux-i2c@vger.kernel.org,
        Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
References: <20201116153245.24083-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline
In-Reply-To: <20201116153245.24083-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 05:32:45PM +0200, Andy Shevchenko wrote:
> From: Mario Alejandro Posso Escobar <mario.posso.escobar@intel.com>
>=20
> Expand the driver to support I2C_SMBUS_BLOCK_PROC_CALL since
> HW supports it already.
>=20
> Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I removed that. Andy's SoB should do.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Mario Alejandro Posso Escobar <mario.posso.escobar@intel.c=
om>

Applied to for-next, thanks!


--uQr8t48UFsdbeI+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/Htn0ACgkQFA3kzBSg
KbbveA//VVzXcowEYWfxvA2ZFG+NMbMw8v7KoDUNqv7fB6xeVWG0iWqP9hw7N8tR
KA2koora7wAlbEokcJAIEk8nfJi3UImO2vhW3b/X7FGwaepvdithOoMZKE2x9LJ8
piPQrcU15MgoNUJvvJIRD5nTf26Slo4GpD3eioImwcYkDJqYN4wEB386Lj4vUiWA
jBvOK0VgXbNj46yi/I4eBKP61PdNOSgwrhIVQa8wQgv2vJBD/ApZ/5fvz+cUUkRH
N1UipUgi2uVzZv44Z9arDNi26AwY8ihj81CM2OUMg/TH54d8XDeQexDyA3ZbU+at
lThik74s/aHUtBuRXG3o0ZdKcKSlaTP4NQcgpjO1E8CVf2uDG7ez+rIWz4qguKgj
nz07KPs1kv7OUU3u7msm36a12Fsi6yp2vlCjY8EIptjRqnmzOInsp67M6mKVfc8o
wfwSPnQA6DLfhstpTSXj9mSFtf5cb74M5d3qY2SzKDDcxyh9/Fyn6WcJ7bQgxRWy
KVkP4e/LPa7244RuywfC3eh1+M0JCeqgzmFqtVwa21mcZBrFrehtG4keSzaOqZg1
DNfBhYx+u4CT+oipBPxpgz9kVcuW3v0G1Mz8+bJlVtlzwmZkfbah8S6eKRqlkBAh
vqzCuhlpNMTgGF4KpGRokN5DC3lYvHSehMiO4eIedLs/av+/Hn4=
=R4RC
-----END PGP SIGNATURE-----

--uQr8t48UFsdbeI+V--
