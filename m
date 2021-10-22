Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0963E4373DB
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 10:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232314AbhJVItL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 04:49:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:44984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232261AbhJVItK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 22 Oct 2021 04:49:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F177610A8;
        Fri, 22 Oct 2021 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634892413;
        bh=CEILUiLo3Ef5aUsDfS+97SOXG+XSykycfDZEsicSCbc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IPdZy73Zdj0qjeDuIbt5ig6hXmBFzbZloroiFVw16isUzfHgX6GQLrmx9gcorrwNE
         NoSkQtN0ZCrbL8ku/fxnQSEyeBEL0FWA8UXdfQDFOuTfgomVvav729qU3dr124JsWP
         yI47CJ9v+yrDRFcWAJe+ydel14ydLn886h6+6Z8R56dDayaCMDhI1Avnm0eHNLDPLm
         JfzpxfOvgdlXdPC6Ggz/tbfS7gMwBRkdeg3rdJnq8qCnP+sUBRDPqT6R4nUJK+spY9
         JskkAut0gtIv8ikGS2+4770ZAxl+RHB0p0HiO930Q9q5TnxUsVJ6y7X+lw5gNKvgeC
         YmpE2ruBUlQNA==
Date:   Fri, 22 Oct 2021 10:46:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 3/3] mfd: tps80031: Remove driver
Message-ID: <YXJ6deXN7vWrSc++@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20211021192258.21968-1-digetx@gmail.com>
 <20211021192258.21968-4-digetx@gmail.com>
 <YXJw2fX42REHylOy@google.com>
 <b8f6dffb-ec7b-c105-51f1-7b761e331a89@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="e7GVzSQ1DCf4k6lf"
Content-Disposition: inline
In-Reply-To: <b8f6dffb-ec7b-c105-51f1-7b761e331a89@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--e7GVzSQ1DCf4k6lf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> It's I2C driver. I'm not sure about auto-probing because something
> should provide information about device to Linux. It's possible to
> detect/scan whether there is device sitting on I2C address, but there is
> no auto-discovery mechanism, AFAIK.

Well, in general, it could be manually instantiated from userspace...

>=20
> TPS80031 device will fail to bind to this driver because it explicitly
> requires platform data which should be NULL if device is probed solely
> by I2C ID.

=2E.but I agree in this case. The driver has this code:

        if (!pdata) {
                dev_err(&client->dev, "tps80031 requires platform data\n");
                return -EINVAL;
        }

and git grep shows no user having platform data.

Shouldn't 'drivers/regulator/tps80031-regulator.c' and
'./rtc/rtc-tps80031.c' be removed as well?


--e7GVzSQ1DCf4k6lf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFyenEACgkQFA3kzBSg
Kba3fg//Wb58LU2rHxo161/nonnSA3fMC2oFlw2yXZiYciLEhsqe5B3fd+GXSn7B
aD3TDYvtFIB9i6Ifs+OtEvaemQut8ea2/nVJqVAe9sEn4CnF7UJFefVSu/in6pA3
yey4ZzqRBZqcyzN9EYjcheLvvGC1+NeSo2Y/Ft05vSxop28auMs4oNDJ+90B/CEH
NhtQ5QZ51AxotkPDWP1i5iAyAVINhZPoXSQVTLFAdnTKe+1VE98SePISzVnrP4vt
BqFqANZuMuYGI3/ziZUoSeMGJYxgvHVvBejom+x/cwCNvLAdpANOY3JG7MsSTDU+
TMVQeld7cSZB0wzXWXeb0K7hGBnTJdkFK/3D+5g7DldZSCw4UxCA0673nTP7SPeK
H8f8lTuYs4VjdMokVPuuhYa4WRWxbgteHJB3z/s6rwv/1p50VL/VU7WUnTzFbMc4
LDAToft++xsYBz4z/oZd/zAKX6FBsuWfG19xvDLUBjxh1NgYUHo6NzF3K86VfImD
vNBkbl08DuHdbi4kvgOE+XTbO2xSABrAmvpZX4j8f8GF9/4gBTUOah+Leo4HIhj6
u6Ynd8famuDpSpU66/5AuWIFlcY/cqy1fCzc14fFt+wDV5J5Y/gl3Omba+1Hfun2
iquq00hc5cwz1rqsEbqyZcgcI3SdD7vGOoxwwMs1wus/g3wb8vc=
=6mGi
-----END PGP SIGNATURE-----

--e7GVzSQ1DCf4k6lf--
