Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CB835EEFB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349831AbhDNIBv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:01:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349824AbhDNIBn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 04:01:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDCCF601FE;
        Wed, 14 Apr 2021 08:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618387282;
        bh=A17+YvYKeT74dwM5NvpYH2hMlwLgSEqUmsE8h5iCq7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fSX6jBuLw2uXn3nPd1pScagSSVO6HZLk44dMSHJEMQpzlA1praHv3HMbQAJwVMAVv
         as1vgm/DByYWPi+HxzMxsVLUA2w6PY5EMa/CmRk2rd6kQomag4VTCCkYQbN2sCeTHC
         /WUxn/YdBgcamrNoIBiyEHhR/2n4PFDnOSeHK8ZRhO5VlUI9IoZI9otcw7xBU+q5qj
         yTn0bwEpndUH/jkQ87Uw9UclAygJ22IkyekBbMOwacRf2uwVAUUQTIDKHc9a3bs14y
         TiM/gv8fBqOIPrSGdA5HDPa3/c0M/t+VAAdRXCRFJxD5CV0jSZFZT9FDG9/KoZi4sl
         vyOKBTY0jGlYw==
Date:   Wed, 14 Apr 2021 10:01:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Li Huafei <lihuafei1@huawei.com>
Cc:     vigneshr@ti.com, tony@atomide.com, aaro.koskinen@iki.fi,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, yangjihong1@huawei.com,
        zhangjinhao2@huawei.com
Subject: Re: [PATCH -next] i2c: omap: fix PM reference leak in
 omap_i2c_probe()
Message-ID: <20210414080119.GH2180@ninjato>
References: <20210408125648.136519-1-lihuafei1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkEkAx9hr54EJ73W"
Content-Disposition: inline
In-Reply-To: <20210408125648.136519-1-lihuafei1@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vkEkAx9hr54EJ73W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 08:56:48PM +0800, Li Huafei wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here. Fix
> it by replacing it with pm_runtime_resume_and_get to keep usage counter
> balanced.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>

Thanks, yet I applied this series now:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D217733&state=
=3D*


--vkEkAx9hr54EJ73W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB2oU8ACgkQFA3kzBSg
KbajnQ//YhDJxuRkElFaaDkaZtFneMSAu9lzddsixSEr6XBiuFq7fOMtQFuO1KX0
phbObJkYzN5ZmS4Ew3qr+pEjY3xcpSyEevtUbDHsTFeiyXkosestDcMDHuwsAvi1
DEIf2kk985o91ficI186zA5xl+4lEccpuQXw/oJHmupT+4vtCUe92DOEuhjHHCPQ
uINfCdGxGsK7tOdIS3ErwKCuCbdgQdde8vcyY7KvhPWMRDUC9hTBqXphRDMkHI6y
XzVS6VC64PfiU873IcarwtFuXmPtwA2u/9PMBCLeON7/XP2cKUScb8WoY0TA4Yi4
Y7JVpwYvPgxcB/FVhN1X3OY64cjt1xZYnG/E5bctGkFmRC0F0ghVVypbOIPxwbX4
U6twNKfWUSjpMRPzqlfC3FfgOxYugidhdUGZf16zA0TfqVS70lbgyDzCUfLFjv++
5n6lICh9M7tcr4bPTRbQq0ZVH4sUCnUM7EAgaHhK4zRMSsf9GhT7eJUcwHxs/9gD
0ctHQBtMQZLnxp1ewitC2zRGZMyaUJORIpcdlchZtvuJCzZ71WwmncJcujVG1CCi
ghakMnyhbcWp2x9Kd40Pl6scLGxILQqGdgR/53t3H/lk2SLOUlZKYTMw4+k7L6/s
wQt4splKRzhzml0zKHquWgRDYS3c2fE7WizjM6n+uXhbWTszfEc=
=/cPS
-----END PGP SIGNATURE-----

--vkEkAx9hr54EJ73W--
