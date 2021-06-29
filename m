Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E013B7125
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 13:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbhF2LNv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 07:13:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:56010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233329AbhF2LNu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Jun 2021 07:13:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBE9261DC7;
        Tue, 29 Jun 2021 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624965083;
        bh=qR7dpwEkDa37N8fq1JF+niB5xx9wYkD8oDf8aWqJvS8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gsv0XlgkoGrCqUJuMrRL6ilJXwxyc5UDgKzptH+i1jtOVWAzGXi5L3+KFbOJGNENQ
         qX0bQ8ZFEkb3ecE6dT1/EIsDi4WRRLRoUxRRKJiqlLw+U7tCjDtroMdIJFrM3N21lm
         ZBcC12OTfBFFPZNNrz9eqk6NGZD4jJ8GtEGnV/vJgGDPRn8AJrBbv9N3vb3h0Pm/3A
         2HOfIoQkUzwW2IAIe3MSSDAVs754SRfQUjgws1BHg1kYkmSqe3sAL+T1uFFRYyAdNV
         EQC6bhJsu67vkUA4vCn5iIZB/+Kuzh3CK+J2qKooOeWSZhUPJhbGLgSaN2MSPEs1Pj
         6TYUx3ManeaoA==
Date:   Tue, 29 Jun 2021 13:11:20 +0200
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
Message-ID: <YNr/2E/T4FRjLOgy@ninjato>
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
 <YNr5Jf3WDTH7U5b7@ninjato>
 <YNr5ZRhT3qn+e9/m@ninjato>
 <20210629105649.nt63mxtiy6u7de3g@vireshk-i7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sAaNsJX8TpQmVU+g"
Content-Disposition: inline
In-Reply-To: <20210629105649.nt63mxtiy6u7de3g@vireshk-i7>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sAaNsJX8TpQmVU+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The case when ``length of \field{write_buf}''=3D0, and at the same time,
> ``length of \field{read_buf}''=3D0 is called not-a-read-write request
> and result for such a request is I2C device specific.

Obviously, I don't know much about the specs and their wording. Still I
wonder if we can't call it a zero length transfer? This is allowed by
the I2C standard and SMBus has even a proper name for it (SMBUS_QUICK).
=46rom my point of view, I would not say it is device specific because
devices are expected to ACK such a message.


--sAaNsJX8TpQmVU+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDa/9gACgkQFA3kzBSg
Kba1Jw//QCapndYVkCEmAxCDb4OuBgOzHn/nM06PE9m2MBtPSuR+dRU98n47Bmay
3VQASHJA+ZydINhHEbMhgClGxDs/jnLV1vx20XraVPzwKLrHG9UDv5dVJCmY6YZq
3F7GV7bIrbPtFVxDt0d0OjEmDcmSHxG/HQeiVwWKDC+RB/5Ono2oemIN/mrmafqZ
vP2Pf46cbQNMHbcgOPG8GxFI6jUtVvPB/xXHAf0TA2U/DzuxIbNH69ymhE57VMV2
ZEQFy+/am9LnhNWbcoaaJCSjVps2e7JqS4en7LOIAexdZGJkNQmog/qZNPmZZkVu
XY0eLGKS2erq94vh6Wp76VKwRLhG/T2rwkFQxFdzHK89otRcfhHRBr9bMtKdkxkw
bihc4FqiM4NiejvF0b+wDDGXSLXnT1UNUuyQ8MYHHxl+2bjTEKBajqBL2bzlege4
upHspbvf/8L3HRlF0UVG01exPBpeUAeiFDM7imoQL6g7Q2itMcYnB0zhxABXZKYm
xNGbmdd8mftRCnxlYV1qyCYFxACYnrIQAY70d9IaLHjaKEpG2XeHEpMWEopG52Fk
M4K/JXnhae3vwVCl1ya5aRpMbIZK6wNzyPewXe0FqdZ8NnlITgxyJImPJI2WBy5p
OBV3Bghg0b/L8vlgFPJP5QLcOY4KjF2VmKBy7Tw/4nB3oxVDihU=
=hGo0
-----END PGP SIGNATURE-----

--sAaNsJX8TpQmVU+g--
