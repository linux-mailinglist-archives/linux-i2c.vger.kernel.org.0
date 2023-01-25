Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D6D67B390
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jan 2023 14:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235279AbjAYNkl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Jan 2023 08:40:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjAYNkk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Jan 2023 08:40:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1683F4DCD4;
        Wed, 25 Jan 2023 05:40:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C59E3B81714;
        Wed, 25 Jan 2023 13:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D69C433D2;
        Wed, 25 Jan 2023 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674654036;
        bh=Gsm6wMIJG6DsBaQdU2Cp1zJXJXZ3h6uadDA4nB+UVeE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qpdcFE7g3exQiUIbzkrhP1o2DZlB4IJBV1ixsJtWVPla5DlgsuPBM7tRSGlA5cvcO
         Iw5APg3ziFp2BvuyjtYU/zV8oNUW0d9/T24IuKnXl7q/l4kA0fIYBEWPGnFkMq3tL5
         R3DJx1mZGslDyB54/JDVWpGUaxRPE0N6M4DtVjp4ndPfMzljVFVZGStFIy4Jg6zMeD
         HdK3UjxSIcuRvdwTXzGDR4XG0vufIdYYU1CTE73GUWEvd9pR02UqT+mRNWiyWgfd6z
         smD13AwrtXRN097kV7TxZ89cX0voK/4t6jSnhFqIRThpL7VmXsVOO+Nha5951Psp8F
         MlMR+q9iZ4ogA==
Date:   Wed, 25 Jan 2023 14:40:33 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH resend 0/2] i2c/extcon: intel-cht-wc: Lenovo Yoga Tab 3
 Pro YT3-X90F support
Message-ID: <Y9ExUbiHOgbHOBie@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
References: <20230125111209.18343-1-hdegoede@redhat.com>
 <Y9Et7nlUmiiPrFUQ@ninjato>
 <383fda33-143d-9e8e-1f7d-080931ae4496@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Vk1n9/8R0IEAM9f6"
Content-Disposition: inline
In-Reply-To: <383fda33-143d-9e8e-1f7d-080931ae4496@redhat.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Vk1n9/8R0IEAM9f6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram, may I/we have your ack for merging the small i2c change
> through the MFD tree?

Patch 1 already has my ack :)


--Vk1n9/8R0IEAM9f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPRMVEACgkQFA3kzBSg
KbbH6RAAs0UIiogXMSrliwrf42w7e7vSDtTjYRGut6rURlsnOH+JsLnnDZ5OAcTd
+93KooyX3leUDXbGdHbj/Tv4eITsn+XeTgfqtyZvLqrdLwgb0fHI8XbKMDU51Bu9
LM0Ohrx8zrUYGsa/MDW9WD49lf2LSviPPIsYWXnD484/swhw+iS86nIZ1M6U5O5E
uQJM9/dBx9QTr9wOozM5+Qzk4lxsOHUAOeYicYAdBVssIjbPUaaafurrLKz+JvM7
h030Co9u/1x/qZBCk78pBLkvokf/jnt7ZT1pYD4LQD6MKOItBWa2/YzXWUh7wRnm
+H1vlk4ctHTg3w1Q5igGqrXKpbNqInOd3eyxpYKe8TzfPu65RcnMen8BMOAl/7mN
D/dOT6G0OIMELz/k3i6RDoKWaWcsHmlPmNm1h0sQGMAKadm0BRST+FnDMFR1p0A1
N3Y10a2empJkAY9w1mfVZ9T03LRoLlB3oe8c36olqv34oKZmr5wJOCae62hfE/eo
cuJvppcBIfomXeszr+C8w/QokSqrZle5NE5FNWNXDTei7OpffyhMrtzPxjcyEAqA
DX79dz5/Uyaje9tZnAIYmPsX8+z0Ph9WTwiSvM4SylC/hXVMRjylU5jQGDwziZKv
QlY4aIvv1NSUAQhkpTHhVgHNRz9oi+fcAhAXALVjEKkBHhiC/Fo=
=1oFK
-----END PGP SIGNATURE-----

--Vk1n9/8R0IEAM9f6--
