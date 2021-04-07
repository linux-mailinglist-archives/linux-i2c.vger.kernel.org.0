Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E61435780A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 00:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhDGW4s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 18:56:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:58974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229742AbhDGW4n (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 18:56:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD8146121E;
        Wed,  7 Apr 2021 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617836193;
        bh=qwxHfnafLkEtJfvg0xpbJnCPJGqP8nFK5xWmfBv8bsI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oK3a9TmRdBL/lPwSif296HMSXd0l6WN1N2MOA+P+zKIotQS2pD10SVJ12sUAgaXu4
         O5laFgj+aUPyxgbj/+PxFSeGa4BDSEChbd8CvmD8n8WYYUebD6vbX789MZdSIg/R6j
         CCXDotQDOa+btLFnwgduMjz1WfXCefjT/WY4j9OjYoRg6jGKwc9zQcyHzEq7G+kFMz
         xMXubwbFu8iSyZdkWM/Zl0Q35xpOpzWdjziSuduyzGmQUY40EPL8FZ6QezrTxWZzXE
         lkZ99SgB2mpmis0xYjEEZ/SKh+RKxKuRR2srNQHJkusp5JxO5secmyWoj4uC+nWjcu
         BUC8XMpFF7l6Q==
Date:   Thu, 8 Apr 2021 00:56:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Sergey.Semin@baikalelectronics.ru,
        linux-kernel@vger.kernel.org, digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v6 2/5] i2c: core: add api to provide frequency mode
 strings
Message-ID: <20210407225627.GA860@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, Sergey.Semin@baikalelectronics.ru,
        linux-kernel@vger.kernel.org, digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-3-git-send-email-yangyicong@hisilicon.com>
 <20210406195414.GG3122@kunai>
 <0d48f447-d1f2-1c86-27f4-3c8b23dcaf30@hisilicon.com>
 <YG2EjHuMb92mX5G5@smile.fi.intel.com>
 <3fc130fe-e34a-4aaa-05bf-23db60b3b9f1@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <3fc130fe-e34a-4aaa-05bf-23db60b3b9f1@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I guess exporting will save few dozens of bytes if the function is used=
 more
> > than once. (All strings will be duplicated or multiplied in that case)
> >=20
>=20
> yes, that's one concern. since we don't need this to perform fast, an inl=
ine
> one maybe unnecessary.

Exactly. I also don't see an advantage of the function being inline. But
potential disadvantage, even if just small memory overhead. So, I'd
still rather see it as a core function.


--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBuOJcACgkQFA3kzBSg
KbabuBAAkCMkf5eJAiOjcxmdKVrf7CgfTh/sFOhPd9bCNYC6JAtGUYj5XlSAH2Tg
f3aY6U9A7GL90c/F/Csb0L8DKuWOFZNGHxKAYzqHtZMCyPBc5M25tFiwDOqLpiz3
n3s11WuXdLrGeqa2ZJB5gLcypaIQbJai1FyOlgQbcLwg+wJs4Ir3XGcXRtZLV/mV
+XZcSO73jjq/EU195V47DvUEc8jNdN2+lR11AE2JOzNSkYRiDHx9dbucBu5piX+y
/Vp5v0qMx2TbSOX5jRpRIsyRdyMHWmPQCOObuNt69n819Rh35kCqguyPwuKiglSq
qzO2DOXNb0AH5xJ8p6x97JoRQgfMenh3IyarD+tmKYK1LZdzBEELnT54tJ09IsW6
uY9sK1H9iQvGyPypyb/FIN6bGjnHBXz2h00SwhPQ3PEBxJfgn/wtwzOFZqwGulMq
IBWo8nUM30HO9sJvCcClUDwld26P9H8vlNj01rJBJFrZTd7A7wAD4nFvvalcA4u7
9ACzwPqGSIzWDhnPly1OH9islXGmYz+TloFOphZA2DtMbfIU7DRfblmiQSJ7SJZY
h/0k8aO1LXi7YQrj44e/NXaKcn6p6BMwB5yJyrpO9jNxemwzrfbV6ZrF0HvvBqP4
yOXoFV80GaDIJ7vyHyq7V4AvKZEJPmR5M9VgMUVhQe5VEnR9GsM=
=bksq
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
