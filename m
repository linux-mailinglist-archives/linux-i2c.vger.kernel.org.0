Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D6A3B9D22
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 09:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhGBHzx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Jul 2021 03:55:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:48578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230226AbhGBHzw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 2 Jul 2021 03:55:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEF4E6141D;
        Fri,  2 Jul 2021 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625212401;
        bh=Brp1/q5O/0OdCaHz3aO+XfH/SiIrEiuEJSidWnSmXt0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g1oYHYH63uQAy+IrY9RzVHJL8HTo76hZOndac1EqkwoH6CFLLFCtNbTEXpL/Q8HSb
         p0/ioM5yx7RXEtq8E3+BgMgLJAcVGfy126ZFVdDtaO30Nk4vJuEWPH05hXiBQ7O+nQ
         Yut0+UZ06amohkLa7+hYr/TIjqGGqS3QGBXjfn9TqH9xKOhZLWcADYZo8qs5nOx+DZ
         EHSrEVO/c2lcGbKjLxK2xLa8oqGzl2XNxdLM7lw56//A5wU6yOidkSqtNI/ceBCRXk
         IvToIcU6r0+7IrhdZcQc3OwFYN+x/9eP5YtCvmrgkvKvM5WBjdN1CbTRltVIgbPPga
         aLQVowdnMCgpw==
Date:   Fri, 2 Jul 2021 09:53:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] i2c: ali1535: mention that the device should not be
 disabled
Message-ID: <YN7F7itkYKkqccX3@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>
References: <20210625151758.12180-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KiogoMbudFHgpQS2"
Content-Disposition: inline
In-Reply-To: <20210625151758.12180-1-wsa@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KiogoMbudFHgpQS2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 25, 2021 at 05:17:58PM +0200, Wolfram Sang wrote:
> The comment from the i801 driver is valid here, too, so copy it.
>=20
> Reported-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--KiogoMbudFHgpQS2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDexe4ACgkQFA3kzBSg
Kbahdw/+JailAqMOkWHxE2EMRL5EGPXH9iwNDpSbKVf7Wx2X+fl5qqq52igXiVh5
0B87vQQObQ4kWhI/yEGO+ncGLe6PqxhJ0lBvZgjDkXDrMUdknHQOj5EzLeVADR7S
K3yImF2MhzgNxkEGLdhCJ4VZUnxto1v8p+Y9UOPUBTiH2a0Hspa9jQeh0Qja6jJl
RMgeT/KvKlKg374Zxl0hzusotRTunMsTti2QlJ4TPZHziKKxbX9/sEicKh41ly4C
iRty4baATjHVfbmEU58dE7o8q5wk+rX8dTIpCt/9w/4gPbExKJN9uvtc+ptPoZp7
3R4wFZLc7NxYYhhsznrUJSOtk2a/e04TTcqIAMuHl8W3SDUqf/IjeCf1pYRZjLIL
ev8H6h1e0IRuy9nLIAYiKXcH798+tQz/1r/Yx6k0C0y+nXebWr/zJQIT7DWi4sl0
jKt8mZ+sNhaSMidjdzTkYMPEHyOQ3/wSBD8h7/9Ni5Vsqu0BrSuPq7Xrnwd/Xazd
nD0mC9LZeI3YmUXj03Zf1wt1kUW1Uwama8ylKP5bFWfPV5ckP4/vUh/zSKeCe82T
GXywqysKBsnboqqQBC6i2Rs52ncH53+S2OgCdX9kxnaqI6vvMB5HlyfV3OZgaYX/
0dH7xCRwGNbsll4WnLbFxwc50/7NGUDdh13yh77GjmM1DyVpzfY=
=3kzM
-----END PGP SIGNATURE-----

--KiogoMbudFHgpQS2--
