Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 798B26E2289
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 13:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjDNLrz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 07:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjDNLry (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 07:47:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF2810D8;
        Fri, 14 Apr 2023 04:47:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4436764713;
        Fri, 14 Apr 2023 11:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D04C433EF;
        Fri, 14 Apr 2023 11:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681472872;
        bh=WewYkRh8ATgRc8boxhNdVYtv+nsqcF33L+MMWN/pbZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lRu4QNum9u78WCLAEbMheYyyBsAEesCGloSyIl/dacyViGAtHPYQG/Ov4u72oOCav
         vpt8ZLmFA1IbnVikMbwQguFKD7mKn1nYRdFhw7LNTlC2OdNb1WazqZrAqbCm4/mx7+
         erjqOTFdmd/Qicex24AaztgV5gKUbsMvWOWb5nbNpiPHNJz81Y4ZIJIqcbV6EjgWxG
         gbk09V2SZnKBCkfUHWOQDGVmdlNvn69uTqvXEHag2WUpmYHQqGzAfOujxHow/Yemvx
         7UZ7IH2eTZ9kLsC6YNr2Q1txn2vvPVfd2bHpj99Rb5k52CFP5iPpmAv2JFSmLvVysP
         5b/JoYhogAY/A==
Date:   Fri, 14 Apr 2023 12:47:47 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/3] i2c: muxes: pca954x: Add regulator support
Message-ID: <84a81f6a-4a35-4b30-8a5a-6cb0eba37594@sirena.org.uk>
References: <20230414110137.401356-1-patrick.rudolph@9elements.com>
 <20230414110137.401356-4-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+vhEaLIsnQcCAIN/"
Content-Disposition: inline
In-Reply-To: <20230414110137.401356-4-patrick.rudolph@9elements.com>
X-Cookie: One Bell System - it works.
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+vhEaLIsnQcCAIN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 14, 2023 at 01:01:36PM +0200, Patrick Rudolph wrote:

> +	data->supply = devm_regulator_get_optional(dev, "vdd");
> +	if (IS_ERR(data->supply)) {
> +		ret = PTR_ERR(data->supply);

Unless the device can work without power it should be using a normal
regulator_get().

--+vhEaLIsnQcCAIN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ5PWMACgkQJNaLcl1U
h9AFRgf/bmWQW8fCL0FVMkcl3BLCa5mW9fAVRjqWcNzIZltT3JtbzaEBNfb+pdjv
f5aTnuVnwiGeSeBMTMt/FD1vVzXjKHgQ9+VgaLt+0NIT5KTtT0EFoWqOtmhzaN/7
/yao7Axxw8JDkLIDu4MfQz0KYHmaw7o1xRrxgZfNHrajBWIJtxrX39BK1mpAbW6o
fe+NHN5gBg+DiDzX6o73GV/bKpaPeqD+JkGvjSgNyWTnUEPtpm/m6Ez3TUR05bUa
BNnPW5+UyoqiuBopsuEwbob3PgJgS/cqjL6FbFHcujEWk1rewAqw6jR6ROBdE3Jx
3Nb+B3KSZO0NI7C54sYE2oq5DA8R+w==
=1xMK
-----END PGP SIGNATURE-----

--+vhEaLIsnQcCAIN/--
