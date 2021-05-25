Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BDA390991
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 21:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbhEYTYX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 15:24:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:48746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232327AbhEYTYX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 15:24:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7550C61417;
        Tue, 25 May 2021 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621970573;
        bh=CD233/PXd0ItWtF6snYXnFHNhgg4QFi274aDoCZrKTs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GNsv3LsELL/9yrUwpBawE0um8jz1CKqMhQyzKwul49+iQikqcMtuUOsz+o+5QdUhf
         5uA+dzTpF77zAid2n0RcMsEnlcL8zwzU69wrVy5A9gsIb6WNYc7uX5P+m4TEK+rXpO
         QXUuXiLCaao1Wt/fY4ImnW29qTX+AyavDn2OxNPkK7BPywDskdXp/cL6hR754FX2pR
         d/a01kZx5hloxM2dRAVMbKMGLeFez9/QSbQS8GE+90H+SmhBAqFSMO4gHbRlsSBUJC
         Il1388wqrxLUQSoLgxN9rDkUOAAgDf4rbOnRXCQUAY12K4NP2dP4ogUjD6IiOmpIrp
         b2wvMVodeVuPw==
Date:   Tue, 25 May 2021 21:22:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Max Staudt <max@enpas.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: icy: Remove unused variable new_fwnode in
 icy_probe()
Message-ID: <YK1OiogOqNSQ05hd@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Max Staudt <max@enpas.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210503070220.23932-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="12Dmi5AxYTVzvQHE"
Content-Disposition: inline
In-Reply-To: <20210503070220.23932-1-geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--12Dmi5AxYTVzvQHE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 09:02:20AM +0200, Geert Uytterhoeven wrote:
> The last user of new_fwnode was removed, leading to:
>=20
>     drivers/i2c/busses/i2c-icy.c: In function =E2=80=98icy_probe=E2=80=99:
>     drivers/i2c/busses/i2c-icy.c:126:24: warning: unused variable =E2=80=
=98new_fwnode=E2=80=99 [-Wunused-variable]
>       126 |  struct fwnode_handle *new_fwnode;
> 	  |                        ^~~~~~~~~~
>=20
> Fixes: dd7a37102b79ae55 ("i2c: icy: Constify the software node")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Applied to for-current, thanks!


--12Dmi5AxYTVzvQHE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCtTooACgkQFA3kzBSg
KbZpSA/+P4jkfur6oUNkbihBC/UKNqI/nktR87zCPjLt3muUZPCywY19qxtyfAxM
lW2S8Nec6MutIJIqSUIl1asTpI6W+5LwtbnkGR40hqAo7QPg+xS/cHJ962dfBhg+
wKVl6XSNQagDwZ+KOY7tSb6Eu5M+YCwQ3Vk/N7ugzUychbHfNVPxGyp5kBTFL5Jb
yO0cSwYERI8KE2HI63lbvL064HJarlHZkbUMRsHfiMGAEWJnopfkYVWQXd0+W6Zd
dwWLWI5TrHe3KkuU3XAdU8WvnMVMzIVMbcdrbuNUm6oDvY4O48L7w4odo48TQZlG
Yx9WXNUZN+PZ+veS2YLaHmkiyE03Z0inG7mOnGSASszpYWQ4bIAvSCieQHjNzb3x
dI3T2qvWO1zkrA3Bg235ALj+hB+Nvae98C7rQzbt6RWjXbM58VbNn1mlQ7dKm0Q8
WJG9SjLspEA4xJN3eP70o1+Dk5H/t7QxEln/gqpU92CwCT4xpnj2YMydsFh7VIGd
I9Bzey3NQk5fpG97wTmDbVGc2mHsB4nyVzlJhkc2T6fuawwi7OnvhdeEws7BCcz7
/TBMNFh+AJgkw8OBkF/dA4lTekmMLU0fUAf1CjHcuvjJK9101PiHkISFCLKt07WB
F9vUSbtOySX9TOxce0gye2Q9Qo+aHVgWRoQXGLWRQKkagLZo7G0=
=K0pN
-----END PGP SIGNATURE-----

--12Dmi5AxYTVzvQHE--
