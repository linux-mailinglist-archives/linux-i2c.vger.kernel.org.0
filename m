Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 965988D3F2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 14:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbfHNM4V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 08:56:21 -0400
Received: from sauhun.de ([88.99.104.3]:48626 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbfHNM4V (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 08:56:21 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 6C4882C311C;
        Wed, 14 Aug 2019 14:56:19 +0200 (CEST)
Date:   Wed, 14 Aug 2019 14:56:19 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] i2c: replace i2c_new_secondary_device with an ERR_PTR
 variant
Message-ID: <20190814125619.GC9716@ninjato>
References: <20190809154047.9897-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline
In-Reply-To: <20190809154047.9897-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 05:40:47PM +0200, Wolfram Sang wrote:
> In the general move to have i2c_new_*_device functions which return
> ERR_PTR instead of NULL, this patch converts i2c_new_secondary_device().
>=20
> There are only few users, so this patch converts the I2C core and all
> users in one go. The function gets renamed to i2c_new_ancillary_device()
> so out-of-tree users will get a build failure to understand they need to
> adapt their error checking code.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com> # a=
dv748x
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> # adv75=
11

Applied to for-next, thanks!


--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UBPIACgkQFA3kzBSg
KbbkPA/+IIbLYkWm/OQkI8SkV2391hNcFVtK/8MfhFix9inrSXUhFvv3QL9ufhXN
VtGLFasJvv1ET5mro5Qhwd1GS/Eml5NdP7WwRLYaWaHTLLRmwGsSSzIuS7TooTON
+2Ro3fI+bwQ1GL7hDGdF4ElpTpHvoP8j3ejZK9cQMpUm8u8Wxyj6YJwUy62pppdh
EtuNem5mXmQc8RQ4nQweOTu42aEUEawbOnE3AxUl6NkE7MpT9bAK5so25kksNfra
GzwHgfLaMmg4Aw0+GHPxGKIKDLTJqEShl/d8xB2Y97TmFSTgpZaXZsBy6T+i5gfc
imtcSuL2j6z6vw+iKKlqnFqk0GUwPvSDH+dNGvi4FO1UOGkXj1gf2AZim+uJz9Ge
DtRH57A4q21asK1QB2rPgVCmkSE33bsoZOLF0XqzucUdij+MH1Sgs3RR8D4KaoBJ
KkpeJtgUHPlnky7Tr/FZcdV/+YZaQsiZ3RkUcJnNOKIJFCEuy7m6tbfneEKT/GWz
SsuNKWIlGtNGnG8rGXmZD4a805J8IjMqGre7LYpO6UdYXmEIvARJXMl2BmmapUJq
nk/dZSw7hQYFfyge/Yg3ZuxQqZvVU26ZdNXDbZ1qEar5u/SbvlSO4x48yMviSJu9
vXE9MYBv8Krq1PrZdrFSjiMRAUQ/y6KqkzKfpyEN16ya5ZOu9ew=
=8vIL
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
