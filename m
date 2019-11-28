Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC0310CC99
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Nov 2019 17:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfK1QQ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Nov 2019 11:16:56 -0500
Received: from sauhun.de ([88.99.104.3]:43868 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbfK1QQ4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Nov 2019 11:16:56 -0500
Received: from localhost (p54B33127.dip0.t-ipconnect.de [84.179.49.39])
        by pokefinder.org (Postfix) with ESMTPSA id 37F4A2C039E;
        Thu, 28 Nov 2019 17:16:54 +0100 (CET)
Date:   Thu, 28 Nov 2019 17:16:53 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Max Staudt <max@enpas.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 02/12] i2c: icy: convert to i2c_new_scanned_device
Message-ID: <20191128161653.GD5412@kunai>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline
In-Reply-To: <20191106095033.25182-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 10:50:20AM +0100, Wolfram Sang wrote:
> Move from the deprecated i2c_new_probed_device() to the new
> i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3f8vUACgkQFA3kzBSg
Kba7yxAAsICe1NUvua6JDJZFMY/3aWdeA1/tg0vM+UDd7IAnznquKXaA1kAcuO9U
pkvn7D5q4E79qmkamMlfpejuzapjlfeM8o0u7gRneXiSVG0z/NcEb5R8muOd7msc
QIF9yv1l9bJjia3oomLIF+kBut5CY8JjCgGTr8SKuMe3LgX9zfyZH+WNU4I4mzRm
qfeME8R0ktINtZMXS10zSJenOhAjJe4SRWfNk1uUgmkU+j3QLgQrd0CUaq+XJ+Pi
DoKvm9FDs3bbYFOkgpCLhJpf9pN7HTF3rTsmaY+aU+ZHAhVD4uM0APPiMFVTcXiN
T4LI6V4tghiRCQJPSg8cMP65krty5VaDRKUjNedZhJpfr8aT9/xftOesCuhcfS1Q
vTAKaEdcSlZNbc9L835m8zEIidvT1Nn+XvIiqvKau9EqiiUMDAhLsmbobW5RyGl0
ZJg189414vB7fFGQymW5pjcNmBtVnB9Ij7t0gE4vmjHJlr4vmJWfxuOxnYGDsD63
xIcPLRKjdu+ZgTGAI2seloYOyCwttTKT91zOS/kc7OWj4v5Dcqc32r5dGWAeP1ng
HRRDww3rpVGRCJUmkBiWFSjS/0Dy4yXNFdoMp6wYp6p6bhBMtzolHewzZNgbXYD3
/EuhBLDDkDZ+/tXD4K6jMr/2QhkboueNm+UwNnD5iDrgTZ0yJKA=
=6A6V
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--
