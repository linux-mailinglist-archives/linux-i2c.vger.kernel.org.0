Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B60235DEC6
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 14:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345508AbhDMM17 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 08:27:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:45882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345552AbhDMM1a (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 08:27:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16A4861242;
        Tue, 13 Apr 2021 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618316830;
        bh=LrHG7yWWxJ7CVbOapeBqNZcSxGkIqyGWXrYYV3Zsum4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YF5y7vvd6zdPNQM8Oq2BivXvN6BlhXdaVXGSocHiI4XLM8p3EuOs5g7QNtLT7Bp1x
         lHeztUeavgcpuX7pcdSvRh8CA4g6La4n6LkQdfUNwwtpO7BWhfHDPpF70Sn3jXkMiR
         rNI3sWcqQUT2smPQvpXayi9yTbi4iIHdGvw95Sq3R6jaHwH17lbG5vxDLAjCv7jHx4
         nSblnvqFv462szepbv/ZP1hiNP03JXEjXOzxsAKS5OeQRehI8CaoiLuw0B9+6S6GlG
         kfBiw+HIBWDXCjd+s6KVDKWCsjcctoSSLEnh7XwOczMWupgjvXnfnoXft4436/dBAq
         3qHG2rXnGiodQ==
Date:   Tue, 13 Apr 2021 14:27:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] i2c: mpc: Remove redundant NULL check
Message-ID: <20210413122707.GD1553@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
 <20210413050956.23264-4-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Content-Disposition: inline
In-Reply-To: <20210413050956.23264-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 05:09:54PM +1200, Chris Packham wrote:
> In mpc_i2c_get_fdr_8xxx div is assigned as we iterate through the
> mpc_i2c_dividers_8xxx array. By the time we exit the loop div will
> either have the value that matches the requested speed or be pointing at
> the last entry in mpc_i2c_dividers_8xxx. Checking for div being NULL
> after the loop is redundant so remove the check.
>=20
> Reported-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied to for-next, thanks!


--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1jhsACgkQFA3kzBSg
Kba1RhAAqv8eAzs6WOZXxZJAGVOJi6zZqCtK/M2vOaLi0AbcjT2/qbc6kaZbSWza
udXO4HwRt4vEriR1GE0EZ0gUrTWOo8UD3SRtScVilJRamJJruYrwX8fFqbytnVKL
md0armPeuziK8g7n3AL4u1gYpcbahS/R6NbUhEqDmMSHm7YDaAR3kHjWCWsUBx01
/lB/M85tzLAlGbfuxPAhoKBUEVD5DLu/M4sV/1MzYcrvchfmmN/Ku1ONhVhVJNWS
pjx5jsJsEu4HES9n1ujDEXCf73LnkgZCscJeK2GnSxLrJbJXzjmzL911WUbCbniu
7UGMQRYEs9y0/L/bEbaTHdDEJMrSJutCi+NU1Vc3Ju/S+2S2OBKAP6Janf9wIrmW
9XzdDCGcTLZIvzn7LX5WIH5IWXI7OZjlFnS5A5vrXh693MgV+j5JBOuvveVfPHW5
RHI4EC04MI4D/g1EH3YfAA/o4Mr3wG9KoehBH17b2El3r0ErwlR+ZXbcSQRndKq9
qNFDTyHVyP6c+3JHtG+ece+4p7GrosGybRgrauZ0YD9gtL/KhIUqXn0nxwWr92N5
1RRkD9RG7KXJhtnq/HgDooaZo+336ep0V8O/Zr46NarIh4ayGUeJlmHEhbTXVXTj
eSeopZGsPdesDhvguR0W0fM2tEETSVRmikeQZhdoWlsIsDQotEE=
=NrIG
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--
