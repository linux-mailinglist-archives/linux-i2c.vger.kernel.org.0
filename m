Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECD0B58FCAE
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Aug 2022 14:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235334AbiHKMqJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Aug 2022 08:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235258AbiHKMqI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Aug 2022 08:46:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F75822B24;
        Thu, 11 Aug 2022 05:46:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D0BB961470;
        Thu, 11 Aug 2022 12:46:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3826C433D6;
        Thu, 11 Aug 2022 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660221967;
        bh=oUxvUoWmJ5Hi80NX/IS6FqegDDBAjPE1IhXhcZtsIes=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZZ4zxQDFeUGSjQeAYFn/XHgQW27C3gifPJegxbIA5p4PHwLDf46n6dtKc6RX+/pTs
         AmNyAohrXVY2DNdAVjHHbNso9pEMUneyBcwacqUi7Ae5ZmDSDix5sUYgvBIJpc9tnz
         IcB4MNZHh/Ro4bvEP0ixEigZNCngdVpFNU2pZ45ctIpgS8NLpzNZEZXmADw5fiPYIT
         gCNIePq9lb8gqMnp402kDxBjfB7Jdo1L0byudCOtX/amroZL4dE0FiDG9yFsKSnOco
         tIjuelPPvxi+jXoPCjOeiYY53IPfCZEXNniqMB9zQZRptegj7dGBQFglVt7QOmIsca
         dAxGzqme0EK0A==
Date:   Thu, 11 Aug 2022 14:46:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Conor.Dooley@microchip.com
Cc:     Daire.McNamara@microchip.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, andreas.buerkler@enclustra.com,
        Lewis.Hanly@microchip.com
Subject: Re: [PATCH] i2c: microchip-core: fix erroneous late ack send
Message-ID: <YvT6C8GWPRnY1zel@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Conor.Dooley@microchip.com,
        Daire.McNamara@microchip.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, andreas.buerkler@enclustra.com,
        Lewis.Hanly@microchip.com
References: <20220805074346.4123650-1-conor.dooley@microchip.com>
 <YvT1/LOr4udX+jhP@shikoro>
 <a79262e2-a190-677f-034b-56757a085280@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0vvlBKKjha+vFQUB"
Content-Disposition: inline
In-Reply-To: <a79262e2-a190-677f-034b-56757a085280@microchip.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0vvlBKKjha+vFQUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Heh, that's what I get for editing the commit in send-email..

I know that feeling... :)


--0vvlBKKjha+vFQUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL0+gsACgkQFA3kzBSg
Kbadtg/+N8fCoB6JHzvUYZKJpWIBS2Se0CqSqUB26cfih5INVDcTed6Lxa0KRE7i
mvtESJNUu5qpc3fxjlzUihjV4lIiRdg48G5U2Yr99vqWFJLT14S+sRmmaD5zY/mb
9yJZ0ZtfKsOGLdVKFVsiUJmL8JzfzbfNwiyMlujuMdiZ/8DsbcmWvM4df6HU+ZBh
+ea+IAP16ZDHCGeG8jAA+uTL9qCOqlPMBKEjXDMXMzwPC1V53xXXDl9H1MCBnNtk
lavfOaY0dCwKRUDBH7K9Jnxo9rtTAyHIqCEB9qHszUR3SgStB9i0Ys3FCD9NnqqQ
BO8VGRJdIKrrLrtG78iU9f40AFIEehEMEflIRb46/+jocbQLl58Y9pCgvySQ0Wqs
TYBNmOq1yANAvesoaKr1CseEtay86SESAE5/15Gyd/9yR9X6JKJWbOanfyQ/47UH
Rz4dgPCoEpm9liSPieX2KnPUETvqMfunCDEUHOu83nSjnp5wMkd4g37WsVlPKNtQ
3O9XhnC4zGluQMU8kqBrj2Yu6IMp+S5Ud2lSpZ7mMYCMyWp3MRDCCVW7O/SL+XhV
UlEdgXOqi6lmm26UUtgi1Vc0KWitrkorMarnz0btj6fuBz6J7UqDkqsDntw+cH57
18O8e9gi4LmW1vNmPny6U9tMeE2zw/TJm095WhfLMRaW2ufM2g0=
=l+qR
-----END PGP SIGNATURE-----

--0vvlBKKjha+vFQUB--
