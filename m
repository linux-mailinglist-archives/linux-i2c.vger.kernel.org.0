Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA54E54BB04
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 22:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbiFNUAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 16:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231928AbiFNUAi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 16:00:38 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CAE4AE33
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 13:00:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6EBD5B8186A
        for <linux-i2c@vger.kernel.org>; Tue, 14 Jun 2022 20:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CC1C3411B;
        Tue, 14 Jun 2022 20:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655236835;
        bh=sVHi8hNAK5r3oHPlRjZPZNNAL5hp+vGy8qYRFa+2imk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kuh/KBCy73cMnunN2MUyXUfyrkI1Xt1WjlrO6tWWTHGnwYnTaqZJKtrCKBtCP9KqL
         9ZGc2G4tgqxAtrOpVWiKQkL8L4yc8dkLL0N0KhgjfJIBV6wcHOKo8pYgQGgA6ZY2Od
         qsY9B9AqW5N2Oig0LnATICVXoMXkw36MDabTAx7wq7zj9/DHUIkkD8myDqJgtAVqxk
         vZaT2BiH89OGqbarN9zVHQJJ84ZpG/i86UJgM1Ir/J67lKcoWliYQLCiFfxksewSRN
         cIE19lSkMGWNRazQXoB2vvZjl6VEneSJwnhOIbgEb0qDTDkDWFZV1HZYsM4MIOuxzO
         t+t1JIkLLfWig==
Date:   Tue, 14 Jun 2022 22:00:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: i2c: Make remove callback return void
Message-ID: <Yqjo397MDTXbwoM+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20220609091018.q52fhowlsdbdkct5@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+jN84sGF8wbjn9Wv"
Content-Disposition: inline
In-Reply-To: <20220609091018.q52fhowlsdbdkct5@pengutronix.de>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+jN84sGF8wbjn9Wv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi UWe,

> Assuming you agree to this quest, it would be great if you accepted the
> change (+ the then maybe still non-accepted driver changes) in the i2c
> tree exposing them early after 5.20-rc1 in next. Maybe it will be
> sensible to then create a signed tag for these changes to allow other
> affected maintainers to pull this change into their trees.

Yes, I can do this. Your proposal makes sense to me.

Thank you for your work!

   Wolfram


--+jN84sGF8wbjn9Wv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKo6N8ACgkQFA3kzBSg
KbZHdhAArLflDSNVuHqVO0sL9bIIqo1zwneqWY/zQDUg62SWk4PeQILzUnYXnM+m
/CoRyGeliRPtnKnttbzOSmSyg+6gMoZg5tQ4vW9VBkyqyIWvsTLxavrLfwFpgtsz
76v6aUM7kmeqv0YXgScAtMmtVtdLTJfIBQI0TH3vLQcHyzLaCNjKhf6cMBjquGJb
nrCbG2eZX2D748SaNkFKFyCo4QnQAEfPAyzHZ/SwzKTCFlhqUpY2Wwu94qBzaTWK
h8BjsleFWDoR36ksdjeqCAO1uDAH1TJp+G3aXjS2pOA1P3L21oNWw2ps4pi/SS1q
vS7V0kbDyAC3gwKhkoUT6Zh38JlmiwN9w8Fy7WYKGhJ2+E6NQVMyAs3uwHQL3JzT
ecg12GkenKG2lb8TfdyaE//nMbIV8Su3cnTSge86VMt79RnCvNHAe7aapcqbROr1
mmHZewtIqirVSjPEE7eBLDzPw+mHORDZiVAnzaDdWK9bi35AHyfzbyEu4otx0mKk
28go5EeweqfMzlFjk5srfuwT7Lq42CXPb6uajZUkaTv24KlQ2JWz/jSkVcM0enAa
WrDTpGULTB5JQ4Bven/oa+qfJY37P1GlEILttgcmnOFCmqwn8kgfkhftnc+uKd9x
CZLPtSnrehgsON/5icKKJB8/i5GMPRSx8nPW74m2Ly+eaJNyWCY=
=iodB
-----END PGP SIGNATURE-----

--+jN84sGF8wbjn9Wv--
