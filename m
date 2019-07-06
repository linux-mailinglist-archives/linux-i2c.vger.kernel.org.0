Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F06D611C2
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2019 17:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfGFPC7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 Jul 2019 11:02:59 -0400
Received: from sauhun.de ([88.99.104.3]:44248 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726698AbfGFPC7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 6 Jul 2019 11:02:59 -0400
Received: from localhost (p5486CF0A.dip0.t-ipconnect.de [84.134.207.10])
        by pokefinder.org (Postfix) with ESMTPSA id E50FA2C376D;
        Sat,  6 Jul 2019 17:02:57 +0200 (CEST)
Date:   Sat, 6 Jul 2019 17:02:57 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1] i2c: base: Drop unneeded checks for of_node
Message-ID: <20190706150257.GA7429@kunai>
References: <20190312153005.63715-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <20190312153005.63715-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

> @@ -354,13 +354,11 @@ static int i2c_device_probe(struct device *dev)
>  		return -ENODEV;
> =20
>  	if (client->flags & I2C_CLIENT_WAKE) {
> -		int wakeirq =3D -ENOENT;
> +		int wakeirq;
> =20
> -		if (dev->of_node) {
> -			wakeirq =3D of_irq_get_byname(dev->of_node, "wakeup");
> -			if (wakeirq =3D=3D -EPROBE_DEFER)
> -				return wakeirq;
> -		}
> +		wakeirq =3D of_irq_get_byname(dev->of_node, "wakeup");
> +		if (wakeirq =3D=3D -EPROBE_DEFER)
> +			return wakeirq;
> =20

I really like this chunk. It simplifies the code.

> @@ -813,10 +811,9 @@ void i2c_unregister_device(struct i2c_client *client)
>  	if (!client)
>  		return;
> =20
> -	if (client->dev.of_node) {
> +	if (client->dev.of_node)
>  		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
> -		of_node_put(client->dev.of_node);
> -	}
> +	of_node_put(client->dev.of_node);

This one, not so much. We do the check anyhow, so the grouping of
related calls in one block looks better readable to me than the chunk
above. Yes, we save the braces but it looks a bit messy to me.

Thanks,

   Wolfram


--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0guB0ACgkQFA3kzBSg
KbZzgBAAkyPfvYdJYSdCzcgeqR8XSxK5vdHbaE8dA20HmE0/WYdPn5AriinC2XXg
YNGIycGvjzfx3xWOAiMtsXFkpcpC0nU1or5n7zjQYsKlVQ/OEmgQx1+fxtNiJnbD
2Qa9t1FDLCOU3bxil8K4bXGrmtuNoHwqpy0AVUAGM44YW12Rqu1Qa358lpLLbMCK
Cbk99H3VphJzxCXo4MLpvKJn5hEVRNOgBQhGMOqMFK3JyzZaeU3QnbE3jtW9GCSQ
5Rk6Lz1NcTiwxkwAZ9x5TW5grz/7GHc09ctyGcxiv/TKaZJ2U8PZ+1JSZ1X6H0Rk
x+dxmfB2YhMRkkpID4D02U8c8DHB5HjaMfO4fj2ln46+Il6PJtwoe+dqa+R0F5uD
c7wDk/pzdmV6L0r6jG6XzHiQWBd4FXfXJVpUVl80yAoKCgYtcsTUQxutwg065x3u
5AvHDgYeOxFgugKhHoDWUs0a+KpZjTghBQg34HucBxvqT8Wg4W5aebQssbTmF0uI
6Erhx0+56KFDzoHfTw4FEHBJtBZRB2xP6LD01611rGp6/1GQD56lLJRieMsS0KMh
befqMUG7wRBcONppuavY6nTcdWn8Vm+7KQP1x/8ibRrQxfPyRQ4mliPdlNpWXOZ/
j9esnkCNyOjtA/ZdeItFWEI9G/Iysw+urzzCQ2gyCo+tIJXhNpc=
=4sIW
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
