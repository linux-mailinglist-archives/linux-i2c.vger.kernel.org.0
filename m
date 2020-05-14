Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F881D27D7
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 08:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgENG3y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 May 2020 02:29:54 -0400
Received: from sauhun.de ([88.99.104.3]:48474 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgENG3y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 May 2020 02:29:54 -0400
Received: from localhost (p5486CC88.dip0.t-ipconnect.de [84.134.204.136])
        by pokefinder.org (Postfix) with ESMTPSA id EC9C92C01E6;
        Thu, 14 May 2020 08:29:51 +0200 (CEST)
Date:   Thu, 14 May 2020 08:29:51 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH] i2c: mediatek: Add i2c ac-timing adjust support
Message-ID: <20200514062951.GA1145@kunai>
References: <1585223676-30809-1-git-send-email-qii.wang@mediatek.com>
 <20200512133852.GE13516@ninjato>
 <1589418905.25512.10.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <1589418905.25512.10.camel@mhfsdcap03>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Last question: You seem to be the one doing major updates to this
> > driver. Thanks for that! Are you maybe interested in becoming the
> > maintainer for this driver? I think there won't be much patches to
> > review and reports to handle but it will speed up processing for me.
>=20
> Yes, It is my honor to be the maintainer for this driver.

Awesome! :) Can you prepare a patch for MAINTAINERS or shall I?


--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl685VsACgkQFA3kzBSg
KbbA8w/+Iih/AnYzyX4NP+kuKMiaDnC4Lof2gegnqKBPDlccUf5qMFAxlvdj5VLg
7fpHoLnxDUaE2VSLT94/l7djAnAiUrDK42F1rXHXfJKmfb4k9dMWI7n+yF29/95a
87gV3x2goe1XucCmobocv2RFwJw7b4rkDkvCb5mN6bvyDBUUS4Q3mW0MGxISVdTE
Z48dW7oyv54Y7kJoEVv3NRcrOfO/2zlrsi1zxamoU8+E5NidGwqySY21PZpq/FZm
4un1Dt98r7nrsm+l75SAahK5AJ/6qYakeJOtwD2NyzOF6dmwOgKLDpMI82Fl5e3p
vO37ZWYXoOeX9u7HFzEmz6CiLQ7Fomg5S6P7pWOV4JWNGbgMvkfnhzhyhZQN/y3z
+n6BX//CKk/Vo2DV7yHc/fO5ueXSP0FpAd4MErTgwUvkbeWj4kM09Q5rug3nwXcb
6+panhqePUGmOpqdT8JvqL+bFc3NpK7eDTmbAW3r6vp06/rttRBNnyKV5R4QMTfq
9qB1gtrcqHz1YJLI+UKW/QXIu04mGdW20TwlnQe06pV8l9/6JoPMMhgz5OnRAMd9
z/j+zHrrH2JMV/2gO+DW7T2Eweo2ZHEJjT1OfJT5pmxfrNVpFmkMsiwFbirC0mDH
l5EQ+idPkrsxFbHMsV/FRdladtoW5CHlB8ujb8StzFIkszZOKUI=
=ZyXd
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
