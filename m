Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9975ABF1
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2019 16:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfF2Ous (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jun 2019 10:50:48 -0400
Received: from sauhun.de ([88.99.104.3]:34042 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726801AbfF2Ous (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jun 2019 10:50:48 -0400
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
        by pokefinder.org (Postfix) with ESMTPSA id 8832F2C047A;
        Sat, 29 Jun 2019 16:50:46 +0200 (CEST)
Date:   Sat, 29 Jun 2019 16:50:46 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jochen Friedrich <jochen@scram.de>
Cc:     Vasyl Gomonovych <gomonovych@gmail.com>,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: remove casting dma_alloc
Message-ID: <20190629145046.GA15093@kunai>
References: <20190629113424.GH1685@kunai>
 <7ae3d130-b835-4966-b21d-3ad7dac86046@email.android.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <7ae3d130-b835-4966-b21d-3ad7dac86046@email.android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jochen,

(could you send text emails, please?)

> yes, I'm still here. However, I don't have the hardware anymore to test the patch.

Thanks for answering!

And besides (not) testing, are you still open to review patches to the
best of your knowledge (I neither have most of the HW). Or do you prefer
to orphan the driver?

Kind regards,

   Wolfram


--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0XesEACgkQFA3kzBSg
KbaPXQ//Xvup3+1jm37VjITy8PSk0B2UjosZjmJCGl9ykh+j+UYzKY/q3UfvVXrp
tc5aE3n9/XFqunBDFAUEBlY9HypfXN8G7xuFdaLF05JQleXaAszs71FyShW2unai
+W4isfkuoHPdByseUryjv0DUFJ9Z/AEGZ1Xrku5BUMVmNq0QsN2f8vmk4akI9ffc
Px4PpiN+u/pHZdXPuoDU34ok6QOWHo5jNWGa1gNXPGK4QZ79je+9Av+3UjSLkB8g
NZk0VjbAbnufS5kWMbxAdQ7SuC28AefPczCSHe7YYXCSa6VK4nhXs0JKOcaY0C6d
bwS6B9eIe/6VQKPhWdPP2bprENNAPnITWvn+TKR54VlSrk+1gR84Wi4tZ7XplaaV
h6lsJWD5W1d8m/LYng/04JQuPFkDcq/U+5BWufR1NgCVZ9Lwy+Ue99QDcha7FYbM
rT0KiLeEFNeg2FtsVCFDYaYfMhaG/m9fN1L3oJ7Xw0gXG6jTSF8ylaRhyuMzAwHb
OK6a05BUz/xzfsGnAKQrSDyDuqNGzEDO1t7YKL+RdHSKtY5wO2HnrJnLOTEXS7i8
CFYy38VwdLYPCUQaxIn/bUCFcxkSt3wbcGsq5lVrsb6Y9lbFOHDZFmJVgszKgzpW
KdIkHVD7ASnTqAvI8SODB3vRt0U+u9MFU5fx94BSUcLO/mmxbOA=
=ucl8
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
