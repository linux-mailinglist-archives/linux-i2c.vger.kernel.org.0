Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F25CC7DBFC
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 14:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731330AbfHAM5w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 08:57:52 -0400
Received: from sauhun.de ([88.99.104.3]:52746 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730334AbfHAM5w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 08:57:52 -0400
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
        by pokefinder.org (Postfix) with ESMTPSA id 81F0A2C2817;
        Thu,  1 Aug 2019 14:57:50 +0200 (CEST)
Date:   Thu, 1 Aug 2019 14:57:50 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] dt-bindings: i2c: renesas: Rename bindings
 documentation files
Message-ID: <20190801125750.GM1659@ninjato>
References: <20190724121559.19079-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M2Pxvdb9QxnGd/3e"
Content-Disposition: inline
In-Reply-To: <20190724121559.19079-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--M2Pxvdb9QxnGd/3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 02:15:55PM +0200, Simon Horman wrote:
> Rename the bindings documentation file for Renesas I2C controllers.
>=20
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
>=20
> Based on v5.3-rc1
>=20
> Simon Horman (4):
>   dt-bindings: i2c: sh_mobile: Rename bindings documentation file
>   dt-bindings: i2c: rcar: Rename bindings documentation file
>   dt-bindings: i2c: riic: Rename bindings documentation file
>   dt-bindings: i2c: riic: Rename bindings documentation file

Applied to for-next, thanks!


--M2Pxvdb9QxnGd/3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1C4c0ACgkQFA3kzBSg
KbamRA/9GpOM7rqnCrHHeVm2ymvAN0h9chZDp/OQeW+ZzsvTNji1kfiSih8XwZGd
/fT81qsO/8/Tdr5lHeRpiue+90jwkEkesllOhiwxahlEM8JIi1mU9Z7eW0bmP73A
fGUw26PKqqRMmGozuOeVrU9varCkCwOnVdOV5y9rKbO42IDxtE+i+XfG7jscGO+R
TMdy7yVa0gv21ppwBykY7JfGfvoKdxmhRMPYSnzj1TcWRvO6vf7SXz8zU1PDJOCc
7oU1hEEhSx1SqvK9ygBB15+kUDE+8bV8VdmYlvRczCE/u5Vt+IYYgxTbbgGrBwS4
yuEGIcBPRfCIzcL9jWlmZZiW9D6HrylKumCnRRpOZA5s4zri389QD/QT4yh7i7AP
BL9nqI65+o00cGoy++jrPWlIImHFZ46+cUuzBXIYFwE66hEV/WOoVn25lYfeKdc+
YANf2kXbkBWy6LZvO+ugu+TfxwJcWYJmLBN2balOU82/biLsk8yZnn4PdiIUbI5U
WFC217rXBQmo+4KB7KvoirUijfsQaVrUktzg473dht8knDFMKDUx0P9hc5ur9MY9
/X9PxNTYQCwlGBxHSAacCRNvThfj2hm2lG4C7dri68XMVnxYT3AxCaekjeijKi4j
agZvW7GxgtpR34VpD9yOdtIj0yZJOdR1L2lA0w1HAfB+tk/PvZ8=
=MYiC
-----END PGP SIGNATURE-----

--M2Pxvdb9QxnGd/3e--
