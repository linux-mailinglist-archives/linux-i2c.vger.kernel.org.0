Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003031C5988
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 16:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729201AbgEEO3y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 10:29:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:60954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728749AbgEEO3y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 May 2020 10:29:54 -0400
Received: from localhost (p54B335A1.dip0.t-ipconnect.de [84.179.53.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44542206A5;
        Tue,  5 May 2020 14:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588688993;
        bh=hHch9Qk35tfnWGRiDodyVa26GalnDkMLxb2qrD7VAds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dsrlqP5MZG8yng1YWvokyQGcmpsxZict3xCGoZOhhXmXVHz657gUCbNFigQ61SVZD
         V3DV8X66RhVroB998uohF09LwQW04WVh/4sLprPsI9JyDQo9VjbmM56VnoHMNZXFpM
         fycLPTvQvg+nVdOnWNopz/KqBZHDVfMl8+Z/1aP8=
Date:   Tue, 5 May 2020 16:29:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: use my kernel.org address from now on
Message-ID: <20200505142950.GD2468@ninjato>
References: <20200502121840.9544-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6Nae48J/T25AfBN4"
Content-Disposition: inline
In-Reply-To: <20200502121840.9544-1-wsa@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6Nae48J/T25AfBN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2020 at 02:18:35PM +0200, Wolfram Sang wrote:
> The old email is still active, but for easier handling, I am going to
> use my kernel.org address from now on. Also, add a mailmap for the now
> defunct Pengutronix address.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--6Nae48J/T25AfBN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6xeF4ACgkQFA3kzBSg
KbYtaQ/+N0tB4bS/c5jtXMkgrmSCPLhNa6mvoSw9WlLnEfbxPyF4Cc9qq5rub8YC
IO7rOSIHdjriuLRQnbbEE+B6LECuHHwQd1WtCSgqvDUDPmVd3DobWGjHNps7fHvr
9NGH+pQ7yQKVzxLJ2W36tL058xvBEccmsZMVpawaZP5ZyKgSlZ4XxzyNL64BguVS
aqIiFPFx7svD1r9KtZ/AyQ44aA5cjV6rOmqHYF+rFPMsWn4NUWXg4tMlCDhUG2dv
+OaF9qVq6aPNkoZN5IvrAkUUBu4yT3bJViRzx5s69SOiI+8ekJAO+3rh6vuqC8XD
OHrMOQQHlQNv9UfcJiiqc1u/Fe2LA59iCl4JQIbkjiCu6R6MkyLlsrNrksmicNdF
JmAtqNyL+ube9+QdJvcUejW1YPhMS4cErF+wwa7LndUq7Emx9fgd9U/NjSFA5hqX
aDWkBUzcwp36pk4SVBimMkR65U6dpT0J2zXzrxSKLwfyTTmQzEpPde4JgaNQIOUX
a3HgU/8WSrUt5WUI3qaNHzOdzrbLX8SVdd5L3wSFrxNze76Eb9ZlFU4lMYo835R3
51pZoKo7Dd6AwKGmoNyfbxCs3C7xtUnwQbHMDaSv7XMoC8cvWS+9Z8vAEk/cLpxV
7aMdIx4hH0buoEDSwojdZ9bMUnD9PpjSJXnNthcclURPGy2TsuE=
=VlMG
-----END PGP SIGNATURE-----

--6Nae48J/T25AfBN4--
