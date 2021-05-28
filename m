Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E1B393EE7
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 10:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234725AbhE1IoM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 04:44:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:51554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229950AbhE1IoD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 04:44:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1629E611C9;
        Fri, 28 May 2021 08:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622191337;
        bh=ngOovX8uEhSsqFNxBgKtj2A/bbISi1OWKe9eQhpLixw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OapqeM5fIDfytHZD+oi4s9lrGi7P9s6LIjTJnuSkK0YaehLm68wZSmkZOuc5WNjoD
         C3JsFfBUvYlTdQTcdGfQjvNvG1fpJh96Bg7MId69UpBFXOKJY68N7JUFzEuiEkG+u2
         8OV/vaEGTL7eB3PX0ZNIPlZTtUWG+5adUqWAOrAuJf1kQeYkko4t9xsHwP5MxuT+WV
         Cib89DxuCa8jP+dwEwZo94lYvRbtvOP8DUJUTmFEViv9OM/qlRq2pvY+nx3eWVBQr9
         LbHxH2eI5KN3bIZcS+f5njVbEtlBEXWEm6hX1L9I6Ij4LwKhlhva+P52AAYZ4ZWv9N
         f8h6M1WiVtbhQ==
Date:   Fri, 28 May 2021 10:42:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Matt Johnston <matt@codeconstruct.com.au>
Cc:     linux-i2c@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: core: export i2c_smbus_pec()
Message-ID: <YLCs5kPBicVLIpCB@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Matt Johnston <matt@codeconstruct.com.au>,
        linux-i2c@vger.kernel.org, Jeremy Kerr <jk@codeconstruct.com.au>
References: <20210517031138.133934-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T/Urqi02Rn+pKLln"
Content-Disposition: inline
In-Reply-To: <20210517031138.133934-1-matt@codeconstruct.com.au>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T/Urqi02Rn+pKLln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 11:11:38AM +0800, Matt Johnston wrote:
> I2C slave interface drivers have to calculate the PEC themselves
> in the i2c slave event handler. This will be used for an in-progress
> driver for MCTP I2C transport.
>=20
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

This is fine per se. Yet, there should be a user if we export it. So,
I suggest to resend it together with the slave driver using it and I
will ack this then.


--T/Urqi02Rn+pKLln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwrOIACgkQFA3kzBSg
Kbbd2g/6AzxsMAhiW7yLj4aJHkWQiAZkyOT0tJecckLXZXjeodKhALEKT3avBY+k
5QGR3jFM8O1Tv+5Yn7Ywb2bUxmV+Kf6gG5iCBZaDB2r+wtOW9ddK0H0XoddygjQa
rGPr5nUXsHotpsbZUnJsAldsLWd+ZiCa0wwDrRQTvPPo7Wqp0pEG+O4CZ2/RznOr
vAcgaxrm3vqaHD/S9fnvfZBRA3bG6Emb23xYkmcXFTB45d4UmBKy2kVaWDVTDgYj
Tlm1BFbhS66sUppdsldUOi7dIwkcPaKhAcuTgNJV/mbCPxwdgcKBAv5zRVmGrSJU
dpj0AeiCkWaglJ6Yls8uDAxPZh9CUXOmmcRoa2tqaDDLMzWDs+9EcgPLiON5UMFQ
mW46LiUMr6WILSvQImE96nwqRml0eq6txobRNkTqiicQAI5RRjlt73EcpFPNXaK+
hIhlP+MwNKLjSCtFAx7cglaIOZ0zleRvy456w215pyL22iDTV+UMikgnawVcSF3A
Agbr2F30WkihhkDI8HyutaU+Ch4UA0r/yytRiRMCxO16obIanFuGr+rFoGGU57nj
lEcnNCBTsapPFZKdMUqM8R5O0VBc3fR/sK6j00TCHoDWBsJuXazQgOp3AAe/Pcfc
qv3VnUe65u1uuqkj5m1YujNfDMY7bemoW/W7NnjUteU/I076WN8=
=FLmp
-----END PGP SIGNATURE-----

--T/Urqi02Rn+pKLln--
