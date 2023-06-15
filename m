Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45915730CE4
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 03:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233018AbjFOBvm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 21:51:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbjFOBvl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 21:51:41 -0400
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D981DF
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jun 2023 18:51:40 -0700 (PDT)
Received: by smtp.bonedaddy.net (Postfix, from userid 10001)
        id B5CD030738D; Wed, 14 Jun 2023 21:47:29 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1686793649;
        bh=Ktx3MrA1IekIkert3j7d0rZRIYPIEG33HW+eoxbTDH0=;
        h=Subject:From:To:Cc:In-Reply-To:References:Date;
        b=lcsiXUxoeh8N9gX01Hv0nCzG1gvsYVzQxn8XcLCZp+FfGADudw1ERx+26qEhsB3f/
         78VORCiS1lllLtoL1/KMUwvMi+DNvLVtHlUh6nOlh6uVoC2xaFBIAsQSOq3NcDQdPK
         u0VQx2DUTmFtoKZQEXNFxwlKhvWatWYVjEBP10Fpbcsz/vZigfC8yJQQJdvzO51dHs
         IZG5FvTseETlLMWOy2E4BFeNEoGVoM/JjmHQI6LpQN4Uh3XVRg4uH0Nks+WBC9I2ww
         a9FB48LkBIdu73ygHssrDXfOxekjKJx9t8JU88i04ZcVKHVCAPd/bjNnAuqUbnjQfX
         LYf3nDZ6PyOew==
Message-ID: <738c0e105090e76d16303af479e2577af91192e6.camel@bonedaddy.net>
Subject: Re: [PATCH i2c-tools v2] i2cdetect: add messages for errors during
 bus listing
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
In-Reply-To: <ZIoxmbo9Cu+bPHsF@shikoro>
References: <20230526002445.57064-1-pabs3@bonedaddy.net>
         <ZIoxmbo9Cu+bPHsF@shikoro>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-Ur52jb23nGOnxQxf4AYD"
Date:   Thu, 15 Jun 2023 09:51:15 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.48.2-1 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--=-Ur52jb23nGOnxQxf4AYD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-06-14 at 23:31 +0200, Wolfram Sang wrote:

> Hmm, I wonder if a simple "Is it mounted?" isn't enough?

It depends on the sophistication and mental state you want to require
from i2cdetect users. Some i2cdetect users might not know or currently
remember the exact commands needed to fix their issues. Personally, I
haven't memorised how to mount these directories, so I would need to go
look up the documentation. Others might go ask mailing lists, search
engines or AI assistants if they are online. So as I said on the Debian
ARM list, since the issues all have very simple solutions, I added the
commands to fix them instead of pointers to documentation about each
error, or expecting users to know about them. Given that the RPi has
lead to a large influx of users with potentially little Linux
experience doing GPIO stuff, this patch could reduce support requests.

https://lists.debian.org/msgid-search/8e2bfcf0375433acec188bbbf11fa9117076f=
e6b.camel@debian.org

Please don't merge this just yet though; thinking about this more
and reading the Debian thread a bit more, I think I want to send
a v3 patch that also tells users that pass the wrong i2c bus number
to run `i2cdetect -l` to find the right bus.

https://lists.debian.org/msgid-search/e496b7d9-e047-43df-9fe3-f65bdc37bf93@=
app.fastmail.com
https://lists.debian.org/msgid-search/E1poJwd-0002Go-RM@enotuniq.net


> If there are no devices_present here, then we fail without printing
> something? Is this intended?

There wouldn't be a failure, just exit without printing any busses and
without printing any error messages. Perhaps it should a print no
busses found error message in that case instead?

> Yes, for rare cases this could mean that loading "i2c-dev" does not
> solve the problem, but using i2ctools without i2c-dev is going to fail
> at some point anyhow, so IMHO we can complain about this early?

Sure, but that wouldn't necessarily be very user-friendly.

If there are no i2c busses present in the other i2c directories (which
IIRC are always present), then there are no i2c busses on the system
and so loading i2c-dev will not make i2cdetect print any busses, so
loading i2c-dev is pointless, so we don't ask the user to do that,
because it would be frustrating to be asked to do something that will
then not mean any change in the situation, aka zero devices output.

--=20
bye,
pabs

https://bonedaddy.net/pabs3/

--=-Ur52jb23nGOnxQxf4AYD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYQsotVz8/kXqG1Y7MRa6Xp/6aaMFAmSKbo8ACgkQMRa6Xp/6
aaOmEA/9E0bE2bD4LOcfV4f/klmyKfirQdLMRt8SaBkfLvrtHHhRho3WgAskzh2b
c/ZuQv0O/SE4/pT1030DMuElcmLRMrFILD8KjwHjxSaQWCJZ3qhHvHhBZc7N3bV9
8ihHByaNaR6a6TcLwRZm9+s4rpSxbLLgiV8jBJw7GuWRqQkmD0fHyjpnWqg+99IW
2vudjfR1wtmROC/ft2KWVH3TmB0e3AWMO6n/0RHbKFiIfsuw/hT98G4HmOmGby3L
sYuLc0wPOJeK8Mw13/oMT9DJgr1w7IxInoLefHh4gY+4BjwEWsEggMgqLGXC9/aB
uOxVSfKsOC3zhYS1p7RNWzqsNkzBnnqu94Kz0RfQ8XGym5NFoiqDRqK3psZ4dJzD
GcmVz4/Fy8loZyyZA+oyh6091+HG5gAbs/X/+xPIts0CLb8bMBVoRFO/wfm3Wv3s
wY5BHyCP+eqpadIju9h8semPWc09BNnc8Y5U0Dr2TB+sw+VSuJ5M9NysTWqJufH5
ah69EbdzLyxQv4dZCWH1IhltumobNUqaCsAXEkSqi61a4rKvaicrrUMPF2lFuUkt
y8+geIaRr10xl9YCAZf4yU8u/KTjHie1A2/3bMK/QyZg/V7UBP6zo4kqUZSd4GsW
g+2b/nsKkq/YtyeOjHWn1nw07lPfOZX9fbAwxoVLI6zp9fsS+ns=
=Rczx
-----END PGP SIGNATURE-----

--=-Ur52jb23nGOnxQxf4AYD--
