Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7E2359D88
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Apr 2021 13:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhDILhl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Apr 2021 07:37:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:47462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhDILhi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 9 Apr 2021 07:37:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 296866115B;
        Fri,  9 Apr 2021 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617968245;
        bh=nnrOYQIZO76MFSXHXzAGR6dVO/7TTti1Cc6F2cB7Qsc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KvqgB0dZmDuDOGIuuo8E9MY9L1/8IzKia97v+uiw25iu6yTHGZsCrRthza1aDEPdW
         PzWqn5V/Ah3ncMrfItbYl7rLAwHyyoI9DyGN1IhS/3LCRKRbYUDbnL0COWfj5/AarB
         h+VQef+5vXBqnx5w58a5Xg5q/69HYKjOqowRCxYNoj4+7e+KJUwDncbjSzmFkvvasn
         /S+6H4TKWV1DZ/wjKqwaKg7pDLbY4WaFEFUkT+El4++xrr3Kv4OgTCBvrCqBVGnLf9
         V+bPNSWLHPcTiGbWqhltKBoR2Q/xem+xxnDFg2MoNCE2W8HGOpHJZ3QvcCwsBqOZNu
         Y8c4Oa0sC1WeA==
Date:   Fri, 9 Apr 2021 13:37:22 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yicong Yang <yangyicong@hisilicon.com>, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v7 2/5] i2c: core: add api to provide frequency mode
 strings
Message-ID: <20210409113722.GB879@ninjato>
References: <1617880641-664-1-git-send-email-yangyicong@hisilicon.com>
 <1617880641-664-3-git-send-email-yangyicong@hisilicon.com>
 <20210408205551.GD1900@kunai>
 <YHAuIdwKMjZuDmXU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline
In-Reply-To: <YHAuIdwKMjZuDmXU@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Can we add this later if needed?
> Because in such case additionally printing bus_freq_hz will be fine, no?

Yes, we can do that.

> But putting max to each frequency representation in the list of strings sounds
> good to me.

It is not important to me if we are going to change that later anyhow.
I'll leave it to you guys.


--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBwPG8ACgkQFA3kzBSg
KbacFxAAl6vhaJv/H5OfIXdMfcZoxfI4GfBHhGi+BVOQujo0NFNEM5ym6qf+/Z83
FYBlXphyqbkp0Qn2cNhYHawEHg8WgoMHh3MRtXdaLBJYv4Nna6OZrVsw7VviwbyC
Cwjk3yaIPhFepaNA05lPndofOd71IGhrmwMJDq61TYe+QyDip6MriQum3SHlCdz0
t0Q6IBHIwwsc3jcQ7TpFKaBzj42p/cDfTn8VMsATaqcsPIaESbH5iBd1aeI6MW1F
zjeh3wuFKbVdb9zMiGsF+InDxHjdUv+y0Mhx6+L74g3z7i6jNrdTKYxNPh8Ay08m
a1Usrfc8xGtIDG6uADJRPIRq4l/tfpW439bMVaham8WjDlYuR7YFTo/hT91+G038
BJVAjBUPovrFK8h7vpl/ubpdd2ChAKH9sicmDUPcZKu69zk4sRv+7bex1NDqWikE
q7f6PHHa0DI3ZCq5hpwugplPW+hCNEarbGcioOWOMKq+1CoY2OYLTP/1ePal6Zz3
WeepZdioFW6mGBNx44lc2MPJJDibx/xw50rXAJIk7ZGIoYT30cVmbiBUq8+0cWz+
4baWZGcZuT2P6h0dgbHeic9uycxubVDUUBaQU57WREp6wjzIPSVHLydZM1KBYqVX
O8lFAGIJlFcYU8K+gGynjjKc9cWfw62c3f6dppvlGfw/D2sfza4=
=b81N
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
