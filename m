Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286DA1BFD2F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Apr 2020 16:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgD3OK5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Apr 2020 10:10:57 -0400
Received: from sauhun.de ([88.99.104.3]:40314 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729053AbgD3OKw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Apr 2020 10:10:52 -0400
Received: from localhost (p5486CDDB.dip0.t-ipconnect.de [84.134.205.219])
        by pokefinder.org (Postfix) with ESMTPSA id AB5A02C08FC;
        Thu, 30 Apr 2020 16:10:50 +0200 (CEST)
Date:   Thu, 30 Apr 2020 16:10:50 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] i2c: i2c-amd-mp2-pci: Fix Oops in amd_mp2_pci_init()
 error handling
Message-ID: <20200430141050.GB3355@ninjato>
References: <CAC_JBqofuyRiSmK0mFqVLaY=5k9MYmjGaVmggx2dn_YjN8VOmw@mail.gmail.com>
 <20190910134242.GA6620@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Content-Disposition: inline
In-Reply-To: <20190910134242.GA6620@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2019 at 04:42:42PM +0300, Dan Carpenter wrote:
> The problem is that we dereference "privdata->pci_dev" when we print
> the error messages in amd_mp2_pci_init():
>=20
> 	dev_err(ndev_dev(privdata), "Failed to enable MP2 PCI device\n");
> 		^^^^^^^^^^^^^^^^^
>=20
> Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controlle=
r")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-current, thanks!

Elie, Nehal, Shyam, are you still there to review patches for this
driver?


--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6q3GoACgkQFA3kzBSg
Kbb3Ww/+IR1Q3p2H6vZjfVbP/E4riOWYHlKhuDWDgmMPjRtep4KFmwo7swfQXwmg
hMZQxtBq8TiTubh0E893JCCeGoIt9ZA2Mq1tkYBDNc7Ad3yjQu81edCmXHkMxsgW
RRnCjK+6ssxyLeXh+fZhTDCUyESJpmwRTsUOmisWRiE2RJfmWxY+5YVhJ/IHDaBH
rKNSsDPYza6EkusCoztaTaw3A7f4gfKqsRv03mBA1WuXE1mG/rZgxhYV2zT9eGtU
ra6FPdWs6MCGx4OdkqqlofHhsQrZUtTjvT+7baLAZRnY8COxFoutNr1S3vq6GiGo
0BIS5dd6U1CCiWulK7glHfGI93Lufo5KZ58mm74rF9NvjBRcNt302ZQRrGlb/R2a
hYcFV5Qyp65glytBRsNgN8Ua2IeTC2tMY/PJBj/K9DvMspDB8G97nERvrVBB82R8
JMMxbSryHnvD3jsl6bD/BMh91in3VfTPecaB1DLWnendtRU//bPeD49rCSmN0lC8
/FBdTfYvPorMG2aAGyo3vusL1LeM7o1mVbyH1bPrSdErvDXg1z1ktbL8uxQWKtL8
NaSh1QsgNzsYfZIc3Jb9TCUTHGxW8uno0fw7zf7i4MK+vu3Yljrzkf+nbsDv7XLz
iiFTApTilMxmACRANgA3yOo/kzqMUViKZ8jUzrKPTexjLdyLVXo=
=2Kcc
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
