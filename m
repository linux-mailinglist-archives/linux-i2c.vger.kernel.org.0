Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF313861B
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 10:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfFGI1G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 04:27:06 -0400
Received: from sauhun.de ([88.99.104.3]:41426 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbfFGI1G (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 04:27:06 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id AAFE03E43BA;
        Fri,  7 Jun 2019 10:27:04 +0200 (CEST)
Date:   Fri, 7 Jun 2019 10:27:04 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Ajay Gupta <ajaykuee@gmail.com>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v4 3/5] usb: typec: ucsi: ccg: enable runtime pm support
Message-ID: <20190607082704.GA3360@kunai>
References: <20190603170545.24004-1-ajayg@nvidia.com>
 <20190603170545.24004-4-ajayg@nvidia.com>
 <20190607082510.GB10298@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20190607082510.GB10298@kuha.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2019 at 11:25:10AM +0300, Heikki Krogerus wrote:
> On Mon, Jun 03, 2019 at 10:05:43AM -0700, Ajay Gupta wrote:
> > From: Ajay Gupta <ajayg@nvidia.com>
> >=20
> > The change enables runtime pm support to UCSI CCG driver.
> > Added ucsi_resume() function to enable notification after
> > system reusme. Exported both ucsi_resume() and ucsi_send_command()
> > symbols in ucsi.c for modular build.
> >=20
> > Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
>=20
> Was the idea that Wolfram picks these? In that case:

Cover letter says your tree, will check the i2c patches now.


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz6H9QACgkQFA3kzBSg
Kbbm9Q//ZSv0xeozNWWdOAgS38NK6yD4Nljpyv+ICbj3uyW8q5t4jGBOeaPJRgpJ
8JdvPZMayBbF+NGoodnkmNMFAF1meuIF94EWPaHqwBeid2HXDCz1PQGJFpzum8Pk
X3F+Bd0JYABKIsMUN9YO+/XrqnHOx4bWQk9v7s53uj1Zf3mG90k+QoK1T2HEQwEq
3DabFoGxl6gVPwG5YcF975nJp77S6HcFFW/E4hw1eej6uWwE+DOtv2ycOjXNF+2e
xsr9HqsBEGvY+WJa1ym7EUFZO7bETgS8GJjjor1iXI+Q8ejrs2SHAo8PIXxZMIbu
cAyqG63DOpBrjAxnoKsUsBHa5DOJj9zSi5FYB+MfBjnOGulY6zKunygoX7XqSY+n
IyLGFVBwegBv9xSiMw7xgaVwVwXlkd83A5Ufr0Pp57aNHBs6oCWM0FRWOMmzK9Hf
mYAqZbpSUmfnCtk+cC/NJ3vMWoE44ZD/BOuwxQgNSisdb8x2YcRmKOjM+CNQLevs
Zozu0hfL2/jfL3mmH5bY6u+f+O9Uw0c0BWRKfHJs8Gbaf0jsQPjsLfcEZQtH7uW4
ifktepO/2/33BeuGky3G3ru3NRPz/q3dH+K6OOFE76WLRyBdq/qex4Ew8WTXOydW
mfAUDyEBM0NODWxPEil5ot7mTvJpO2ShoEUF6Bd8kEofs2EIhXc=
=zo6m
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
