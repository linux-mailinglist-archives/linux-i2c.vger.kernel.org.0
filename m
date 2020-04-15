Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1CD1A9BEB
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896828AbgDOLPO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:15:14 -0400
Received: from sauhun.de ([88.99.104.3]:52880 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896818AbgDOLOc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:14:32 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 1A1452C1FF2;
        Wed, 15 Apr 2020 13:14:31 +0200 (CEST)
Date:   Wed, 15 Apr 2020 13:14:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: Calculate SCL timing parameter for
 Fast Mode Plus
Message-ID: <20200415111430.GQ1141@ninjato>
References: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
 <20200407133439.23422-2-wan.ahmad.zainie.wan.mohamad@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hIO1AjEoFJ7b3ahE"
Content-Disposition: inline
In-Reply-To: <20200407133439.23422-2-wan.ahmad.zainie.wan.mohamad@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hIO1AjEoFJ7b3ahE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2020 at 09:34:38PM +0800, Wan Ahmad Zainie wrote:
> Custom parameters for HCNT/LCNT are not available for OF based system.
> Thus, we will use existing SCL timing parameter calculation functions
> for Fast Mode Plus.
>=20
> Signed-off-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--hIO1AjEoFJ7b3ahE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W7JYACgkQFA3kzBSg
KbYj0BAAs2DL1mY9IBjQaMe+jhN7wXlsvjtYz7lvy8yUYnckK8gWFs8gtrHnNEfG
2TVwbjk/9S2ejIkR486Ii/0Pdw1aEHgLA04lqzuZakOX0JcayLRsj7mvX8qF9ftv
zTWreKwgVDdw5Ki4bFwEMzdR8F44Hu/NH2vGYmatW0q/MIRn5GgXbeiVfZ2dXM0D
oGSaRSB/eX8682Pj6a61LPRrYXjIr0DhgOiNVHKLqY8NLRsJMrTg2OvKle5eBNdN
R/uv/rlgdKob5JDw3oExmBL0BldfRzDTZ2i0gIafPjBSXSEbZq3h0W1EAhwrGaQu
8LSqC6rPEzo4Y6F1iku8v5xHrELT6WQP59BWOH8uPL2JjgKBhrGwfpzT6yVel1ZJ
U4TOP4ad37+0MOw3Nw0iDF+wUfA+pgRLRAbPc/NqK8HCpH3KHZamPMbT22zbg4zJ
gg66nJ8QVlAAMecUix4nyDOZouBAgFYB4S+UNTbhjOjdhX/7oHjsyYpL1eakqE3/
BR5akFohqVNwD57lf5asRPbKIqCMKG7TEu/jaEBlGF2OnCU5ijKg9pVzw9EWDulF
SNEbuCXDy8XM6IEAMkeb5hL0HSeIEISOf6p1uczL/pflcf+Owra92YshcQhdrYg3
Fc3XoB5+WZbDVyUUlrrIdTlag2zS8F6hh9xMdBOrcyq/4fR9AqI=
=pNwt
-----END PGP SIGNATURE-----

--hIO1AjEoFJ7b3ahE--
