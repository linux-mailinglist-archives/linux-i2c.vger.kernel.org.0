Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26F967526B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 11:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjATK2G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 05:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjATK2E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 05:28:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7298B93CA;
        Fri, 20 Jan 2023 02:27:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C4EE8B821CF;
        Fri, 20 Jan 2023 10:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFD0C433EF;
        Fri, 20 Jan 2023 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674210450;
        bh=g9fHvGuKc9Aiv0vKYSqchcTH68QrPJkZUTrlFpYc4Yw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UpNhzkGfjhfx3M4uiOQHCbIirQfnH4CjTD87fBBLO+qMGQyF9qxI6wSXaNZFNYFiO
         QXoxUL/b956E/5mUBj2a4DtOwoOjMlREfkSnGKnb5DrlgWVWtWhanDUYnwUkHL9lmr
         lJkM5u4mVxPglTtsgvva/SKDVZdo08ATFGzbvR//WG71XRUAn0TnrQQ5z8Ai2X7K1M
         kHR+EY2Daf/wlzuHwjEkkBrXh8dOZQa4Gy54fq4qKTf4MKpcdhPEkgpxJaC03EfizN
         BTElY09be62Q6TZMUu17hKrvVFXXzYzYhpkpIUNHLgvPX5SNcfRiU7TUCAMgrM7d5v
         q0P43X698T8bw==
Date:   Fri, 20 Jan 2023 11:27:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 0/3] i2c: gpio: support write-only sda
Message-ID: <Y8psjzVeuZ+hOwMo@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mYzw8xEELUo2S/kl"
Content-Disposition: inline
In-Reply-To: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mYzw8xEELUo2S/kl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

On Wed, Jan 18, 2023 at 10:49:48PM +0100, Heiner Kallweit wrote:
> There are slave devices that understand I2C but have read-only SDA and
> SCL. Examples are FD650 7-segment LED controller and its derivatives.
> Typical board designs don't even have a pull-up for both pins.
> Therefore add properties for not using open-drain. For write-only SCL
> we have a property already, add one for write-only SDA.

The code looks good to me. I am just waiting for an ack on the bindings.
Thanks a lot for keeping at it!

All the best,

   Wolfram


--mYzw8xEELUo2S/kl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKbIwACgkQFA3kzBSg
KbYghg/+Ju0UdyGOZ+6jj5+DcIvbVgiBO/59M+mMfD9P7w/Dv+QBILxPV3qrxaXt
rlqm+wjYEppOt4AlZAmpPemQxgbtiDN+gTIJs1mYsIu/yHb5gMRUNGPSZWAp7KZE
mVFxwup0CRQVJkLbHpF/F1zFUJ6Kf0LRjfp5m6APAEup/HUk3fNWuyRWOjG7vXXc
Qk5W7UDIi7H5pi3/2UEPfaonSgtpfQNgFP0HnBNgM4CJdDZiGbGZILNrTjKTsyjO
wiav9DA4nT2k6FyvjCxjvZoko+KXLEgbKvxARF9wQUtKsGQf9KWz0ddJ3EYF8LLA
UULpRFjlBVIvEw51nquFT+xVxOrH3c7YyQGJijKVgByRE49C5w3V8sUZrKISU67j
ebj2CFK8U6T3Fqb9ZQU49OS6gNnrD4EuW9ZM/lqtgTpeaNEErlR8OsAReVQYQ7/Q
77s7DqS6sfsrajt+pKelifSMN/JVZGZAHduZYTEJoJDjGi0sQE75/SCi7vCZOeM5
+7GV4m8VvWn+nbzM6PQ1n3d9A8tcSngBta5vboju0pwhPyS4uYG3CLMRRo5ZMe5b
/o7t5xNYwLreshlWduTp2oJnM4Y57Uw47/NvbEuoj4DtVlTl+D2+ykUzJbXVqqmn
mjSdL08xezgD0yb3ZiNvBNymSnnK4YMx0RaGyISYii4uSitlcbw=
=J/XE
-----END PGP SIGNATURE-----

--mYzw8xEELUo2S/kl--
