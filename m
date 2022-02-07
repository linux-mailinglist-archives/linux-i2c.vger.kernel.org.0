Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F344ACA64
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 21:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241539AbiBGU04 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 15:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241525AbiBGUXv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 15:23:51 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B79C0401DA;
        Mon,  7 Feb 2022 12:23:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 78102B816F8;
        Mon,  7 Feb 2022 20:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68F06C004E1;
        Mon,  7 Feb 2022 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644265428;
        bh=usqaXiifcEu+JIY0FJvPPoSf4O8s+5EkUbpQUKh5KyU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mqQKGW8oImfRrgLRIJs936msARKuW7MF6OO4wl5/4jfGk14W8csXorOwibKtXBS4p
         ivQ3yCdOEV2Ed1I4uqW97PAyTfKxPQO+3OBYs7KPntk3Dl8cL9cU9XWG+MquvabU2v
         mI2DYXDw+zbzRCkNVxN6E9Pqw8EHdCDX8MAemYQI24K3yjSJcKYs7YMsDjk6DCBpc7
         Y0efuOcSVJRXAkAsgk1eZKFBNEDqpU2d5wiie3J+q2w80KP4MpJY905Ouf+WF0oDKV
         ENblOEROW7KC5dpUDMOOgZVuq7NgKGZDy1T75sGyAsQ7NMML1S3ZFrjR6zWPscGxeh
         YYuThUp1DnThQ==
Date:   Mon, 7 Feb 2022 21:23:45 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hugh Dickins <hughd@google.com>
Cc:     Derek Basehore <dbasehore@chromium.org>,
        Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: 5.17-rc regression: X1 Carbon touchpad not resumed
Message-ID: <YgF/0QGFN4SppLKg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hugh Dickins <hughd@google.com>,
        Derek Basehore <dbasehore@chromium.org>,
        Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SVWOx/Z2IM0sSr6X"
Content-Disposition: inline
In-Reply-To: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SVWOx/Z2IM0sSr6X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Hugh,

> Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
> ("i2c: enable async suspend/resume on i2c client devices")
> and reverting that fixes it for me.

Thank you for the report plus bisection and sorry for the regression!

I will wait a few days if people come up with a fix. If not, I will
revert the offending commit. Are you willing to test patches in case
there will be some?

All the best,

   Wolfram


--SVWOx/Z2IM0sSr6X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBf80ACgkQFA3kzBSg
KbYP/w//bKPTb4uzystTG/NLAI6vfcl66Q1s10ZKVC8aEK7LS+bSSMLTiUmSf638
vYP5hs+neOiDdeBFdhYvcm1tMlud6quQKsYugbtNLQxY1J+bBJnqMLLWZ8zn/EHf
0G4jLNW3u3v2C88A7E6dEywMsx+8CDtdtqcDWXKljIMbV3yNLPF1c8qhHsbh8diO
xIv6RY8KSnR37uG+3hv7TQEXLM15hc8KT7l7sMtgQb1+oMRnpsalbPmJFTyx4cy8
zanBvoSgg3PlYx4C8/cGzc2YSaMZKPNs5PIdC2nodlL0gm6JVDIx37KuEzqVs6gA
9r1BQzdcjPkoW87Pi7HLnTD6h/XcWb8MAK6gnu9hO1UxjCTFMFxMnYQ6wpyni5rk
bXr/MhALZfMh+T+yUFe3p3zrRZEp7ek9uKiPFXFdjg/gNaxen5BgYsXBMlUjU0rh
U6UZce3AP9Oct+lDa9OrwoG7l58pTZRb7PCBjpS3B07u5YngzXybf4/vdbak4se4
DFWMCBKaWgngJPEcu6z7ar2BOhwAFWFNuNUPDWulW3KsEVf6GUh9rDAyHaLAWnwN
2RqsAkMs1IsFJWXwxM4EiJSEiPB+nKKXW4BPRjCQ6NS0Yn8duiGOphlgQPK8oC36
+53oDlSCYXEWEp2W0zhZJOv8l9hmDabbwJopfSaxq2nmLOyGYJ0=
=a8CQ
-----END PGP SIGNATURE-----

--SVWOx/Z2IM0sSr6X--
