Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913FC262A47
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 10:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgIII36 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 04:29:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbgIII35 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 9 Sep 2020 04:29:57 -0400
Received: from localhost (p54b33098.dip0.t-ipconnect.de [84.179.48.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E68021532;
        Wed,  9 Sep 2020 08:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599640197;
        bh=MbClhGyUdRECN1h82ylvGrl2A/SJZyPj17UZy2kQneA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zfCmpZVRhOPWymSa+3BrJsvTJiqc8kkneJOJdgLm3KnLuG2u1f/cFsYx/BwYe7/Mo
         n58YrV9sEiYM0t1DehLE4fPtaIweTnK3j6IW0s+TvxApeOgQJfWp8acFP3S9b345/w
         k71mqJtcO3OIksU0O/z7N07yBMT1RfTryX+T+wLU=
Date:   Wed, 9 Sep 2020 10:29:53 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jeffrey Lin <jeffrey@icurse.nl>
Cc:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v2] i2c: i801: Register lis3lv02d I2C device on Dell
 Latitude 5480
Message-ID: <20200909082953.GD2272@ninjato>
References: <20200616234130.814499-1-jeffrey@icurse.nl>
 <20200902045136.527776-1-jeffrey@icurse.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EY/WZ/HvNxOox07X"
Content-Disposition: inline
In-Reply-To: <20200902045136.527776-1-jeffrey@icurse.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EY/WZ/HvNxOox07X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2020 at 12:51:37AM -0400, Jeffrey Lin wrote:
> Value of /sys/devices/platform/lis3lv02d/position when
>     Horizontal:     (36,-108,-1152)
>     Left elevated:  (-432,-126,-1062)
>     Front elevated: (36,594,-936)
>     Upside down:    (-126,-252,1098)
>=20
> Signed-off-by: Jeffrey Lin <jeffrey@icurse.nl>
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

Applied to for-next, thanks!


--EY/WZ/HvNxOox07X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9YkoEACgkQFA3kzBSg
KbZOKw//RODDc4CifTdAU7Aka34vLm8LoMuxVa7ZAiVI2qw4VozQ/GQi9m5uXBzD
KFcFnd6QCD3X+R52IzGX6MrgbMELN6M28+im3e2On0tS6Bs9LsPWu3SpklYeUX9Z
6G3QKnKucXQ8JqCMuKoYCYudAtUeR7AiWlYv5a8lemIXJaD1Yn/rPFbvgflVje5V
9HLCPVr40EGX4Jni0jPcqniAq1wBe8HUxxdPxC2KkfrtZh8YsW6TIikbt9jGdKZ3
9jMmNO9q9VSB4XZaC0fvgWklL9VXkgyzT50UV6vMTTlTxx2fSJcFm665OKHPqszd
U5D9q9DnKOvDCg/PHUMeEsPpMq3FEApwg+itp8yhdOMwdufa3DnIVWztjcyVRKeC
zWo/h6MgdGSXlePmVPO4FF98wAzvi62O9F9hpEJF8aDCxvosc1ngrX4Nzzntc9nw
Vp/6JvJeihtr19dV85QToIJMMFoYMSZQWvk1D05Ryl8QnNm3dqs93iSR5y3FWOnQ
ofBwBq+ppU+INyo7RFMWr8V3t5BThHuS57C0VLb9OLXAHODV3RZZ7ESIJs79uS9g
Mi9BGRJp2FOMHPJ9QAFU7vptxa/LzyXLQse0CE7BSuUrhHAkxtzxdD5sCQUO6QXe
L8CowGSxlN4RYBR9LVXb2LaUtV3GYBQGpy4CYPvXMoNp/QuB19E=
=vVja
-----END PGP SIGNATURE-----

--EY/WZ/HvNxOox07X--
