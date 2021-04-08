Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92980358ED2
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Apr 2021 22:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhDHU4H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Apr 2021 16:56:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:55180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhDHU4H (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Apr 2021 16:56:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C142B6113C;
        Thu,  8 Apr 2021 20:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617915355;
        bh=dTju1tcCBQi5uHJ2quaUpPwZN0c8X8zDfQuDNWLJN1Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=huftAJCfOXkCEOFAopxujRwEgRQulkipRCwlT0VmplZJluZSdFbmyNYkUMNj9q0fj
         cAHAnHJlgE0ySpsKeWz99m4vfVa/xlgRj4uGgO8UEWnqI6wYGbOJ5EIanp8NKDWvrO
         vc/dcEoQPDuCsKUdifmKwrXh4aAbaPyw+i8KYHzncEIEBFJH1cZVPgpNFML7yRK7sq
         IZfYFQiNhSY2j+IK+mscHzVNhNel4MLGhPCbmOIJoWnDB4UlCa6ivWvWjiH9APyHsg
         9ESgMPstO3kD3yc3aIh1FD4A3uMy2pVgqOtjYNkkkuTxeAP9BYVfL6Tu2hBiAjTvzd
         v1kRSlyCqQknw==
Date:   Thu, 8 Apr 2021 22:55:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yicong Yang <yangyicong@hisilicon.com>
Cc:     andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com,
        jarkko.nikula@linux.intel.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
Subject: Re: [PATCH v7 2/5] i2c: core: add api to provide frequency mode
 strings
Message-ID: <20210408205551.GD1900@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org,
        digetx@gmail.com, treding@nvidia.com, jarkko.nikula@linux.intel.com,
        rmk+kernel@armlinux.org.uk, song.bao.hua@hisilicon.com,
        john.garry@huawei.com, mika.westerberg@linux.intel.com,
        prime.zeng@huawei.com, linuxarm@huawei.com
References: <1617880641-664-1-git-send-email-yangyicong@hisilicon.com>
 <1617880641-664-3-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Content-Disposition: inline
In-Reply-To: <1617880641-664-3-git-send-email-yangyicong@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +const char *i2c_freq_mode_string(u32 bus_freq_hz)
> +{
> +	switch (bus_freq_hz) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
> +		return "Standard Mode (100 kHz)";

Sorry, I just noticed just now. Shouldn't we also support lower
frequencies than the maximum one? I.e.

	if (bus_freq_hz <= I2C_MAX_STANDARD_MODE_FREQ)
 		return "Standard Mode (max 100 kHz)";
	else if (bus_freq_hz <= ... )

?


--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBvbdcACgkQFA3kzBSg
KbYWUxAAiUxx48wgtmttceezaLABx+UJm/5sIu9mbfHHa5tfi4j/MOw/40CSxE2e
fz9lupkjZHBokVzeURVghdECZiRkRVmCITk68Q3HPG2x25ESaHF5abLFD5eOucnw
shyGjerudG9LmDAj9/yjFJf0u8yXC7CSJ7/NFF46WUHihATnhPlRwywMbV7Td978
KqMF3ha/Hf2+iyiOv9vXe5Te9Cr7F4u2M4BbR8X9sBy2NqK9TRiXBhJtpZ8rsiGl
kP4U1RHl2k4JNawH3zM1nV6ST9JRHByQzPERUyjEawGI60Qy1W0YWe3Oz093dkwf
oGVDr6wUlZiwLHb7aFFCK6UaIHwH/J/Cwz+j+ho4yi0w7D0bfYn5di5fpGqh4IIg
Tcl+lDrHfu4QoU+e1mWrLVd2/yLVMzbGLNy0pvoaFLSqk8vFDHsi3I4xbVNeJsGD
T6S06wTNUVMKPIb5xskyvG4e8WyJL8NTwEDRovlSKSl8dMrE0Vu/rOqMyl1ohzPC
X7Frkke3rtzgts1gT9j7A34CNRk23xeG3XhyxeEVSwFl2dzOsE+sb11stbne//gO
NQdPG21jX9TeaKZqtNa+zoowTZG8h8jAtlfleV7KCeTBhfZ6ALnpy/lGFY2KdYmx
y4utJfbka2d1QpX/45HP40H6Gjaxtv//wcYtAy+icNugIeyz5jg=
=6xkz
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
