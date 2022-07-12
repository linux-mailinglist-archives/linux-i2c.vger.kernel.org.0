Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACD0571B3E
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 15:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiGLN3x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jul 2022 09:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231852AbiGLN3v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jul 2022 09:29:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF80AA75F;
        Tue, 12 Jul 2022 06:29:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 892F86177E;
        Tue, 12 Jul 2022 13:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B57CC3411C;
        Tue, 12 Jul 2022 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657632589;
        bh=OteWyXRmEDrtCukLkgYjbqtZlLf11Y3mWdBSSl/so9k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DGvm3Ool1qxrx0dzCNGSFxJGec2YRKpv0Ve0b4l2DnSTKQgT+ZY+X82rlDKMe7R1b
         3XaT/B0M9sQcUQ6Yzq+VvB8O88VjVhXpQEZeum1B4z+0bcB0SJYuTloA6HHulMLGL7
         KZPqLPRGbaO4qKSVahkG2pZIFHvC2863hJERd+/DuqNlKGIpXz3NXIaJHBA5vYL0OR
         ZkAFaAIQR/WhS5DNfm8ZZLbH71TGG8B+uoXcGt3nk9aSwpV+PID14TEaLUCbC6Jkzu
         8SG4Ewa4Ox4lb0f2ZXuytv6xQGS2/J0Viht6pW30swpCoZtjaOh5qhfpgTa9cl8ce9
         btJ96Lr29sjww==
Date:   Tue, 12 Jul 2022 15:29:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv6 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Message-ID: <Ys13SB17LKU0y/tU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220620230109.986298-1-dinguyen@kernel.org>
 <YrI6EeVkkWVMNPFY@shikoro>
 <928b2996-b2e7-d847-0e20-7e19df3cbf03@kernel.org>
 <YrN2lxvlP4cWfelY@kunai>
 <c765455f-c1b9-2da0-675e-591f7c268d99@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ffCZFUTnErNAuRc0"
Content-Disposition: inline
In-Reply-To: <c765455f-c1b9-2da0-675e-591f7c268d99@kernel.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ffCZFUTnErNAuRc0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dinh,

> This is recovery of the master and not the slave.  We have a customer that

This is a different issue then. bus_recovery_info is only for stuck
clients, as I mentioned before. Resetting the controller can be done
anytime inside the driver by calling some reset routine. You don't need
an I2C core framework for that.

But when to do this reset, and how this relates to real bus recovery,
that you need to deal with the designware maintainers. I don't know the
HW at all.

All the best,

   Wolfram


--ffCZFUTnErNAuRc0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmLNd0QACgkQFA3kzBSg
KbZ3vhAAlY7TUZYPDqjBIuPN5DGi1+ND4S8/owutDwF0LD9/1T+VBbXygTzM4UPg
aA7suygd1ZCp6/pv7hGpT6qVga+bS6yW7d8G/ESj0/ex4Bp80t+kVnUx452WM7wW
K9hBZ1RK3/AnMKnsDoAL3+EJgEQUNtcLLiNiHkjU5wN13jJ1TE2W+E1nEAey3rh3
Kn4elufiwT8vJ9/bll6GXrs2yPPzRMAV9nj87ktMpB5mgV14IyvZi8mF8y4nBoem
ynZ2nlHj+TflsdmLOXxinpN/vNOqp5KJE1bVSx7YlT1vggePkhaZXTZ9P1Wefa07
+N0+ttiTJ86nVFUcePMqMsADRVNBI2CoVhhNeVdUvc/tcrFFz7UDgMpG5zx/GzWn
9uI3bQtbsGZo4hcvI+NSDxFVkfx7mjutMNGTuvGAOgSDdG+6XySHQ6kSk5aJQ7PT
KmLD5fLifxa0c2wLMdn37cBRcZCXazHrvJ5y6L2wRp2vwwyCfDVOcjBHVqLUltI0
gFN0loGxVyT0BF3MY318i44Ir37NoL/SQnkThqWXRZ5yGLrJtJGbgD0GH85lyLzo
6wiuzYfEeC7gLlfQtGbAxjRb7GTNhMDLzM5mCAD0vlqmI7YIPZffJRYlTJH57+gQ
RAKub4mMnEbnE8Dy/4ICoMFUhT+PpRvB2f0gLF/8w/aib4LV7SY=
=GOXF
-----END PGP SIGNATURE-----

--ffCZFUTnErNAuRc0--
