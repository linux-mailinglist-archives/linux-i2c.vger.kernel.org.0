Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEE7663439B
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Nov 2022 19:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbiKVS2K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Nov 2022 13:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbiKVS2I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Nov 2022 13:28:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5FA5B87D;
        Tue, 22 Nov 2022 10:28:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5830FB81D3E;
        Tue, 22 Nov 2022 18:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814A3C433C1;
        Tue, 22 Nov 2022 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669141683;
        bh=armo7pUTYG5p2QhFDoh2d1c54OWTXaeCob37qaFm5qY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eblzWPISo+BrrAfC7F704FIpl2P2jDaBNA0T4X1GnfpCzsCff+tSBwAyFTMvdFGvS
         hD2VMBQRuLuXljc3MfnDzUYYVidpBeEq5nM2s7UgYWjhNMqLg2nnbgGCa4DudUeSOQ
         SDL2TEATZ5wDVB49WEqbDl75qkxDn3r1n5K9+HCK4I7HU8hKq06FJP1A+yAr4G+qSp
         vDZWzE3bjRDQldscEOyDHFop85Ijtj+2fJoZCdUQ/3F6xpU2im9fqf9weKrT10qUGR
         aRZBRp+Mwgrk0XWNjTj0Yo8Ik9pGn/PrghWC/xrxL6FYjzdyqNn9ltPCBbLmD02IvN
         9n9uVt4d0CSIQ==
Date:   Tue, 22 Nov 2022 18:40:33 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Uwe =?UTF-8?B?S2xl?= =?UTF-8?B?aW5lLUvDtm5pZw==?= 
        <uwe@kleine-koenig.org>, Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 567/606] staging: iio: ad5933: Convert to i2c's
 .probe_new()
Message-ID: <20221122184033.6cae4473@jic23-huawei>
In-Reply-To: <20221122133534.zoosrjjszpgmgb64@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
        <20221118224540.619276-568-uwe@kleine-koenig.org>
        <Y3y/DxNp+cYu7GTH@kroah.com>
        <20221122133534.zoosrjjszpgmgb64@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 22 Nov 2022 14:35:34 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> Hello Greg,
>=20
> On Tue, Nov 22, 2022 at 01:22:39PM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Nov 18, 2022 at 11:45:01PM +0100, Uwe Kleine-K=C3=B6nig wrote: =
=20
> > > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > >=20
> > > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > > that explicitly in the probe function.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > >  drivers/staging/iio/impedance-analyzer/ad5933.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/driver=
s/staging/iio/impedance-analyzer/ad5933.c
> > > index f177b20f0f2d..b3152f7153fb 100644
> > > --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> > > +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> > > @@ -674,9 +674,9 @@ static void ad5933_clk_disable(void *data)
> > >  	clk_disable_unprepare(st->mclk);
> > >  }
> > > =20
> > > -static int ad5933_probe(struct i2c_client *client,
> > > -			const struct i2c_device_id *id)
> > > +static int ad5933_probe(struct i2c_client *client)
> > >  {
> > > +	const struct i2c_device_id *id =3D i2c_client_get_device_id(client)=
; =20
> >=20
> > Breaks the build in my tree as this function is not in Linus's tree yet
> > :( =20
>=20
> As pointed out in the cover letter[1] you want to make sure that
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client=
_device_id_helper-immutable
>=20
> is part of your tree first. So either pull that into your tree, or wait
> until this hits Linus's tree.

Greg,

I'm already carrying that tree so I'll pick these up unless you particularl=
y want to take
the IIO staging ones with whatever else there is in staging from this serie=
s.

Jonathan

>=20
> Best regards
> Uwe
>=20
> [1] https://lore.kernel.org/linux-kernel/20221118224540.619276-1-uwe@klei=
ne-koenig.org
>     (It wasn't sent to every thread participant because that would have
>     been too many.)
>=20

