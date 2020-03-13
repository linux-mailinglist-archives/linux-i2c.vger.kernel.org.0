Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 790BE1848F8
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 15:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgCMOQS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 10:16:18 -0400
Received: from sauhun.de ([88.99.104.3]:52264 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgCMOQS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Mar 2020 10:16:18 -0400
Received: from localhost (p54B3314F.dip0.t-ipconnect.de [84.179.49.79])
        by pokefinder.org (Postfix) with ESMTPSA id F24D52C1ED4;
        Fri, 13 Mar 2020 15:16:15 +0100 (CET)
Date:   Fri, 13 Mar 2020 15:16:13 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [RFC PATCH] i2c: acpi: put device when verifying client fails
Message-ID: <20200313141612.GA1852@ninjato>
References: <20200312133244.9564-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <20200312133244.9564-1-wsa@the-dreams.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2020 at 02:32:44PM +0100, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> i2c_verify_client() can fail, so we need to put the device when that
> happens.
>=20
> Fixes: 525e6fabeae2 ("i2c / ACPI: add support for ACPI reconfigure notifi=
cations")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5rlakACgkQFA3kzBSg
KbZbaxAArEAsA1yKwsk92jQHfsNR+Xq/KPoHgCn2ebTVnEMuqsT4HdyysiJut86o
NE6IxWaxYXrkrunYpsKNfWBDiONDKMhCkBIYrvemUtN6vvdQfdTOcIZmgzq9o1EP
DexXySXd05+kq2DLDl3A887MA4upkSAA7AGa7ZVKnb5xVEpZue5ANAWObbuqkU6U
Pz71g3wLD+XO5msbHkn8+6C1bUwTUcq/yZHqDYFu1tcrwpVYldoZ68OR9IMgD+JP
/vGq1iFBV91QeoSRvXqJcOgMOhai1Z/u8u9XPs33v66MlzbYjiH+r7ZCabO1ZVt0
lD4Q5lvkvxUE+cE1yEQLrVzNihUIy4XD2K8LvBxeDx6r0WdCKsCM8f82AnXSQ6FW
sZpmx+2ISEfpptgCOSFzXc9whps7zOiHlCIpKq2T4yGiH//HQu+oNA02QcS/opKd
eMxkY9TLqTVVhnVsmyvyo5IZsAU0Qg2ns10UE8+JvFgcFss6i3UUwP3p+w/WAXNO
ZyqsPzrkWytmIQ+wTFpqDp2nXMqaNWr66RjlTFUkIzUYht6d6gWaPItr+BAhAIbc
LpbKe5RziAUX22QnYLcuYcXKIPwg8orNmhwlJ2uOhQCpYkTGM8ls3hAtc1JUNnFx
OC511G9TUqAiVuRLhQQPqw3JUxivQJfaECrL9vZZoFWRd6jhFhI=
=7Mho
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
