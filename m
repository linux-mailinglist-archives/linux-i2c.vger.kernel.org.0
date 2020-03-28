Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BED161968F0
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Mar 2020 20:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgC1TfF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Mar 2020 15:35:05 -0400
Received: from sauhun.de ([88.99.104.3]:58286 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726981AbgC1TfF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Mar 2020 15:35:05 -0400
Received: from localhost (p5486CEA0.dip0.t-ipconnect.de [84.134.206.160])
        by pokefinder.org (Postfix) with ESMTPSA id C48112C1F57;
        Sat, 28 Mar 2020 20:35:02 +0100 (CET)
Date:   Sat, 28 Mar 2020 20:35:02 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Jean-Baptiste Maneyrol <JManeyrol@invensense.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] iio: imu: inv_mpu6050: convert to use
 i2c_new_client_device()
Message-ID: <20200328193502.GA1330@kunai>
References: <20200326210955.12991-1-wsa+renesas@sang-engineering.com>
 <20200326210955.12991-2-wsa+renesas@sang-engineering.com>
 <MN2PR12MB44228DEA7CE19B853292FE38C4CC0@MN2PR12MB4422.namprd12.prod.outlook.com>
 <20200328151310.1dfd04a3@archlinux>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20200328151310.1dfd04a3@archlinux>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Note this has missed the coming merge window.  Hope that doesn't matter for your
> deprecation plans.

No worries. If I can remove it in the cycle after the next, I am happy.

Thanks!

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5/puIACgkQFA3kzBSg
KbaoHBAAs7uYfJzW2W62SRkJ7BLmqjeMfJlBq/LjXgzG7B2qZ2ndY1ObemD2Qflp
fGqIgt5FRXIFxuNN52Md0W4iRQ8qoYlluELMnAe4mXlYqROKTOm26PuvS0OB9rWq
/kVd1LoLj6DqWHVEl8IVjSGm9byltpO+LwT32bQVetRP6Kj6Gai+e9c6Ri15ZN4E
4ljVMCQij7QLiuwrG4cnOMURbJFlrfEiQlUt4ufQhN/Yixe0xjvv8mEbzZCcwWUd
5JY1Dj+R7RojHRH1Xpu3bCCtLQ8MfJXj0lae85MGamOqWpHa48kxieDSIigR+2BH
kaqapRu9voZO3WCK/gABhcPekcRNnIJx/c2FruC3ABpKWsw4izxUbVar2oSHAt0F
ah9k3ZfzUJQA43Y7WGkzswnikHCde3b4DMOILO6JWs7C/OKEgFIzPY4srSK9YBOi
2tcC/NG9jfYqSOZGUV6X8UJc0wLZA+85EwJbtfSV9Q5YJt351wLCB9Fa1+ky6nqS
J5lt6TVvM1+JoO1np7K4uwJFrRA+1xVokxGpOz8Em5EF/10UXn0xCXUCxkhgw8+C
ifT0aMOW6ZLbU+qlDWaJreh6YHb/l2KO2UWE4325PuakNw8sv7+J6dSBpTPHcGu3
d6nE4ONH+0UDsVu9fGyZps45AR6HyjD2Ou5XuICHKHrUsl45LEY=
=bgvz
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
