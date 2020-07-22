Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BCE22960F
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 12:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732153AbgGVK3L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 06:29:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:43210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732151AbgGVK3K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 06:29:10 -0400
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC15E20729;
        Wed, 22 Jul 2020 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595413749;
        bh=KMLpaxcePCpXp4URNPpOHVjKKc7YKBwOyGmXdo5i96Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PMggXTytoMX2+ayoPs8fR6Re/9yytPEBRg2AWVXRH496o7Yc/Jl4Pc05AJTi2TvUI
         JqT+eGzcamn4d89RaQDf1rJZw+YxMKXtPPztmfHLgeGJAchlFdlBPvf+XoFvPXVMpV
         kfaqS2zfBzQENcOVSqbGwEoQuK7jPRLjMJBmayh4=
Date:   Wed, 22 Jul 2020 12:29:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: Re: [PATCH 2/2] i2c: cadence: Clear HOLD bit at correct time in Rx
 path
Message-ID: <20200722102906.GJ1030@ninjato>
References: <1593784572-21910-1-git-send-email-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8tZVdKiiYitVG083"
Content-Disposition: inline
In-Reply-To: <1593784572-21910-1-git-send-email-raviteja.narayanam@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8tZVdKiiYitVG083
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 07:26:12PM +0530, Raviteja Narayanam wrote:
> There are few issues on Zynq SOC observed in the stress tests causing
> timeout errors. Even though all the data is received, timeout error
> is thrown. This is due to an IP bug in which the COMP bit in ISR is
> not set at end of transfer and completion interrupt is not generated.
>=20
> This bug is seen on Zynq platforms when the following condition occurs:
> Master read & HOLD bit set & Transfer size register reaches '0'.
>=20
> One workaround is to clear the HOLD bit before the transfer size
> register reaches '0'. The current implementation checks for this at
> the start of the loop and also only for less than FIFO DEPTH case
> (ignoring the equal to case).
>=20
> So clear the HOLD bit when the data yet to receive is less than or
> equal to the FIFO DEPTH. This avoids the IP bug condition.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Applied to for-current, thanks!


--8tZVdKiiYitVG083
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YFPIACgkQFA3kzBSg
KbZ6gRAAk+U1RJWBmsO1kg17hPWLV4CKbeQwkokAO7OxQ+Xz4eMBTlAZX9T3vqh5
8bsrQ/oiFTFWqEaKrtkK2kgvUIZqOAwdmXKvEL676ft3cjjg/4oJjr/zfRZWhlq+
FrRHbVo+U1BjiuLmBm/D/hdR/p2AuekW899KrM/ZszFW5+RFcYQRoCF2eMwilLuH
5ZxHAdK66xbOof71C6jlsQOWpFUXDVjRN1Qy7k9iE7tpwscZ4YT/+IJk/h3dQFFH
Mgrh05rH4z5vu7ED6Iu3WKjlG1+IUjPbBFB2Ay+Ulc2SZunLKHQw6oNzjp2LxyNu
1lRYwt4xCwkEe8eGXSM5gw+wcS+w0rnZMtDaUWyxzQTCDouykj49Kbt/f8jxawIN
6HVGMZeJvUSioiXEOSOPBtLe9Ra3Wd3FI7G0UfDJAhsBKX2Xn2Jt+HsPs0X2Ey3o
cU7xHaIK+oI66RLC+IWzXXXk4wOyBHVNRatacwRGNS9KBPpCDYlv7N5L0Y690y4N
FO5iSKxYJKA5k2MypsBLHG/2aiK6RPEYOi2GkNPmEx6wKOuniPtonsOU80Vwrb7m
f+DMNmEkiEniGihZGEj4vLwI4ZMgH9JVLKzj5S6ygu7wPqnYEdxZXUYossBmR+rk
gt8C1EpIJvFlFioaTSMIR/sdNr5wnuGPpJ+68V+WnPwAwtoSDjA=
=uPhR
-----END PGP SIGNATURE-----

--8tZVdKiiYitVG083--
