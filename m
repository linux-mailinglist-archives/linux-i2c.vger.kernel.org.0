Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D074D69AB
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 21:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiCKUwM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 15:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiCKUwL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 15:52:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEC21D981F;
        Fri, 11 Mar 2022 12:51:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D75AB61F99;
        Fri, 11 Mar 2022 20:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF049C340E9;
        Fri, 11 Mar 2022 20:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647031864;
        bh=zmuWKozrUfnxutVRlths6JXC2XxK1VKUeowuBiagvhA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S2WNf1lJT3t/VZEr+1IuLr89QbIyi9Kb/z9xp3TFGUnmgJm+rY1jfGd1ieRDDCAgF
         uGvXD5A2EmXwfZL3DBSbJeLRxMItDJIyDJUj9VR3Z19PxQZbaPyHjY1rlvJ2pdmDZj
         VIpeZ3IteKG0+hlzhM45S9OtgGBlttAFvSQWL921m2xA5PaJtxcmSajigOQXR4v0I4
         lVejpEFMUlaSBHstv5PR0MwVU6dZl3wHoq9iy7a7WSV23YTQGJcgMlO26h8rJ2qsvS
         4lVDxN0lOdfTOh+MQSNOP2umCm2X00YmclMp+g1UHRCYKsdRPSAzBtsyu/AjU1miu1
         F+K1GDCu3srrw==
Date:   Fri, 11 Mar 2022 21:51:00 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        upstream@semihalf.com
Subject: Re: [PATCH v2 -next] i2c: designware: Remove code duplication
Message-ID: <Yiu2NIvEOow87s+r@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, upstream@semihalf.com
References: <20220310220932.140973-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rdPYt9goBFHRhha0"
Content-Disposition: inline
In-Reply-To: <20220310220932.140973-1-jsd@semihalf.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rdPYt9goBFHRhha0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 11:09:32PM +0100, Jan Dabros wrote:
> Simplify code by moving common part to one function.
>=20
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Is it really based on for-next? I can't apply the patch. Am I missing
something?


--rdPYt9goBFHRhha0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrtjQACgkQFA3kzBSg
KbZrnxAAifHU+tNf8a+mdHxvRXSHdQEceI62pvHsfwFJEVQpHhty6sm8iUyHU593
Ju8iK2Oja1W4fd383sg5w1uvHv0eTrlzHPNgccDYJ/X6QfFc1z0N54gSILgYwyk+
rfQpbzj9ZBydmk+y7ObAhmbLVitD6rGnwko/7vZvPlWbQ3vFvYtHR4s7oTsMFJGL
EFYEtac9/hcjm0+iDJc8t7Yg1eclRVIUvwQh8PJlNTHNH9yFNqE6Asjeynl1d3lk
e1hMUJ9iMMVEbowxuu/w2RXRbeQovbfvUoc76ppyOCtcv1rJWAwKG/dfOMgbOSoa
uFe/+zJqAhWntOtun6x6D4FoDAFt2oMs9cUBHKwfKpIF1c+VmMbYZmcAioW1n0K7
sz4Vk9BnQv1pjYmNfnWGAF67BCgvCSGh+FkR2lOjXJJbE+4uZ6myw6ujdFOatCnO
XmiFj4X2R/V+wHA7nicqjw8ncsuE+c3EWj33IZBCQzxxpnvOH699u7NUBAvEZVdP
P2vUS8kWFFQWadrC5uE0hBrudXsPuVshreDwdwppqr0LtBKY2qYYtOZhhCLuLj2D
EJjI4btjZQreSdZmmecW3CyVsdf38dlV/PfEHaM8UtnonBBYyETDt6UdtTjH/TFx
GCD/ts4bAi1bzSw8DuevIC59Z1pQ8xPUrxc5sanrIuM+X2U3e3Q=
=W6+Q
-----END PGP SIGNATURE-----

--rdPYt9goBFHRhha0--
