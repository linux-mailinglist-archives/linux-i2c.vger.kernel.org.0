Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB6B23E2D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 19:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392774AbfETRRK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 13:17:10 -0400
Received: from sauhun.de ([88.99.104.3]:52244 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390305AbfETRRK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 May 2019 13:17:10 -0400
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
        by pokefinder.org (Postfix) with ESMTPSA id 78D832C5DC5;
        Mon, 20 May 2019 19:17:08 +0200 (CEST)
Date:   Mon, 20 May 2019 19:17:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Ajay Gupta <ajaykuee@gmail.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/4] i2c: nvidia-gpu: add runtime pm support
Message-ID: <20190520171708.GA4018@kunai>
References: <20190517163818.5007-1-ajayg@nvidia.com>
 <20190517163818.5007-2-ajayg@nvidia.com>
 <20190519144704.GB7291@kunai>
 <BYAPR12MB272780E97D3D70EF46008E32DC060@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <BYAPR12MB272780E97D3D70EF46008E32DC060@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > I am not nacking this, yet the use of goto here seems too much for my taste. If
> > you could try refactoring the whole code (dunno, maybe using a flag when to
> > use stop?), I'd appreciate this.
> Ok, I will add a local variable to make it more readable.

I was brainstorming here, I am not sure if it will work or not. But you
will see. Maybe you get other ideas on the way. However, thanks for
trying out!


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzi4RAACgkQFA3kzBSg
Kba77Q/+LQoDOmt+a22fXm9b1ELau3gGmTQGOXeMLs34JHkKCkRmQiQQH3jCnTqu
3iLB1delPjjFowEVDQVoTQ6+fWWJtPvItzyGhYNMEL59+kIwlbQ7VAUuhd6WV/Do
q4ddPvP6AlawOgRPQSPF2MF2+pKC7m65OWbDsR7xK2cfZvyzRVjO9UV2ds9nOCL4
ZVBw0W1jgKOdhe10E1sOp0Ol4nxrknGjY3Jw/aPPMQZNK7dIhIi8DDf12oEmGhtI
v3fajfLxDu3GppPJqHNUdb8l/maFIhs7CBfiR4/yZdO1RysIqI5P+I8jXnBrtdbX
yaijWo8MeNw9vfhBqXbuiAPbKJMRNlTwR2fnKSkqgb5ap9Mufewtjz/3STvoh/Fi
OL4XF8RMkhnYUbGA/xxcnTir4yal+Xrfn6hXnm+NHyTe9Q5PAbsvswRzsr+jrFIB
HAaL/NfxDETG6j3Q8OeIg43bQBUeJHasPgdg2FWgLB49JoFyZerwiIAiTwUi6zI1
dyDuD+tVTCsnh9kP39+vYWzw/d6m79YE43mSwbMHsaOuRENseL1qDs4tH78bs5Zy
W4uKm5VV5OChA5SGi+HtLaT4zCcu8Ziy3P3tFvNXY1AZ2luZl3aTJYkzckuBIX/a
jKtBZG8FRwrJXCYRMN0lFZvw84mFcOt0gKIbozbGayadBN7aGXs=
=0Smp
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
