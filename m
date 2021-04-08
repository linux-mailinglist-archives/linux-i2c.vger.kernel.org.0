Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F47358ED5
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 22:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbhDHU5P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 16:57:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:55284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhDHU5P (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 16:57:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1E806113C;
        Thu,  8 Apr 2021 20:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617915423;
        bh=Grq6Y9MFG8kVBMy6GU/tIw8EwcjcXAza1EvJmSR9xNA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m1bxWkAgUJC/tP0r2tMDhQ39UofnJzPefAAvsI7wCvsanPAoNkINyF2MpcCV0mzq7
         EX7OT6llUUBWW+fSZ2DWb6TW990BD/UOWn2mbOp7kkq94urVexg9L4Al51WElz4YzU
         pXFMpTcycnZ0I6GeMgcQDlsHaTiezohmWBbbIILIHstwHjqZf1Df+AYov+VzYEt6Nr
         8qi+PnarS4rlNTEpwmqENUuqQ6ihWWbqBMREUdnaLhf+jneglzetPhVvMZmFiguqBW
         CmlYC4L+toEaqvqlVk0pslt1c9DhxW9wC67E7P/1wRoHju7pdHxmH/d2ODCWoR0V33
         AcnpV4c/+oTwg==
Date:   Thu, 8 Apr 2021 22:57:00 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v7 4/5] MAINTAINERS: Add maintainer for HiSilicon I2C
 driver
Message-ID: <20210408205700.GE1900@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, mika.westerberg@linux.intel.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1617880641-664-1-git-send-email-yangyicong@hisilicon.com>
 <1617880641-664-5-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Content-Disposition: inline
In-Reply-To: <1617880641-664-5-git-send-email-yangyicong@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2021 at 07:17:20PM +0800, Yicong Yang wrote:
> Add maintainer for HiSilicon I2C driver.

Only if you need to resend, then you can squash this into the previous
patch. If not, I can do it when applying.


--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBvbhwACgkQFA3kzBSg
KbY7FhAAsOoIwl4uxCZCL8cun/DjFNuMm/pe4k9rjr2ecX1SampE3Ku25c9cdSLs
LSviBlf5j4zw2YNPltD0+pLKH15eqGKNrXGJC06BZwMNqJOc0LqC0qD7MK/KVy9k
paTpvYoA3Wy9QR4Q2ESExnTo/FyVibsFqt+xvrneGoQawbwhYZIVQ+4PEE9k/IEI
RsH0Sohrw0QD1hc1WsUA91vgDos8YvsfJclcJy+giT0zaTOHKIMJGYRbIzu78b52
m7JGRc4q+ktdsKS01LAwhsJPpvKj2eUY5Vw85MNWT3PLIYOUL7BHVK11r7bti6cJ
Vb2jY0w0+A30U8K7VyfFRoXvm8fp7uM6QKEIttjYfdK+H4OQ3edlVeLefox0yFe+
hkpG6LBWtE69/KIDhR9GT+vp+uW8jdIDCDoy1ozrMBGGp7zo38Jy5xcW1k+dlLkL
J86mzLTLkTXZ4BHfNJ0unQ7GOC8Ik9pgUMmjz2v1oWisCEtSSqtIAvjR2PKETXQo
4dNI/9up7x3okOqFK9ZmIkU0YZPajizWwvUg4Od+4sX2kZaMwh4MbSXg1NH819CI
k47NImvmSsop0U1nCq6PtLNaLiD6e2bZ8z4Avllf3LobF5FXnr/KUdRpyvGMq/4b
0Zp5E20azctQPwMWtRit/vOOZOVvz3ZC12YeXW2UWFKPaQ6mkEo=
=1HHz
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--
