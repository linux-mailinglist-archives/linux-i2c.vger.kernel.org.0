Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 964595EFEF3
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 22:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiI2U7N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 16:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiI2U7M (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 16:59:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F746186994;
        Thu, 29 Sep 2022 13:59:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B57E2621A0;
        Thu, 29 Sep 2022 20:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C76DC433C1;
        Thu, 29 Sep 2022 20:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664485151;
        bh=soq0OTgA0FIpZWEKxp2teYlokoB9uKr06vqY3Z10nWo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lM7bNPrpWoGPd2Vmh3nf4TnaH4AMaxoWrz5sZdKoI0djXA5x0v0nOOJSDXlKDL76U
         Nc0KHcBtMPeX0L9OCdKaNfo3aHkTkJuFeETkGh+xfLB/gwn5Z8vTTk609BvkLLfNaf
         kXxiSC/OkuA49DwkUCsy+/eni7LLfq9ovugGrw4gbaCRE4cIjJA+nTcrK+rHg1bKJN
         F1ULB2bJPG0AqO7NO4rHhuT4Yc6snQ8rYALlKkffQA51PpwqBcS3ORI1Zhlv600Drz
         kWoiC0tJZZVoIsJrWKAEeVFB7cycA8pv5aH2N/9nbQaAGJCN+Jm7T0xxOA5isBf/W/
         RKx54N9nB4rSg==
Date:   Thu, 29 Sep 2022 22:59:03 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Mani Milani <mani@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] i2c: i801: Prefer async probe
Message-ID: <YzYHF5qPMEMZu6WB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>, Mani Milani <mani@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>
References: <20220826074430.1333272-1-mani@chromium.org>
 <20220929174334.44d3e6d9@endymion.delvare>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yXKve1oIjQxEgUHU"
Content-Disposition: inline
In-Reply-To: <20220929174334.44d3e6d9@endymion.delvare>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yXKve1oIjQxEgUHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Jarkko, Heiner, Wolfram, can you think of any reason why we should NOT
> apply this change?

Nope. Even if we overlooked something, we can still revert and figure
out what went wrong.


--yXKve1oIjQxEgUHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM2BxQACgkQFA3kzBSg
KbY4iRAAqjInleMYw5m7vaQ2psULANRofUZKLAxEqRBYFVWhP0d1emErS1YxbOAl
b4ZB1eB3wpszOTvu9OngbGNIkIgGTsadLkT8Zfcq1jLYNXNYiaYGGMB/z4p6+wQE
wJEE84SxBf4rNfTV7pf0mSu/jMAjWIpP43TF5jY1kC/h+2xJHcwxB/6BuHceHpP2
lH1GYdWo6uoWysk6yEt0Bt3FmJ7JwRQeaDQzTMbd499kzJQ0vUceGR1r1SkyUlzm
lMjC5errZoZZli+SI1HniqxwoylGaKBf55LqDLCAHmMHVo9D3twNtwxQfdAauf7k
TNkts0YQYZuAEISaPkpH5c0c6cIk1srr5TZoKDQU0swfXzSpsagU3r64ZPYw2Vpc
j2r6lp6aTD/aujzB/okcEZk74r1UikboE/OM1653Ll+AsH40jN+HTU/vScQsDw70
T3QfwY9W8sJleQw09QM8Dw0zhT7REIgd6vcczKpe+XWbBGbVum5cWcFI49BXmoNk
c1FJSAaJhfrW2agpfejLSngLisQ/REPRUlWEMYpQrMmOpTZBgZDHmkMvr5puZ6A2
NeJ04C1Hc5ABCKT7Wdw/h5RtI9NBTAp34fZYcWKDT8FoaUq6Yg9s/9lthmDkx25M
o+0A1MApnSywBdkjq6gLrkOYA5YcorFj5c3kzrFHjW5e07T3Blo=
=IGiT
-----END PGP SIGNATURE-----

--yXKve1oIjQxEgUHU--
