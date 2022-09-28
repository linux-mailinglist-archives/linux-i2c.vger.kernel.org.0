Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F615EE4E3
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Sep 2022 21:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbiI1TQa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Sep 2022 15:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbiI1TQ3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Sep 2022 15:16:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12943D4DF3
        for <linux-i2c@vger.kernel.org>; Wed, 28 Sep 2022 12:16:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CF376B821D3
        for <linux-i2c@vger.kernel.org>; Wed, 28 Sep 2022 19:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5573C433D6;
        Wed, 28 Sep 2022 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664392586;
        bh=is99oyr81D57vTuTcFPFKQnBEYBIAteghrnsMIIucOI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rQW+5WJxdkjpW7aYtOA4o64OuBOAnAEVxeLVd3rHb4OCQe6DvoPjyjwC/tj4G6qIh
         sRAIcBcKwWaTPx6OR6a/3T8ooenisBAnJvMWqSaG1PpHCkqUMIjIgQzbvRMm45+wrB
         JVChlUBPKNVLE74c50dy6e5CEUUcdOagdZbEfTaBQ44jAuljRZ4z9WDAPTeo1OG/RY
         SGPT4q5FWMsksArfekDQjJ/CguHZNSuV1Q8nrPw7UztAKJ7U8M2fq4Jf36hBT4Y1ta
         72tmXVqyd3ZRm2WX3J//Wqzr/806TDz7g96jzRoZpAwDF4K0dT6t/jcr3HwMwmYfOZ
         m1LtIscCjwfhw==
Date:   Wed, 28 Sep 2022 21:16:20 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sanford Rockowitz <rockowitz@minsoft.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: i2c-dev mismatch with proprietary nvidia driver
Message-ID: <YzSdhCrwjPwMr4DI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sanford Rockowitz <rockowitz@minsoft.com>,
        linux-i2c@vger.kernel.org
References: <6330FC96.5030908@minsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tprFTxN6i959L7Aa"
Content-Disposition: inline
In-Reply-To: <6330FC96.5030908@minsoft.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tprFTxN6i959L7Aa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> At approximately line 41 of nvidia driver file nv-i2c.c, in function
> nv_i2c_algo_master_transfer(), there's an if-test for symbol I2C_M_DMA_SAFE.
> If the symbol is not defined, a call to the function with the bit set fails
> with error -EINVAL. The file includes "linux/i2c.h", so apparently there are
> versions of I2c.h in which the flag is undefined.

I2C_M_DMA_SAFE is a hint for controller drivers that the buffer is DMA
capable. It is not something the controller driver needs to support
actively. Bailing out on this flag is wrong. Do I need to mention that
such misconceptions are the super-downside of out-of-tree drivers? (I
know that you are only a user of this driver, so not your fault)

Happy hacking,

   Wolfram


--tprFTxN6i959L7Aa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM0nYAACgkQFA3kzBSg
Kba5wA/+IER/h4+cw2xHrp5VrD8cbU51+0XzXK5xVxDq0yqb/zk3vtUkIxdMzMWx
vIObW8Lbslrcslz7gVpHTqk6s+4N1L4M/q0P9km8fnA/ERcyChBk/uBWKeAitr++
avV6iuuNdG6/fQViPdB80s02WcFgvtK+bTs+mLAf87rGwYr2oHYEVy9N6sL5CfZT
vO2RWsEBQ6DhLP9czsGYMvBgmmlAhHZME4gdM0vffd/bLki/aLHqUEh69aMgzk6C
6xII6++TYAUxXwrRyR7Y3AP2eX9cjx4EN7YAnH1aeTPR2qhqq3jUeHucHsZBi6Bj
AblB8vaJV3Umo8Xdjv0qRU8wIg+Fvt0181/f5MlhPGUHzb1Gli2YTdUn8nqkNI44
xdB4U0U8P2VH333QT6IUO0J4XohFTgEK8H/MqGvJhg4U6oC01QL7/8XY5Z/orbZm
hNU9EgAwrRXD39MF7UE7WQ43y9/jKuitbZ5bb7phf7ANpp5JVqlDoaP1Fkix0Y2j
Qv8YX9ciNwBQaEMHdUqOW824ulF/4DuwJMbs/Rb2tCN1CAVA2rerV0TwKKxz6U1F
ZvwGtK4OsjVDmT2m+uwHkJhqTndiQs8j+7dmJK7E4567svjA7R7V7BNcQRR5+MKP
0JynWB2SDedyCVgmk6kI64kLQTehE0EEMBMKKPGLK2kqcKbbVu0=
=48Oo
-----END PGP SIGNATURE-----

--tprFTxN6i959L7Aa--
