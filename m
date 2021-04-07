Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A3D357833
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 01:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhDGXEf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 19:04:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:60396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhDGXEe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 19:04:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A236B61181;
        Wed,  7 Apr 2021 23:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617836664;
        bh=hwoYrwOq9pLEpar1NO7OjTnNO97Ou5obMzbFZrY0SaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=McXKbWlO+zmMzPpITR3Lmdc2PnVwwHekVl14v00WLX4jFVqL+hed7Uy2Ggr9R74kX
         hnSlObbb2CkFeYgcGvNA4lhPI0tD0zsz+DYbdcmT7b4z+MwmdiAP1sW4MseU3WIbvk
         klEkvhH1+tJyro+ISP57oqTy+lD5tqZqk36Oh+GUVeiLwBlhRNZOcInItxsJ6+o8Bl
         ieAmjDNLx2KFlIEWMydigNMwBECO8R/LQz+uGQI3ECbe+qS3uXS3WrR9IIBbTEZ67k
         Z4a0OTCkbnueleL/IlzCfW/8hPWx3QYO8LERCpFjx+TD/U25Dt9V3sPqyzQiSNTMSb
         F6fxJolieIpEg==
Date:   Thu, 8 Apr 2021 01:04:21 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Yicong Yang <yangyicong@hisilicon.com>,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v6 3/5] i2c: add support for HiSilicon I2C controller
Message-ID: <20210407230421.GB860@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-4-git-send-email-yangyicong@hisilicon.com>
 <f1d50200-93f5-2c35-933a-01a1e7622983@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline
In-Reply-To: <f1d50200-93f5-2c35-933a-01a1e7622983@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Reason for temp variable is for me it's confusing to see statement like
> "rate_khz = rate_khz / 1000".

Yes. And with this clearer calculation, we can maybe skip the HZ_PER_KHZ
define completely and just use plain '1000' as a factor/divider because
it then becomes obvious. I still find the define more confusing than
helpful TBH. But I'll leave the final decision to Yicong Yang.


--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBuOnQACgkQFA3kzBSg
KbZEPQ//czAF//Y5lGA+H8Rp1n68T3nNiA6rmBKuPZFX/qmqGVCJPG8filxwrP+i
ibtGyvuQhjdlcYtDwlCnrI4KuuyUDLsHN8jgk8F028ZNUlFD7jqjHFa1h6XHzd2l
3petiBjmJPFBoJdoSR5W8qWXvTxlex+fi9d/Rf4kdsppGfz/7gN1GI7JzCk3crx+
xkZz8SOWNfteTLg0n+kSU5YrKC/lEbab4DuDxLSu09UJMuHi3OLtI++MNjJuZ6RT
dd5OhcMIQ/IRcjG7WCqD9+sUYlWlaXldLiUR6OlWtKka4PM3SubMgUXjhFIimOwU
ppknmefPGgyM+GeZ+eg21xR1/Vj6s6plfIuIbRsUAvt8BRznixgpXWLMM/xSLDQg
s6aJDL6dI9WhBnUhM35Bb34Ui6ri9DwYZmzY8eRI78tfD07OM9xs2qBZDJIunvF7
lukNPmiroSyjprRqFEQRb38fEt4kHx0eBwFWbjmwtTnetVRralkkymxN+YwQLl5G
qihhcGazUqiKD4KcQ7QZYKJMgTLy5/1kcvGX6bOdTo82tE+IDgvjsf0G95OWmY0b
GJkvUgCce1IWDeQMnONRrmYPL+sc7RgJ4gfOZfw7fuxbztRax6/J/tBUE6GnC/iJ
7iYdIbGmFhB76zrHZIvxTPQlUJSnFpyjsYFwAqLEQPLsicAknaU=
=d+oE
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
