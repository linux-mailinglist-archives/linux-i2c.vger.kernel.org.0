Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61497287590
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Oct 2020 16:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730207AbgJHOBz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Oct 2020 10:01:55 -0400
Received: from www.zeus03.de ([194.117.254.33]:49326 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730206AbgJHOBy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Oct 2020 10:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=B25JFZ56dNNTT3gHzxvxMM9PgiUs
        jCDPWLcYTA5adRM=; b=MQl++c6gzpEe8RbkM2Ny4gru4tZSMdCxRqEqD69FKCYI
        GjaPuw+vgsOoIU2K8V4hSitF+UMk3sUGmr+JSZJnPyMQjPorEx5dG8AheuLAm85/
        Un0XifRkMvCRxCP7SWTr77RH33M6hZWiteIAI0jQFmHS7hnvszP7yRryLyHEsrI=
Received: (qmail 3366732 invoked from network); 8 Oct 2020 16:01:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2020 16:01:51 +0200
X-UD-Smtp-Session: l3s3148p1@4WUfRimx2pEgAwDPXwzvAOi1YJpFLj+d
Date:   Thu, 8 Oct 2020 16:01:51 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, Sergey.Semin@baikalelectronics.ru,
        krzk@kernel.org, rppt@kernel.org, loic.poulain@linaro.org,
        tali.perry1@gmail.com, bjorn.andersson@linaro.org,
        shuo.a.liu@intel.com, conghui.chen@intel.com, yu1.wang@intel.com
Subject: Re: [PATCH v3] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20201008140151.GE897@ninjato>
References: <1350309657ab0c7b9f97e7a5c71d084f88caa549.1600743079.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="phCU5ROyZO6kBE05"
Content-Disposition: inline
In-Reply-To: <1350309657ab0c7b9f97e7a5c71d084f88caa549.1600743079.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

some super high level questions:

> different controllers according to their needs. A backend
> example can be found in the device model of the open source
> project ACRN. For more information, please refer to
> https://projectacrn.org.

Could you provide a link directly to the backend, please?

> The device ID request:
>         https://github.com/oasis-tcs/virtio-spec/issues/85

Shall we wait for this to be approved? Or will it get only approved once
the driver here is upstream?

> +	  If you say yes to this option, support will be included for the virtio
> +	  I2C adapter driver. The hardware can be emulated by any device model
> +	  software according to the virtio protocol.

That means stuff like "limiting which devices on a given bus can be
accessed" will be handled by the backends, or?

What kind of testing has been done with this on which setup?

Thanks and happy hacking,

   Wolfram


--phCU5ROyZO6kBE05
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9/G8sACgkQFA3kzBSg
KbZpUA/+MK6H+3FNinSddnI4K6iznndiLMD9yBhDzPgTahxvk5mO54a3D0xZEyOJ
X4mVguBCy9glZaPIRSIox+X6fjyzKXnWunyPcqNDmrF4PrzEwkAHCHeN3Kz92j/A
Xi1+uaoJOBj3oRnNPo92r968MEPFwwu5xGQXMak6V2vjTLH9jEwB8Y4XbZohpwLU
TzEoWJZdanu4j8MsNxuvC2vwkMiw4PFaPJu/Sgs28JUx8WOm0zjPV1AUsYUz9WUU
SwlZhs1Q38uTiky2wXzYD+HtNMwQ6IWVZ8DcOBxZgz329oRLwnBMdUyIWw2ImQ5t
9571jQBLhX2kP2gwqlPlURdUPH36ePyYIaW6M8yjha3oyGsX0KCRSSPT8SlKIXtR
eiKhK1Ov/q9KdvfXjqrUHI3crXMNk4e7OJoSB2jTmILfFlSPAvhZqdffD+bUAH3p
qme+cbUo/ziuxxhMcFaVdGYniDu4lf5S4qemaK9FGb8KeXM0Wnqiwh1mFH/sA7Pd
ba2Z7nstcG14tHbbg1tID9nHSn3QB5xUMemk7PfnhhLaiCqdLlZ8bUIwUqJ58ank
ynPpopCbEnoB2C5mWkzkDVWU0IE4dLwYMR6hD8p5QVdE0wvQuqxUyUCyLDxzs0UC
9S4OOr8RsZawybmgUpmvTz8bbT9QxybOpcnnR+Npd78dxuMkChE=
=7jcK
-----END PGP SIGNATURE-----

--phCU5ROyZO6kBE05--
