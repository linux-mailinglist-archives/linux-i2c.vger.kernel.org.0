Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D224941AB
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 21:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbiASUWe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 15:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240188AbiASUWd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 15:22:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D29AC061574
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jan 2022 12:22:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2CE4AB81BAF
        for <linux-i2c@vger.kernel.org>; Wed, 19 Jan 2022 20:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF59C004E1;
        Wed, 19 Jan 2022 20:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642623751;
        bh=yk6jGz/MaR2XpHmb9jYToNeFyFpMB0XmsMAWxgJ/T2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oUXhRt7aRtVyqLFfbXfANOThaHY0ExXdwuI7JoyPpLTWzp6NZ3wldc7n/p/SNQ8Ka
         9sGiRC4DiEprLlnvSOVetmbOThtmELtv+hN2d8UVmXTJFBuO9hg3x6laJ4Q2PEqN07
         J8vtC5tITA0spfFcd+3zMy9ZFA7Hr7ynM1i/lXV3jjFjlDN7IXJ74iahcL12xoX6ti
         PSh/72q8Yyavpv/GL7z2RzBNeZCyYYpyhEWZu97oh26u2PW+Oi87fS/ln18M4xjh6J
         R3d+B1TIxkTyToj6gwaHj5ALhdVoQTURmYKjlF42/f5w3FhC8BgNq+uhh5IGg3ZsLG
         OFHBZiU/yLPPA==
Date:   Wed, 19 Jan 2022 21:22:27 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alex Henrie <alexh@vpitech.com>
Cc:     Hector Martin <marcan@marcan.st>, Jean Delvare <jdelvare@suse.de>,
        linux-i2c@vger.kernel.org, alexhenrie24@gmail.com
Subject: Re: [External] Re: [PATCH] i2c: i801: Add module parameter to
 inhibit BIOS access
Message-ID: <YehzA//f73Sgq7i4@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alex Henrie <alexh@vpitech.com>, Hector Martin <marcan@marcan.st>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
        alexhenrie24@gmail.com
References: <20220111233151.8484-1-alexh@vpitech.com>
 <20220118134705.6ae5b0a4@endymion>
 <20220119094900.7792c05f94329f584dad934a@vpitech.com>
 <dc6c3b38-dbc1-3d86-fd87-607a2d6a6685@marcan.st>
 <20220119110156.574ae2d96af6b8a722c8c9ba@vpitech.com>
 <YehbtKp6QFoQ3NRt@kunai>
 <20220119122450.b9d7ef9b7178f1f2b4d76497@vpitech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PYWmbA1tVyhkEvn9"
Content-Disposition: inline
In-Reply-To: <20220119122450.b9d7ef9b7178f1f2b4d76497@vpitech.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--PYWmbA1tVyhkEvn9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I wasn't subscribed to the mailing list when that patch was sent, and
> without my own copy of the patch email I don't have an easy way to
> reply with the correct In-Reply-To header. Is a reply with a correct
> Subject header enough for the automated tools?

I see. I'll bounce the message to you.


--PYWmbA1tVyhkEvn9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHocv8ACgkQFA3kzBSg
KbauPg//RJQhv5xVcs7xXPwuG419oNuzyM2q5czxqMohabBQlXB5KHNICC7OZCGt
3fLUHSpkL7PeBM/CeDg7CcI6+haEz8pCxtJ6DyI4sfzHp1nGmuDAQdCl+zi6Vejv
YWA5iiveAA65wejQQtFB6JFaDAxpgx/VvCmC799le1lnXhnGWAozj10nlx3t3b+5
1fzGHFDahIOid0nbrOEY8AIEYWLPDoJBeayA08SuYeePVxR/7BhKWZISz0Zteh+D
JsU2B1v9dQnSmDNoQl9iap0fyWVPhNlsfueI0on7NdpV0udvItPCzFMW9sDElR4k
llY8MgVQhr3ZcYfEbOesEDcDDq5GWj2kd9qaVNxhQJHq6h3EWy83taRWJIBbB1Da
hUM3irgUMTdUVPukIgKLY1cDWwQF/v3hDbpey1Pl5j1RH0qeIq+Om/44uGkcKou3
xnAP+boi4OeLi5gjHSP6e4v/r1PBLmBlR8J8ErT7P0cdhMqhru+SpECKMgWZV8Mj
3Cwzc5a0510XNSoCkjCMm4z1b0XY9fx+d+ZsMJeU/jvttds+2kJpoVR8vtMghTDG
3cZQTic96ixvoxtidv10I8zyuqhoUdYePbMvtKf5cdex5h4O8cWHS/WJk/MVil3B
ifN7ejJCbqKZX1allRACJ0VaKwwnpJ5eCjj1A8YNAUJRq9+qnsI=
=K5ph
-----END PGP SIGNATURE-----

--PYWmbA1tVyhkEvn9--
