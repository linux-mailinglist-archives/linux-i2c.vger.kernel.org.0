Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50B17D9CA6
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 17:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345940AbjJ0PKc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 11:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345761AbjJ0PKb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 11:10:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0FA186;
        Fri, 27 Oct 2023 08:10:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C442BC433C8;
        Fri, 27 Oct 2023 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698419429;
        bh=3r7xLVB/33N6eW6JZ8mBeFHH+Vxfd0dBSng3u4hQHuw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M7Tox+EP+YZ40+qnL5aKwDE4TCG0TwU4deeG2ZWuk2gwZ6CrGZuRPysbypIFvBDjY
         2FZbPgmNw78st01FrxeaaBYK4tHDgLZWZLnpqITOOgMvJxvGU0KZfk7Jxdm8SPE5Sm
         AIZtC54bori4FJdhXTV25M64eYkpWENCnKHSngyBax1xM5OEvW67/bGDV4LJckiDbw
         KYvmkCshe+KHB4duxKeFxbuoXGFPszceJ22lcGLoUemjcdPdV4qYnAyPWHFxtA6nRh
         tJeQkoaLqsMZmNFMmjweWTWT7S57K9i5gGD2HyRH20cdHRI8RZ2Vfd4yqrJ6NlkJab
         +/nJKuDCY0MGg==
Date:   Fri, 27 Oct 2023 16:10:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        gregory.clement@bootlin.com, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] i2c: mv64xxx: add an optional bus-reset-gpios
 property
Message-ID: <ZTvS4TylOQQJ06He@finisterre.sirena.org.uk>
References: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
 <20231027033104.1348921-3-chris.packham@alliedtelesis.co.nz>
 <65911ec0-e073-435f-846a-c5501dd5d3a9@linaro.org>
 <9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q3PUvKqoLZyuYIzn"
Content-Disposition: inline
In-Reply-To: <9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.org>
X-Cookie: Save energy:  Drive a smaller shell.
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--q3PUvKqoLZyuYIzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 27, 2023 at 01:37:05PM +0200, Krzysztof Kozlowski wrote:

> The (2) above is not solveable easy in kernel and we already had nice
> talks about it just few days ago:
> 1. Apple case:
> https://social.treehouse.systems/@marcan/111268780311634160

Note that the Apple case is not a reset, it's a low power mode for the
device, though at the GPIO level the beheviour with tying together
multiple devices that need to coordinate their usage looks very similar.

--q3PUvKqoLZyuYIzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU70uEACgkQJNaLcl1U
h9B9Pwf/WBrIIzuUnzHdkc09HWdtnvPUwYs6X+fca/zq/zFhxQ9jWLTGnUFTQfrg
jGK2NMhCCyTu0X/QzNnXwYRiObbDBfM/cLsFOsGmhpwtvq9BeCRNxDjTtU2wHuMu
17cXEy2O/OaXFncg4LWiiaGTT79DXwpWvTbJ/1pGCvrrCLuxCU9X5s4hu18+YOGF
lriZr0BZMEpbds/cEsT4K/ftrKRbiytbc4mx+VSPWqV1kAsnURdCwJ/udPq+jT0K
s1J82Mf/xYQ7CxwpGtMvEnVJGwlScIdRAV2VqZur1+cAuY33cu2F2+2oHbFZewXG
grSXvz4i+lGwWPIE13ubkq4mXNXGGg==
=1Tes
-----END PGP SIGNATURE-----

--q3PUvKqoLZyuYIzn--
