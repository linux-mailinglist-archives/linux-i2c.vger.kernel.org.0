Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FA21F20B9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jun 2020 22:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgFHUbB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jun 2020 16:31:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:54754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbgFHUbB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Jun 2020 16:31:01 -0400
Received: from localhost (p54b3319c.dip0.t-ipconnect.de [84.179.49.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 740AE2074B;
        Mon,  8 Jun 2020 20:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591648261;
        bh=/TR0znQSNBVEfdoSa73R4jFdN9S+pGIjLvb2EUYPsAQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q8C+OJniVQ0Eovxv2qrqW6OCfM/CSPEHEbprxNlWJD2AxVr64STFO0mCOvpMktdt6
         Np+uZvKMHDZN6kSMFrHoclwxSAKxyyrue1Gf6ja74kFqYGReg/18s7xZ0lB9W3DCZD
         /jpNGuDeNfqGCyB8iv2bfSB6/vnq6O+z1DfN3Qp0=
Date:   Mon, 8 Jun 2020 22:30:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: npcm7xx: Fix a couple error codes in probe
Message-ID: <20200608203055.GA917@ninjato>
References: <20200608141727.GC1912173@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <20200608141727.GC1912173@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2020 at 05:17:27PM +0300, Dan Carpenter wrote:
> The code here is accidentally returning IS_ERR() which is 1 but it
> should be returning negative error codes with PTR_ERR().
>=20
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-5.8, thanks!


--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7en/sACgkQFA3kzBSg
KbZttQ/9Ey8Kf2SvVwUBxEWRZzA0wki7LFu+OIJR8IdQvyx13t2rYOSLZ8Rh7ehZ
GYENcTfBohlyr0V2Rd0sVL0MjhwpDjUYFyBvMlz9fOP2+xmlq2uF+iOINIToz0CJ
RTqYfOXxbqfcnQBUXuQWKJJc7rQyhwEWOS3VdTUt/khe2Kg60hfrYO5jkXwucm0B
ULVWXiu5UYWLo0xwstbUPPkFk8dUleR6wnNqVhtgmG5RdbUnNCxpGhVqAymqzX0l
YQUpURv9HP+wZERAIryr0nk+P9h41Wfh/pG1vXQkQ1i1zl9yU35yS9tpZnRJeVW3
7FkjsNO9ZSlmKIjMI7lpPZgOI7jLL3a764UmUM2tSy/KgDFdzWkZ8065U+rx8nOE
8Yc3Rw3xQsZb8xorwn/a1UtpY25uEBM1oxKMsgXvvNW/zbyxMu9Pw0PJSWB5WCXp
pvcY+Wfec6v6CGX66Wm3OqHfZquMwcn5xUp+zdX5SouNIuQw8lVZksh91ZGBxakZ
4uVm1JGYPJoZvMY1UDLFZ1AadeODlsCIr4GOkDyfFL7M9XJ/Un6/gsAjpAtAsQx0
iUJPvdcuJE5T6vW2K1+TkyjabjpSHc/zoJ3SOzgO8MKrQZOLqUPUn4RziIxglqMm
rzkMUWqK034wLy9uzYgPZo+7JnhvyFNRM2sBxldH4q/IcFOOrPI=
=IgmB
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
