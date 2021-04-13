Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D54035DE93
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 14:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238296AbhDMMXX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 08:23:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:45176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230025AbhDMMXU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 08:23:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E7BD61278;
        Tue, 13 Apr 2021 12:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618316581;
        bh=ND/X5PX2F50VVA44GaiVxpFt4RRi9WYFZe/ETjrmJRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A07tmit26Z1hkuVBBr3htpkoV63+IyAC1YHM/7SHgFLlMucegNyEZzRJtQUSSot4v
         nY6ASTaCF25336mR4ox7kx+7DMsrcglZXjtZlBpeQj7OdNR8IDWpE9hA7nPWbKJN68
         7noArUgSXxdaA9CX9s73pmP8hq8FlPyaFiUeo//NneKfB7FzK41MW5VFZ8ig8O5Vj2
         rka/ha2upJwc/daguFwxYUMuwkvlDGBAD3afTEFea+VrmoI/XUa0r9k1rRq5S8Xx5z
         68nFM1V0WenqPieTJv4Uq/uVayQE05TwvRjE5nDXTAPZ9gNaMVDIn1WNeIIMfPFIf/
         SUFxJDPptHtkw==
Date:   Tue, 13 Apr 2021 14:22:58 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] i2c: mpc: Interrupt driven transfer
Message-ID: <20210413122258.GC1553@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
 <20210413050956.23264-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <20210413050956.23264-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 13, 2021 at 05:09:53PM +1200, Chris Packham wrote:
> The fsl-i2c controller will generate an interrupt after every byte
> transferred. Make use of this interrupt to drive a state machine which
> allows the next part of a transfer to happen as soon as the interrupt is
> received. This is particularly helpful with SMBUS devices like the LM81
> which will timeout if we take too long between bytes in a transfer.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Thanks for the update. I'll wait a little, because IIRC Andy wanted to
review.


--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB1jSEACgkQFA3kzBSg
KbbYBBAAlXcLqEENblEIDE7psEDr4mEm+m3yO79FZEb7BBNe3+VZhfoRfjikkcbu
IgP4JEjveLzN3oKuV2jniio7h5eX4I48yXAQJHonBUv8pDqCeMQ/D/trxfHE08GO
iL36Yv9Ehun695nGDxmck1CwqvR8CuIUMDvnw08zgaNDHzPn1y9cQL38WF4uZLsc
Exv4xrlxJESnSIkGEOSAEQO07Cz9ZULVIQK9hMboPIVvim8FwR8ZckEFly+HgGut
CAt3DZHbNkSzA0tbmVoMLuVNhOkGd8mCNy30oB9ykuY6ZVGCmNYTWfVDPBa6KLgF
6o8uuOPhWn2MfyWf95xYBJXiJvDeD0fS0tGTykGHgx+l2DR0etTukQBJzYLXZjna
bNMCy0mMpPegRjQcPnSItRSJzkRo9/sKiQe0oSSP/zHkqKnX7vkGBlOYwLRmm4o/
8PYM/IAi526elOGKVRX8D+sg5SkIymnHxzMVniqQb1xSnkv9qWGNJVC4cypXw0fi
JIdie4YPkKh0p66PMiysCSg3JtQx6t/nwvu8N87e0vSJawcswCAqJYhh/F7N25Iv
xlnu/lPphQTqiaqdphEsy0BVy2z1w3DBDu75zrBmXwqQ7jUUc17mJZBAbjxkjpAg
hcjJGcGKfWoOO9gcAewgks/Q17XO/FjLviga63AQDsW29d8d30Q=
=jhNF
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
