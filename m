Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27064355CC9
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 22:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241590AbhDFUSv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 16:18:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:34512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231339AbhDFUSu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 16:18:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A793613C2;
        Tue,  6 Apr 2021 20:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617740322;
        bh=p30de2zwEyR+6P5P00MqZLCxzCiE2AKM4h3UU+dzDsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fdpuF0Q0JrnbJv8Vy5mbvP9T/NBw18A8AoCl0teGvZN6MsomecVMj8X2HZY6hR6bJ
         n5jj7oRGTCTLZkiO38zF+XuUEO8o3Bd6CEG1p12LxOiXtAES83p2zZ+ehQ8tpzVnsZ
         MjYdh59GcsK9hvYTnbJJSeBXkxHK6OT3AWN/iJ/dvhbPwYFJkhfuWy1Gjr+9JrYC8b
         y0oRPJ9sEoQL6r7FttPGsDtQ/1zA09bfjlMD3hYlVb6z3mS9vW283Vy2vcieA3L/3c
         RNEumEb/+x1dpsjp+cpH2A7bkWIHXJCYckadXr+HLUPal9+DieCZE4yn2lNPriHisk
         dCwz5livqH8xg==
Date:   Tue, 6 Apr 2021 22:18:38 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v6 0/5] Add support for HiSilicon I2C controller
Message-ID: <20210406201838.GA3804@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, mika.westerberg@linux.intel.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 09:36:25PM +0800, Yicong Yang wrote:
> Add driver and MAINTAINERS for HiSilicon I2C controller on Kunpeng SoC. Also
> provide the devm_*() variants for adding the I2C adapters. Add a public
> api to provide I2C frequency mode strings and convert designware driver
> to use it.

Thanks, this series is in a very good condition. One question about
patch 2, the rest are minor nits (see the patches themselves). It will
make it for 5.13.


--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBswh4ACgkQFA3kzBSg
Kbbn4A//bwuqrVFhOnSusi+RukQsO87iAMNGVa8JLZE7097JLQIryYROAvrfQB+X
4Y5rTf3/+Von/P/wGTCqhiqD6YfNdK8FbIF+VOfOJXDnbiW2a22GdOy4Y2qFdmLo
6yKF/46gF+nWogGg8m+9wtAf0AYg17UhCAWLOA3R/c5eGfVs2pXdTtXq8koH2/Ea
HP093jc9MTppr88yjsVbJjn41A7xBsEfPsQMqEfTH9FtTCF3ZAPHZQZ5T9QaU9wv
Wmk+TrDD/kkX+gQT59rrL0N8TQ8brdM7J8d5nz2AeKX6YA7O8dYOMJ5vTqE7my1k
cSaBjitdd96Mo9ju8fpHFMZPF6yU2k9ZApmMxpdLnFhsNZ/dv0PlkKx0QY/hS08f
HGmw81ifYUMX51VJnCT0fF9xGRVf9S3WXC2i2br3zgjCA1Rm/3KhNaQlXt9qZ3cS
ZjZiZXVdOefkY9yiDqIirwy6YMKg/1JxYeEVoqS/CEPD1vmpak8rnt7CIUt7Vnhh
CDoh0ga6yZ0DDXY5vGNMk8qKzSyXeTDDjN13Q+AmCX9jt9/yOzl3dfmGVGZosSed
HNmEURoWCYyE/HM/a8Eyy4W0ovKpWzVNctIn6taZktJX/rlLlSIMqpg7EhktzqIJ
VUQJXRu8cqx1gWRZazEmVuyhgv995bU7ydmbzL0YLo5UZufhS7o=
=Re6t
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
