Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDADFEFC
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2019 19:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfD3Rhs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Apr 2019 13:37:48 -0400
Received: from sauhun.de ([88.99.104.3]:36246 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbfD3Rhr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 30 Apr 2019 13:37:47 -0400
Received: from localhost (p5486CE82.dip0.t-ipconnect.de [84.134.206.130])
        by pokefinder.org (Postfix) with ESMTPSA id 385022C3720;
        Tue, 30 Apr 2019 19:37:45 +0200 (CEST)
Date:   Tue, 30 Apr 2019 19:37:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: I2C delay due to maintainer illness
Message-ID: <20190430173744.GA22352@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi people,

sadly, I have been tied to bed for a few days now, not in a condition to
really work on I2C, and this will not change until the weekend. I will
try hard to send out another pull request for 5.1, to get things fixed
properly, but only super trivial patches will be applied on top of my
current for-next (5.2). All this assuming there won't be another rc.

I think it is annoying, sure, but no catastrophe. However, it shows that
I am the single-point-of-failure for I2C patches, what I don't like.
Like I said before, I am open to group maintainership. If you think you
are a reliable candidate, please get in touch with me.

So much for now, I hope you all are in good health!

Happy hacking,

   Wolfram


--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzIh+MACgkQFA3kzBSg
KbbR7xAAmcwlIAXsgt5HQGQH9KBD+AyyubmSecTho85M/o/s3tLj4lTD7ejsop3a
70WSZfkcYtDZQHFLBewAWIomRWEmmvFEcrcRxVL1zPLFSTwNQtddY/6rjs6G+Ylz
GRHq9KWxOKCzUvP6stS6733CVFv08R0E8yMh+8dXAJWjZ1i4PKl+Wo33/I5/IXTa
KQNVtnNNnM6SjaYAz48qDRhVBTSlWGSYapKyAe06OGBW3nXwAJr7sjnXGeTQJqtk
okWbu5Ylx1XnhXwa7JASS7tda73gNacE8z38TgbCD7XqCqcMLa1jsO5FJQ4jU3vN
8SrIuSUqSiDOv+jvxlzpp2AcYQppz6jL7kq9FqavVthlU7D7G3ghmkeOiyVbLsrh
7z7NKE9FvJyWUmYgRIqdLPSrIVyDvj1R0EEphAYXgBkpWJlRVIVKIYkVzEzOg7oE
tHhSW69n1ScQQLRK5T8Rp271UjaIKOBwbT2GKn16k66XZG9YKdc3zp+zt/tYXEuh
5/pm/Vp9zXfOP8NaYBf3dsvyFGqjoePkuLEIrXSCjYEQYOht4ysGw0j4L4AccAUx
1WfEcGVCPhWMNA/noo8KdECQwtvp5X3Jni+Rn2F2ypOvx9puTKN1Yq55GnKWNTZC
Rw8VR1oFF4ne+JsW5CrWQOmtC8qNv5loOzh1IkJSMc2cjGf8IFE=
=P27L
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
