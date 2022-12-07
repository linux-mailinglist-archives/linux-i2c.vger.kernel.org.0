Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 027686458E7
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Dec 2022 12:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiLGLXg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Dec 2022 06:23:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiLGLX2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Dec 2022 06:23:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D13C0B;
        Wed,  7 Dec 2022 03:23:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 810A1B81D6D;
        Wed,  7 Dec 2022 11:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B2CC433C1;
        Wed,  7 Dec 2022 11:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670412200;
        bh=3YU23InXjthWpJou6I3gazjFEz+Ws5zTsuXi0q/CsUM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Plkgpwfny3LEbsm2Fa+F3Ljxa1i1Uu77HCkLB0BG7NOMe+JqQJ5F0SIqba9k1zNzy
         Swo/kz4a2zc9dfWAiFSs2YEtK/rjckxS+VoHKr9cs6poavIsPhCN1+sW1qVG9Nmv/V
         2VJOueAD2vIAq2klZqd24stHG96WkgEWlNtLBYkzWH1vwJHVPWRQpYLSK7vvnzIQrT
         t6KfqqK6Qp19nEPwx0IUR+sudZ+MGH0AFo6SwdN6E2Y80fCPpkTBpe+FIkBzFdAkg/
         QL6DG9tWzTjnYVmZmB3XI6Y7pMZ/qaPB3ebPleu1Z01dtM7n0g0kdldED3xHy9z1tS
         vA1mA1Sj9fvcQ==
Date:   Wed, 7 Dec 2022 11:23:14 +0000
From:   Lee Jones <lee@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <Y5B3otGG06QCjldc@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
 <Y49pi54DKsvLOzvb@google.com>
 <20221206163516.i6rzewxts7do75y5@pengutronix.de>
 <Y490W6k4N8iBxLHf@google.com>
 <20221207110007.yfjfiakmh4ma3sfo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221207110007.yfjfiakmh4ma3sfo@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 07 Dec 2022, Uwe Kleine-König wrote:

> Hello Lee,
> 
> On Tue, Dec 06, 2022 at 04:56:59PM +0000, Lee Jones wrote:
> > > On Tue, Dec 06, 2022 at 04:10:51PM +0000, Lee Jones wrote:
> > > > On Tue, 06 Dec 2022, Uwe Kleine-König wrote:
> > > > 
> > > > > Hey Lee,
> > > > > 
> > > > > On Mon, Nov 21, 2022 at 04:51:21PM +0000, Lee Jones wrote:
> > > > > > On Mon, 21 Nov 2022, Uwe Kleine-König wrote:
> > > > > > 
> > > > > > > Hello Lee,
> > > > > > > 
> > > > > > > On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> > > > > > > > On Fri, 18 Nov 2022, Uwe Kleine-König wrote:
> > > > > > > > 
> > > > > > > > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > > > > > 
> > > > > > > > > The probe function doesn't make use of the i2c_device_id * parameter so it
> > > > > > > > > can be trivially converted.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > > > > > ---
> > > > > > > > >  drivers/mfd/khadas-mcu.c | 5 ++---
> > > > > > > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > > > > > > 
> > > > > > > > After a week or so, please collect-up all the tags you have received
> > > > > > > > and submit a per-subsystem set for me to hoover up, thanks.
> > > > > > > 
> > > > > > > For mfd I'd do:
> > > > > > > 
> > > > > > > 	git checkout mfd/for-next
> > > > > > > 	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
> > > > > > > 	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx
> > > > > > > 	git send-email --to .... --cc .... mfd/for-next
> > > > > > 
> > > > > > That's just crazy enough to work.
> > > > > > 
> > > > > > Thanks for the tip.
> > > > > 
> > > > > On irc you said you'd care for application of these patches ("I plan to
> > > > > attempt the b4 solution"), they didn't land in next yet. Do you need a
> > > > > reminder? Something else?
> > > > 
> > > > I applied them, but they fail to build and I haven't had time to
> > > > investigate.  I guess they depend on some patches that have been
> > > > accepted into another (input?) and are now in -next.  Any idea if they
> > > > are available on some immutable branch that I can pull from?
> > > 
> > > If in your tree i2c_client_get_device_id() is missing, you want to pull
> > > 
> > > 	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_device_id_helper-immutable
> > 
> > Ideal, thanks.
> 
> I see you added my commits to your tree now, however there is a problem:
> 
>   $ git log --oneline --graph --boundary linus/master..FETCH_HEAD
>   ...
>   *   7281458f4396 Merge branches 'ib-i2c-mfd-client_dev_id_helper-6.2' and 'ib-mfd-uwes-i2c-probe_new-6.2' into ibs-for-mfd-merged
>   |\  
>   | * c066a1632bc3 mfd: wm8994-core: Convert to i2c's .probe_new()
>   | * 0f22cf00762d mfd: wm8400-core: Convert to i2c's .probe_new()
>   | * 090f49b250ee mfd: wm8350-i2c: Convert to i2c's .probe_new()
>   | * 7174af1be41d mfd: wm831x-i2c: Convert to i2c's .probe_new()
>   | ...
>   | * 63909fec136e mfd: adp5520: Convert to i2c's .probe_new()
>   | * 549d4f3207f8 mfd: act8945a: Convert to i2c's .probe_new()
>   | * 623f79babaf1 mfd: aat2870-core: Convert to i2c's .probe_new()
>   | * ce41e4ae7cac mfd: 88pm805: Convert to i2c's .probe_new()
>   | * 02aa483f1f98 mfd: 88pm800: Convert to i2c's .probe_new()
>   * | 662233731d66 i2c: core: Introduce i2c_client_get_device_id helper function
>   |/
>   o 9abf2313adc1 (tag: v6.1-rc1) Linux 6.1-rc1
> 
> That means that the commit introducing i2c_client_get_device_id() isn't
> an ancestor of the commits that make use of the new function. So
> 63909fec136e (which is the first commit making use of the new function)
> likely won't compile:
> 
> 	$ git grep i2c_client_get_device_id 63909fec136e
> 	63909fec136e:drivers/mfd/adp5520.c:     const struct i2c_device_id *id = i2c_client_get_device_id(client);
> 
> Starting with 7281458f4396 everything is fine again, but still this
> hurts a bisection.

Fair point - I'll rebase the my topic branch on top of Wolfram's.

-- 
Lee Jones [李琼斯]
