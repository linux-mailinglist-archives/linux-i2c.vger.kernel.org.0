Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDA05BB9E4
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Sep 2022 20:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiIQSaz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Sep 2022 14:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiIQSay (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Sep 2022 14:30:54 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573F12C11D
        for <linux-i2c@vger.kernel.org>; Sat, 17 Sep 2022 11:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=VWmKOIXfXGxfF9Y96DPy/rIR12TE
        N4Te9MmIJn0hlyY=; b=kHY5rmx7AP+17NaqRhHlMviLpijjy1hlVAzzJc8ketR5
        slpmyFI9NRm1G9nuSGKlVsEo+k4jQVd1SfYVxfIrINVTNaWqvg3ApcSkpr2lzTln
        J+MlWyDWtbPbff/mKKvxpXnPoL2qEk17Fak6sxjIPtwHE2nBCuksGQ6pn8bz7iY=
Received: (qmail 3860469 invoked from network); 17 Sep 2022 20:30:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2022 20:30:51 +0200
X-UD-Smtp-Session: l3s3148p1@JnOPrePoGIi5aIoe
Date:   Sat, 17 Sep 2022 20:30:50 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v3 6/9] i2c-mlxbf.c: Update SPDX license
Message-ID: <YyYSWjFJcmzCF9z5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>
References: <20220908173544.32615-1-asmaa@nvidia.com>
 <20220908173544.32615-7-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UkqP0IX9fM1FA5vg"
Content-Disposition: inline
In-Reply-To: <20220908173544.32615-7-asmaa@nvidia.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UkqP0IX9fM1FA5vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 01:35:41PM -0400, Asmaa Mnebhi wrote:
> Update the SPDX license to GPL-2.0 or BSD-3-Clause and
> update the copyright to NVIDIA CORPORATION.
>=20
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>

This needs ACKs from everyone who has touched the driver in the past.
Please resend and set the people to CC so they can respond to your
request. I suggest to move this patch out of the whole series and handle
it extra.


--UkqP0IX9fM1FA5vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMmEloACgkQFA3kzBSg
KbbWIg//YcuM60ylcawc5nW8k/Qd3Mj9fB57fxIT16tGterJbLy2/ZordFzZVlKU
1tWe9GqyUirAtLjYRqVw+lWhSvkYDGNJeNY5ZarhYmwcX6boazxQGiGewniNJBzx
QSGs/JJC32X1S08tFIC2dWMl4b1sncRzTd5pq6WgKbd7vcLZuGBXJcTwtk0msOdR
gYGYHyHB3JDJo+dGbLCAQXX5oj7Jhk+FUARNQaXxNrqIQ1W7K/wzIoHVCAu1inzA
/cC9QJBZXaZutHoQ79qsojefNzghz5xZ6i3nHVSs8LOJ3zC6vOQLXtSITBGNcrc7
gi8vYkdt9PPu5NtUGOqaRfPNaNzrkfvealdRSC0wCCVZ6cKFA627TMiqXy+uvNfv
MEWoQvCZ2YkOnjaJg0eB6EL6YdusV/M5QWVAZLQyedCsUI3LArhNY2WssBgNnS/m
sdfQQiIwLrhvcQ321HTzumccgPN9fYdkPU5wawsfdBJsH7VfUtkhpH6cgz5oBsBY
BG8doekvcoTg2dNH8BLJ7Q6d1aASZIL/oSm+oiuL48Vi4Iha8ENGn3EuJW3Nknc0
MknULAMRaSb02hkmmegkrMYTph69TYLTZ/i/ifcB9x7ymyOkD73ho/U+lMAhCK/e
o2eyfG1daC/LqQQR/cKGXZ35cNJUGLJprYfU1kjwHFDdWYANyr4=
=rpS5
-----END PGP SIGNATURE-----

--UkqP0IX9fM1FA5vg--
