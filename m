Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8CE3547F7
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 23:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235284AbhDEVDJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 17:03:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:59406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235325AbhDEVDH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Apr 2021 17:03:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C391613C9;
        Mon,  5 Apr 2021 21:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617656580;
        bh=HgQvN2jxd6pqNuQlUKDgj72sVC1cpzJWfPe39RipIoU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y2ijAu26mkYYPXYCoIyD6Hrthus5fUXIPKGiW4/+Q+HLZa0l0+HwCFSw8aCW9Qyip
         nTuEaThTQnJupCBEsYIHkxyN247v+lqAuHS4NSvHAb+mlXv3ju26kIk+w+NQn9gTIQ
         pZ+Wb/zulKMEHhs0sKP/uA+s+c2gjmIglWCoh/1YlNcwu0a65Bny2w/SRJyGV6WcSe
         /P93yOWjdv5zVSW1XbFPVqfbdFMSLrwaBSWhmgr+vxXD/LosnY7ZaUMT+T+3fZ6nMx
         e3qXtjveyNTaAVyVrVLsOlfVtZ8/fLw16R5cuqoa/6M8jgSho8FWEKreHXhZOHZQoe
         iCeD62jKUGZow==
Date:   Mon, 5 Apr 2021 23:02:56 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 1/2] i2c: tegra-bpmp: don't modify input variable in
 xlate_flags
Message-ID: <20210405210256.GG3945@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210331075141.22227-1-wsa@kernel.org>
 <20210331075141.22227-2-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qf1oXS95uex85X0R"
Content-Disposition: inline
In-Reply-To: <20210331075141.22227-2-wsa@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Qf1oXS95uex85X0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 09:51:40AM +0200, Wolfram Sang wrote:
> Since commit bc1c2048abbe ("i2c: bpmp-tegra: Ignore unknown I2C_M
> flags") we don't need to mask out flags and can keep the input variable
> as is to save quite some lines.
>=20
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-next, thanks!


--Qf1oXS95uex85X0R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBrewAACgkQFA3kzBSg
KbZ1jBAAkcvQKOklEKraEG7adpnwlA9ciDavTAYR14IfwvF0xXhuGrkuooxf4oL9
2/ZoSUsy+yAJmP8Crs6MewgWtjwMYH5h7UvtZVWYqEdYuh9OfRrlXBdl4a2PeClb
rKEJJteKgnENLF+S6TfOWEfaAHwCqvqmO1idT2sLvlEB04U2KEE1H/y4aprK5r7k
1NdprdP0QTrmEStusv/09pmkVvAkespn3Yst9dg5XJZw0EmtqJsWKZ42XiEDaui4
1X19++qnY/uQ9AiNpVwYiwIn9H8yZFvSj9R5vdgxOlTl6P9E9v/7m8e0bKuJdveh
eFGtf+Kp6a+T/JE7pN21dgf3RAYtko8SccDZVxQTTSwX2vdUUzGwRRdDvf1Mo946
T1umphUGgmTT14epUQtk0JPVvICJFZyfuB9fughkHxvBL2MbvaNTMKGgKc1DFZV9
cZlvkesP3ojVBRWvAk8FPMGyms4PfEpPwW5vcsp7eHathyZSaD6o4wpcGJJM//vn
UuDHKiZdA524tO3cBbAEsoBmmnXQgDqzgk3RKNb8v76XoxiTrfLBxvEuQbA5WxWw
dSYk09mll4jEuoZ/McqrB2tuKwzODs+SPEaVBVUnt0wZ0W41/I5MnVaWqMVxcKmR
iwIgyl9wvfZqIm45qrZpi6j8RL4fS29bVV7POeTTGQvJGv668Bs=
=3b4P
-----END PGP SIGNATURE-----

--Qf1oXS95uex85X0R--
