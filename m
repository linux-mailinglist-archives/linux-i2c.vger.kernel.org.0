Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EACC3071E9
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 09:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbhA1IrR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 03:47:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:47604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232145AbhA1IrC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 03:47:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4563F64DD1;
        Thu, 28 Jan 2021 08:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611823667;
        bh=ef5HP8kCtd0XxgudGLXbW1GarQgWdsRVnQ7V6cZdKAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qGR0flb4Z2A/DtGA+cnNZ+rJdyOIDpu/4bO2LKaZzWRMUNovt9aY+Rwnn1/1Ive9T
         tHSrzI18/2HC29FSVqW8uXR/Gc18rEqOTeMvDMnfbD8YCruPO+gVCBBm9fwSytytS5
         +VM01RvqfxbMBGiXKOVw8Zh0nNEfsEO7sK9ZmKIb2bHgtwSsXuJ+2GjpTpSn/mn/Ke
         Fj5SZJuA/4pNAVCSsnLN6S3Q+oMAShXLNjfUMztuXzsXCaQvICzAhAtbZ5u0iypvlo
         oBwnc0Nyny8jBPH8Ky9r8JJR73W88/qKch9d9RpOCNoQWm/X31C6W1f4VytmA95S79
         OL8lI/qsDFfyQ==
Date:   Thu, 28 Jan 2021 09:47:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 3/3] i2c: remove zte zx bus driver
Message-ID: <20210128084745.GB963@ninjato>
References: <20210120132834.2375048-1-arnd@kernel.org>
 <20210120132834.2375048-4-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline
In-Reply-To: <20210120132834.2375048-4-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 02:28:34PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The zte zx platform is getting removed, so this driver is no
> longer needed.
>=20
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to for-next, thanks!


--WYTEVAkct0FjGQmd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASejAACgkQFA3kzBSg
KbYN2w//Zn8B3sS6iHHx9vNRG5hzmhh3xvyWvawFvWmojwrZU8yYt1zycYDARkFc
Qws1GmbZ6onGwMBAdxQgOqXStgRpXnMOOUsCG+TJR9iiQDdExc2rdIpwh+kXus4B
JnbqLgdGfl5FS81OJ06w53QTjumxbIb+yFcYTtfrlaVWZTUYjUSAkSfYXB6BsEBt
RzRqd7RohM+lqFOTF+ECNYC4DmRTm21KTUF4eXBJSzjXRtiI3bVcAD4PpRNhvjGt
413QBiPYxnQXxuKxdjJYPdFtft38pXU7Yl4AjrGj2ESI7iHIsTGleW3+Q716j+dw
dJBggNVqfURoG+opmoWT7UQ1rgCwJuoZTIWvlhoTdyin+snK4UnM/zCECLpKSv/Q
AUmvGcnyfkakGQglEsYOJfkNAaBmi8i9l32IidcLVNVYL4gRimFwXlTz1BbJ8y8b
oRxwX1r8wKxh+rJANFQcrDCmqTziwhknAtRXUqoZys4UJTEy4ZpG6dVtEXpyRGpd
6GMjcCXPDx6e4foK9hNFXWdBlGDiiae/ykIGhoPAyB1PF9Kr9Y/wqTWkd0yu+q+D
3UGMSB0/wxbLef/8piPrmIx2/1BWo+sRe1yWqyrrBGC/OVZMNzlTwSmy71OCweNB
RprLFSiij0CR+6oglfLE2wCXUL1gwigpDQHlDk2+qUH1XtJPqfg=
=RCjn
-----END PGP SIGNATURE-----

--WYTEVAkct0FjGQmd--
