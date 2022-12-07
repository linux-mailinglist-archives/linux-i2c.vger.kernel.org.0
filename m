Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAB064620A
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Dec 2022 21:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbiLGUFQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Dec 2022 15:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiLGUFO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Dec 2022 15:05:14 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFDD6C732
        for <linux-i2c@vger.kernel.org>; Wed,  7 Dec 2022 12:05:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id CB67ACE1FA2
        for <linux-i2c@vger.kernel.org>; Wed,  7 Dec 2022 20:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37612C433C1;
        Wed,  7 Dec 2022 20:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670443509;
        bh=3UL/IpS+mva6RzkvSKMbS87yIvyMHCLzltqoU5DgxIw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U5CMVg/IsblyR2vEFDIrcZL8Uch0Dvi1iA2+sIeXmtUfc0z1JX0SD1bFGQWcJ80+N
         Xn+aaU15ogfats9HaXebZe5mpFJQEMxrICMgO42WXOXWNl9cKLbrqy7hIYUKQNyKik
         I6Nnwxa/B0hxQjv6xvKfKUCR0pFQoS29R2iGnLOB8m6HnqJtwCi6JUBmjjhxbTANRA
         aCh/nH1jQIH35wJafpXdZTbmUGTrrWNzilJWPJ/eg8l6yQcWR3iHAXgFIPaR6PsPA8
         oRH+sjEuvL0HpyZyJrKIwFz4JA1IpKUOc9dhXfVA0noc/PY3wHxw+uFa3sgDDitSoT
         nAlZVJD+FB4xw==
Date:   Wed, 7 Dec 2022 21:05:05 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] i2c: xiic: Make sure to disable clock on .remove()
Message-ID: <Y5Dx8TunleMwpcNn@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
References: <20221019202808.88779-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7gaQPCGDRnmpfteL"
Content-Disposition: inline
In-Reply-To: <20221019202808.88779-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7gaQPCGDRnmpfteL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 10:28:08PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> If for whatever reasons pm_runtime_resume_and_get() failed, .remove() is
> exited early, the clock isn't freed and runtime PM state isn't reset.
>=20
> The right thing to do however is to free all resources that don't need
> HW access after a problem with runtime PM. Also issue a warning in that
> case and return 0 to suppress a less helpful warning by the driver core.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to for-next, thanks!


--7gaQPCGDRnmpfteL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmOQ8e4ACgkQFA3kzBSg
KbaFSw/8DbpF05k8MsaBQF/2kcWrKwuBoiEmT9rd68TWTm2X3RBGBnklw4QbhOyC
gOTkOCbbH4U6rnDp1C7w2fzl7Z9Y/2KkkV7kyFkyb/JuWXlYFwDadJs/+/kBkxkJ
VwKNhwfWqiWPn8Y9kbRQrCGPwf33feiK+4OJg0/44wOE0GLthT5ITh7YTl8U7EeT
R/AYQPS6i6qjDwGL7HoCCQfmGJqS924Qrw0aXLXcJ2PjE7VRLEdlGNxTLOj/vsvk
UCC7ItxC+snh6c51a/wEbceSkEDvCY8l2a2k/dtiUzClLeuTYQUtJFFMTtSqSwkd
xna0eamR96P7231Wc9o0bUd9UAKPZWfywmWBVJfMEfQnF80+c0ujQcBg9jpG6NTZ
jjkkwgRVnAaivOpQpy+/+7Ww+nrsUWVErWjxjRcCSBQEit9/3wlMkaoo6eaRNMuH
9KQbQ4r6p7s97FaGoEbri79A570Kbu6Qf9+cbr+c/I/AX5KciaBSpneqd7FkwdRJ
1peeGNNLrPnUbiCfj03o5iRPHyEPrWtns6upw67yyyB3KZvITc/nb2CGVt6eaZ0f
wV26UtvTLnC59ma0DJlvmUZOcODqlMCKMIpcbk76sESh5vEoFdqd5aMzC5mV1+kX
j7cceU67g8M9V687N7AHwEJq3CwmJ9iC0Ov/BgBFc+7wG6+OcVk=
=7YRD
-----END PGP SIGNATURE-----

--7gaQPCGDRnmpfteL--
