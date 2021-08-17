Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADB53EF30B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 22:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbhHQUIw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 16:08:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:51382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhHQUIw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 16:08:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D531B60F35;
        Tue, 17 Aug 2021 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629230898;
        bh=wIxbC121EXhJUpbFnInt5T3BBS7g4QGwC5Y3bDcz16o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZKNHut5Xb9ciSuwEv5bTY7Nz1i0Dw97mILPNwYegqLT56FZqgwkOAu6kBrIVgKvw5
         pBFet7TErEa4ADW8dfSVzvEansSu2OVqKQmUBa/mKiJXwf+Rd4nFVJYKahUhBn8njk
         XQsLTYzVOlP7KEdhnWL8TV8ZRVEL7GWB+IQ8s468iGmqmD+up+9GF0F8YKFcr+zTvm
         5EgpIrs6CvC+sh05o4TAwcX78u6G5SAboW+Ab6r2EiY/zQUSfCXj7psb8QYzRVWmfY
         LUHIqcztz9Jr/EuFuxiqfPHtmAgwV+qfm/Xu9WquM8W/3g8gRYHNuf1oMGON+AYABU
         AwUspzHXqjfnQ==
Date:   Tue, 17 Aug 2021 22:08:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 3/5] i2c: pmcmsp: fix IRQ check
Message-ID: <YRwXL3TGBMUdgyBX@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <fd0dd13c-2fe7-c954-ff0f-917067c8252c@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xeU+vrfKRYKMdwFI"
Content-Disposition: inline
In-Reply-To: <fd0dd13c-2fe7-c954-ff0f-917067c8252c@omp.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xeU+vrfKRYKMdwFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 04, 2021 at 05:41:50PM +0300, Sergey Shtylyov wrote:
> The driver's probe() method is written as if platform_get_irq() returns 0
> on error, while actually it returns a negative error code (with all the
> other values considered valid IRQs).  Rewrite the driver's IRQ checking
> code to pass the positive IRQ #s to request_irq() and use polling mode
> when platform_get_irq() returns negative error code (or IRQ0)...
>=20
> Fixes: 1b144df1d7d6 ("i2c: New PMC MSP71xx TWI bus driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

The driver has been removed meanwhile.


--xeU+vrfKRYKMdwFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcFysACgkQFA3kzBSg
KbbuVRAAog8kgBoVO40tHuMMofr5WN/edoALLxDpCDBc8sfRU4DZSCA/BayKoGEc
ubI61VlZNHGvhURQOG5JQrqcSDJhMeM9WI3WGBF4am+Am5X4tAGOg0w/hwH1JaMG
1OPvNEW9YCXWBroSlh3DqQNcdB8qyhbpbuVjB2O+PTPaqmsgR5aEq2fO9tAnK0ep
s9Xk4+C7nnjzgLttnWQhnjNW9wrW1dBsRHVn4F+Dbu67fjbUMuuqjgQodO3DksvK
YSIoBdkOA2XPaFggnYFtO8tvBPdAj/rUHuSFQiR5FTUx2u0ICEpb5nUNRTLssk/T
dH+QYd3Y/Od6jmJNanf45QPEkoLNl5haCcAbPMAu4+8lnIwNVJMerhk0C2cDhrRH
ndHrw/dxr1uHd8lqZLayyo8O0Y2jzn6+tK9iYstgZTqfdnUpUW11Bzx7VwIQZ3bH
yiH+W5HvLML9wDUJQQ6EEueCAKKXQVh6WYZxFDZ9clVpPgjV8hUAbWczOC75hjeo
lMmfu5FRgVMPNJrGMfMmSeCYUIiMjyB7rwaXo5J7mr0AqU3RXMZjOeJ8WY5lWW4b
TQ6qKOH2FnvUA1LWuPPE85gs2AzT6kEydY8oZGzTIUE9gq6qd9ennU03oVgX01Hp
Xqoz9Pq5hGRLIVIy/ABt0sJut/IEzzuOU8KwOfkAZAojoAPnVzI=
=l6Aq
-----END PGP SIGNATURE-----

--xeU+vrfKRYKMdwFI--
