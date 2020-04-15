Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1A41A9BEC
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 13:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896818AbgDOLPW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 07:15:22 -0400
Received: from sauhun.de ([88.99.104.3]:52888 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896823AbgDOLOg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 07:14:36 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 897E82C1FF3;
        Wed, 15 Apr 2020 13:14:34 +0200 (CEST)
Date:   Wed, 15 Apr 2020 13:14:34 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: designware: Calculate SCL timing parameter for
 High Speed Mode
Message-ID: <20200415111434.GR1141@ninjato>
References: <20200407133439.23422-1-wan.ahmad.zainie.wan.mohamad@intel.com>
 <20200407133439.23422-3-wan.ahmad.zainie.wan.mohamad@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A1VS04HCCjrR2aaM"
Content-Disposition: inline
In-Reply-To: <20200407133439.23422-3-wan.ahmad.zainie.wan.mohamad@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--A1VS04HCCjrR2aaM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2020 at 09:34:39PM +0800, Wan Ahmad Zainie wrote:
> Custom parameters for HCNT/LCNT are not available for OF based system.
> Thus, we will use existing SCL timing parameter calculation functions
> for High Speed Mode too.
>=20
> The value for the parameters tSYMBOL and tLOW is taken from DesignWare
> DW_apb_i2c Databook v2.01a, section 3.15.4.6. The calculation should
> assume higher bus load since it gives slower timing parameter.
>=20
> Signed-off-by: Wan Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--A1VS04HCCjrR2aaM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W7JoACgkQFA3kzBSg
Kbad6RAAgIr2WZAmQC4wE0eg8Cliobd3/7jABVgRlNF6uRWhqpoDRhkuj6nf3AFT
FMh1C+0pSLXF+86/Y/hmlR7zYzG1RHnQr+572FBxVctVtHVeUJd1FBPa1dgKzI79
X3xZLmK4T5AOSYxfsGAV41mgcAbNXj4ewzP2Ja5EDt2tUnA9znnW41/J4NN2rrFz
EDBTRpLZANwl1dMhtyHbeQiLhbD3gwrMOdiyRHpfnFhbDGF01UV7Z2UyEgUVjI/4
cPBr4rQ2QXXe61fil6TTjPpZxl6RYZXGHQ/ilahMoqtx+7kf6yDxPq84ghpaqsLC
+76eSNGNHuMRRshuG05LmOuVN6ySoHHonv4Iumqt7GhOZ7diG9irK5t9Wqxzna30
bOA6LPPNtqpCf7pK6TS9PaRC4Md/B2XxHoL7KfIl1V3TO+p9jvCbQ8qqMAMxqKat
uhHtwaPK6Vk/iQZw3BM43chJxMkdie8t2E5H2jT8QcaLRTVzr0nx7G3CfrzrhhG8
uNzwNGFw2wbBt5pfp/eyiJDV56eGd2oS0zJaCP6V3Wsu62IA4+gcl8k3mh0CUv7U
l6FdwVR2SPQI8Fb9Grhq6IZ3OMmvnU+yTmzKcHxRF/jzc+wfugupof5ssMe6oSn8
+uKyE8dz9n9+tHt28fbFFch0K6ftWRng2BjSlxNgVaJTEdnLXFI=
=Ae9F
-----END PGP SIGNATURE-----

--A1VS04HCCjrR2aaM--
