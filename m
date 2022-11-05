Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6306D61DE9D
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbiKEV3q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiKEV3p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:29:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A269FF6;
        Sat,  5 Nov 2022 14:29:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8D2EFB808CA;
        Sat,  5 Nov 2022 21:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D3EC433C1;
        Sat,  5 Nov 2022 21:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667683782;
        bh=J1hfoJGSNQOKc8XT5RvXdhWeLYuaIyqPSyoUZco0sLU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E4yqdx2w2JR6SuR7Hcd4DuUj5kZ04uKWZiOq/CGOTkNVyC7ZsxORzQ7fZIZSw4TTp
         XCN5mEa2SnCHkqxGHO0SJ6mdrgS4IHl72hikNbA1B1ENTB2edGTV5ozd8kjclT9QAL
         j3/wBOgRTc1rmR+esSBxapNZQHRIpFbTdkRxDtuHzeTeulzryWSe8OTw/VEP9FMyUQ
         Kjh9qGoa0RFYDvkf6fMleXWGGIx8ez3h/s3186FD0Xk4HVH2CcYabofdvFdMbs4zlK
         JHwjAymM1KJFcOI2wZ4yEgOGlPPDrqWj2370KWc99jCjeqMFcAZzwH2426G09CsS9C
         vvUihGpxnPr0g==
Date:   Sat, 5 Nov 2022 22:29:29 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-iio@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] i2c: core: Introduce i2c_client_get_device_id
 helper
Message-ID: <Y2bVuYMVew8/h9HE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Angel Iglesias <ang.iglesiasg@gmail.com>, linux-iio@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1667151588.git.ang.iglesiasg@gmail.com>
 <Y2E0BWyvHjPko2TB@smile.fi.intel.com>
 <20221105145658.45b0e9da@jic23-huawei>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GbTEe8/An/6w9DAp"
Content-Disposition: inline
In-Reply-To: <20221105145658.45b0e9da@jic23-huawei>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GbTEe8/An/6w9DAp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I can do an immutable branch with just the new function call in it if
> that is useful given I assume this is applicable across a bunch of subsystems?

I'd think I should provide the immutable branch with the new I2C API
call. Feels a bit more logical. Will that work for you as well?


--GbTEe8/An/6w9DAp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNm1bUACgkQFA3kzBSg
KbZaAQ//WBgJbkMLdsM9t9QQJkZ0WHjkEGByBDkyUlNNtR5L4oqJVFV2RMhRaBVm
lPMliU4Fva3qwFgipgD+guKdfkDZfqKqdf/P5GWXMjroBbrfnE3IKnXnq59d8+l+
ZBquSlguuzWKE02dxNK5s9qGJMd9xub6gbyhaI4nNTfelBwNDtkQZGSfA+kdLRT4
6Xk3nh3qBWruHSzppuIw8E9j0zjS4Xd1hwF0gcl/7WOUYMcdvoaNj4y5E//mUNFj
HEtEP+pWrSE2UKDmweJ3FL2xpsokObQ+4INEF/lars5zSQw3j+ytYf6MOWB8/cyU
JqCQQvZ3L2uK5M9JH9XWpuw/KO12bIcBeL711eyJOm69ZkbvYg192l8Zr0EdzZQe
7ozX3Vtm+XhsPTZ8FhI9KFEWJ8P/AOlLGHOV2ZOYu30rHOsNEykyeBOhoVf9JZ0t
ZRV4bE4fyWN6VSoVqixhvm9egx2wD0UagqaO6LJup3yR0apVBAnsQhTjhs6/z+7I
kNf2k9Isw0zE835P3Kh9kJYGzSRZ5JRUK3BC33BFAORx87enLsh4AC8TeMLgYc40
9XKYVZYdfSrlDwjfPRHMyjQpBEqaoXxNh7uH9ZmFK4IWzIq1vIA8rGOglPcDIIL+
s7tLVkl7iJGnMbR9MfBXzCCU+kAB1rMgJrKLxxf26JG3Sk35iCU=
=Q8Ii
-----END PGP SIGNATURE-----

--GbTEe8/An/6w9DAp--
