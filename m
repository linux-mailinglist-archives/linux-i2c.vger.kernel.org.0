Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B7C646261
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Dec 2022 21:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiLGUaa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Dec 2022 15:30:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiLGUa3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Dec 2022 15:30:29 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40AD24BC1;
        Wed,  7 Dec 2022 12:30:28 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 95D881C09FB; Wed,  7 Dec 2022 21:30:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1670445027;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Z5b7y/2yjvFL4i3+glZhDDF7w9FN/LrwFRG/9dbVc0k=;
        b=r4Zzx1+K8PdaFkTJ3QZnZOhV+4Xq4Qh7UNAPlbQQREzViAdqqoWAQCFYOQKHQ8uAXdDcW+
        0+ymEbQXwVCkPmeZqmP3/Uassci31KlNCrqlM3lOOp9t9xAzfnPl9uvY7g3Xd9YdZ6Rfx4
        viCTkBKukxTAmoyw7J6Oxg9K0Remdnw=
Date:   Wed, 7 Dec 2022 21:30:27 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 288/606] leds: turris-omnia: Convert to i2c's .probe_new()
Message-ID: <Y5D34yLLJ+d7sDbi@duo.ucw.cz>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-289-uwe@kleine-koenig.org>
 <20221202111221.zl7w6guy4bgqwkdp@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="oqC+wzXIVm8UOXNA"
Content-Disposition: inline
In-Reply-To: <20221202111221.zl7w6guy4bgqwkdp@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oqC+wzXIVm8UOXNA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> On Fri, Nov 18, 2022 at 11:40:22PM +0100, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > The probe function doesn't make use of the i2c_device_id * parameter so=
 it
> > can be trivially converted.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I didn't get any feedback from your side about this patch set.
>=20
> In case the problem is "only" to get the led patches out of this
> series, I recommend:
>=20
> 	b4 am -l -s -P268-288 20221118224540.619276-1-uwe@kleine-koenig.org

Yeah, well, I guess:

# A part of the patches depend on commit 662233731d66 ("i2c: core:
# Introduce i2c_client_get_device_id helper function"), there is a branch t=
hat
# you can pull into your tree to get it:

this is a bit of a problem because Linus will be unhappy if I pull
into my for-next branch.

So... I can get them in the next cycle, or I can ack them and get them
via some special arangement with linux, or...

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--oqC+wzXIVm8UOXNA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY5D34wAKCRAw5/Bqldv6
8mrsAJ4mo4v3DMQASdklNViFzyNoKCrc6gCgjECQS+emTZBiFto6cFY8yYnAhbU=
=33+E
-----END PGP SIGNATURE-----

--oqC+wzXIVm8UOXNA--
