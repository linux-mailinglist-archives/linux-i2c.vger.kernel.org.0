Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14255338BC7
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Mar 2021 12:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhCLLqs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Mar 2021 06:46:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:49122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231516AbhCLLql (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 12 Mar 2021 06:46:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9125664FCE;
        Fri, 12 Mar 2021 11:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615549601;
        bh=S5L2YOCMDrU+3EY3IBUOQ9XL2o/v+Z9WViy91wUaTzM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AlGs+atRDxSXHAqqgb0Aed8XvRamdkxTwtQf0K1W8KK9Y3qtSk31tCbAGqJpYsg1b
         ZomgU7DHQ21aGsI+iwTzRnNCqadJTBQYWbaYCBJXGrGVqDDBuClkAWdoZJQsTDurQ8
         AqoxklpT/VzUHqs7vfoV1XmNN46aI27gl6WOmczMOdmOqC7EAAmMkn8EhMpARLAHzi
         vZD3j3bpbJhE+Rx3bPOP4Q9PTM8vB7XKw/HFrChgEzk+Wzzf5g8l+8k2BvTJUG9L2z
         SmS3g9YzE+PX0CDUCcU7lGw+Fgd9vTUdbBm3EMFdBfYY3GLtZoncflz0Swtz8UzOar
         FjjGji+dsxM+A==
Date:   Fri, 12 Mar 2021 12:46:37 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     syzbot <syzbot+ffb0b3ffa6cfbc7d7b3f@syzkaller.appspotmail.com>
Cc:     dwlsalmeida@gmail.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab+huawei@kernel.org, mchehab@kernel.org,
        paskripkin@gmail.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in __i2c_transfer
Message-ID: <20210312114637.GA13150@ninjato>
References: <000000000000f564d305bd521b83@google.com>
 <0000000000003ceac005bd541781@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <0000000000003ceac005bd541781@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 02:09:08AM -0800, syzbot wrote:
> syzbot has bisected this issue to:
>=20
> commit f90cf6079bf67988f8b1ad1ade70fc89d0080905
> Author: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> Date:   Fri Aug 21 12:58:47 2020 +0000
>=20
>     media: vidtv: add a bridge driver

This is a false positive.


--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBLVJkACgkQFA3kzBSg
Kba1jBAAhQfmmasX/CO7fOdmvFF/4JSSz6fycdArsZWhDlOanA2bAkXb4b3JOBbE
tK6b7QGCKaEKmrZEG6xvhoowX1EOwZabbRtZut/u/HbFNeA2xE1/a0mJm1S+ObpO
bFE0NtS3UaXa8TIiDaezoDaSlZotrgtvwCAL4WzFpNM098G5gL3tPaRpFYvN7N+P
uhITiDM4pGPyV2qtBPTGcJi1q+jnoAMguSm2/QNVKX33Vt2EWmZP2CG6FJ3MFcwY
oBxK3bHtNo5AMDG3HunB+SSks7Vj/p6uT49TSJM1fEWeI9ePCQHWCQgt1TcYKiYs
ntCAFiQv9asUZdy96Jcw3iFMUtlTop86Y+rmwgMlv5PP/hjgtj+A8X2hrjd/36Kg
gYxgzMosQ7hCiWBIVVse2zAh1JJgh8d/wlNddpjUoH6SVD9fsQ/a9mJlD0WMUQKT
SmZRAXGUzXYb3zks5okwrovR8f9L9e3lSs0q8De1YrY+33lf6jzlu1hntoNIDyXz
YT7QrLkHozvBG27sW9+hZsQRC3CEqagyuy/F1SBGnA+zLX9qOHejVE19NgxrXJBH
2Ae+PgTP4A+8Z0NJLIhnO5c3L7O/FWAQemAKAV60rk7G9Z7pTGvF3AG8nqlVztrM
kib7JAGbyj+UwJf3LdnaPuarwo5MU6vDaAMrPA5fymeBev36zic=
=SlTC
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
