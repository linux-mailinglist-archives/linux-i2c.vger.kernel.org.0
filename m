Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB9BFD876
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2019 10:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfKOJKj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Nov 2019 04:10:39 -0500
Received: from sauhun.de ([88.99.104.3]:56592 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfKOJKj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 Nov 2019 04:10:39 -0500
Received: from localhost (p54B33606.dip0.t-ipconnect.de [84.179.54.6])
        by pokefinder.org (Postfix) with ESMTPSA id 6C5462C03E3;
        Fri, 15 Nov 2019 10:10:36 +0100 (CET)
Date:   Fri, 15 Nov 2019 10:10:36 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: of: Populate fwnode in of_i2c_get_board_info()
Message-ID: <20191115091035.GA2227@kunai>
References: <20191115045049.261104-1-saravanak@google.com>
 <20191115053201.GA800105@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <20191115053201.GA800105@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2019 at 01:32:01PM +0800, Greg Kroah-Hartman wrote:
> On Thu, Nov 14, 2019 at 08:50:48PM -0800, Saravana Kannan wrote:
> > This allows the of_devlink feature to work across i2c devices too. This
> > avoid unnecessary probe deferrals of i2c devices, defers consumers of
> > i2c devices till the i2c devices probe, and allows i2c drivers to
> > implement sync_state() callbacks.
> >=20
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
> > The of_devlink feature is present in driver-core-next branch. It started
> > off with [1] but it has been improving since then.
> >=20
> > [1] -- https://lore.kernel.org/linux-acpi/20190904211126.47518-1-sarava=
nak@google.com/
> >=20
> >  drivers/i2c/i2c-core-of.c | 1 +
> >  1 file changed, 1 insertion(+)
>=20
> Wolfram, I can take this through my tree now if you have no objections
> to this.

What would be the advantage? I can also apply it today if you ack it.


--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3Oa4cACgkQFA3kzBSg
KbaZMhAAh1UZSZZXjji5ZsU0sxQOpgTLqO0m8PDgaHqtoQ8ASGngmutKDq6R9v8M
6ChpmmIfUHgIFdqta87XH/xhnjpP94TAr0XdIl8Aryjj2xg8+pdUOwNpxofuQmQ+
TG7gzSlRI2MAN2+nyiaObD42FlZrOoNjiwL2nZySsPlWRoIGdfT7CO0zX41qp16l
f4E01AhfO6Irb94O1GJXtg3/EKoN91K7B25+BhXiCiv8PE0+MFZzWZ6BprKZCpae
oy1pHgQpJbZJM1GvPEdXTfBQu5HHDxlnL50d1auAsJaTMcch0p4nTFKmTqg+tW0N
7szlGfwVyVBnGatSCqwZrX8GALU+7pPPDMx5KT+sh6M/a28+G2qFX/3HrATRQvat
omMHQkVtvNll2OZzo9EWIaWvElLqay1hpTzdO5Anbwj4/6fKUWgGwj+/TF0xkj06
xA+nLKOn3kEcO8xoBCduWvShvmQDUADnVNXj6dbM6XyF/WmRH4dEcrgItcoUjqfn
tsF1lmSlJIHlzrUwQ77BsJj1ZTziwnwrj+aBQkqmRUYw3K+qJrmJAAyfqvoPYcT4
uh4U2sSxAw5s1TuzZFRqDY4drnQ6Spooquq6BE6CL21yqURKfENUiF63BUrMVobp
vAwaflgkzGCP7XtJMRP86uFd2a9gtdSTjiLA3A54Qd/gmx5FJoM=
=PpDn
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
