Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43EAB7A77E3
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 11:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbjITJrS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 05:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbjITJrS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 05:47:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B611A9E
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 02:47:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5007C433C7;
        Wed, 20 Sep 2023 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695203232;
        bh=Y7zVGRvnJfZUQ2Uf85ZsjauRQh1TVUVOj2TptDFi2dI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EG3bjg0iuV45fS6KRfoBoU9V7YAd0KXEBnl0rDyzOs+t0om26ekZMEAu7dlMCaupa
         hiQaDX5LMpcpgAGZyimEZZbN5U/FqyssVDH0zfddwawlT7dSW2U9ESR0l8964UBBJ5
         a8e/3CL169qxDnFcDBUn/bOrtBGsYhdUPUoKExcWgftzV/zpADZYanJkoHD3N6/XSb
         qW86wE5UXMPmlEtn7vWdHBjf/fnKkFW6JxaiD+dutZxW1k4NNt9DlMIP1YEuVHRXDp
         0UQbtSpEo+0l1kaxPPFV26k/jJ2WNycf9Ssw9xYX9iM9hiNDPevrqdELExIzwQA//t
         2TV2I+Toiv8aw==
Date:   Wed, 20 Sep 2023 11:47:08 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 2/2] i2c: Drop legacy callback .probe_new()
Message-ID: <ZQq/nEkK7fEd7HQo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>
References: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
 <20230905194253.256054-3-u.kleine-koenig@pengutronix.de>
 <ZQF34dwupVtsIr3K@shikoro>
 <20230920065409.xexu5ab6omvl7afx@pengutronix.de>
 <ZQq1h0F/5dSCvH2i@shikoro>
 <20230920094341.fhiljy2ew4n6mepj@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W27zVmfjGeZeRZ5J"
Content-Disposition: inline
In-Reply-To: <20230920094341.fhiljy2ew4n6mepj@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--W27zVmfjGeZeRZ5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> added that get it wrong. I just expected that this change doesn't
> qualify to be applied after -rc1 and I'd have to wait for the next merge
> window.

When something is cleaned up with rc1, then removing deprecated
interfaces for rc2 always worked for me. As you said, it prevents people
=66rom using the old interface again.


--W27zVmfjGeZeRZ5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUKv5gACgkQFA3kzBSg
KbYiERAAhZyyLBdlCqGeDKEPhnoWJ54BcDEhWjjfT490Wg09Ibe8XyGdE+hbCzO0
MbauKloai5IqCZykrKxqoV8D2iIkACNbhDoJh9u90QHcktRb1++5nsf7axfUzT52
P99oBmqzATO2grfFkCaU+FEf/dFwcGcT1NZTc7KFgcm70V4a4wrr8hdRl2H8kMds
32byE9UXtdj8GfJxm4PZkwXVI3DOm0DLI7Dskk7MMPRqlf8vJPKIMh3z9vRpQ0X1
mBy7Zw6usCdHvUAg+LLqAIhmdtthlsaquXEMkguoomiGHYzTsO8Jzh2Co2vhJ/+a
b21M5A/OyZoa6j11srtn5VYaWFkDZJ44+4g8yQ+iGAIvSNV6weGOjGzXqJH9ayo2
vkaAXCT8dACzvwRF9H3bwFBScFSSlWbliAdWunsBMaUP2FQGY+akBRpGfVcs5syd
J7f58Zh+nsIjUfLJ6OApRtVSzq4I0JMMybHlVPw43ccwIGrNjNfJdGc5+ly2sSHr
Nf5gDdLoB1q0S2T0CzyEaO31+k5gPyu2bDYgUEYgu6B1srwnBXORcWnIr3XxFujf
UzttqM8cVbwcalRGlIS315txwdH76xHabOGEoqiN74okxmZA0vRZ3KJr8YRG8mfa
B8AyoCYf0tEN1xsFcCdpta0xUjhEOLimJlbaOxUbSKcGboVawic=
=uZFA
-----END PGP SIGNATURE-----

--W27zVmfjGeZeRZ5J--
