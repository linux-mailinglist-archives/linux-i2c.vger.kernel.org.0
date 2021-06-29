Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8363B70E6
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jun 2021 12:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233251AbhF2KqV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Jun 2021 06:46:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:53170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233221AbhF2KqU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 29 Jun 2021 06:46:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 363C061DB3;
        Tue, 29 Jun 2021 10:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624963433;
        bh=4VOTqddS7uKW2eQmZeku4kQPJMjXgCF9ls0JJnqoJK8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IdVCPNNZF3MuV/j83PGyjf0tWuRa28Z+NHRlmxLgL7m4Y3QysD/5MIzuK7rWavh/K
         TvRSfo0dg66KsP6zYY74YFtkJ6F/XhdhQCVEEJvgOX6t5fE1wa+JXREmeqFf/LNkVP
         s5NdZTOpxJBylZw28mXfU9GxOEvJ4Y+W8ZPrDF06BafltDBTGIGVgCwQPhx0sVVRZ0
         SrZjfx1Hn46l0UVi3SecMWh84Uu4uZMaVn8Qw6D39VKJg8jr0w26v7o8pxMTzRaIJG
         5g7+jHrYvtuTXLVvW0/UNMdioTkAgEspXF52pPuCkT2FpTfPKcRJ4wwpvhlzwD4KOP
         43XGUOPz9FW+g==
Date:   Tue, 29 Jun 2021 12:43:49 +0200
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
Message-ID: <YNr5ZRhT3qn+e9/m@ninjato>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IPUolotEl89k8M55"
Content-Disposition: inline
In-Reply-To: <YNr5Jf3WDTH7U5b7@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IPUolotEl89k8M55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> From the spec:
>=20
> The case when ``length of \field{write_buf}''=3D0, and at the same time,
> ``length of \field{read_buf}''=3D0 doesn't make any sense.
>=20
> I mentioned this in my first reply and to my understanding I did not get
> a reply that this has changed meanwhile.
>=20

Also, this code as mentioned before:

> +             if (!msgs[i].len)
> +                     break;

I hope this can extended in the future to allow zero-length messages. If
this is impossible we need to set an adapter quirk instead.


--IPUolotEl89k8M55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDa+WUACgkQFA3kzBSg
Kba8Mw/7B3ItYaYag3BSGk0Ue14V20I3OtVtN/HquuwX0LpjERuvFFbdkYtQ2iFY
h8zebNkl/9Hw4F6EvDP9xIakjTGO9l56jqTJGvs3zDGPJyo8bZPX0zlmGl/bqfzD
AF+EOS27097fMakwkwNI2Cb8HuEtBWYHNMGcCVhA9WJeF5Vpdq4BQZSGMWx8NfpZ
u3LxstwaXZFVGS87pUiRhmWWBIRKKjPLgduQYo4jNcVUZobVSD/6gY0IjNKRS7l8
vAn/IGrqWb7eHDR+ywcOJEm9XTzCqtMrxFS8wEMfdKzNqhDlc9o71F5+C9A0JSq7
4T4V3SDuMYgnSaT7PMKAUpepAM4zglVASbw8IHgAQ6Lj0ZgWQHS3TqYs/NfDtT1D
qOBKAIYETHS7RU7QfjNZtg0MOCeRco80yh/DHPVx+xgaNkLLCTTEcuy2REbD/e4z
mjsKoSx4xp2eaF98xvrykoN6yIBRLgcfKEu9K1Vk+2I4bJ1rWgaIi2gdyRJ2TODZ
MhMYPYv3Yd2pZK+LlTHX5eYh6v0UKHMtIIwD9CO3ja/fK9DNRV+weA8QvmXrGxU4
vLld7rvHF2QC1SXGkhxlGopHNDBLBjIRdmRrZlQ47Sj5W9fuVkiTuvml9Jk+ihDu
JDVAEsaDInmiYu45lX9HUwrCUeMNROmwOfvKwk7wQ7uDN6FbpMU=
=4zKv
-----END PGP SIGNATURE-----

--IPUolotEl89k8M55--
