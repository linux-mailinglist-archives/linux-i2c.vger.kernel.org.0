Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947CA34040F
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 11:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhCRK6q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 06:58:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:49458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230014AbhCRK6o (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 06:58:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B091C64F24;
        Thu, 18 Mar 2021 10:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616065122;
        bh=H5haXsTyRhLH/Tr8Ot7gpbm3NkcHxuV0oId1CbO3wi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UCMC6stWkb2KilpzcwYzrjpiy5n+IpWGdjpEGJcn62LZGF/JEVu/l+o4838XaU4JF
         33dMvw4nnd8Ab9NYlRZi2stoE3seDxO8q2p2DWJzIFPAJpkWdE0CDEBNZuNmIcxn3Z
         ReodiIJP1S2W6KP/Bmy+LWtpa9+ppL4L5iegrI1TEWRohlJwMhOQtN/ffdDLbYzwjq
         WgXsJJkHtaZxDVRXT8H35kBtt2svxImYyiesoMP8jLS1yQkB1FzAd9xpibMj9VtIb9
         f/Wfj8bgsPXLi7CPqzF+XItZZ0jW4RdLjFsNGiqg/LSNs9gGK49YHjh6MUqwv6M9IY
         4+kTnXS4WC7Yg==
Date:   Thu, 18 Mar 2021 11:58:39 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com
Subject: Re: [PATCH 5/5] i2c: stm32f7: indicate the address being accessed on
 errors
Message-ID: <20210318105839.GG974@ninjato>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-6-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KIzF6Cje4W/osXrF"
Content-Disposition: inline
In-Reply-To: <1612515104-838-6-git-send-email-alain.volmat@foss.st.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 09:51:44AM +0100, Alain Volmat wrote:
> To help debugging issues, add the address of the slave being
> accessed when getting an error.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


--KIzF6Cje4W/osXrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTMl8ACgkQFA3kzBSg
KbYFGhAAqK39kHrbMrNW65/acOoglcf2ZVyUccSvCvlPuqXeheH7V39lIoRoOlwz
YjKFLQ4/WE8r5YEZfIbQKLxOjTEGCm9M3UILFEV+SL4xiCpsD6hiqjhvHdRponph
VJcnrF7mvkCC9dvybD7gqHz3LUcMeaC266wvIC/0fUcm1YUkvehIDzilECeweTV6
N4j33IOlQLd1SJ4IH0x4S0Mrh66Y6XS5dbBBHxmx4MrdSSxfGfVkyPB4JTDZgrsc
mXWx3+4bMNaZW4OnEa7NbjYEtIGZLOBE7r5NFE3w/RudmabTHOCp7Mg6YCDwKNoe
CSMQ4EfH5dpiUSEEYu/myNPtiGemyTvWbEjPFk3YYZuuTatiyyIPOPQwBKsBlDAR
IGs3fmTur/ooCyIvb1HhDIaDD/BXMt5oJcgZKItXQRQQfn3mxoy16Cajz5v3/NQM
GZkLG4pFOl41Irv1kw5hMhfBqIsqEswO9H+yRpWWjx+KRDXDzgr780fj7fPW+HGL
MNXydEy8vmf7V3Hx50aWGaVQEkEUx8wORRBdPd+HG/PhIj7b0E0x2z6OkJssf59W
ZBdKc9kfvz3hm5WzW3iVcG7tMoltGTL+5kex6ufI9TpG7P1qgt2Q/+jz15ErkTkw
m01+/cxWGPBhdRJCmgwYVGegsLXBPjM/luqJc2f2UhPZmD1Q61A=
=AQRM
-----END PGP SIGNATURE-----

--KIzF6Cje4W/osXrF--
