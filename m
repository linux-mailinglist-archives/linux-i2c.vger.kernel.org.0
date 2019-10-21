Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34F1DEC16
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 14:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbfJUMXS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 08:23:18 -0400
Received: from sauhun.de ([88.99.104.3]:46704 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727256AbfJUMXS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 08:23:18 -0400
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
        by pokefinder.org (Postfix) with ESMTPSA id 9F05D2C040F;
        Mon, 21 Oct 2019 14:23:16 +0200 (CEST)
Date:   Mon, 21 Oct 2019 14:23:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        brendanhiggins@google.com, joel@jms.id.au, andrew@aj.id.au,
        robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: Aspeed: Add AST2600 compatible
Message-ID: <20191021122316.GI1145@ninjato>
References: <1568392510-866-1-git-send-email-eajames@linux.ibm.com>
 <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3eH4Qcq5fItR5cpy"
Content-Disposition: inline
In-Reply-To: <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3eH4Qcq5fItR5cpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2019 at 11:35:10AM -0500, Eddie James wrote:
> Document the AST2600 I2C bus compatible string.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Applied to for-next, thanks!


--3eH4Qcq5fItR5cpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2tozQACgkQFA3kzBSg
KbYW4RAArdkdyER9/nDFPWwqsfMrIVd+zx2BH3gX1AN4YyZk6MrTvGUPAMOfYwbF
pfdZPEi/zwvgMrbdc6N7oKiNv0pTj83z8zFlku15rp+FaaKCljWRKlVDUMKA5LRK
T7yOYHCTKSUCgxuw2VvY7eEyPPzuNuodlFr7sz8QGY8JepN1ZyanlvuFPD9FY/3b
rKfbsmyl6EzlNHjIDCdJJMFjh5T6y8q21uipGq0FcZ/3WLA7sNMgSY7RF5otI820
nH9D33hHySsYeDe6R69HPoHz+chYGbJ9Ua4am2q9fBiNMZUrrIYQ+WgMbp5Pfxgl
scG9UT+pzzltQj2JY8i/k1RyR7gOYxJfIr4bvT43iy5G8dMbw72aRmxMg/E2qd0k
VlB0ZZK/w7gg+h5NTvFC81owsW1UxwtghP/YdH9HJs9D+XiFxnhwA74cdS28bNFq
fK1XZeYYSSWyCZ690GpOVN22UToHyj8xA7ml+8CU2ivdP39HuMblLIYIHm53bN7M
uoMI3XSIKLCMJeITDhQOeWdeq9Reu5v/IRUTg06AsWggpARdTYJLRjI/R3wVKhyi
aq7VIZx0nrbZO+xOE0Rf/l+Lt7/FoEB+Ejpfzj5RmWy8HJcSjE6hb1/DBlfLRvI4
j1kLtMRTkfguWpIFhhBwhiCRObfLHIiefx17cEgh3zMMWbM6Pio=
=t3sq
-----END PGP SIGNATURE-----

--3eH4Qcq5fItR5cpy--
