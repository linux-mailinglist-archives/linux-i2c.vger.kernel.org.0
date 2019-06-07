Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC033865C
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 10:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbfFGIdZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 04:33:25 -0400
Received: from sauhun.de ([88.99.104.3]:41492 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726116AbfFGIdZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 04:33:25 -0400
Received: from localhost (p5486CE26.dip0.t-ipconnect.de [84.134.206.38])
        by pokefinder.org (Postfix) with ESMTPSA id 45E463E43D1;
        Fri,  7 Jun 2019 10:33:23 +0200 (CEST)
Date:   Fri, 7 Jun 2019 10:33:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v4 1/5] i2c: nvidia-gpu: refactor master_xfer
Message-ID: <20190607083322.GC3360@kunai>
References: <20190603170545.24004-1-ajayg@nvidia.com>
 <20190603170545.24004-2-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline
In-Reply-To: <20190603170545.24004-2-ajayg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Changes from v3->v4:
> 	- Further refactor master_xfer based on Wolfram's comment.

Yay, looks even better. One thing to improve, though.

>  	status =3D gpu_i2c_stop(i2cd);

send_stop =3D false;

> -	if (status < 0)
> -		return status;
> +	if (status < 0) {
> +		send_stop =3D false;

and skip it here...

> +		goto exit;
> +	}
> =20
> -	return i;
> -stop:
> -	status2 =3D gpu_i2c_stop(i2cd);
> -	if (status2 < 0)
> -		dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
> +	send_stop =3D false;

=2E.. and here.


--i7F3eY7HS/tUJxUd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlz6IVIACgkQFA3kzBSg
KbbgqRAAnnC/zcXDPILNTRV+nik31Sj8x/1wIVNaVu+tM8zM9e1x/4T+gJuctqNG
pwdMWmuG936hVtx9KLhtZPCj4wQZQaTwAzWxNPWBcpjCeot0G5H/8IH+D1TJlI0d
h1AUbp0ztJo5rnXfuQFotV+jm+h1xBkQNt0DNqy6qB7yLdts1ZKTiLFc2BC0yGOv
w4pDBGd+18QYqKmeNrKkKO7UNNgu38gDwsxsOekFI2JayTZje/9iUO30RtggVays
pFRBjKuWTk7R1nN7pGXk8qoxRrHKouL6ErXEe4mEHaoutVDCwbNf0L+G7JQutSUP
AZgOZUnB+l4JlGb6qHEVSzytw7r9VhWDX1GDhF3d/E+4IEFKwr98rcVwTedb6IK5
u2aB1uJoq6uv7506d82CcgNxy0lk3QIqm/y9b6fOxI09zZ8Nui1UxqW2Zo6YYURc
eJaudMbnxbHGAcvCCfDYWrtBmbMTPPREa7mkjKnvjaK9YKzDOQEPWgjZS1uX0akL
rTSlSZf29zPzcmi89IGcGkRadE/ShaUjGU4VJP5+y8GFtfJzHHtpiQiJGeNrGPry
sCNL+vnr/102ECktqQo8kGM1vT7Lj5FMPULEvqDeY0JnxEnJrOivsCeozCCGbY07
rRmLcBN5k/LG1GgLGWS037qI8VSjG4bf74Usys3lQX4wBT4N4DQ=
=oZ8g
-----END PGP SIGNATURE-----

--i7F3eY7HS/tUJxUd--
