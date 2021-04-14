Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FBB35EEEB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349786AbhDNH5z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 03:57:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:43402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232363AbhDNH5y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 03:57:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5CF1601FE;
        Wed, 14 Apr 2021 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618387053;
        bh=f6zDGNINJ/UW60c2hM9vk1vwDoFWms62JvvgGtA5Tag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=csey9zwjcY3ybehi0G5Wx0jZNBYX6/hEeL8xXR0WQZetH7/TewxSS87rwsCvwcGYG
         ffy9h8zEa0CG+1U1Xhj6QV00vP9a2XDKB9MTEphkh/h21dQAEtE8/6T7SHKRq1d4TU
         My+MJfF7D5ZswzFLs/y4wKTh8w7v/LVqOlqq6giLN7u1R+IvETgkLTw8P/Ivckb5A8
         O8KMZ9XTWSsAAo+wPp/NFdVrjpuKXoXX4qeTh47rGObtY53EOqX9i+5kL+fnrk/t3t
         yYALMLqEn1qQAVpSMgfbz3kXOPTXK4Sur31iDJpsBF6IcmoPFjWc0tILJQ5WUyj3ce
         F/ERT9b07imqA==
Date:   Wed, 14 Apr 2021 09:57:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Pu Lehui <pulehui@huawei.com>
Cc:     michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        yangjihong1@huawei.com, zhangjinhao2@huawei.com
Subject: Re: [PATCH -next] i2c: cadence: Fix PM reference leak in
 cdns_i2c_master_xfer()
Message-ID: <20210414075730.GD2180@ninjato>
References: <20210408112352.211173-1-pulehui@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline
In-Reply-To: <20210408112352.211173-1-pulehui@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 07:23:52PM +0800, Pu Lehui wrote:
> pm_runtime_get_sync() will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get() to keep usage
> counter balanced.
>=20
> Signed-off-by: Pu Lehui <pulehui@huawei.com>

Thanks, yet I applied this series now:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D217733&state=
=3D*


--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2oGoACgkQFA3kzBSg
KbaJ8A/+LOVFIgPpu1Sk9JiNXEaOG8IHDrpPANUQXUYRI9GsWFrOLZ7S+lTl1IDN
W3HehonqL9azP0lyhCBGoqDKp+1znEfoJMOGyFxW1OyiGOLXthlZjGE59Iadsbxp
jT4SOeSJ1EK6KacxWyNjaQ46RHBqZGRCJGYI9fASjBlOag+r00MAL3i64meDZfiR
inBqaDzNhfxxa3+Z/n2mbEwiQ2h5vP2N4QZfXUlOMv4JqtTDEJieg51qcIn8mzDN
fOwBvgM1Q0lNhE/J/jowt7yDBSH0WLPV6ELO/D+7olPQbHJIbMYdNVlmIYwVkDUS
PVeqYkLqjPiE+30/X/C8Z/E3AvwqBaCIFXyOp0bSGLvkSSPHt3N27fK+VP8ezT5x
KSN+qd4fZBT+21f8m7T2k1uFhUsArAj6jlsKWObkeCbWgL42blMcUlEa0sWMHh+r
2N0XWwBc8kp4mAyw2hJSNNpjA4o+5CzHBG07UpAaXt6xY3FFwF9oRIi4/SKjPHf+
wXqz69BLorUe0j9ZI24K5mqIDVaZAh1RcgK6MfV5CFJQDt0qGZaRwJP6jtVGz6kU
4RXZhYD3SmAiO1j/mo7Xdb6KYEGni/q1tNOvpTRa6xCOsODZ2fZRSrhwEMplZ84+
Ht5hHhgXJ2zjavMJG4r/zeKZpS7flnCG/eLIf6olIy9/C+m6fx8=
=B9B5
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
