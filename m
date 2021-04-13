Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB22335DEE0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 14:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344275AbhDMM2h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 08:28:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:46144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345619AbhDMM2A (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 08:28:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 602E361242;
        Tue, 13 Apr 2021 12:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618316861;
        bh=vCZyjTt1cdqeNu3ZiSxkPSLpR0G0BLUELRPXqa1t/+g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r+wMNERUVpg0zw6Czc/D1mQ1v3tFTlFWymJnGVkTwPi/ZSmzS/OgGkXHf/niSdLb5
         gBjHoFWq9yrwW99YVGXOOv84KPCbVNvRdehOBPTi3QYshvtjyZ6u1le0waEDfvXPGy
         KU6wI4jB3goMFlVg3L9QbZN4H/hxxHuglFASg3Ikfx4XH1LLsQyNLL7VQAC9IxV2HY
         uy0y1uxWAagwjvCnAE5E0eQutSsja1scH6/E5H2iRAs+yJaRgg9ZUxrH0tZ6UlAthl
         dqr66U3gGz82HLKwBUanlHBCjTfGlnxFaT8QQAJwkBs2CXbKglsuh1+gBTznhQ1JE6
         APuvL+wUCQEAw==
Date:   Tue, 13 Apr 2021 14:27:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] MAINTAINERS: Add Chris Packham as FREESCALE MPC
 I2C maintainer
Message-ID: <20210413122738.GE1553@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
 <20210413050956.23264-6-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Content-Disposition: inline
In-Reply-To: <20210413050956.23264-6-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 05:09:56PM +1200, Chris Packham wrote:
> Add Chris Packham as FREESCALE MPC I2C maintainer.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to for-next, thanks for stepping up, much appreciated!


--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1jjoACgkQFA3kzBSg
KbaAoxAAnYI1d93HxQLyIk/yqx/SFyBv82sHg4k3YVxKlpafvKfh34OMs06doqtx
7wTkkznOx+sWJfEwWr0+pXZGwxuw3GiFc8Kd3SVCqj3MReeXEbqNpwQEr+CWBpzk
jV8j0s/hZ32cYJzrsXJTM0qB6koL2kxdR89cOnFyuwQJuWmj67q06eZUA0fVoIJI
i8/cMLtM3flZmmxPeRvek1LaoB0qHCcbNMsxEEAyFiVmRhNG2uobwLP47ytpzQMe
ws64ucSYhlPGxU2wSYaIeWEi1yq2/pjzvndSJ3XKWotRFsRHTKhZb7k6ZI+kCc7v
gp/ocmd0QUWkRCvJw0vKubO1DG/tLeNfizi4mQQzYnsKz0rAJEOeZhwSiTy1xZ+a
B2ZxGt52KxvxU2hdtSn6px/GL8wX0rfF3PnyBxUohd2Ph3UE+Ah/04mFCALdABEP
vwwh5gs+B+jRknqTvf9xP9jiwpbdogZGHtRNNJekxL9ZYm73k0gHPXcOeCVizfSC
ZRw1jGTP2oZc+WlcRmM86sR/Z1+xaoEtOjg3+J35IX4SoAgmZoTHPqEvXsoBH2mR
MXxaZ2DrydVByzqSFACYrsyHFqxtkaMeGurxyCSJEuFI4ORgtYSDgqwPmuQHsRis
J+LN1t/sUqFY4YE3QzojYK1a3sZXi4o05X01uDet6SKKaAHh2UQ=
=+HEg
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--
