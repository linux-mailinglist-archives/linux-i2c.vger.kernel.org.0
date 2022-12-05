Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48C2564260C
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 10:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbiLEJsL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Dec 2022 04:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbiLEJsG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Dec 2022 04:48:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF091929D;
        Mon,  5 Dec 2022 01:48:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B4073B80BFF;
        Mon,  5 Dec 2022 09:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D49AC433C1;
        Mon,  5 Dec 2022 09:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670233682;
        bh=YlYKoqyt7cdn8r2c7P5RcFYqVH8fTbv+NY+VEj2eHg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LYoeyVrvNhyKVGmrrICJB1Ocxkt2q6VM6Yct4bWBPT6YwiUxXEB6XYem4KlpVe5PD
         3WC62ScLmwV3/qJIVIeQL1JAtNN+1rD5Yvg1tmiadT4hZVNCUjn7fd3PPEdj8Pdm89
         H/34KgCaiMMZHY0J+z0Xo80QemE6vcCpSOm85ja9dQMSrNue1CBS2XZpaH1gvlCS3R
         EVUgACkN7o+TnDUUuy6oYj0UE1VKDD7krp1pelO5v1Q5FVCFX2be410YAXtrs3Vab5
         PLQh/WAZ3WCvB13oaYK/p7MthSYLRSxwZS5JDUTarnYtQvORd3vlzboWVFsgR/235+
         BOwpdBjYPmV4g==
Date:   Mon, 5 Dec 2022 10:47:59 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 044/606] i2c: core: Convert to i2c's .probe_new()
Message-ID: <Y42+T/3ZpDoiGHVg@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-45-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a2koQ6tskP7hfQ7F"
Content-Disposition: inline
In-Reply-To: <20221118224540.619276-45-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a2koQ6tskP7hfQ7F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 11:36:18PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Found an older patch doing the same, but still thanks!


--a2koQ6tskP7hfQ7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmONvk8ACgkQFA3kzBSg
KbZI+hAAmuToQYSzgX58x3QNZOsq/X/YiJ7DOdk80+hfoZJXLTOFBfUcpS9RElDk
ezAcWZxYY10IE1fIitKRfkVlr0ULfItGcZkTSWWPpFFwj8uJLCKc4N8qv6ePW1XL
+GwDNe9RlpQQVfgAWoK/fx2ZwGdhuZy0V46t9quqTmwMP+WNBkDntUye7lZ1Csu5
aFAYiIRU1eGb2ykLl/64VHM3jng6v2cf23I7702uHKqY8vOPLGoLt7IIccNr7zsz
h2sRunOR8sH+bECEAbdyrr0Zy22ljb8A/zHAYiQbJSU7qsYEFrowvLrykGBwPjyt
hX8rH9ll2hPTPQBL3VSgRlbm+Os9w7RKzh5hR9KM2NGCBTFZRgVXdtYh3sdD3lNb
SQVCUlHy2lnImOI6kgNX5JjHkwM53TqvJxVfF3JMW2HGwc5FpZTz/JswTtN3UT/E
iRZcZgEsP331ZK6NXLH24f0n8l8/mFUrYX/8UAf69fFU7OSAcfykHvnhz+tmOErB
pAxQZEhQg76j5XMKbySzHEnS0sTKj18wUsHeQPmjKQDjbGoigXL25Qvzp0KD8XTg
O2sKDkl2UE18b14yD90Nx1YQR6p1K+8Muh0q93kN97J5N4BUNY3VHhrulY0i/RmH
qJIDb2MonJVwIYM5CiY9vMBXFHllBkj2wrSYebQnMGW3QASK0I4=
=D8in
-----END PGP SIGNATURE-----

--a2koQ6tskP7hfQ7F--
