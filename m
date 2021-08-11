Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFB13E9317
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 15:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhHKNyf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 09:54:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:35724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231983AbhHKNye (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 09:54:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B423B60E9B;
        Wed, 11 Aug 2021 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628690050;
        bh=MslcfQhIgFTIJSxidpSsHDFSwQI1YaqTbHPoVqLOptU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U2oGrCUzJhFSlPk+yoWHJaNgUHZN9dVb64PBB4u1OhnXpjddj08vnr5SmWxUFOp6l
         ybGjDf/BRPwKcgwgjs9wi2JzzVh8pHoy+pAoczSX0SikySictZyegA8kv4GiWQxLIh
         rzKFURNDthFC6EHcl7WFojtiO43d1pevyWsybN7vl02lARHDZoxsY4XRjzu3pCZ0Ti
         BogqWB5squVAejum0kgXY0CYB8RL/T+4kpcg6VAGMgBytHLdtrakYU1N4jonyofm8m
         iF55fVuEGmF9c/e+1bzmCorkZKpFG4po2fmJNFsMw49RZx4vlMjYk8Log5o1HeTO0g
         tPP/dzssZ73jA==
Date:   Wed, 11 Aug 2021 15:54:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: at91: mark PM ops as __maybe unused
Message-ID: <YRPWfzteA+gjIZpR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        kernel test robot <lkp@intel.com>
References: <20210811131002.2201-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Zqx3oXTfd4wYk33g"
Content-Disposition: inline
In-Reply-To: <20210811131002.2201-1-wsa@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Zqx3oXTfd4wYk33g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 11, 2021 at 03:10:02PM +0200, Wolfram Sang wrote:
> The driver uses pm_ptr(), so the PM ops could be unused.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: dab4b0e8c9a5 ("i2c: at91: remove #define CONFIG_PM")
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-next, thanks!


--Zqx3oXTfd4wYk33g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmET1n8ACgkQFA3kzBSg
KbZsBA//cTm+G16cT6EOzsxSIGX8ujjgISd6pnyxUMA38RlHae1F2p/a0h1ooYK/
wGBlYChMpwXThNTeAwlzVY1UVEXuHumslNifAJJ+ezirA+lCz9BUBLy+88zfijl0
7TN1pyFArUqrIRyv2lfQDFH3DO+AydvqQlF47ly3xWUPcp/xvZltqr6c03Llfyp7
qnbhwMcVoldHkKrgD4xJrNc9kqGHJglg0HAYxeP3cwTDjqxXkvpnFP+uzu+/Q9h+
oHDcXVryCD05gsfNUKInfwnv0RhIrrn64yZIxX8C8okVzhq7t8j/MRTS1ghVG00t
NH1K8y6JqlE3e9ehqpkfmXfESIpVHvBAiHJM8fxe+d+ezTTvRgnbxB3+zvYph/p8
fy+NyjvuJ0H6F1sUJ20vdBX1xa03Uu6jtcRIvd+BqUDT2E74Crz/C2ioSmEYE3fg
a0nnhHeFsLyoYiiuKy9MKN4JTIA+zMCoa+7xuHiPDjNiaqEA9HLbR6QOe33m/oMA
vI89YAE+Rp//Njel+kpCIpI4B+M6feTpIDcKiGRYGGrGwUykDbJNORtVepViqlbL
cUXW/95eW9Xp5nBsT2tCp0DS7d+8qMo8hgaKaZ1MmFjBeKQk2ZG7BuF3LGdfHXd5
xlc/KW0F9XSekT9IR7Pi7JloDmVpIvxskdxiNXUhpRH/QajfG3o=
=OfC7
-----END PGP SIGNATURE-----

--Zqx3oXTfd4wYk33g--
