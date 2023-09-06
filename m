Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B432A79446D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 22:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233540AbjIFUV4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 16:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244275AbjIFUVz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 16:21:55 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771E519B1
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 13:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=Yv67
        0y/ikUzAQzPKatK8iaFIZc865ohGwHixJsvpd38=; b=On/rRZ2+A7nwIYp9sZWE
        wflgBejnTlb7rip0HuhUtB8dOLWKcZR1iD2Q6ZDauKQXC4klQ0j1DJjThpqaF623
        CGZwqBZ9jD1au/A5vyVgpstnsALYIYUtCwCEq8JYQOJRFR3uYChy+gIT66IduwTU
        W7Uf6cIJ0cwXlu2H2dzD1nrCJbOjC8d4h6ozImlJh/NHVURDcD7UnaYJfkHK/HGk
        zT4fSYT73It7TfwaQPdgDzciNp1H/mVkQ8Qdn9Jzl3l5Vjaq7KkYv63+GGNWkaSS
        vghAQ2SO88NaswGh1uGhgDitrH+othx4vEMGhdC8mGKIW1VxMUy8jQlKfL1tijRO
        1w==
Received: (qmail 2934407 invoked from network); 6 Sep 2023 22:21:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 22:21:36 +0200
X-UD-Smtp-Session: l3s3148p1@gyt9fbYEmpEujnuj
Date:   Wed, 6 Sep 2023 22:21:35 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: rcar: introduce Gen4 devices
Message-ID: <ZPjfT3H42+5id0i+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
 <20230904135852.12146-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdUJnKeLJu4-CuDEFty8oW0p9M-D5mcuDv+fFxo-fHvvaQ@mail.gmail.com>
 <ZPhKxsj6VTmIlKUY@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4syRa1QPYYWNHiH5"
Content-Disposition: inline
In-Reply-To: <ZPhKxsj6VTmIlKUY@shikoro>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--4syRa1QPYYWNHiH5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I was reluctant to add the reset too often because my measurements back
> then showed that it costs around 5us every time. Annoying. Maybe I
> should take it easy and follow the documentation. But then I am still
> not sure if a large transfer with way more than two messages are OK
> without reset? I will ask the HW team.

Stupid me, we are following the documentation. Except that we treat the
reset property as optional while it should be mandatory for >= Gen3.


--4syRa1QPYYWNHiH5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmT430sACgkQFA3kzBSg
KbaiSg/8CmbA4HsS4DI2wE0sFgFrKf6x2ZptRRDXeoC4vxZxVoFbnW4WpbTA/c8X
vwab4lX8xfSdQsuGjcakT1GU9SL3lf9uPPWlMELMv5f3RC8gkt1iVjj5K9NptNTY
4JBWacfHJCKlaN1fEzHaeXe/xWeJYmBJZJ1NMjKNftxcLcpFfVUdDIrM/vMH5tcA
XhoNNmFXG056fyXO6Up6n/DLx3lq/seHVx5dhu1UjZhb7LiIdaIINKTG0ThoSQN1
o+R4ziNxKtTGiiFmmvWuMaPUfbILeQ6GQ0ERTSdIZLphJtq+Rtfz7aollGM4wofi
0B0zqJhePbZHo+gF2XfISkHzOfBMch7Y2xIJ0R3y6iMYPB3bm2KE+1XUi5ctIs5W
pwnsBbKP9FLpFj/yB3MhuMrqJTZ4esWcEsvZG7kRWgTnAcUXe7cg0kiy0uAsdbjD
3F/Im0l6QUKsPzjO+W94dqmwHlgwlxRSdMhCi+lWizn42atY6SOxtSwyu479nqDI
10M/pVfMix+ROjPRPSdW18dfimIQA0/f1maSmTGQa7JY5CX9ra/dLFX45nX5vDBy
7CbMotH5lpdww6DpAIoXHkNX53ej9LH7LI//hVc2azk16TZ/TMxLyhX0fmS3rhIZ
8ZSoyQNuZZRc+rJhE5ffQ2/sQsJ+/966+Ps4iIWaKodJnp5xXqs=
=evcE
-----END PGP SIGNATURE-----

--4syRa1QPYYWNHiH5--
