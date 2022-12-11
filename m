Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD4B96493EC
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Dec 2022 12:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbiLKLeC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Dec 2022 06:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbiLKLdy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Dec 2022 06:33:54 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430B411475;
        Sun, 11 Dec 2022 03:33:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B318660A10;
        Sun, 11 Dec 2022 11:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25376C433EF;
        Sun, 11 Dec 2022 11:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670758432;
        bh=lFKRx+bMbLquodSSJm9pTt6nw1Zl4L+qi0OJBXrYCso=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sxI/HYUencpplG6cK3SVn0H/AQtggsezrCv4exQFa9GI7S0mNUZqNmZ+X/gwV0tTA
         u9wY2ywKaMhbYjZlLuTe6QsLTw8k60TykGtXZYCAVKL0uwtXbFgVzO5PYUyff1X/h3
         EJXsf5ImqgktsiMImt24XsolUfoNeJIKG/nXz8gaJecpirtQd59k6IGV/5cEIEBnvo
         SifEO0MruVL2TqKzR2ehqaTqn91l/o3v35XFL5fU+1qeQu1jk5hTvtelB3L5XtULCj
         AMgEXjeMKaovOX2vnO/mwf2BfLn0lxroF/S3b4lqWrLKZaum5UEnpFmSDRRAtFlOLz
         cJN689Qw++1Jg==
Date:   Sun, 11 Dec 2022 11:46:45 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 132/606] iio: light: max44009: Convert to i2c's
 .probe_new()
Message-ID: <20221211114645.1fde7708@jic23-huawei>
In-Reply-To: <20221206112343.no64esqurdozwuqo@pengutronix.de>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
        <20221118224540.619276-133-uwe@kleine-koenig.org>
        <20221206112343.no64esqurdozwuqo@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-pc-linux-gnu)
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

On Tue, 6 Dec 2022 12:23:43 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> Hello Jonathan,
>=20
> On Fri, Nov 18, 2022 at 11:37:46PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> >  drivers/iio/light/max44009.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-) =20
>=20
> all iio patches from my series but this one are applied in next now. I
> wonder what happend to that one, my best guess is that this patch was
> dropped by accident?

Ah.  Oops.  Applied now to the togreg branch of iio.git, but it won't
appear in next until around rc1 as I want to rebase that tree so
won't push it out as togreg (the in theory non rebasing branch)

For now pushed out as testing for 0-day etc to take a look at it.

Thanks,

Jonathan

>=20
> Best regards
> Uwe
>=20

