Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B3F614B0E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 13:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiKAMq4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 08:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiKAMqz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 08:46:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF486192A0;
        Tue,  1 Nov 2022 05:46:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 60D46B81CF5;
        Tue,  1 Nov 2022 12:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7EBC433D6;
        Tue,  1 Nov 2022 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667306812;
        bh=bMmRpdw3GwHmGn2s8NCRCzcJ7zkV7g3nTjcHKI0yTuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cyXpYlU34y/pFwyakvDsFcssQlW5rVc6Py0GMourXTa1GDRVYR0CuTBI+Jm5II82l
         RSggqii3O4Oqs6jqwMrSItpKAApku/2zgyrg/ptVuzzOIy4oqxNCImNVeI7FV33MO3
         qrBYBW1NmxBhGSrwLxswDx7MxNx32VeFQBsFfER6wL0FvuFvpk/7pR788OfysYmcd2
         fMUl1kRoxu5Wx/6d1usXRG7WNa7RNGsSatWoZc0Zu7CHYTO6cX8ln5L2Zpa/P9Fo4D
         dNakd2QQff87ROEuFVZDHBnbetGxJ8UiSWS4Q0QsTHnF1VHt4b3RE0CLe+gHvOo80m
         7Fsd9qXs0Isrg==
Date:   Tue, 1 Nov 2022 13:46:48 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Nam Cao <namcaov@gmail.com>
Cc:     jdelvare@suse.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: add lis3lv02d's I2C address for Vostro 5568
Message-ID: <Y2EVOEwR7HQaK473@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Nam Cao <namcaov@gmail.com>, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221006145440.10281-1-namcaov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="16jWhIqg7CBGDNl9"
Content-Disposition: inline
In-Reply-To: <20221006145440.10281-1-namcaov@gmail.com>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--16jWhIqg7CBGDNl9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2022 at 04:54:40PM +0200, Nam Cao wrote:
> Dell Vostro 5568 laptop has lis3lv02d, but its i2c address is not known
> to the kernel. Add this address.
>=20
> Output of "cat /sys/devices/platform/lis3lv02d/position" on Dell Vostro
> 5568 laptop:
>     - Horizontal: (-18,0,1044)
>     - Front elevated: (522,-18,1080)
>     - Left elevated: (-18,-360,1080)
>     - Upside down: (36,108,-1134)
>=20
> Signed-off-by: Nam Cao <namcaov@gmail.com>

Applied to for-current, thanks!


--16jWhIqg7CBGDNl9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhFTgACgkQFA3kzBSg
KbaKshAAmQtlA1G6uRQ1THv8yszK+qupQpYuwl6HUie61kDoFH6MOp6QyVmJvSmU
ZKZxbc4KGOaslt07OZixbQrE/X06cyfbJdYP2NHJpDetQnVYmXE131d9d6EHb3Kn
QW3EHPOznYOORi3fD+8PUWToBLfOTgm3m+oaOWHOQ7oAKlFqES/+mQUQ7XizNAWf
2GRST5abqqT0YukqOLtYudZ41LlY7pbvWm7Qs9mK/ZLlVNSBXfWKR+3LtG88Y5HW
0INVc9pfUXkqtkqrW6/a61cdWQU3jyjDU26Utvti1ztmPGIW7hYNcpKnDrZP64rG
32Cznd8TJNn1inUpnpTKxSOA6COWJm79Vb5KqHj3cY7ocGdHCbSUskSb+bDIa1mC
HPb6bXnUDlyjbfp87iN9yDWPJnD15LrjRzgmW6tskOuXKXOxAloYxeDed8c1iETd
Utrwjmm8dKcWyXlDsPbbRoQH83InReSOpzURjaoXwmI5K9uH6Uj2Jo8gx1VFb56V
qLi1+GDPkUgc3/8Yacj9DC7BAxJLjp/ZdsGiv0Bf2rjyuNNDv9C3oEZRd+b1BjB1
Hj9hs7roIo/VjHvH/0chtVn+WhFs6QK3U2yvU2OnozLJx8Df6FcZs1eZcsI0dSSF
T2E8kZNzEMDTITJvoaBl+MqF3beaZreD1xrW0aqeh7t/P3C8vdg=
=VLaY
-----END PGP SIGNATURE-----

--16jWhIqg7CBGDNl9--
