Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5967325594
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Feb 2021 19:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbhBYSfK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Feb 2021 13:35:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:32818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233001AbhBYSdj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Feb 2021 13:33:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAF9264E6C;
        Thu, 25 Feb 2021 18:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614277977;
        bh=xS7BokRCnvo+IUBPGbI29u2JxzgJKfwVlb4wE8bep3w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JNnz9zloyY5bF4PZ66NsEXroR79NrDtxlBG78Ry242ERkfTx9K5oUKrdWCPYmih28
         QmZCWSwB8cveWWZpJjKtXOMxQAHdTLmBjAZ5mlIxebTyC5VSCqixe25arttFNdVX50
         ExQpXQxvrIPOnAcWN/jWjSLb06TaT42EXSY9lfTEyHcbOEZYqOMrpkzUMTM9Fd46ec
         6ojCEC8BC9WU3W6bOfau0MXhLlvFxF7n/d0JJ7UP0Z8xn7QziQCPTnCW3hka/EgJFh
         bu0TgopDXCq73cT2p0LPXC9yF+enm3u7FBvKMjqUdORy2WhRuwIILrHiLcUqw03PEs
         ah0EanLPIU2Mg==
Date:   Thu, 25 Feb 2021 19:31:55 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] i2c: brcmstb: Fix brcmstd_send_i2c_cmd condition
Message-ID: <20210225183155.GA3072@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20210225161101.1856192-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <20210225161101.1856192-1-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 05:11:01PM +0100, Maxime Ripard wrote:
> The brcmstb_send_i2c_cmd currently has a condition that is (CMD_RD ||
> CMD_WR) which always evaluates to true, while the obvious fix is to test
> whether the cmd variable passed as parameter holds one of these two
> values.
>=20
> Reported-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I got a feeling of deja vu...

=2E.. and, in deed, I already fixed this, too, one year ago:

http://patchwork.ozlabs.org/project/linux-i2c/patch/20200426081211.10876-1-=
wsa+renesas@sang-engineering.com/

Dunno why it never appeared in a pull request :(

I'll pick this one, now!


--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA37RYACgkQFA3kzBSg
KbYv5Q/+Nuebrs8L6NUzrEcijfMOYa3lDJluGtrp0M/KcTptEK+nL0TVl88t2IQm
p0Nyn2MdJc6x7Lwt07FUcgm3JTC8ofw8Aqavezin+go+/xE7mbx9/GY9rIO9axxN
krJSfTBVjduxoIhEBOwCknF0mR6rsAFzm0Qjh4uPPvBuaPnuEuWmweO2+fnNKqc5
hSDFp3yUno3Sxo93aInlFe2JkZPzRstwhoRM4ZfuuU6If2AZS78AxaQtX66/n5MV
G5OPduiW3yzw/OtnROyKUbWqqot2ph2VbyRR6vN4ajCUg4EAQZ/jB8yvvGy74vcj
m0NdVW1RUe3vxVX33Ng3mUpVH4AajrdChj1BjC1TgLdN6IHr6danY6HNieL+9ssH
LmNvspBHQsWG+suDk6sMX87WZdVLGg1Pg8WgnHzu3am7YLVN3TP4YXuB5/LLQy9H
NyQNrOuggyN5JkxvM2IQOpe2vIaWxbSHfi7MOm60DE+Dk7YFwLJ+9vqKer8M4E7x
Xhf8rPDBIJGKovsQXLVYr+K3jL+K46/HXURiLZxMjUp7meR2MB3wbKQ0RBAt3HT2
Zj8N+SbALH7pd7gdixANPOnXq5BQO5erHxx50vfn9NMIpbs3Ll8qI/vrClqgzy4a
vY7jNI/nyC7vF9Pa4g2w0guLgm6XiUcvo/9Ftjk4A+ZQ3aeUmIs=
=p2bg
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
