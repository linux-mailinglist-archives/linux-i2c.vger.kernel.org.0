Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237BC2306B9
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 11:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbgG1Jkp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 05:40:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:54466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728197AbgG1Jkp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 05:40:45 -0400
Received: from localhost (p54b330d0.dip0.t-ipconnect.de [84.179.48.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2287820786;
        Tue, 28 Jul 2020 09:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595929244;
        bh=oza2dCMvJLfbtMMvVIZdybzoBeH17mdhcHDM5KbadjY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fHDR+N6noqXdIXYYQSUhA/iYhB7q+HSnsXDQjoH/ivb1ItgtQ1aW3ZsVMLiGDTYxg
         MXItggnkQXvsN/CLZC6mdhc43EkJKO6CGwoiKMejjH8uwjB1d/ed2eNscH7VUNZhF5
         4DlJ3CXFMxFDGsEjTf7o7FTQWW59kqHlp5C7WY+c=
Date:   Tue, 28 Jul 2020 11:40:37 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     daniel.stodden@gmail.com
Cc:     linux-i2c@vger.kernel.org, jdelvare@suse.de,
        Daniel Stodden <dns@arista.com>
Subject: Re: [RFC PATCH] i2c: Support Smbus 3.0 block sizes up to 255 bytes.
Message-ID: <20200728094037.GA980@ninjato>
References: <20200728004708.4430-1-daniel.stodden@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <20200728004708.4430-1-daniel.stodden@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

wow, that was fast! Thanks for the prototype.

>  * I suggest to just settle on '3' for new macro and type names
>    (I2C_SMBUS3_*, i2c_smbus3_*)

Yes, I agree.

>=20
>  * Block size definitions maintain I2C_SMBUS_BLOCK_MAX (32). Only adds
>    I2C_SMBUS3_BLOCK_MAX (255)
>=20
>    - Means that drivers in drivers/i2c/busses/ default to their safe
>      32B block limit without refactoring.

This is totally fine for this patch. However, I still think I will do
the renaming to I2C_SMBUS2_BLOCK_MAX in kernel space later. Just so
people will understand by looking at the code that this is an old limit
which can be removed if there is interest.

> -	__u8 block[I2C_SMBUS_BLOCK_MAX + 2]; /* block[0] is used for length */
> +	__u8 block[I2C_SMBUS3_BLOCK_MAX + 2]; /* block[0] is used for length */
>  			       /* and one more for user-space compatibility */

I thought about this, too, and wondered if this isn't a size regression
in userspace with every i2c_smbus_data getting 8 times the size? But
maybe it is worth if backwards compatibility is maintained in an
otherwise not so intrusive manner? Jean, what do you think?

Happy hacking everyone,

   Wolfram


--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8f8o8ACgkQFA3kzBSg
KbbF2RAAlUz26Sn3CuixDLViRTtCtf6t88maHM5SEUI6krS+Vrj+NRREzd773OdI
GBcxFh5D+YXFMQpN41Bl4JSayaGIM6NWtCTkXDK1aXUHKPXLxaz4abF5z/7AYvZp
MLiiAIsXOGPSHwRp6VEL17JyJ7Bsyn5SGcDFh1lu758iQ+JjcLRB33fXBBM3xJQQ
ILLzjRJPHc493gxETsPmhyjCzwKt18LVOfBce1WM8zc3RMWiuCIMyeYb306Fo9mt
SS1lemfBg/9UgFxPrIkT3+zcp55YOR6Sxf1V09r+l4o8+4yH0TrPbm4cgAluNCtC
TG+MSI1ZL9s42ktzuXtyhyAe7QtzZjwmrzlXDJkhQsQTm3brRyXzBsOmU5FjQKrP
sIXVuAUR3HVR/FeOuG2DEL/7HfzKb3e4DIIEMIVVACSFamkZdy607A7vcU/tN3bk
FtcYu9RP8uZDCvHAx+b5TOjZS6iU0GV/nXNlmoe+55pV6+aszlbO6NnQX/1Ki+zi
VaD0KJ7nd2+1BAJluzqAbdy+7qVMrathu6C/Q+tomrC2MpHmgeGMHbPmsUO3fEbM
NTo/EBBpsrLdAo0gEN/EBHzNA7yc5SmCQOdMHo72ZQCsLSmxMHLxIeYcw8BVQUqN
W/DWN8ZM1/MZ5y4vf2/cmcAvDxbYBwsWjCGy/XOEJ70amHj46SU=
=ZI0a
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
