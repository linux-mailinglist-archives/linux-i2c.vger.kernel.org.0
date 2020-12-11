Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5BD2D78CC
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Dec 2020 16:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391290AbgLKPFp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Dec 2020 10:05:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:34252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406550AbgLKPFN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Dec 2020 10:05:13 -0500
Date:   Fri, 11 Dec 2020 15:53:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607698418;
        bh=YDIuYljoqc26LKVO8C90Z3OhvO6XmgA1mBkLcV52L4Q=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qljz9ZohTXrHZVCSw1s45CrDnlZypeDo9DfenGPcLEiFwfqht65ynHuajG83iUgaU
         TPSD5vDcXoeG++i9FeAhXWxfFVDqn5nJ/PyoBlUelG2ajvDV3ddzd/8pNltA36km+E
         1AykQYoCmwIiRyDl/85cKtsWNiU9woYECYqcQB0puf5UiHVZfrUvRoswpWfUjicBWM
         IIwlAFsju2vVYm50dbDV0144PR3pegCsZva3rFVueT2SmJLShU+9fHCArTgnqsuwK/
         zod8sOxKaMDAlMpLBWQg31Io9h65gRykfArODM26+THmMK9ryZqm4mZ4YsjSnGlRY0
         8ECDW9o12Y4gA==
From:   Wolfram Sang <wsa@kernel.org>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Linhua Xu <linhua.xu@unisoc.com>
Subject: Re: [PATCH] i2c: sprd: use a specific timeout to avoid system hang
 up issue
Message-ID: <20201211145335.GC1990@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Linhua Xu <linhua.xu@unisoc.com>
References: <20201211102248.1018374-1-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KN5l+BnMqAQyZLvT"
Content-Disposition: inline
In-Reply-To: <20201211102248.1018374-1-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KN5l+BnMqAQyZLvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

thanks for your patch!

> If the i2c device SCL bus being pulled up due to some exception before
> message transfer done, the system cannot receive the completing interrupt
> signal any more, it would not exit waiting loop until MAX_SCHEDULE_TIMEOUT
> jiffies eclipse, that would make the system seemed hang up. To avoid that
> happen, this patch adds a specific timeout for message transfer.

Yes.

> Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
> Original-by: Linhua Xu <linhua.xu@unisoc.com>

I can't find this tag documented. Maybe "Co-developed by"? Or just
"Signed-off-by"?

> +	unsigned long timeout =3D msecs_to_jiffies(I2C_XFER_TIMEOUT);
> =20
>  	i2c_dev->msg =3D msg;
>  	i2c_dev->buf =3D msg->buf;
> @@ -273,7 +276,9 @@ static int sprd_i2c_handle_msg(struct i2c_adapter *i2=
c_adap,
> =20
>  	sprd_i2c_opt_start(i2c_dev);
> =20
> -	wait_for_completion(&i2c_dev->complete);
> +	timeout =3D wait_for_completion_timeout(&i2c_dev->complete, timeout);
> +	if (!timeout)
> +		return -EIO;

Basically OK, but readability can be improved. Because it reads "if not
timeout, then return error". But it IS a timeout :) What about this:

	time_left =3D wait_for_completion_timeout(&i2c_dev->complete,
						msecs_to_jiffies(I2C_XFER_TIMEOUT));
	if (!time_left)
		...

and the rest adjusted accordingly. What do you think?

Kind regards,

   Wolfram


--KN5l+BnMqAQyZLvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/Th+8ACgkQFA3kzBSg
KbYbpA/+J22ESmz7QHBJjTsElLQIbQEx4RDg4L/yLMyZxkTNM2rqQOgoKCknZRWU
PI0YRUKMp4RWDicqIp11+2nLHH/YZ5BWDPD0zg0B2m0x9JIbIvWEMewxP0K8E/OF
QtlHvpwmUdKnJaLATlqVWTnAZpQ73qfQ6gCQqs2MHcIGhWKYM3gm6zHGudkttmqH
NMPdbndg//ykaqO62F/lSY4SVhS+sZDzJbiYefMcsz88u2mXdtdaiGt7VWb89WLn
RTA1jwFoYs69F13cbl3t6TaNjs+0ul5bOiAfh5qx41/sHIyFhKYVd6SLqrD2d4yU
5mI3i2xNrir6twxyqSQv7EB/vSHyIY/AC9tkDsiL4gQStagWG2aJTUIkhn66ghQV
xMbpUK7iUy1ddUxAGjCXvm0eTGrFu3rSsTicmI5H2a8nmCljAQ+Y1plSmTGQX/QY
4+FZZv6lU6Ur8bXPTCFCwKG/1MQNXmmYU+W2ta87Lt9I4dTVJuAP/VJolI4j3ve1
X47xlHlOi5MI4ix8iS1L4SGbEFOmo9LnmHvsL1lZ7rpO5nthLSKPyr/X94dyrTrs
V8HuKhfc915ClP4VRRofSQrKdJGMK7LVaq3wQw0+5G5sWAGhLqwqCX94JUmf/MV4
yiRFXIZMjKMZHlGZubn/rIIzRF3CB+5HjSeTXDul3HezHEGwbJk=
=YT9Y
-----END PGP SIGNATURE-----

--KN5l+BnMqAQyZLvT--
