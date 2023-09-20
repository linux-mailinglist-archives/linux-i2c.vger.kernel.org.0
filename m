Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A0F7A76D0
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 11:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233921AbjITJEb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 05:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233979AbjITJER (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 05:04:17 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DE4AF
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 02:04:11 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CE0C433C8;
        Wed, 20 Sep 2023 09:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695200650;
        bh=LR/977GivY88RNyNxnkZoITUlTC4ei52pdNaBpx56mU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T2oxtcci/a31wnFEojIC1PnFC9TFT3hGOh5RNgww/aeBFNfv32dvovxVGY8JoxTY4
         eNIuqvur4RdLLiNG7HtyH6kuQCq4z6hkDQMVnwIgHGcKX0I5Wn/91lCZ7qIoZuoZRq
         FddBeGfEad5gM3sqK8YzJu8hea4pjXqN6ixMAAYZkoYJBT8eeh1EUZd8HmmMR60lJV
         5MFL1iH69HY6MeY2kBeXr6QAL6GnKqVDzApqLc8vDEVKgOrYuTiYX7mQrYmJhIfzYn
         4lZQ8SUO2yi99pYwIBRtdtKTjRfLrMERMgYe9AVVBA9j4qLtSXjzeYq6cUNlD97dkM
         vjqtWrH4skR3Q==
Date:   Wed, 20 Sep 2023 11:04:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 2/2] i2c: Drop legacy callback .probe_new()
Message-ID: <ZQq1h0F/5dSCvH2i@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>
References: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
 <20230905194253.256054-3-u.kleine-koenig@pengutronix.de>
 <ZQF34dwupVtsIr3K@shikoro>
 <20230920065409.xexu5ab6omvl7afx@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KxG4EVpq7wrHmu8A"
Content-Disposition: inline
In-Reply-To: <20230920065409.xexu5ab6omvl7afx@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--KxG4EVpq7wrHmu8A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> you even took it via a faster path than I expected (i.e. it went in for
> 6.6-rc2 instead of 6.7-rc1).

Was that bad? Was there a reason to wait?


--KxG4EVpq7wrHmu8A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUKtYMACgkQFA3kzBSg
KbYtZg//UyuMYJS0LWKdpj/tqsql4HmdGUSjz9vUpKc1DRcFkFLjxkWkmolhWIdJ
RFzWp76k+MpzlPsKvkoVNrZ0Jhtx6+1Ha2uC+i/ho1rTI6aCA+7tS/BP+wiTMh+7
DKhw1WQufIb/U/EACRI5ZHfyQFEbmANzAUROx8MCudhSttlFTkKFO0MLbPgl0vXy
7lM7SXCRhag6GsYJQZjABD5p1MuuQTvxjnQ/eI7/R0NPwBCAbsZubt0I/hN4HKFo
but5nBPjCZ1XGZkhVXDZOiIP7t+BtOR4YLhWjVVHlTzt+KLbpm32w9Kp09j0hasS
9lQMnXVrO6dPpBm+ZSIqZeN3l6PKK9nT26J2mfjOjTYZ849pjJZAb7jcqeqUPT+z
1Z1KAIgue1Pxbj2YUebxUxLuXKAVn44UuZTGua3DK+YFSC1F4egW/Ck40MAgc/cE
A6tNwpfcFZH+moGSmSxZdahkYfvPG0YSTVFc7Uxbai2OeFXFW/rC+6cBLbfbASH5
RKVwnynQOGdO/Q3GF/QZ2pwQ11Yc8yT9d2Dvgnojn8qdRux4XOldsIGJGk4TCMFv
wo9b7JQNfeLkGqL/W5uWf07+QsJkeZ6oUVo3PoBxvyywPBH+pzjw3Gh6UrQ492UV
VmLoIYMdDd4TVD+qJuDRRRbF9+Z2VQNr5LVzZiQ6VAUn08nJiBQ=
=mE1p
-----END PGP SIGNATURE-----

--KxG4EVpq7wrHmu8A--
