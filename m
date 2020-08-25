Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992B92513C6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 10:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgHYICW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 04:02:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:45674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgHYICV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 04:02:21 -0400
Received: from localhost (p54b333df.dip0.t-ipconnect.de [84.179.51.223])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5FFE020706;
        Tue, 25 Aug 2020 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598342541;
        bh=bW13b8whVUygt/4rBdV1/g0/gNKmPIYE6suPowRZoFg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BQVvCvXTMwC+xwU4G+qX71HTNbcHnrkKm+kDkjp0Xiqq0t/ULU/CYo34QzzS8okrL
         MbodXfeiu5FlhH4w57HMfN8h77BrrJw2QT1cDwx/RrFkgmT95G0wZKUckGj36uyuCN
         qqv4UcJY8haGJ3F+sHlQjtd0naMmKm5OlqqJDHEg=
Date:   Tue, 25 Aug 2020 10:02:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tiny.windzz@gmail.com,
        huangshuosheng@allwinnertech.com, liyong@allwinnertech.com,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 13/16] dt-bindings: i2c: mv64xxx: Add compatible for
 the A100 i2c node.
Message-ID: <20200825080218.GI1861@ninjato>
References: <cover.1595572867.git.frank@allwinnertech.com>
 <a6393e8feec580e11dccd5df20417e66e8485cd0.1595572867.git.frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fckbADODYWZD5TdN"
Content-Disposition: inline
In-Reply-To: <a6393e8feec580e11dccd5df20417e66e8485cd0.1595572867.git.frank@allwinnertech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fckbADODYWZD5TdN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2020 at 03:17:01PM +0800, Frank Lee wrote:
> From: Yangtao Li <frank@allwinnertech.com>
>=20
> Allwinner A100 have a mv64xxx i2c interface available to be used.
>=20
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

For the record, this got upstream during the 5.9 merge window. I seem to
have forgotten to send a mail that this patch got applied. Sorry!


--fckbADODYWZD5TdN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ExYoACgkQFA3kzBSg
KbY0xQ/3Q36zIMyVlkjykwjnFr9cNVl74rUXASPx+KqYBCPCcRW4YHzmDvdsmycj
thCvkVfvYy8WWgeyn5sccWYNir9oHTKAaToZ+VztJsrwK8a5xIjjZ+qbVpScLQGX
6aiXnzwl8Nj7N0ntuZJRt+ghWAuYEi59FpWmxFCtecMC+V0vkQfj9xfaiQ+/NUWA
MpIzHekbvoZKSvsMv91iJZcuA2+ouZiudy0/zi9tQB3aRXUIrVttSWFCkdT8yzAk
oC+Ix3zT9UeB1/2hnhjl0BTj8rcSFSiIsU2q+jYdyfG1sQZvWQEGj+Hcx5DvDFqp
sm+HM+UIORNOrJyL3k1j78QKdoj+n0CqKyXQPHsZl17aziTy5i47bQx45xiQLA1x
0rOlZM1vHkn7pFCcJ94jc+KpjpxrNoqiXM3WHF7e17w3VsK9buCUJQIScepPYn+y
LwlApNjGfYS6ZgpY5P/9IH34Gb4jl3pwdhCZwZaCm/zr9igthNEhuOc9BB6veBFk
nBHiwl8vpVed60Uu1Mn+O0XwGqTdU9RyIwq3iBv0w2PLellX6+Gm/CSO6RzA8e9n
Ii/h7SSrqsJmmE5NKg6jSrkk/OlVrjK+Vt1HxndUc/pG41ZDIE6/85vEG41N3KG0
ekOcl9ttQkxwsbmRbLq/ONZCrpKzbNtMNP0AyJz7376ICmOgCg==
=kqFI
-----END PGP SIGNATURE-----

--fckbADODYWZD5TdN--
