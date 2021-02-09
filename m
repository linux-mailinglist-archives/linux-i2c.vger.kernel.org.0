Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E092314D62
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 11:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbhBIKpx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 05:45:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:40372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231991AbhBIKnc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Feb 2021 05:43:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD73164E9D;
        Tue,  9 Feb 2021 10:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612867368;
        bh=TA/pHjkDqLjfz1vZW6rtl/vtGdQ6haGdbzMOlvKPKHU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KSqfDyPG3Ai+rYKOBNaVMTBqn9NWR1sOhe1PFk7CC/BIMTD40icN98iUMI3CBUYAW
         NzCRbC4CnqUh7LfYosF+vw24HwXhOc9o0ClmU6xS/jlNZDIj5SzuBTvx+SiY3uv/JN
         D5NQwm/q1iPP8YFe8D9/CE7Khz3UB967zwYiFCH5/6mb2lrO8qTR3D+2IkDS9PhZ/3
         3TND63naflVo5C0ETCosdVnqP0PeLZm/uX93tzmriF5AvRL9W0TzGeQTvnARTebkuD
         RHmxQlcJeL9lgANf7mDUyoJwCpM4WtgEduJtOm85SLJs6Q0ThEBz/tD35LzKb09jkE
         HuVnjm3BMjvvQ==
Date:   Tue, 9 Feb 2021 11:42:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] i2c: mv64xxx: Fix check for missing clock
Message-ID: <20210209104245.GC9698@ninjato>
References: <20210208061922.10073-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline
In-Reply-To: <20210208061922.10073-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 08, 2021 at 12:19:22AM -0600, Samuel Holland wrote:
> In commit e5c02cf54154 ("i2c: mv64xxx: Add runtime PM support"), error
> pointers to optional clocks were replaced by NULL to simplify the resume
> callback implementation. However, that commit missed that the IS_ERR
> check in mv64xxx_of_config should be replaced with a NULL check. As a
> result, the check always passes, even for an invalid device tree.
>=20
> Fixes: e5c02cf54154 ("i2c: mv64xxx: Add runtime PM support")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Added "RPM" to $subject and applied to for-next, thanks!


--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAiZyUACgkQFA3kzBSg
KbbUaw/+OHlG7eRvAJA0QRLPXAacUa1cEwYAa0cgd2OslnydlFmGYGrVr4OME0w1
fhICkSuY+SI89RDmMkFpEpAvm5jOCloT8mOIWY2YQwOTHb7w1Fmog/ZClQqHCD4s
A7SO8IB4CcG/Ys8JIlPJqiM88qYoeInn0+g4mdvZDr/ygLIj7RBoRri7ptbmRKTT
0qujmpnX/fZfGjVNu4fm523up+VjnMtxCmcme+vPpmPxBRgKgGcoU4kcZT/FQjcY
PtQV4v6Fv330BJFfYAmN3MSlxdU6kZEeD3fyKJMQCe3UDktKKWkilA9aqyN2j/FW
B9ufNhVSS0urpcuuOml2jEr+z7vU1mkz7RU5pqWv81+mV3ruCUHJbHVWlNQwDu6b
5E7HEMDFVsMlChbb+q24f4tTAwhcVAPtK+Jsh/MVR3EEWvNJICpt03WTs16JiCIt
F5/xXSxSPkOekDPgGLL0JyFUzl1dWZeYSdcXzhVEHybuHmK1i8+FD7gjmOX8qHeE
UsS92xZHZIAhtexS52T25ZbuB4VUEcSQ/USKrWxQ1hLayLqYMfFTN4qYd055qy5m
05YWuUQCsDAVBnPqEqPbYiKfsZHlob8gY9K6Rgp/Wqx1Nq8wD+LlwN2Pit+TdULG
mxjYro1LxYuyPtcBHivUDIsXM/jSeRRDL1+Zxqs8mK81NJWgIXI=
=3Bhm
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
