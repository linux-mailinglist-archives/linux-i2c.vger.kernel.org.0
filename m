Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08B436D8FAB
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Apr 2023 08:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235569AbjDFGoj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Apr 2023 02:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235582AbjDFGoi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Apr 2023 02:44:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7178A6F;
        Wed,  5 Apr 2023 23:44:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 848B7642AE;
        Thu,  6 Apr 2023 06:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3087AC433D2;
        Thu,  6 Apr 2023 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680763476;
        bh=0fYnrtShh3heQ8SFySjlm0nJ6Lipo3HavFl1KhR+hJA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=myt4Xj0y5Imr5MEtMqFXHF58MHljlv55xpeadDYaByMhkZ82FbReuJXSnv14JSWiM
         WjiArBhe690m/LKUuZod0LIqj9KFiAHqR2Cs6g2tO/KBFDUIJoeQ2zQXEBGhVxT1Wn
         uszgeMuspEzppgmJhd76pj28jE3JkwzW8Dt+o0pfqcLY8CI2W/b56FlYIaiUcjOTzx
         9xhDuMgB3UIb48QHs+rkPKaw+GqvlzRsitnGMivrx2zudwmHgYV0g4rdLgUt3RVOZU
         AGcuDlHLKF83XYScu4sKyFhtK+BFK+J4qGlOthyG7xWH3mbdsQ/22ktImZvkN2S7EW
         ltNtMqUbPJDAg==
Date:   Thu, 6 Apr 2023 08:44:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andreas Kemnade <andreas@kemnade.info>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Vignesh R <vigneshr@ti.com>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Don't do pm_runtime_resume in .remove()
Message-ID: <ZC5qUU4JLI9Negyi@sai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Andreas Kemnade <andreas@kemnade.info>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Vignesh R <vigneshr@ti.com>, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
References: <20230402105518.2512541-1-u.kleine-koenig@pengutronix.de>
 <20230402225001.75a32147@aktux>
 <20230403054837.6lxyzznzntvw2drg@pengutronix.de>
 <20230403060404.GX7501@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s4UAyrFHRun+nI7G"
Content-Disposition: inline
In-Reply-To: <20230403060404.GX7501@atomide.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--s4UAyrFHRun+nI7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > So if there is some clk handling necessary before the register access,
> > I'm not aware where it's hidden. Is there some bus or omap specific code
> > that ensures clk handling?
>=20
> I think the missing part is that the runtime PM calls in the i2c driver
> cause the parent ti-sysc interconnect target module device to get enabled
> and clocked before accessing the i2c registers.

So, this patch is not needed?


--s4UAyrFHRun+nI7G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQualEACgkQFA3kzBSg
Kbb4FQ//RnIuFltm0q+rqaGbPpO3AKyGVt/jow/9th4ub4DL7df/XB1skXt961L5
ms1B5/pMsJqW4l9iiLvkGs6An1yt8YdBuGbg4X9KmqRsv0KN4+Qd3agIqdM6RtgJ
vT2G5zCDwnHJ641dpESR3VXC7rFNgdTR8a8oxJm4k3ONWSBX+l4k4m82Bfk9bZfP
urFTkupbwaAubHWOUss51QgeFfoaC4Q9n+vZqyo+8Wx9mesoVa7R9wA49N3BGhbf
xE5qR7w27+CLBbAd97VXsqPBjYqoPM2CMoB3d5ZhrMds7a+YVKe3jURMeNyn2vJ1
oMZJbxTyWSdHvybHth43slkzVNBCdv+lLZwxUDxcWVhcmXqwGgSWG5/lh3eCKLG9
F13vNRzYXwnMXydOmYAKXkt3kZcS/5VmfIWCeFNGN6x0r6w7eiuEVk23rY8+UfP7
X4vrTTLohCL6vVqWcbIeiWA/LQyBKvUGUClfDjKXaNHLk4s4UYGWA+LwFEoFi3Fr
1euJAGsvT59f8LIje9j/ZGrF09oL+rTCZdmt+ZwW8PieGyJN0NLc0t7z/KgslZoZ
uOEvuYH6iCVfYPN4rBeImfNEtnKYov3V8g4vY8qrVcQarWcGnQa6zImd34LbNSBn
t060JySBA7mJKxTV8qxG2M20xPzMfb6yQWVJodMq3G4BPTbdkqg=
=9qt8
-----END PGP SIGNATURE-----

--s4UAyrFHRun+nI7G--
