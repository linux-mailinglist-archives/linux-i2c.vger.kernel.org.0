Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9909E2A6DA
	for <lists+linux-i2c@lfdr.de>; Sat, 25 May 2019 21:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfEYT4d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 May 2019 15:56:33 -0400
Received: from sauhun.de ([88.99.104.3]:46514 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727416AbfEYT4d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 May 2019 15:56:33 -0400
Received: from localhost (p5486CB33.dip0.t-ipconnect.de [84.134.203.51])
        by pokefinder.org (Postfix) with ESMTPSA id 2AC8F2C016F;
        Sat, 25 May 2019 21:56:31 +0200 (CEST)
Date:   Sat, 25 May 2019 21:56:30 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v3 2/5] i2c: nvidia-gpu: add runtime pm support
Message-ID: <20190525195630.GB12538@kunai>
References: <20190522183142.11061-1-ajayg@nvidia.com>
 <20190522183142.11061-3-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <20190522183142.11061-3-ajayg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> @@ -211,6 +212,8 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *ad=
ap,
>  		goto exit;
>  	}
> =20
> +	pm_runtime_mark_last_busy(i2cd->dev);
> +	pm_runtime_put_autosuspend(i2cd->dev);
>  	return i;
>  exit:
>  	if (send_stop) {
> @@ -218,6 +221,8 @@ static int gpu_i2c_master_xfer(struct i2c_adapter *ad=
ap,
>  		if (status2 < 0)
>  			dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
>  	}
> +	pm_runtime_mark_last_busy(i2cd->dev);
> +	pm_runtime_put_autosuspend(i2cd->dev);

Maybe another worthwhile refactorization possible here? The exit code
path and 'all good' code path look very similar. This can be done
incrementally, though. I think for now it is okay.

> +static __maybe_unused int gpu_i2c_suspend(struct device *dev)
> +{
> +	return 0;
> +}

Why do we need this?


--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzpne4ACgkQFA3kzBSg
KbYeoxAAhfSpaG14UxX0oMoSlpuSn4C8BktRQVDdCh+IAIywVMFh7hwzTH5cxCrn
ws3WYszDq4ihhR1HKPgM/ebkmQIxpOmy5buACwFKTyw8pDZOzPi9BAjr6JKA559t
M7V09hcT3s/asiUozbBwnARvT5BALLNS/IlFh49P9uFNHNmoHhs8Vv+d2+v/pe21
5ggTa79l4ElyO2vHHzKE9RsREsWRDtYCdhnYfaEoAMAbjEzAuVLS8xQ+tacIoGPk
dF6mGl3CcbzpqqQAhdMvPPjMK3B70nAZ4p6fmSdK9qv62RPZDKZaF/3u8sxhUGS7
W1hoPJTvSHF81M0JdIwYAbo6K0LB1ZAU89FN75m4DVR5fRC4oBFr8qtZkcngnpPH
rzSSmGQ8h86CFwNWhwtRs8jkAP1irmTXRhtYLv2+aMODZJu73G1QnG+9/rqDKDw7
41xlA3TUe8LEYc7/10lHzcfrIettDE0n17CmfRqbjEOjkOUuYcPM6gFvedbxtJsd
T38gn03gqNwOg2AOYPjbIxZjs+o0gO3duhhXppXR4UUS+f6jMZ5Wfz/sob+i+EzI
ixYVNhXrDScY/HuA7EU5Lyie4mOD7qaMJ26KbJHl0la2mrDpioAsMPHtNFccvzSK
P6IRVgkTeudSZMoP/5MNtkZmyACi+CtsMxCLBpTq2zb6J3FmUkA=
=A79o
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
