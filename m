Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E06A0727943
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 09:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233697AbjFHHzo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 03:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbjFHHzn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 03:55:43 -0400
X-Greylist: delayed 341 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 08 Jun 2023 00:55:42 PDT
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79C9F128
        for <linux-i2c@vger.kernel.org>; Thu,  8 Jun 2023 00:55:42 -0700 (PDT)
Received: from localhost (120-123-142-46.pool.kielnet.net [46.142.123.120])
        by pokefinder.org (Postfix) with ESMTPSA id 761C7A40F02;
        Thu,  8 Jun 2023 09:50:00 +0200 (CEST)
Date:   Thu, 8 Jun 2023 09:49:59 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-i2c@vger.kernel.org, Till Harbaum <till@harbaum.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [linux-i2c] Patch notification: i2c-tiny-usb: patches updated
Message-ID: <ZIGIJ93Ze7oCY7oq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
        Till Harbaum <till@harbaum.org>, kernel-janitors@vger.kernel.org
References: <168614100370.23273.6741328315484253780@legolas.ozlabs.org>
 <b103210f-affc-51cd-0540-a63072abba23@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5BThGYoYYSmyNDOr"
Content-Disposition: inline
In-Reply-To: <b103210f-affc-51cd-0540-a63072abba23@web.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5BThGYoYYSmyNDOr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> May I know anything more about such a rejection according to my update suggestions (from 2018-02-01) here?

I think the current code is easier maintainable if some functionality
gets added to probe() in the future.


--5BThGYoYYSmyNDOr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSBiCcACgkQFA3kzBSg
KbaCLg/8CMl1Zdj0VQkVZR+bcgldWcCBx9XDw/I/ehajXBQNAOPLcTccTALyvLdB
/CT6p1y6qiHX5iUkqHe0mCXfha/KYoaSh5v+yGQxkSdt2aVtzg9qJihGd8jQjgQ9
5P/md8re1kon3W0JEIP8ASkaL3QoZVP9ZjfMEA3+idm4iReNorllX6kRWGDkU5mY
UEnUn6A2VKGtdyUr+j70MCQe1xMyzAuFtPxTSXQgRXQD+i7goZPlGrSM+G7POkDH
oJjqys3K9zCwmMVqNcSaEhRz4eNILsM9f2UitiZUz34Iq/BO6eVMQZxcN8wdSyq3
PaQvHOlhcAHzuHSUE4KJX/LVMOTIBGWZSOGhpudH1ByC/lGkPwcsEzAlIRboaQaz
IUkKwJnrGj9CD657Fn2M77pLBvcrWxaMnP3/Q5u6BFHweRlXi7t3gy3vqYWUjscT
sxQiAqLaJN7K1hk48/tTkipgLvhqp+ap/mH81+9A1ODv9fgrbiJYaWWbXhBkL8GS
SGSEql2WEmJJkuCtpfrDIfVsEUKfF6ErRK3S1ykmt/XBgfj0947vdIUQtJLB8gs7
ymyuoyMxqxKHgEFfLAXh0/kKVO2IzSM14MiphxhQc86Mea5Yuf+fdJMjRSIqaftK
zPvLz3e8yOX5NtMitCc9ybDjFN77/mKfIZiK9FSL/rtncm/MKLw=
=u8Sw
-----END PGP SIGNATURE-----

--5BThGYoYYSmyNDOr--
