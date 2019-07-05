Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F4860B8E
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2019 20:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfGEStu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 14:49:50 -0400
Received: from sauhun.de ([88.99.104.3]:53736 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfGEStu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jul 2019 14:49:50 -0400
Received: from localhost (p54B334DF.dip0.t-ipconnect.de [84.179.52.223])
        by pokefinder.org (Postfix) with ESMTPSA id 69EB02C0398;
        Fri,  5 Jul 2019 20:49:48 +0200 (CEST)
Date:   Fri, 5 Jul 2019 20:49:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Add Dmitry as a reviewer
Message-ID: <20190705184947.GJ4717@kunai>
References: <20190623174655.25445-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="apbmkPN6Hu/1dI3g"
Content-Disposition: inline
In-Reply-To: <20190623174655.25445-1-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--apbmkPN6Hu/1dI3g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:46:55PM +0300, Dmitry Osipenko wrote:
> I'm contributing to Tegra's upstream development in general and happened
> to review the Tegra's I2C patches for awhile because I'm actively using
> upstream kernel on all of my Tegra-powered devices and initially some of
> the submitted patches were getting my attention since they were causing
> problems. Recently Wolfram Sang asked whether I'm interested in becoming
> a reviewer for the driver and I don't mind at all.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-current with a comment that Thierry acked this in the
mail thread prior this patch. Thanks!


--apbmkPN6Hu/1dI3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0fm8sACgkQFA3kzBSg
KbZY2Q/+JxDQL3UNgJmHcRs3I4U9y2MsEo6jLh6uYCGKEqZgDGIVHCTOFz47yia4
nSuDFqwe4K4X8obmzJUT8lP5sr9A8atNWZOrWBCoB/WG9WNbzgYXnhY2wy6NdFP0
VZ96OF+O91U0OkDtemY+4kuFihfLj/iwbhZ8uGBptFVRdkmy1L8aFoxXzGf8Onz9
a5CXn0IDgBU224KqY9f02fvmWlNtii8jPgJZ4E/FdnvIioX0CrZYZW2p9yldDAHG
9CVGCFAlqB2Vpcdb+ZFVSiJY0YIFgRciVhH7itNryh2tHbG7zHltiH0k09CYZGUu
VQ03yyceQsIeJQoVq054LWHOwckMNldMwnhZW5eWkebgNI4g5BieMY0ES0+i21EJ
WqsopjL2kWs+Vq9n4QY5wu0ocucjULfiP/BlZ0wQblPQbreQUJ6z+HiSpIcV0DOd
jVeN78LH10Za9t7NKGAsbBLZSErHRJltFFSrKSKi58WgdpaoM1MzMU33ku/MiFft
W9LPhg1BOiob64sUXHD8uFOCYFXTrbdusgtfNCZYRlFg/d+mOZdJG2Dn3Ajc6Q3w
znWC/4uq5CMmxoUAmPxDnrj/PtyxEsTjMRJlbgnuUPTYcxUvzL4jkLOlcZIan9HH
2O4pj7dRV9pv4i4DZUDVAUW4hCQdvmb5/iHm8sn/Pes06ja2MSI=
=v1gr
-----END PGP SIGNATURE-----

--apbmkPN6Hu/1dI3g--
