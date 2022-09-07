Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCD25B0D82
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 21:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiIGTxc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 15:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiIGTxa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 15:53:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF02A223B;
        Wed,  7 Sep 2022 12:53:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DCB4DB81E82;
        Wed,  7 Sep 2022 19:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED88EC433D6;
        Wed,  7 Sep 2022 19:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662580406;
        bh=uJDGsijOfLFRzMAftrgEfAwsjhjht2GzpAmXnTWJ/dM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WbcHwS3qDsm0f124PorbTqSiDXola/BsZK/P8369UZ7h2JdHZtGtWgRki7RbZl+Wb
         jUcL+uO8c6YxPFYSiTtfwPJnj71+pqsHJToL0vC9OAFjPoS2+jfmIY4PLK5xvD4Cvv
         NEnJxUHLiVGunUMdrSiiALRFy3kN8iO4gMu7x26QWkYGBPVrshU+1Z6ISmVFi08e4U
         7kCZK5pYPoGfzfUswuUwfA9AOi0YVSP4n99Pqqi6wJzkba8jMWS6NITokhztteKspc
         MP5w4UW0Vtcq0Vzc518Uje2xl5SP3JDp6XAqbDE5/WWoju1ASvVelQiCez+fM/T4oh
         jI2X7K8O+c8Tw==
Date:   Wed, 7 Sep 2022 21:53:22 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sudarshan Ravula <sudarshan.ravula@intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        pandith.n@intel.com, lakshmi.sowjanya.d@intel.com
Subject: Re: [PATCH v1] i2c: designware: Add support to get I2C related
 timing parameters from firmware.
Message-ID: <Yxj2sokHOo40wUOR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sudarshan Ravula <sudarshan.ravula@intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        pandith.n@intel.com, lakshmi.sowjanya.d@intel.com
References: <20220907160920.22006-1-sudarshan.ravula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wbtFfviCAIt2jkAf"
Content-Disposition: inline
In-Reply-To: <20220907160920.22006-1-sudarshan.ravula@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wbtFfviCAIt2jkAf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 09:39:20PM +0530, Sudarshan Ravula wrote:
> Similar to I2C designware platform driver add i2c_parse_fw_timings() in
> PCI driver, to get I2C related timing parameters from firmware.
>=20
> Signed-off-by: Sudarshan Ravula <sudarshan.ravula@intel.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--wbtFfviCAIt2jkAf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMY9rIACgkQFA3kzBSg
KbZw8Q/+LVnohFY4CEL7hca2NVfA/cE6rgN3mImsnUDONZBj02E2R46uxzUwIhhE
1+pewITtVuBp8l6v+ecTWUabeE3cZfJxHc+kpAC71pIrnLc/4xy9oPfgjccrfyM4
c3bvS2nOUQeK7GYN/GJQEs4UMM8nA5hmbKiFucLpfWceqg6PuRt0WFRhOuqkIXy2
qnM4REhtTMsjPsOTYftwZxsCEiZYmM2npyIpJwYjThryS/A4boi/h7SV1c5OUp72
89XkHkNbI0+ZCPLDZQPnM0DVq+dizsl7ML5t3phvy5e7VkZ4PiIfAkMrqw3bN0jK
Z+xjnz6R/hLphXmHjLXoRr/gl2vgEBQlpTeBZUFNLe27wqaCzqyZaa+OzuZOQ1VS
l1YWlsCMCX+JRWWKndBiZTZ9tKtBIxlAp7UIVz2QyGgN+gnd+4Rmw6ZhHSRu8COO
rbtECDI5EVq3APB577rnWz6gaOGZR9KRUppNOikxhXkaUet0TeK8yi70EBfDCu46
zgFza4vQZ6bdHmYhLQ+Lg/gnzD6RvuQARejjZcs/sbkjYE/QwDhvpDQ25+2kyc3s
tUaTnLpl9MhtHfBVeQjy1a3XD8SNX1htxM4LnR4emf/St+ouKrm4oAq7LKWQGpiE
+YDQ8bYq3Fs+M621EU+UlufrGvH6XKeCfF5i+srqcm/y+UzX7vo=
=k9DQ
-----END PGP SIGNATURE-----

--wbtFfviCAIt2jkAf--
