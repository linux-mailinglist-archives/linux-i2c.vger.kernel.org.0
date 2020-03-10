Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE6117F4D6
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 11:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgCJKQP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 06:16:15 -0400
Received: from sauhun.de ([88.99.104.3]:47064 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbgCJKQP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 06:16:15 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id F2DDE2C1EB6;
        Tue, 10 Mar 2020 11:16:13 +0100 (CET)
Date:   Tue, 10 Mar 2020 11:16:13 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 04/89] i2c: brcmstb: Allow to compile it on BCM2835
Message-ID: <20200310101613.GN1987@ninjato>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <0ec2a26c7492b1ef6554d3bdada7a6fb8b41ab1c.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ztcJpsdPpsnnlAp8"
Content-Disposition: inline
In-Reply-To: <0ec2a26c7492b1ef6554d3bdada7a6fb8b41ab1c.1582533919.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ztcJpsdPpsnnlAp8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  config I2C_BRCMSTB
>  	tristate "BRCM Settop/DSL I2C controller"
>  	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_63XX || \
> -		   COMPILE_TEST
> +		   COMPILE_TEST || ARCH_BCM2835

Can you please sort if for easier maintenance?


--ztcJpsdPpsnnlAp8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5naO0ACgkQFA3kzBSg
Kbbotw/+MzEKdBWRAl9XS4c7JMOrYWcaHDXRPlPcgpby/WGwtkBcP3qMVLzhUK3P
wmRIwVMeZxmVzF6//Nj0RUMzHdMABDfMxroBW71xRaksB0X1Z4QwQoPhJrySz880
n7CosfR4WmdVujIgSA4G5Wx7Izqbw6Y3F5MBI4q9hDQC4yB6+0ByDA5PdC2c/ze8
UtrISDP7GZyfGY8j7+R5jycrYzGAZo+nsQ96AphoZYqnMoOaVhMU8e9zKzcPZjXE
y7gjuKI9drofcEYwZSwfA7xBN3mjG/zGaQdcfw8wYd9dX6+7Rw4ufZ36t6xKjvGv
OtMuow5QkSJAnjoTxFx8AvfqpXuGFTaRIq8znaIPOLp3OfwbWy6YpMQXwBTuhdip
GHouuNT9FKOfKhNxWo4wRox1VnaI9a/88X6L8VPu6hCpk2y+Ok6vzdcd//aA56/W
JeSFvdkFW305mu4CGGLq7CSH/w86tjSSmQveOXgRrsYfZ8fJL5TrQUIkkVCZG9Gk
Tj9LqtT4b97xVY6bNloTPRF3xAiu9t6pvJna/J8RSSIct6bjSPXJ5wuZW7eykUYD
DKOCd2LRmDbjwU0niH6Xt9K5FOK05SVdQDvSgFNABjGJTkaH29yxtoA+MQ8PTDaS
5J1H1Vzqf6tuGQ1I4Iv/W2yS9GmOlwY6pW8qvi+csOoeW4TXMR8=
=UluX
-----END PGP SIGNATURE-----

--ztcJpsdPpsnnlAp8--
