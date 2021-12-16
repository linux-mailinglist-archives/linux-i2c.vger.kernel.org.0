Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AF6477EA2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236595AbhLPVSw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:18:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234877AbhLPVSv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 16:18:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75AAC061574
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 13:18:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66FF261DF0
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 21:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FA5C36AE2;
        Thu, 16 Dec 2021 21:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639689530;
        bh=2SFX/G6TWgyqsrgY0j3YqyYksDjHm8cRU2esXd9WPvg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=su8FdqW+ydH2azhurvs9AnVuon7NjJWjciQSgaqwUpt/xXHwUse+g5i5DLc3fSnwE
         10eEo9u6QmlKC5pHpOCzXJET2CH5Hx1a9fIDjlwhOWPu0GHFud3/klmmaRHEzPczsR
         SSb0jtn5xA6HTsHAP8BkuxPasGpJaQ+RjVPArm3Ge3LlypndRzrIhKGs9YPdyddI5G
         RL7UYpc6XuAoixTIr+k0Jn255RN8MiqXPDs72g3H6suAf94reuz/r+B6a6saHGDvzb
         cYsL2RD429aWsTRd+lHg91HEw+qBBBYcQ2XG37R09F49WIJEPc1suFgmKcAnCkDF5L
         BF4jigLvUkkcg==
Date:   Thu, 16 Dec 2021 22:18:47 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 6/6] i2c: designware-pci: Convert to use dev_err_probe()
Message-ID: <YbutN5Opu8O4Z2Zl@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
 <20211215151205.584264-6-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="U71V0hXALByj5MDP"
Content-Disposition: inline
In-Reply-To: <20211215151205.584264-6-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--U71V0hXALByj5MDP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 05:12:05PM +0200, Jarkko Nikula wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> It's fine to call dev_err_probe() in ->probe() when error code is known.
> Convert the driver to use dev_err_probe().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--U71V0hXALByj5MDP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rTcACgkQFA3kzBSg
KbY0ChAAsZWlhJbwKrof2pRdrRpdcTaBxoUB5esErewafICOMCdh8xgyOUR72QLe
pLFPqZtXn40ca0ADPLBoE8f7a6Go0+W7kCzzzXdTEWZR4sdeS8yzaZutTH5WLXpn
6pBAqiEmUdwLMgUDGaG95wJ8SdKE9lAp30oiyOOIf+KztnSHp8bQhP5QeqRT5efr
cz4Kd3vjvBc5vuLfByghcAUsRmLa+bWZ1v+L7J8ShWZ62zJyBfX2vp8Zx0jsJ5wn
6fFm14MR4k6Zpf1/APm46foHSQnj1GPF2lAHHBYLO3sU6WADfMBOJ+RTb4pJTXOx
DApk2hrhVLzuDIRRx8cuBSNvqdv0iaNjLgge766AUkqsKNWklnNP+duOMHPiYgfL
Icqs2ubCEdpMVt0D+88hrhZvMKdl6hRfHIuaX+LxOws8C+AGddHkudXoOS2uRKLb
VyNhYpF962YVuFEOTv8JdcHNz0CPVQPCmiICWk4P9aj/IQ+r8t4X6g3lx042ZaiO
sggwJfvOVMQ+amYqgLwljoLZP0lnf9VIVCW6YCz2oBM99EAantVzTwEFslPsb/QQ
lQfQgfu6d4czd693xr2C3esMtQqHlOsXX/X2DCC30JhoR8zRoXclbKM0DIhJcrG/
yGzIIr5+fJZ6evnN6sdpvPD+Rym4zrgK4CdQ+9lMnop7+QmHW1g=
=qsNP
-----END PGP SIGNATURE-----

--U71V0hXALByj5MDP--
