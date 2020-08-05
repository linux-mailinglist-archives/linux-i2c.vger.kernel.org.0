Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DE723C93C
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgHEJdy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:33:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:60410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725868AbgHEJdu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 05:33:50 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0DE4D2075A;
        Wed,  5 Aug 2020 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596620029;
        bh=+PVMkHow/1cTDpTZAm0fNUZhkXhy8Y97366o6wkD/AE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uld5+n9kR22gnZeVca/pluvROt16z6AmOtya7TVb6MjC7DU5KxrpqMT5M1WEYnFsq
         ERVt39kL2w74Cdn32KGV8TUM57jhsOk3IHnmM0RoSWp0WfXUIS66PpmdYFQKf1YV4g
         HQHBSj12KVFETrEIr67Rsha8OcMn0h5yb365wLbg=
Date:   Wed, 5 Aug 2020 11:33:47 +0200
From:   wsa@kernel.org
To:     Jeffrey Lin <jeffrey@icurse.nl>
Cc:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Register lis3lv02d I2C device on Dell
 Latitude 5480
Message-ID: <20200805093347.GM1229@kunai>
Mail-Followup-To: wsa@kernel.org, Jeffrey Lin <jeffrey@icurse.nl>,
        jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200616234130.814499-1-jeffrey@icurse.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="37nyS7qXrnu4wN2o"
Content-Disposition: inline
In-Reply-To: <20200616234130.814499-1-jeffrey@icurse.nl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--37nyS7qXrnu4wN2o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 07:41:30PM -0400, Jeffrey Lin wrote:
> Value of /sys/devices/platform/lis3lv02d/position when
>     Horizontal:     (36,-108,-1152)
>     Left elevated:  (-432,-126,-1062)
>     Front elevated: (36,594,-936)
>     Upside down:    (-126,-252,1098)
>=20
> Signed-off-by: Jeffrey Lin <jeffrey@icurse.nl>

Jean?

> ---
>  drivers/i2c/busses/i2c-i801.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index fea644921a76..d7c802e20ae6 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1268,6 +1268,7 @@ static const struct {
>  	/*
>  	 * Additional individual entries were added after verification.
>  	 */
> +	{ "Latitude 5480",      0x29 },
>  	{ "Vostro V131",        0x1d },
>  };
> =20
> --=20
> 2.27.0
>=20

--37nyS7qXrnu4wN2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qfPsACgkQFA3kzBSg
KbYSkw//eQnM9kVffTP2sjG4jmvlxf+5TFmy//rhpCAaIOa/hBbOh2WmAsQvkcYq
fvIDnl+RnCVuydZX1IKfIZWGaALJ2s/jNsXv8GwQMzsrEjD2HC9I2vN/ivn3le8K
IpAcJUHylKUNV+1XeQZi+VtXUVkfGqLC88YV5Vz+Z9+peDvVFT9Vi8anDGOsnKUK
gwvXAQndn0RHTyF6WdzZKIc4RhPX61EKZep66xScB1FXrxLgEchwkwStg9ZG5+Te
80WmFMaEKzTPEaNiEWYsaIxHvEbF4Nkw8xHEu7I/nhP7+pzGHjAcBTlEOh4piowB
e5xZZBVD8XpIMc3WJ5eoCNIxQSzDryQg4araqH/iWktW1lSJF2FnzHNTNDPTKjrs
uCATpzPjDU9qODctW5EBCopH0aM00YWZGQOoWAT+SsvuRTcNNls3DkO5vNXe1okN
s59hrS/atRFc1FVOs7ySPWAA1Kr8FApRcApE/Sjq6odkll5N9skVnNf7LOHbs907
0hpr/4L6AQkF55oKRX/e5hJ7mIcsVbbKHRGO+1r1+KUW9UYxWI++dEfHsjbTz34w
Rle+tp+Hw6T0S2zLuvhKYfAr+ypGb2NEwDNMnrgn0kIzRWGULQT5vhmMNvZUI8LF
hYG0qCTuTCrewcIRAcq/FoYOUq9ybvPaIWIYAQSU9L0d6cA9yMQ=
=ckP+
-----END PGP SIGNATURE-----

--37nyS7qXrnu4wN2o--
