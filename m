Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F116B393646
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 21:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235285AbhE0Tb6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 15:31:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:54320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235257AbhE0Tb4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 27 May 2021 15:31:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69006613DD;
        Thu, 27 May 2021 19:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622143823;
        bh=3PGsxTOOUe19KS+MsytPkQKfZ5lmUOSYZuKpL/wpOIs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nSJAGaCmBg4nod0lyP4xkJnYuO8ufJIAmA+kmyhTVihjn86okwtJUO/Ov8yxjxwgS
         PX/omA1O1ev0RWRlPtejyYseYLXX7eN9Rz1g1S6pyYMclLJ+sbAOygRQMyY7vmKpEj
         sq3rL11uV+R5enjDmw0k1LC9EcA1aUbRtC56gdMVmeeJn1J+sg8MHolc2AwBhfuJ5U
         kF2/5bpW+OUCekkhI4JbKFN02VHSfPWDSyGYtLAe/BVu3cTBQzIYbUsKRJ9A+wVF+m
         4F5wLb3nG9Xol7+hDF89WNorNMh0bowI1y8JsRdXWSelngm2G6Qxue97zIPGKsqeqS
         WJ65+jXSdr7Xw==
Date:   Thu, 27 May 2021 21:30:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rudolf Marek <r.marek@assembler.cz>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 03/16] i2c: busses: i2c-ali1563: File headers are not
 good candidates for kernel-doc
Message-ID: <YK/zS1ZPKEl26Ese@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Rudolf Marek <r.marek@assembler.cz>, linux-i2c@vger.kernel.org
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oQMA+jq5KRbPgkaa"
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-4-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oQMA+jq5KRbPgkaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 08:00:52PM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/i2c/busses/i2c-ali1563.c:24: warning: expecting prototype for i2=
c(). Prototype was for ALI1563_MAX_TIMEOUT() instead
>=20
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Rudolf Marek <r.marek@assembler.cz>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to for-current, thanks!


--oQMA+jq5KRbPgkaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCv80sACgkQFA3kzBSg
Kbae5Q/+OCpeiGfK8y2MAJ4aXxA6R1rk+x8828XV0Vs2LvA36MZJeZnTrmhlURhp
s2Pf+XAEa2wfYUNeE9SIv8PqTsM/dmwZgyLtITv6dCKzqthoiTO0FwCFuEop7Oqk
67Sd1yRByA6/u+/vDgq04cJLhUDzFJyaOjSaC8mspjzoA3Mudd9u+70mFRsuLbvP
CcqzFOiyLUdLyCp1u6/tYsFuNKdQyfYZUsengiIuLKCxwxg62mFCQT/j9BJqnDH5
n45KQcrZDlTOXqnyM8yffJe4xpTl9ykjPBSEv0li7R4bj1vlKeRv8CLLihiDY/nl
cTtTKHsd7l8lfvC+Q6xKwoqqj0Vy97AjAWWWuz9+u56cPAf1QlJymWlUCtqe+6sv
MJdBBbkmPS2k3bvxGHZOoeXg3IJo6MTGcibZSu9RUIvPMm/BEgG9m7e8oWqqgWVs
c0xyyAPr5zCdTtR8f09O9gowiuIbEuW6efJWF+/t4U1iBZMGmQO+W9JuCdlu0Uvq
uFSa0Oqcn2qoiHKTo0vEYESqD4EsQcKFvXH7XL8oT/5yYfU1hc8Ux2SJlHQDh6KC
UccBkwbkpm8MSTbwOvAlHk+gD/DCV8bVgxrEMiFhuE3Y0t9UsifeMnJ/9IK8cZhd
uSPNz3/t1yiDydYrzobJn3YqoOWHLF1YfOPYJZaQzYmrzZ9Lk7w=
=DiU5
-----END PGP SIGNATURE-----

--oQMA+jq5KRbPgkaa--
