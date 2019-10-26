Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B66E6E5DF0
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2019 17:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfJZPdR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Oct 2019 11:33:17 -0400
Received: from sauhun.de ([88.99.104.3]:47866 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726189AbfJZPdR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Oct 2019 11:33:17 -0400
Received: from localhost (p5486CC3E.dip0.t-ipconnect.de [84.134.204.62])
        by pokefinder.org (Postfix) with ESMTPSA id 547462C03C5;
        Sat, 26 Oct 2019 17:33:15 +0200 (CEST)
Date:   Sat, 26 Oct 2019 17:33:15 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Annaliese McDermond <nh6z@nh6z.net>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH RFC] i2c: bcm2835: Store pointer to bus clock
Message-ID: <20191026153314.GA5137@kunai>
References: <1572093288-6223-1-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <1572093288-6223-1-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> a NULL pointer dereference on driver unload. It seems that we can't fetch
> the bus clock via devm_clk_get in bcm2835_i2c_remove. As an alternative

Uh, yes, devm_* doesn't make sense in a remove function. We could
probably use plain clk_get/put here, but a pointer seems fine, too.



--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl20ZzYACgkQFA3kzBSg
KbakVA/+K2R/9SirG2DNayuOk52DPILr/uDihZvMo7UkD0EyCWhk+q/hJSTAZZD9
+cgGElLwuKJ6egXWaUuN9rgEIsjRU7kfnuBAf6lstPeLUWBJM8Xzl7OprTKVX0FH
hGXR86MehWVEfAcAvTOKYrDAB2jTuwTiYasdQmF2jHipgdN8gOl5NRErGBfWPApq
ICAr4I7PuwOrRqT8cXyX5j7A1USDx4GBa1424aygQ892SLc+r5chSmlEvGOxQZ40
QRxdVhGlHDWvO5C/kvppVvKxI/BwQN2mQ9el/bkkFBEYuqKC0bv1aMkAAothWRP2
o0yNRQcqz4aZv07ve/RuyMxQyFXJMjIutHs72SwiHhlpVNxIg2PiyEYDx02wS36v
ZTLnMnZWfYIEHmTkpyzgcZh12WKWpCSUmDWuJCofslPadCXhxWYYt6GNMr1oEeac
4HbSW28ngj1zM8buQRQPt1bgGfFNcVLHi8uZqAzi9vfBBIo/mFF3d44adxB/h1JN
BfYCcVODBDYABWIAAKLstydW7LLy5EjgpOQLe+DHb7+XjRKsU0VkVARCsGSDcSd1
TkRuGJCYaF0cJ2cW/k1MnROE9C+W6M2fAZJfrWB8gOO0EmWMsSeMt5GzaARjTUq0
1iBLQYhmi+SQNUHL882J8mrGY+95bdXJk06S9WVtChiai3GRdJM=
=xaw5
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
