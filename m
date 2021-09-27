Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6518418FB1
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Sep 2021 09:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhI0HJP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Sep 2021 03:09:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:57136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233140AbhI0HJP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Sep 2021 03:09:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D47760F94;
        Mon, 27 Sep 2021 07:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632726457;
        bh=eMQ6pJlXVCcD9g2RORTHEO4UfDrkbLRI1N5jWkz02pk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dM0aiacINeizZ/6nAaB75Y4hAq+u2IvBjiW0d5J2/eoqd+undvXHbOZWTKuBv0Rvl
         wpAsdPnQz4ltiF9RFHkApMFWBAbIl/YTlCXa5lCLoOoZoa8RcpRusmUNyyGvCUDk+O
         B0KlHcQ0OcBgbDCzd2z72uSf++2vFJsl1Ulit2Tc7mgFmz3M4VYv9KO2AjvvdqAa5D
         e+jGqSC/6IF7/inwhuRmkfuJcB1qXNtUVjLtybC/yzLdY4mclsBQGA8e1Hvx99fSzh
         JqzVMaJQpVaqnd1xSXaz333Y+fxr+BsuKoLLMmSBR6s9pF9HefFyymsGryxLbkisG+
         GfH1GfAfaCQ/A==
Date:   Mon, 27 Sep 2021 09:07:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Christian Zigotzky <chzigotzky@xenosoft.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        mohamed.mediouni@caramail.com, Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        linux-arm-kernel@lists.infradead.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Darren Stevens <darren@stevens-zone.net>,
        Matthew Leaman <matthew@a-eon.biz>,
        "R.T.Dickinson" <rtd@a-eon.com>
Subject: Re: Add Apple M1 support to PASemi i2c driver
Message-ID: <YVFtrpxfUbzv4XxT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sven Peter <sven@svenpeter.dev>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
        mohamed.mediouni@caramail.com, Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        linux-arm-kernel@lists.infradead.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Darren Stevens <darren@stevens-zone.net>,
        Matthew Leaman <matthew@a-eon.biz>, "R.T.Dickinson" <rtd@a-eon.com>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gTShxT62TmlXACri"
Content-Disposition: inline
In-Reply-To: <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gTShxT62TmlXACri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sure, will do that later as well!

But please do it privately. For upstreaming, the patch series you sent
is way better than a single patch.


--gTShxT62TmlXACri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFRbaoACgkQFA3kzBSg
KbbrrQ/9HIs6yV6l8QWQ+P4IlPfU2kXwk3/9VhzWJrZ3nsok/WzVbDWJmgPo7lJH
XR6Nm4tcJI+N3zqD4K2yIjmjhOaZPS9FqWwU52+46C3N9KtefLm5nk2BKPcWQeSv
/ezPuxpFX73wh+sLjHrlGJm02QBycsWU0UWXPeDCjzMHvgLKMK+TBOMkMkDiaR7N
zHlVEyraezoqXsW+YIe766GewkmOnBp9r97NXrn1nLjWmVV81wXt0jTg7v/mVcCO
8HAle3UUvQc+njozZZrYwwDPyS5Qr1sfRWaVVOROD3ljqaDEC7kJtYJ+AyOVdmvU
vOrcmXKSvsluIZb7qfk6OuLL2H3Vg47TvaYjZ7jdqoHeAKiEOP/IOB8InYMiu49A
ne28Gw7Rrv4qxao4JIFnL0/3teaDMnlGXLe5unP0lQ0QDno9Q2PeiLfWkFPzvMeU
7XhioE+m3UFSFBG5MhjpDuVm0LeQXw+F2kOK2bSWEKbtRW0qfYgOhJVzBIrqYgn+
mdAiLA9CecBnAQDr8eS8nqg16MUpdCnm7AXr0WgFv43UN4kkeme3gTww1N3GAzSh
TkmF/Ii0C+Tl7DEUQP2YsRwS8b1axQ6BD80FjvYdVVur8Arb+KcnSgjdca7jYyfw
64CBmjl455K9IQv0wYY7r695zhQch3OkKa91VsmwGXMvzlw+tMo=
=Kgu0
-----END PGP SIGNATURE-----

--gTShxT62TmlXACri--
