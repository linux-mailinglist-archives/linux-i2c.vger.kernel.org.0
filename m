Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0006474A47D
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 21:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbjGFTme (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 15:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjGFTmd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 15:42:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2541BD3;
        Thu,  6 Jul 2023 12:42:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A0F9C611A6;
        Thu,  6 Jul 2023 19:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC47C433C8;
        Thu,  6 Jul 2023 19:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688672552;
        bh=kTNcRSMLVzNezR1y48TuYe1rJv8pSc9f622LTFLC8+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bRdxckO0DmbHI6xHUU0+mUP1IxGkp1iOcX/zU1V/q4AL0uuVgmtNFSmctRy6OWRyU
         kW7kg8Df8OQ4zYglK+MoSbgD9Prxgj+Ybe90lo7UzU6Nn2LLeDfhry9Q0zgfozqPg6
         9Rxg+JVL+q0buTe3Nv456sF372odPKkLoS7AMf+4SNqxI9h8vRBhwGGl2KeS/gm5ux
         8A6zFs2NAJM4B0JwYLprSCqZWrNoiFyKdcHfOD39m5Vl+DFx+sRabKo0+jtqnZNMT3
         1+axZZepKGJ6U5DJoCejGRg5nDM2+yyfG/5zdw2m8PqHOEPiiVVfnvLqYYrTr9KOaw
         e6zhGEa1w4C5A==
Date:   Thu, 6 Jul 2023 21:42:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] i2c: mpc: Drop unused variable
Message-ID: <ZKcZJKHx0w7Pfuak@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20230704150031.385001-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GvGKIRbQqqykVX7m"
Content-Disposition: inline
In-Reply-To: <20230704150031.385001-1-linux@roeck-us.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GvGKIRbQqqykVX7m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 04, 2023 at 08:00:31AM -0700, Guenter Roeck wrote:
> Fix the following build error.
>=20
> Error log:
> drivers/i2c/busses/i2c-mpc.c: In function 'mpc_i2c_setup_512x':
> drivers/i2c/busses/i2c-mpc.c:310:20: error: unused variable 'pval'
>=20
> Fixes: 9d178e00583e ("i2c: mpc: Use of_property_read_reg() to parse "reg"=
")
> Cc: Rob Herring <robh@kernel.org>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Let's apply this fast before this patch comes in multiple times...

Applied to for-current, thanks!


--GvGKIRbQqqykVX7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSnGSQACgkQFA3kzBSg
KbbsEA/+Im6UztWInAKeyXr44CJ1xRiPAQSS483KylVqelFw9PIGhFSygojQY/ok
h2GpRKZusOd1eIaNCsqWd7UfaUsIfcqHSgU7UYi1xp3Q17AtVvO3knrdabhVK7z/
rcakl26NmOdgx1I1/t9+x/1jWl6ZBu/NfrLvshVBUvqAcNqPonw876lVsESxYh11
YGzpytL15HKDuR1lIKp3Btz4b/YoyFa/Z2zJqaE5tOlFtyINnA/QfsXo6tBpfRoB
3tMfZC3GlGYLKKN8xSKyIdvODDCFAhTPZmzvEqStYdzSxQPCSf3ZHFRiRPRbuoQS
vlQASglz0bVJ0dlFFRLW2YTfdK9DPHwAx0injTNZSV5RsvFJNdBc+VqIYz3LVUZl
Qi8dG/x+ImGmyDGRgbNzFc1qOrk31kuAAwuKgZ4pBWUNknHIGyAScwTiMVhM032d
tVa8Srn87wjv93xzvf5MkFE9/KZcLW/WRWmAFjqOej7SorxpTNOQc5keN83OmHkc
E1Ch4eiXFOI+uBhtNFr9eJmWwucfAIjQ+VZmnagE+UXNOUDmZ7t/O6/Pa9P56BCN
evTDI6ogBOunSzsS9X7Il+RjmkyeXPrqm28bDAQB/VAGnJiddrd5CAa5MY966seu
zUZv822inn3Scek+kgBaVIcQvwi/UHRvH8IZwRCa3PCoQVUA2mk=
=8UsO
-----END PGP SIGNATURE-----

--GvGKIRbQqqykVX7m--
