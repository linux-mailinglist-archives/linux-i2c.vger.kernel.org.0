Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB19969B50B
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 22:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjBQVqp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 16:46:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjBQVqo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 16:46:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF3965696;
        Fri, 17 Feb 2023 13:46:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E9F3FB82B45;
        Fri, 17 Feb 2023 21:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290C0C433D2;
        Fri, 17 Feb 2023 21:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676670384;
        bh=RawpE5mpSU8yc2/xySzrtzYpZhoqwKb/hsTWXduMG7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rCI5bC8B2vVqPBRSHcw4jEhqiAl8MuRKSwjXVBMXAI59BYggIz/UBeEoGg9hwyXPm
         D948Zu1uubn6SCGCggpVTYDzy+MLOt1NtzXbO1sfLhS38bYOSQLVd9t86DB/mssjo8
         GqClz+wWN09ca8wJGxB6oiOIVZU7SrnHbkkREJf7Kp7+OCYXQ4o3Q/Eb4YTOkKHnm2
         MdpxeaHk9ECYbgMH4lcNcqnuIL/tkFC57pLO0ShIEBnnJEF7hQqagMUXtNlWtW5iNi
         D454qIFZJ6rpQDrnwPhvG889xlnJzM0yZnoOQR3wz5FHkBhGUlVS6h7Zw6mdBGPU5x
         BH2cVIvPr9lBA==
Date:   Fri, 17 Feb 2023 22:46:21 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: xiic: Remove some dead code
Message-ID: <Y+/1rR0wGc5E70O0@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
References: <9d36938de98dc491425a51a9c07367dd9e448e60.1676457464.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="T2k9SWCaMMVdEf0J"
Content-Disposition: inline
In-Reply-To: <9d36938de98dc491425a51a9c07367dd9e448e60.1676457464.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--T2k9SWCaMMVdEf0J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 15, 2023 at 11:38:07AM +0100, Christophe JAILLET wrote:
> wait_for_completion_timeout() never returns negative value.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-next, thanks!


--T2k9SWCaMMVdEf0J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPv9a0ACgkQFA3kzBSg
KbbTURAAtZEbY4eI2SEy24N++zA3qqGZIwvkgw4Ikkf1l10zUxrX6VhfdMGAcjGH
PjlW4RwXvcBhOOsc13ZQp7jf9dOuozh99jt8MUW0irG8XfdUyF1oZCWIF4+zslzX
NaH6Ft+4OHylNkzLj1V0GJ1kb6GOYpCmn4NWrwSc4c7c7aJQDIUM3f/M5bY2/f0x
icx+iqsyOz6FXVhWm8F8PeaM+Y9vn9JGAiZkK4reyFylxILt0/uXgxGMnHfXjVgh
G01oP2JoBAIPqLkJkNy5NKZkMR/PshVYHTxJ/pUB2Jam6nqao8c+wDbGPkqmyBwq
4aRC1olkGhj1n+t5qyaW/RjXqPS5HL7FCtScLIkP39kjP3iGSBC62ZTKQEFQVyZQ
Unj1AUuy+DNhvGDU1AHST/XM2reNrFkTvE4BsyRxrHYXdjFnf9nwXMh4tZOw8mS/
9jFysdo6NwPx6agfFMPwttykD7QFnJnfKIq3SxDe91k2hV4xIkLwhwW5UtR5nmW+
F9kICYnqkwmFodz755UzNIhiqHLhA1qMMZ6wjc24NP+OIEQX2FhKr7nQqvncnhVg
9ZKsdEP8fKUcQsa8GcjEcHLGhcbs6Kq43k9lx2W5KQcbNDW7T9gL46YayLAPt5cB
6COH4gYn+O11cAX6jGYx2MX+aeslMCWJgi+9EJhIs7iq2UPOsg4=
=oyIq
-----END PGP SIGNATURE-----

--T2k9SWCaMMVdEf0J--
