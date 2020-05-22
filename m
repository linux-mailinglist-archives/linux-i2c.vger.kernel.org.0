Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B389E1DF072
	for <lists+linux-i2c@lfdr.de>; Fri, 22 May 2020 22:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730967AbgEVUT7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 16:19:59 -0400
Received: from sauhun.de ([88.99.104.3]:36478 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730965AbgEVUT6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 May 2020 16:19:58 -0400
Received: from localhost (p5486cea4.dip0.t-ipconnect.de [84.134.206.164])
        by pokefinder.org (Postfix) with ESMTPSA id 3A54A2C203F;
        Fri, 22 May 2020 22:19:57 +0200 (CEST)
Date:   Fri, 22 May 2020 22:19:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>, harinik@xilinx.com,
        soren.brinkmann@xilinx.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: cadence: Add an error handling for
 platform_get_irq()
Message-ID: <20200522201956.GB21376@ninjato>
References: <20200520144821.8069-1-zhengdejin5@gmail.com>
 <2d99f043-f854-8975-86ee-2f0ba1382275@xilinx.com>
 <20200522151459.GK5670@ninjato>
 <7763d79e-3a44-2dbe-a4d3-45d40a3a1e02@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline
In-Reply-To: <7763d79e-3a44-2dbe-a4d3-45d40a3a1e02@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> You know about
> devm_platform_get_and_ioremap_resource()
> usage.
>  Maybe that's the way to go. Because as of today there is no way to pass
> position of irq resource.
>=20
> But I expect it will come in near future.

Has been tried, has been nacked:

http://patchwork.ozlabs.org/project/linux-i2c/patch/20200518155304.28639-3-=
zhengdejin5@gmail.com/


--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7IM+wACgkQFA3kzBSg
KbZlSxAAhMck/jA48zSbmMYyvVQ3019xmP3l9kYqEODd5UerZgwQkI+rtXRc6XqJ
0b6N8nD9h6ke2o5aQiNAWg8eJDtauFjm8scCboNh6sI+myBpEQ2x3gpMIuAJ4MaP
AcJGc2ChHxXlxLaAKh1IA/VptdGL2n/6QKZVboWT/iX96KwOXIDE9VcPYPcUDsJM
mDVio38M/1wg9hrNSpyg8hMaDgf46HoyC8cWe+wcK8MvQJsN34ctkerIe46Mar5T
zfYWKsdUz84/5LbztBivRsJWE+BnaIb0a5b65Z1mnPipxtS+gDcBNxLd/yQJL86A
mUsamqzTiDaS0/rAId13tpmPorwHyL7VbTSuiAmCq+LYpbIltu0ywL+Httu/S3VI
WC2jjtdUn2S8x/3Y5aUlBd72NYdLs83xhWMW5VB7RyJVjAQj45RxKxTSYS6qjUrz
F/ejDcsx7hsdgJ3qtgCG/qBFrVFgUmNGChUSm179xgxp5EVmG93WlS2FZV1OL/vh
OInYrcS0KcFIaayWQ/vYsns78zEb8fmTJz24RkSkSpOxxE3Gvdu1sx2HSVSVkz6R
H9MvALIbnsdq0vFZmLh7cue8dIEMSdAf5CLqmuqkXxJO65yk4TdQYbwFJx39yxNQ
I6MgWowgu2U3Mt9VjeWVTSjXAPtSWgWX1SdSzmZU4j0w5fcEC48=
=rVs1
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
