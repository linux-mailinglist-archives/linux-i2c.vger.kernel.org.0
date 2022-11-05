Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B27061DB41
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 15:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbiKEO5N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 10:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiKEO5K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 10:57:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFEFFAF8;
        Sat,  5 Nov 2022 07:57:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E4DD760B4A;
        Sat,  5 Nov 2022 14:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57961C433D6;
        Sat,  5 Nov 2022 14:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667660229;
        bh=Fbuihe+e9s4DvLxPwjOmLdWdcE0d20qRMfa+YEg4J1w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Mf9KKQho6QEq9+KQnMW63E5FYIKOG3gj2aKeTKTh50NaF6xOGFbWKK8XQ1Sj93XLj
         P4eo9ERimzmePpe3zDnIqE2UdNt35AojlmwHYNkYC+nTz1QFUgkkR+QZrJIRIGWSp8
         1UBXkqKhnULTtpQcPnix5QihQSASTglkB/yhOeiumwbPKqYSUUTyVgTBiWDlaA5k3x
         CUaH1T/O7mq7COV4sHU5FRCLyRhBHWQCTNPWHPl72ZdJOrXyX7SUapKO7BPmjpa02y
         x6YM0ngOxWL0DEkEl3FJ2pxam72DJPY3CquUtwdKWrwen9i241enDLvp8C0urS3JLm
         ZTXh7UMUNmVYA==
Date:   Sat, 5 Nov 2022 14:56:58 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-iio@vger.kernel.org,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] i2c: core: Introduce i2c_client_get_device_id
 helper
Message-ID: <20221105145658.45b0e9da@jic23-huawei>
In-Reply-To: <Y2E0BWyvHjPko2TB@smile.fi.intel.com>
References: <cover.1667151588.git.ang.iglesiasg@gmail.com>
        <Y2E0BWyvHjPko2TB@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 1 Nov 2022 16:58:13 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Sun, Oct 30, 2022 at 06:51:06PM +0100, Angel Iglesias wrote:
> > Hello,
> >=20
> > I don't want to step anyone's work here, so I'm sending this RFC to the
> > devs involved in the original discussion. I read on Uwe Kleine-K=C3=B6n=
ig's
> > patchset submission thread the necessity for an i2c helper to aid with =
the
> > migration to the new i2c_driver .probe_new callback. Following the
> > suggestions made there, I wrote this small patchset implementing the
> > suggested helper function and ported the bmp280 IIO i2c probe to the new
> > probe using that helper. =20
>=20
> For the entire series (please drop RFC in the next version)
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I'm happy to pick up the next version but a question on 'route' in to the k=
ernel.

I can do an immutable branch with just the new function call in it if
that is useful given I assume this is applicable across a bunch of subsyste=
ms?

Jonathan

>=20
> > Thanks for your time!
> > Angel
> >=20
> > Original discussion thread for additional context:
> > https://lore.kernel.org/all/20221023132302.911644-11-u.kleine-koenig@pe=
ngutronix.de/
> >=20
> > Angel Iglesias (2):
> >   i2c: core: Introduce i2c_client_get_device_id helper function
> >   iio: pressure: bmp280: convert to i2c's .probe_new()
> >=20
> >  drivers/i2c/i2c-core-base.c       | 15 +++++++++++++++
> >  drivers/iio/pressure/bmp280-i2c.c |  8 ++++----
> >  include/linux/i2c.h               |  1 +
> >  3 files changed, 20 insertions(+), 4 deletions(-)
> >=20
> >=20
> > base-commit: c32793afc6976e170f6ab11ca3750fe94fb3454d
> > --=20
> > 2.38.1
> >  =20
>=20

