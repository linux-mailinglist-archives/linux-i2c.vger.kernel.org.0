Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CD24B2BD5
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 18:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233241AbiBKRff (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 12:35:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239369AbiBKRff (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 12:35:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAD1391
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 09:35:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19367B82B25
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 17:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A98C340E9;
        Fri, 11 Feb 2022 17:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644600930;
        bh=Fye5DYxYqeX0DYIQSBLhLXfqkeTnxb1Soj9jvLLBMxc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=era3a0UnjW3f56fr9u1UcWjPF4Y06sspB926sKbA5OQVl42uOxuz+RIuPFp39xhtY
         Pgc5L+0eHgoJFzK2kAwEdLoAOrSSqQDJ7Wvd5OXEx5ifF3j5TWmbs3k/xdNKbNrJaU
         n+0N602nxKOCF//ZlhGTzv6WQLyabA5nmycv4H1aslhFP5wnxKjxQj89/+ajX59rrD
         z5pQZzRiRoCCLwiqTbj0BhmDl4FudxTkp2jQMsdTtM5XzH4r7I5RqZgXIsHIygEjpj
         1nSVGL9jt2es+FIyFBGMQKm8ZOB/J28+zPmIyI0/M2mxgmz7/Rn2uwKKjtyyjUwK4D
         r2/9C6PIqVqmg==
Date:   Fri, 11 Feb 2022 18:35:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Dabros <jsd@semihalf.com>, Sven Peter <sven@svenpeter.dev>,
        Jie Deng <jie.deng@intel.com>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] i2c: brcmstb: allow compiling on BCM4908
Message-ID: <YgaeX7X53d597kVr@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh@kernel.org>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Dabros <jsd@semihalf.com>, Sven Peter <sven@svenpeter.dev>,
        Jie Deng <jie.deng@intel.com>,
        Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220211105806.14341-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fQBQTKe0JP/Go6s9"
Content-Disposition: inline
In-Reply-To: <20220211105806.14341-1-zajec5@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fQBQTKe0JP/Go6s9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 11:58:06AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> BCM4908 SoCs use the same I2C hardware block as STB and BCM63xx devices.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Applied to for-next, thanks!


--fQBQTKe0JP/Go6s9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGnl8ACgkQFA3kzBSg
KbZMaQ/8D38CbLWMJdQg73nXL2XgP/ddJLpR4vvXuyzNKnjVj2Er1McVkARXx4OR
VxgN20JiXGfmEmkws7z9y5pxNP8Sbwrb6Sz0bliGuRomOXaxJkMD1/dCHQTVNJta
iiTBnzQUEY0T10Znmx0PmQx5WLbJuNcQMfYvQ2oMvWrQNfkImQEgAH89V9jep8Ev
guC1njTcGtAxlYZtm7WIagN70dtT6PjaBwRnDJO2wIO/L8rVyAbl/su5TnX4ek6i
p+bKDZYMFZ4W94b5jaoWT8H6ixTu5wCz0F99a8CAdQ8Fl4QnBWXN8u9EkJgd+/TG
Bew0VXextnE4aVKmD9GRH0hG499VQFeuhtrWFBtkdZCxIfwlvxeDPCWIV965352O
wT9x3DMG5ChKevwxKsAZUOLNW3qm+j4BhEy0RJe3Od1IjnQFu9Iy0qohi99L83LT
M3lJyqhXqIWDO5lQxAiQTw1fqIupitaCwP4LZrLviPS8lKeV3++mfn/KMYDgUMAS
vIYUvQiXXrrV71Wt5yMf+iAX1WOk6kSjf86fREhnxgKG3orXObX0lg5PTH4oKGTl
Dnn/96H+HxnpK9NXq2f2DreWvCIPAn1Lx0dM+PopPAZhwVbZF/fREpm/t9PBJp1k
qtkBDLoSXnIs6GafE4QmKRNHNMzPoMtQJXrwsmyXDkaBFY/O5q8=
=IiU5
-----END PGP SIGNATURE-----

--fQBQTKe0JP/Go6s9--
