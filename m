Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95191605217
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 23:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbiJSVh7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 17:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbiJSVh6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 17:37:58 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD3A1958E6
        for <linux-i2c@vger.kernel.org>; Wed, 19 Oct 2022 14:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=9dYSSSWUYKNvzYBVm8ifN/l5JnAV
        A/EUrrEOnFuDA2k=; b=dKbW57vfKrFSVoR2wZnQWmkSUp+3QAJ8nlYJk2kqpu1O
        2qVNVq9V5/AJYu7XfWFotfpmRUvNFgP7JBLcLcBYQumfMX4OL5Bs1KkGjdSUZJUo
        xZEjUnEGl29LSqJZlDSIO1bTQvMXsb/Yn2HJzMCMwxtCpOPUN2mEhvWJVOFlRvw=
Received: (qmail 821590 invoked from network); 19 Oct 2022 23:37:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Oct 2022 23:37:51 +0200
X-UD-Smtp-Session: l3s3148p1@j7BMBWrr6sYgAwDtxwGnANC4y/SuZCIq
Date:   Wed, 19 Oct 2022 23:37:51 +0200
From:   Wolfram Sang <wsa-dev@sang-engineering.com>
To:     Jason Gerecke <killertofu@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH v2] i2c: Use u8 type in i2c transfer calls
Message-ID: <Y1BuLyxEKLIAgF+5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa-dev@sang-engineering.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
References: <20220718153448.173652-1-jason.gerecke@wacom.com>
 <20220803145937.698603-1-jason.gerecke@wacom.com>
 <CAHp75Vd6yEctJoNT6TpJ1+h4ZQckyLsaUSeSCV4MHqg+LUDkcg@mail.gmail.com>
 <CANRwn3TutF6skHQHk08dFUa8gLMVGxui_QN7YK6nDacSpRHtLg@mail.gmail.com>
 <Y1BZ8CjSnrKi+Yos@shikoro>
 <CANRwn3SmrGX2-cqMK=dDTJR=OaxoVM9C+fsaa8jz96ADtH02DA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="z9tlMrGQdpWoo8J3"
Content-Disposition: inline
In-Reply-To: <CANRwn3SmrGX2-cqMK=dDTJR=OaxoVM9C+fsaa8jz96ADtH02DA@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--z9tlMrGQdpWoo8J3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I spent a little time trying to put together a Coccinelle script to
> take care of everything but I eventually realized the size of the task
> was larger than I was comfortable with. In particular, even though I
> might be able to put together a script, I worry I don't have a good
> way to test the resulting treewide changes to avoid regression.

The coccinelle scripts are one thing. I am quite familiar with it, so I
regard this as "work but doable". My main headache is that I am not sure
about the best way to upstream the result. I'd like to avoid a flag-day
where all drivers across all subsystems need to be converted, but I
don't really see a way around it. Preparing such a branch and make sure
it does not regress is quite some work on a moving target.


--z9tlMrGQdpWoo8J3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNQbisACgkQFA3kzBSg
KbbnHhAAkfWpRLGRDmdzv1HH4XrQUaAFabR25IsltjhcTRbwlGpM9QJDDkxdpvy+
GUODP8ft0wFdgTRsh6pOfWkK02DvwUAQYTQRCF/ZVJFebqhK8lYhWDLOcTDLQp/d
xCit/4z48BckEbxqBqUyLO8bfm2MbcoIS4WxG+DEZqjhzKcZdf6+qE7ZsgLYIMmK
lClROZhZusKNwTynTFRaXixMIcKkGzentVnJRHjaCjYIhUMc8uVEM01T8Q3JuHyR
7Xci7qsn/6R+zQoApv8LW4Fx1K3YdCcv3iHNRcKT2sYyMNqJOxqSAF5xGFRWIExR
zEHZ1QdeEWi5MjwamGufBmj54M9V0c0J4IdQTaB4zLNYG1bGo7TCxZ08vHDBQpsL
3UMmQYwDq6PWmu94duTJHGfUPgh5HGr+BjdQdJ9PSNuaAAAkyIUH1Oov4H8KHDzR
WS3611NFgWx8zzjF4uKLc3V8qV0Im9QiOpTtoOpwQqCRxIK+EPaeWcpl9LutPFQI
tSqxqeDZVtQLObUSg5RoAZQT/hDqvqverD4Kq0d6Dow102UJt8j9qJftccpzi1Ky
Rtbh+xpsdevjPBD0/ks2jW0KWT2ohNpz4Nc04TmnkrJ+xn7LRM84AlGSX7i/3Tuc
U/DBjmN3vNi8eoWlyKGYsS6RFUf3nDGaTbXIjf81SqM3Tq6Usaw=
=nOXa
-----END PGP SIGNATURE-----

--z9tlMrGQdpWoo8J3--
