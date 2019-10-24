Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3FD2E3B3A
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 20:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440087AbfJXSok (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 14:44:40 -0400
Received: from sauhun.de ([88.99.104.3]:43808 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437082AbfJXSok (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 14:44:40 -0400
Received: from localhost (x4d0bc9de.dyn.telefonica.de [77.11.201.222])
        by pokefinder.org (Postfix) with ESMTPSA id 5D9E82C011D;
        Thu, 24 Oct 2019 20:44:38 +0200 (CEST)
Date:   Thu, 24 Oct 2019 20:44:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v2] i2c: i2c-stm32f7: remove warning when compiling with
 W=1
Message-ID: <20191024184437.GE1870@kunai>
References: <1571145118-3522-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Content-Disposition: inline
In-Reply-To: <1571145118-3522-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 03:11:58PM +0200, Alain Volmat wrote:
> Remove the following warning:
>=20
> drivers/i2c/busses/i2c-stm32f7.c:315:
> warning: cannot understand function prototype:
> 'struct stm32f7_i2c_spec i2c_specs[] =3D
>=20
> Replace a comment starting with /** by simply /* to avoid having
> it interpreted as a kernel-doc comment.
>=20
> Fixes: aeb068c57214 ("i2c: i2c-stm32f7: add driver")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>

Applied to for-current, thanks!


--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2x8RUACgkQFA3kzBSg
Kbbyqw/8D1GESh2wz7RCGgify6hbIO/FgUOUJigLMBvN7ElqmAgJbf23OvTg1zQx
67AJ5QhuUzw3oXySC2ntHIbBvM5pfiJjCp3knOLIrjWCUVZ2KvBPEprieW5tpBj6
sXy+6ZzojJj8vpA6LqmIu/jX0vMo9NBGLUGkWcnkklz0J0k3U+0VzdAUHGvVpJGd
xWUxHGG8q5vJ5Y4t1RDktRj+vraHaV7SZwp5QL5+tD0LDZ1e00pqupVpHL+vEzIj
GPljclhyWiF/fQzBpY4MZWZ2Gpk4ZCJ5aL2oQtY9HTzy3UmPQJAu2ZjfDzAwM2cy
UfX9vpo9Uzg5k3sphhQz8lL35KYeRNj/HHGn4ricMT05G6AnLZ3PvPN3N6XL7dbk
BFnN1xaDmiF0izsXGQQbkpHvywAL/glYaImGZ2B4cKUN58JXavsmFsW6qM1mlrNl
hAFPFwJWffGJRW91lxC++v4LwjkpuypnRghWwy6sllU28/MgBESKnQwDqW4X3hmA
SsUijLNTRUgUWjgbUJ7s0YQ0zOEP/3U0k/Jv8XY8aLRu38fJ5jCxREQinZF6+Ner
G1DvSW9mfisN2HQqV9lWdADiiM5qfDyqJMT+SkSkXuaYqWqn9FNSFNn9bWjVRqut
aTEeMGUPOljpMtVflUPoV6nPF8LhFNXGhKaZqx5RkGQD9blcWaQ=
=yMm2
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--
