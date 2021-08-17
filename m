Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0137F3EF2DA
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 21:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229466AbhHQTpv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 15:45:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:48280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229640AbhHQTpu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 15:45:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8EA9561008;
        Tue, 17 Aug 2021 19:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629229517;
        bh=7urKVJ6IdYmpXI3G6Gu41C2MmW5MX7zn7a5e1SyPhtM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S2/TuetVinp8PGDwn92d3ZwTymtYVGpIWNOqKgFXG9KsQaiDH/C9s2RlI5CtLZk8Z
         BonZq1xlAw7V5JAgC3Mht5QJOGLhduj8zzTZEfr5F8SJ1DKBM3muIlH5tzx6Zn3ziV
         Va8CWM/Vz0gmOVOObi1uxg3mW7dUWSrFs2AkEJKQ9LWukXbmFbXDrxLLikqadM3/mv
         QdlOs3nhbMZQPUdz7fYNtKEBLwa3IClo23A10V2JA6YLGNSh+jqSLnR/sEKSM5p3WI
         YUacDLc7Vclwufpoz8nZIDPBn7AHG97XLtcc1ge7h1asEcYfhkO5F2PPbtKdcJKlgI
         lGym29wr0y3rA==
Date:   Tue, 17 Aug 2021 21:45:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 1/2] i2c: iop3xx: fix deferred probing
Message-ID: <YRwRyiSrZtZ7Y8Yj@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>
References: <07588701-4f82-2390-8781-5e6965e87eb4@omp.ru>
 <006975c5-df00-de6f-c553-0b967ae23b89@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="deCNpgx2/W3GGyt8"
Content-Disposition: inline
In-Reply-To: <006975c5-df00-de6f-c553-0b967ae23b89@omp.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--deCNpgx2/W3GGyt8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 12, 2021 at 11:35:09PM +0300, Sergey Shtylyov wrote:
> When adding the code to handle platform_get_irq*() errors in the commit
> 489447380a29 ("[PATCH] handle errors returned by platform_get_irq*()"),
> the actual error code was enforced to be -ENXIO in the driver for some
> strange reason.  This didn't matter much until the deferred probing was
> introduced -- which requires an actual error code to be propagated
> upstream from the failure site.
>=20
> While fixing this, also stop overriding the errors from request_irq() to
> -EIO (done since the pre-git era).
>=20
> Fixes: 489447380a29 ("[PATCH] handle errors returned by platform_get_irq*=
()")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>=20

Applied to for-next, thanks!


--deCNpgx2/W3GGyt8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcEckACgkQFA3kzBSg
KbYQxg//Tl61CDzqB7FHvrG7Gf6LhjkKeBdNgmSATJNzKF6AmWRyqPLrnb778EMG
S9amvNSZ7VQFg8lWD6dPdnbY29TfoYu5TB3LiK7kNErTwMlVuq1wrIKppwXK72Wk
pKDcr9F3gXZXWYy8PZKwGNroQrctzOsDLn4Q6nqI2rZVTybh6LouvMCMWBTYIWNZ
GaozCXgkr6yTPqCZ4lXD4E0Tf1a/zMqZ5K9F2EQHkHzfaYqGbTVpBIJm2NmYxnaV
ULdUUK51ejTcHj23VxY5MZdyumKMI++INdG0qNlfzEhCuHKVYqRNDi3OYgpp+fkK
IeozqGJXwDNKPaUwCxeFZKwFTac27Tl11I9USR3xirXY0H3MO66MBxQMEaWLPwPX
TWFulE/D94Y3/vIERsHiydVf/8spAHu/0fJDm5onGWfd6qN5jaQJh3RrXDiyV50p
kYweB0u+ZtCMZpmBPHAxOQt3nGM4sDoteLPAiAqyTP+/szbm3hJlAIi7scg64u+7
vHCDpzAJ3+qpRGlo+nuwmDQtDmVXQDA49BTSaouqq8iHv3EJjtDRMf5dL6RhkC3Z
6CQWwBmHwXmi8OpL8HH2ElWx0alHq8DsxBq2wEWuwdyLirInE1aNEzlCwOIthX7E
qGprL4TfBP++fDTnhKVRaihTwG+FJm6t/iUv450z5MoIr/4mAcw=
=oFv8
-----END PGP SIGNATURE-----

--deCNpgx2/W3GGyt8--
