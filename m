Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E996750A3
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 10:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjATJUv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 04:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjATJUu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 04:20:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C738B420E;
        Fri, 20 Jan 2023 01:20:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4ED2161E71;
        Fri, 20 Jan 2023 09:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603D4C433D2;
        Fri, 20 Jan 2023 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674206446;
        bh=1v/OutS1+ZLLYxLQy361r/IIRHUUsdrfGl3Sl8MfW+M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IXH32jb3Xcl43KTKzyPP3yZ2Lu6UFDcWTtSbtfGvQgQKYXQ79alxHXX+ILoQGx2it
         2s2WbyiCnsUP2jfuDLagPRiNkXhFXoACc3jx6m0wWpn9lFZ7B1EQyRqJKHZ8RFUM7M
         jQNtfjBTWooqSeC4kneibn93EVSwRR2Ts5MWKjm1DAPFLhFPvXjBB3dCxPaUUMZ88O
         EVZEFAMN5myQ1zUnnvUsvaAWeNJ4OfYz/D4G8Ix6qdvqjzP0joM1Rhkhs1nFWKw8J6
         CvdYBcZDXsTJNUbJw6hhR1NfD0vlrEYojYFHeFasAWbfgDq10RoXvtg9ltZfeHRvnX
         Lskcjl76VKpWg==
Date:   Fri, 20 Jan 2023 10:20:44 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: axxia: use 'struct' for kernel-doc notation
Message-ID: <Y8pc7K2IWIlMYl6S@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20230113063756.14071-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/5AkXSUbgroXsUIk"
Content-Disposition: inline
In-Reply-To: <20230113063756.14071-1-rdunlap@infradead.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/5AkXSUbgroXsUIk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 10:37:56PM -0800, Randy Dunlap wrote:
> Add "struct" to prevent this kernel-doc warning:
>=20
> drivers/i2c/busses/i2c-axxia.c:135: warning: cannot understand function p=
rototype: 'struct axxia_i2c_dev '
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: linux-i2c@vger.kernel.org

Applied to for-current, thanks!

@Krzysztof: I hope you don't mind, I want to send out for-current soon.


--/5AkXSUbgroXsUIk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKXOsACgkQFA3kzBSg
Kbb7KhAAowKWmQzkvA1C8j1jjzAhrMghxpUWbFec8L1kgwSfGSLaFVUEhCJqBQmB
r0EzJyXfM3DLF2PcX8anRN2E9QvZOOXeoP9dUBjiGopUvnKeLKu9B19OMCdBCnXP
FaqxB/qvfwP94ptjHDPDMpbO4+JZKY5l61HWP2o9SfUIuc+MdgwbNrNeE2weU/c/
VKJgU9dP+ZZqARUpJVKB10w8vUL4A6eqFly4BVnm7mgsr3Xk0HgGvMGE2zuBbOOT
LGI9tkHJGKPmCQRaG031jnjut45VX0TH+nvB4fD1OWEx41+sGJtm7XDoobflAwPw
fYJanUErSEWSxnHnOPBttwy1Bfo+MNnTWuFQ9S0tJLisNCk73J87LErcAuZn/LGx
Fa3+TiDIOEYJ9BgW1FXeslAWAA/ZzUsg+frhdYzoQ2kzxh6xyFK5x7amaW28UHS+
EwWU+X+zgNdYI0EJB4IIDt5XYM5333cWExSa/8lzEP/Omdo9ncnYSqV6mPMpvpCZ
aytQUP19UG/S5mvjIC7hhQ377smR+anY31IAfcDXI2V2N4EjGNXLKOmKgZq4JekJ
6krAPfoMTxIY3UIemu1KYbTC1R9r3CJ4x6JAfm5SfxI7MkJG64fPMeT87oSocB+5
ri3KMBY89VRYK2w350619HQCtnfGfildRQHJ1eVE0KWffTXCjh0=
=A/Be
-----END PGP SIGNATURE-----

--/5AkXSUbgroXsUIk--
