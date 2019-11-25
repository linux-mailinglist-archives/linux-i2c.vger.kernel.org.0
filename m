Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D598610908C
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 15:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbfKYO6w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 09:58:52 -0500
Received: from sauhun.de ([88.99.104.3]:55066 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728196AbfKYO6w (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 Nov 2019 09:58:52 -0500
Received: from localhost (x4e37056e.dyn.telefonica.de [78.55.5.110])
        by pokefinder.org (Postfix) with ESMTPSA id 371DA2C0456;
        Mon, 25 Nov 2019 15:58:50 +0100 (CET)
Date:   Mon, 25 Nov 2019 15:58:49 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: Fix Kconfig indentation
Message-ID: <20191125145849.GD2412@kunai>
References: <1574306363-29424-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline
In-Reply-To: <1574306363-29424-1-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 04:19:23AM +0100, Krzysztof Kozlowski wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>=20
> ---
>=20
> Changes since v1:
> 1. Fix also 7-space and tab+1 space indentation issues.
> ---
>  drivers/i2c/busses/Kconfig | 22 +++++++++++-----------
>  drivers/i2c/muxes/Kconfig  | 18 +++++++++---------

Peter, I'd like to apply this for 5.5. so we don't have to deal with
whitespace conflicts during the next cycle. Are you fine with me picking
it up for muxes?


--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3b7CkACgkQFA3kzBSg
KbYcbxAAlLTnbKDY7JeTE45Y+5GmbWZqpE32VWbcAleUoU12p2NTufGyRB9WMgbh
TbdF6PEyH590IUjnfwfAG6Xfh5qrF/JaSu4vOgRUxMWxIeBFlK5Lw3DsMSjv5f80
sTRTNeKA6qXLb4lZ1J2HBsk0tym2n2XROkpRBOOPyT8vxtTwWn66zS/Fnk8rOyG+
SGOhSwQ/jO+sIDLyZFaNSLssKs0gQE8Roaqv64uT5EZMaFSBlHO2Jb2ErOOZ06fp
rLiC2jO01O6PLDkZs8wiemPEXvgukdb5ld7C1Qs4ZL11m2aaEzyYoJeFuJyHiP81
Grl1mhGLSFVXdONGyEa/sW1COVk2106qUNJQ1kuQOy0EKc/8xtqJnPVOrErVDkgF
govrszAlBPUYAZlV+It3uB206Fn1jQlecDbgsgw+ECRyN7I3P/CCfisbolgQ+C6w
aa5VLB+0sIGNMw4130Y8eHoXNlAz33tkDuCvCNh6C+gRxL3JQMSOicrM5c0alKyB
AtoaVG5Vul05v723IXAhojoIt0/fyQo+/1ndAgPNMFNN5PJ6YZWCFvMWkMJ6ob5n
dQJahJ8/2pV4wrSFraQ2aYg1ej9coJKEvfCbps8YBJUQ4ESvwvHyvR78oNVzkKX7
HR2cRUQzEd1dQ8adzH62TUujoozrXwwd+HfQ0jUNzt3lVIMp41g=
=O37+
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--
