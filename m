Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAB6CA282E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 22:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbfH2UjP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 16:39:15 -0400
Received: from sauhun.de ([88.99.104.3]:43518 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726245AbfH2UjP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 16:39:15 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 1426E2C001C;
        Thu, 29 Aug 2019 22:39:13 +0200 (CEST)
Date:   Thu, 29 Aug 2019 22:39:12 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Enrico Weigelt <lkml@metux.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RFC] i2c: imx: make use of format specifier %dE
Message-ID: <20190829203912.GU3740@ninjato>
References: <20190829042905.4850-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8Tx+BDMK09J610+l"
Content-Disposition: inline
In-Reply-To: <20190829042905.4850-1-uwe@kleine-koenig.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8Tx+BDMK09J610+l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 06:29:05AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> I created a patch that teaches printk et al to emit a symbolic error
> name for an error valued integer[1]. With that applied
>=20
> 	dev_err(&pdev->dev, "can't enable I2C clock, ret=3D%dE\n", ret);
>=20
> emits
>=20
> 	... can't enable I2C clock, ret=3DEIO
>=20
> if ret is -EIO. Petr Mladek (i.e. one of the printk maintainers) had
> concerns if this would be well received and worth the effort. He asked
> to present it to a few subsystems. So for now, this patch converting the
> i2c-imx driver shouldn't be applied yet but it would be great to get
> some feedback about if you think that being able to easily printk (for
> example) "EIO" instead of "-5" is a good idea. Would it help you? Do you
> think it helps your users?

Yes, it would help me. And users, too, I am quite sure. For me, if I mix
up two numbers while debugging, I am hunting ghosts for a while until I
realize my mistake. So:

Acked-by: Wolfram Sang <wsa@the-dreams.de>

I think the main drawback is that ERRORCODES in vsprintf.c now need
maintenance, but I think it is worth the effort. I'd be interested in
the overhead in size this causes, but I also think it is worth the
effort. (It could even be compiled out if we have some generic Kconfig
symbol for smaller kernels).

Thanks,

   Wolfram


--8Tx+BDMK09J610+l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oN+wACgkQFA3kzBSg
KbaAsw/+KQeS89gkyeBgAuyg+ZnDAtyMHwIHqkX4EkYR3abYoCEQARebjkC5PomS
r9Ie2ueeR8sZe2MjpIds7ajUq/VwCb7oSstIWsS7mpiQsFDmMH7UxrpeuUdL6yP9
3DxNgaIfKpf7kw/AbOMU0KBtb28tzG8qkw7+iGu6W7U5/H7XCGHTmHm0a5K2sEvk
ajZxyXeaXGZL4Y5EYyTRK+p4Allrr169BsOzh2oZhnn0WGxgC0S5Afkq3WcCs8gr
id+80az2VZ7wZkDklu2/c3TO5PkROViHnAISfXtqeyrD7fqnEhpsH4aX7iEuSed+
GSa67N0uMO+0Pap/5Y+CgXazG1EGgc3UYUywgxLw9vRneNy6yXLTZ3S375Xb3GOF
L3BOqOW2lbVchDr9t+igYPEIWH63DEWfyrVZyWR0BfXWCkNQhjOM3r+9X7YvXdQG
fTu0Jwxt8sEHcaug7L0PDEGfU3ym/lcGSwiJSKSc1bwVbthJSpDtgfnY8B+KU+1x
q/cXdcP1CLOykl1FGJ4YeGP+cVoNYDRd61DkU6hY44vVdZ+ZgoEKnz2wr4w2JDzb
3SLqPQpu7SBw/YmmFWliCfbKhiPxhWlyZfNh/qRYj/k4gEVfW/SGyQ5odeFLRY5P
lE64DMYszcabfUgh0QGiE78PeeekqZd0kyIRLKWytvfN5YXHKTI=
=XXiC
-----END PGP SIGNATURE-----

--8Tx+BDMK09J610+l--
