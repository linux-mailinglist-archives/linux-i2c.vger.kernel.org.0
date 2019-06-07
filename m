Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC93398FB
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 00:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731768AbfFGWi2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 18:38:28 -0400
Received: from sauhun.de ([88.99.104.3]:46660 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731806AbfFGWiZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 18:38:25 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id 73AC13E43BA;
        Sat,  8 Jun 2019 00:38:23 +0200 (CEST)
Date:   Sat, 8 Jun 2019 00:38:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Annaliese McDermond <nh6z@nh6z.net>
Cc:     eric@anholt.net, stefan.wahren@i2se.com, f.fainelli@gmail.com,
        swarren@wwwdotorg.org, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Subject: Re: [PATCH v3] i2c: bcm2835: Model Divider in CCF
Message-ID: <20190607223822.GG869@kunai>
References: <20190529042912.12956-1-nh6z@nh6z.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KIzF6Cje4W/osXrF"
Content-Disposition: inline
In-Reply-To: <20190529042912.12956-1-nh6z@nh6z.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	devm_clk_unregister(i2c_dev->dev, bus_clk);

Is there a reason you call this and not rely on devm to unregister?

Other than that, looks good from what I can tell.


--KIzF6Cje4W/osXrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz6514ACgkQFA3kzBSg
KbaMExAApAMFnRZJvXuFOCFels8tmkIPUkpkZ69YwmOIYzCf8kK1VDSpQ3jzmrVN
gWajpxvY8z9Vn3x95HPtzpuoo8qkhnydRE+mS98Yto2qek3Z6gMCjwY5V9X7go0P
y5goRoVDz7yLMvWtJMH+gc4fPrDoFXz17+vpkX1+fHz94Em/Q801nZTUsqe8S2K1
sCQrL37uijXaXlihwCWbRfn+XC26Ci4oyJ733rVUoc0LqSUH1uk19OwN1ASZ3M1l
yLDEnCh7FsEmi7n30F0bvF6EU718HrOb9assrqIvu6mzh+t1Pdmo/2Cw48ZQai4Q
Dp50Tzt5Ky7J0ufI1koR9h4xkQIRsy4lVNNzohkzOutgHNOPh3qmfjH/K4DAi0Hx
FIhl+mKU7QFlcFHTHfEUC+SZpC9Cu4mCnWdpvzoZvgOOm6BpH5vUg7NCcFhBY7wn
AoVojYqtZIjDuQmSHDLeQXbz7Tz0TeP7FF7ZUYEyOKnnSASMlWKf/XN3Rs0u9KaZ
GeBTT5aEXyIgUuVfXo+rJrW0/9KPbZ5aJpIa6c9eiDYHjbrNFIBl4PEpF+UmovPX
N+r8tXKI/UOqRzvqBFiIweFMl0kIPi9h/sZFERTLuYshmkN6bmLb/CR7rqvSfeQz
6jaeK7xsRVupOhNrNyAC5Blh6OX+uyzOjGDMhFPOyNVdW9EskGA=
=R1IH
-----END PGP SIGNATURE-----

--KIzF6Cje4W/osXrF--
