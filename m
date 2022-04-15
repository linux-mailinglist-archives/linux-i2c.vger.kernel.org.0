Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6A05030C5
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Apr 2022 01:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355512AbiDOVr5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 17:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbiDOVr5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 17:47:57 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B4CFD3D;
        Fri, 15 Apr 2022 14:45:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 16B97CE3148;
        Fri, 15 Apr 2022 21:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA9DC385A4;
        Fri, 15 Apr 2022 21:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650059124;
        bh=V5KT44zPHxdCxuNBGuMKnFW9ZbwhdDrnA6iBRSGQ7vQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DS7sMqDhP6BN4P+4XoZIfUGbu/o3sR3fZ+6iL0ZMl+Im6dYDzvRdBGCiiuO9RNylS
         +eLZYgVvsuSpgPob6xXc+N0gQrD9YuIzUpWd56w9kCU9ojhPBWdFzHUFDTCrZEmTxx
         BtqW1viPUPx8drlUAJGe5Y0w/gtzk/rTpD2zzT7aX/7i/MEsjNq68GDhHIbTVnZOMk
         VYEf6Ii9ejLP4+K8Soth9DGY8Zvdee3vVmWL6zkmRLV5Fzr3lppRo/cjdIxdzu8NVW
         +yxWQWqG0ipsAt5Qil34ObZLuEfJr426IZwaCCrZy8+ctQYMJCY7SrPYmBFE2BTnHh
         EHREuVLdHy/ag==
Date:   Fri, 15 Apr 2022 23:45:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lucas Tanure <tanure@linux.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: meson: Use 50% duty cycle for I2C clock
Message-ID: <YlnncKoQwr8iW9Ji@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lucas Tanure <tanure@linux.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220409164334.157664-1-tanure@linux.com>
 <20220409164334.157664-3-tanure@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="f8SdR9ouA5qGgT1k"
Content-Disposition: inline
In-Reply-To: <20220409164334.157664-3-tanure@linux.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--f8SdR9ouA5qGgT1k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 09, 2022 at 05:43:34PM +0100, Lucas Tanure wrote:
> The duty cycle of 33% is less than the required
> by the I2C specs for the LOW period of the SCL
> clock.
>=20
> Move the duty cyle to 50% for 100Khz or lower
> clocks, and (40% High SCL / 60% Low SCL) duty
> cycle for clocks above 100Khz.
>=20
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Applied to for-next, thanks!


--f8SdR9ouA5qGgT1k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ53AACgkQFA3kzBSg
KbYB8w//TfKL6kiAHSRUAnceU4+7jlUM7PgdROR9z3QJ0PWVi+1QMa1Hf8MoPJk9
UeU2k0S9tqR8Ax6NvO9mGaWcMv5sU9pw8q3tOuz2YEyQm4AEpS/duZAU36ZW7enx
cnoeYaRMZe5S5tmfrselpZGOfO6UbYWUyZdolfT6CV0rTu0ntRtwKPpsd0QtuzqL
cOO8qJiIThFlg6dApp7TfWSkzBwu2MjuvaafK3TsGOy5x5r8IrHGss40S4w+Ztm4
f/iOUSLBTn72UBK/qCInPAii3mzESaY2IF73WLjTm+WLP1uEVIBab5/3QRDn3GHL
k7dekQirjv2DQ/g8uDODRls/xQ1jNQtGhZR1hj9mb21EjWCl7HjOCJYgCu9eO8LO
/wQLBGRc2YYlk/msXKVjLHjkZ3dvpXd3xMQVT6z9YDT4EUjI+Ev7B5jYVCZAqoDs
voAtULPzZlE542xXnoz7RQestfpyteDuTpon+bFGALWkKd21jpx3SqalPbgMiLfK
yxi8P9FPU5noCd8vjzjcqla9sAQDDL/YbHoIArst/9hrc4bEBGlLfKuJfnmbsLwN
bUkK32ZiekTg1r1ob05AaLQkinDRNb+vtIzgUdKFDGzzVXzKgeX/Jlxf+wUI7mkh
+LKs98hoaOsAcUhYI6Xxbhl7vloO1edXZLkS9y1zOWqzfRZ64Xw=
=gtuO
-----END PGP SIGNATURE-----

--f8SdR9ouA5qGgT1k--
