Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B46F3B70E3
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 12:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbhF2KpR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 06:45:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:53016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232410AbhF2KpQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Jun 2021 06:45:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2DB461DA7;
        Tue, 29 Jun 2021 10:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624963369;
        bh=EQm+Q52P0Wib5HyIx8dMio6/6MEpfVira6/FYxYQ8XI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WtNns79ChU4Da7j/PvkcL7etBt3neAE+XqChZbgOURuRqaodlCXENtzQKSFwpUSjW
         aqR7/qVcZMRY0KXMT4V/ST54fVfSRcCPvLh81RebDZ8TEeuLSQkgOXcYZp8N5G6hWK
         FFSf+hUzoZsk8Am4Zl9FL5hjIpEFqfzqVF+OFABjjtCQYJq1wQcnQFtuSl75ff/Q64
         yQ56lJHb+uyrAfh1YchKYFGdnhsMhUPY3zV/hK3MzVryK/rPbLRcthwabtdw+Xdpv5
         jSHRdd+huW/IUXKl87iSKsfwHaILZSdZT9kVHgYF9ETKnouPhFWzu8lyrgR2qBge8t
         /TrPsQw8Ughuw==
Date:   Tue, 29 Jun 2021 12:42:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YNr5Jf3WDTH7U5b7@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com, jarkko.nikula@linux.intel.com,
        Sergey.Semin@baikalelectronics.ru, rppt@kernel.org,
        loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
 <YNr0uDx1fv+Gjd7m@ninjato>
 <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DWc7wYBxX5qn7vxi"
Content-Disposition: inline
In-Reply-To: <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DWc7wYBxX5qn7vxi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Okay. But what is missing in the driver because of which it should
> mask out I2C_FUNC_SMBUS_QUICK.

=46rom the spec:

The case when ``length of \field{write_buf}''=3D0, and at the same time,
``length of \field{read_buf}''=3D0 doesn't make any sense.

I mentioned this in my first reply and to my understanding I did not get
a reply that this has changed meanwhile.


--DWc7wYBxX5qn7vxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDa+SEACgkQFA3kzBSg
Kbbh+xAAjjok+PzUt6yYXID3QRxMwhD2lcKTY+vJms8hdTwxH5FHfhwWGvvZNJ8E
hnxH9VWGlxbg4HMbfsSP968+MJ4xq+6nOWsXy/5zcbM95g7Mo4TDGNWyo31y9Gk6
Hlyfz+EKHh5sRi57jjKFXJMDCGmFGapXm1qWFo6NHwpuDFfwtMf94XhxpsnYCnlM
8NzORMTW5G/P8K7h3UE/vrN+w7BYXWYHBlkS5cIy/B5S3dLEvb2CqIMzYKxnQ3TP
IgHJa8xmvfTN9EmB5THNMzsXt28gnL3pL2jdTL3ZglSNZvljFUfVcK8EApGqGY+3
tlMqRtSbiqEaQNHJg/2kzlrrgK+0DPSe/4ojmxBWN8icepf6dOwW8/4LZMygyPX/
V0SxX00bG1N5WcFhSxy20vfXXBSOK9FHmH12Gn6wWc4F5t64Co5/pYUMGD73GfpN
9rMpALB2zIc7RGnJeca0+iJZpm0lIvVyyR6qAegCgYY0HCYchW46pPS1QQh8wZy8
EK7ffqg3md0N7StDTNILJvojv01RHVq6F2vfbZXo8JWqhiodvPTAfxxW4GFXRCvD
/1l4sPKq6b9k4uY3Sy7JY0+vdPANItUaNlJjj8QZZwTsU3XCna+SRLCYsUiGrSQ/
1FKSgpB3I3p4usxwC3Dy7RjvoUAss4niXG5UCwp2SKKP4EJXigg=
=IwgD
-----END PGP SIGNATURE-----

--DWc7wYBxX5qn7vxi--
