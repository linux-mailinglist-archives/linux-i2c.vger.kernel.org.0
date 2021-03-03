Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2ACB32C873
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 02:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbhCDAtc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Mar 2021 19:49:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356221AbhCCKrd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Mar 2021 05:47:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80E8364E66;
        Wed,  3 Mar 2021 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614767646;
        bh=vWDVz8UCSoRB11Joz2z1uFnWKF/SYql5zesbu2Mh24s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iOAGRzITI37KeU3j4Drdz3m+qTcXh2WNv7D722PY37n6kWrqJ7SqNrh8r72rjJCQX
         4QFJH6N01DpDZWkRC8kr4wlyjtKwhN40e1HtnP8T6SN5zuPSIrciKvb9LDB71XzNdj
         JVIVtnroeGw1yul51ifiYrXkWJcp9HuWm9ByqbeGTn+iCBOeTzlJtWm9zno6gmtzvM
         1kI1dE1ji7cBMkr3A/Wec43FrrhZwlT1sM4BGWF3JVxIf+/btZbIlHFSpibktmHSuu
         RuwblBEnNbr9YVbziMZ+b1Op7u3dxkCTZcJ6d/zdeer05PKnq1Y1w4eV77BWhD4ZYu
         +d1KFFdTwk8Ew==
Date:   Wed, 3 Mar 2021 11:34:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Nikolai Kostrigin <nickel@basealt.ru>
Cc:     linux-i2c@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>
Subject: Re: Need some help on "Input: elantech - add LEN2146 to SMBus
 blacklist for ThinkPad L13 Gen2"
Message-ID: <20210303103400.GA3689@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Nikolai Kostrigin <nickel@basealt.ru>, linux-i2c@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>
References: <0d1eaadd-5350-63a4-fe6d-f8f357c49504@basealt.ru>
 <CAO-hwJLmByHHULhJF60qOUAqprkqZpSvVh-GFXLZ_ndL0guvPQ@mail.gmail.com>
 <e1fd99ae-8e46-0b21-1011-db73cd75523b@basealt.ru>
 <20210225093801.GA1008@ninjato>
 <3ffc29f8-cdf1-15fe-6406-28872bba5716@basealt.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <3ffc29f8-cdf1-15fe-6406-28872bba5716@basealt.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Happily Jingle Wu has pointed me to a couple of=C2=A0 patches of his
> (co-authored by Dmitry Torokhov):

Yep, this looks like the proper place to fix things. Good it is already
solved.


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmA/ZhQACgkQFA3kzBSg
KbbCHw//X+iKQMH2lAIAvwVP4wXZNSsK1QsyUSbLcKgEPWaZ96Hcq1oFvkaJHWnA
mXWewlu0BA2sC+GNMpD/0EewZpqOPcjmaO7j7yFYIC2HhwfAYZu7DO7EpIeH5N9x
VXW8QaBWXejr78lLClwexAGGY1sPq1yud8m1wNZBtAWczFkeTAU1VJZ0biAsw7XC
5mgV9gAg7nzmfJT1IDRVb8nUpjO0GjWBPaAm1jVUjX+rDqTeAWS/5AHv/ekpIbve
Z0H0fHWnh//+WwLT+R3+TK9NXvIeRIiOEghNqvDOhSJ5bxAqIlSrSeEWBWhITlMq
i5BKFvv5TQ8ux85IynISlxqkXGokz+P+fK7ZnbXZwK0hBMDo28n2Fx34CNSy7D1H
NdhckCGFPzvRrffjim0OmLxf2+VWZhdOWqiBjCL90JV7ZrVvl9yUa6ssqOEWwyf3
JVXHP2fIpRrViIPiUCqP58ZRPdmGTGFICgE7fGFU1PY/0Ri7rp1BTCVJ/F6v8afT
4VZoDOYxs1a3L5gEXA5yB7mNLIgEMJc8wkf1eO8Okn+OejdUCBdrM72wC/AkYd09
f6EruUvsXDivaOY227orPWtUSEmggDDSzy/fgA/T7OfSIbr4V2bZ/flgI5G3RJlu
Qd4FISK/OFC/yuUFjLZvw7EaZmifRTeapFAXM5amFHOImuABoo4=
=sFlp
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
