Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2021F6448F9
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 17:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235481AbiLFQQM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 11:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbiLFQPu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 11:15:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C133B9E8;
        Tue,  6 Dec 2022 08:10:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2E492B81A96;
        Tue,  6 Dec 2022 16:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF46C433C1;
        Tue,  6 Dec 2022 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670343056;
        bh=F6DcxtiqCeG4B6wmN9I+pwVih4zHP19OF/1oftcy+cM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tK7IUkXUxWrHWCQOObPIW+bVrPjFl8vpJ3Zhe5rh4Nh8hqPo0VHuyHpMGVdXRQ7Wv
         E+OdNwSvW0sNShK1BLGCd2/9gd72c4JUyoGQEBAJQYDcVY0BFcmYnIVpfHUL/GdCIi
         wxw4NnkziVMmdl9WOD8Nvfdq6E+Weabtmlc9d6plnsAhGjIeyr5LgxCkKgQDo4t0RV
         h90lBD5Ghn1C1QXRyoK5G4ZmU6zUk0AlzNiXZzi/89bVE8hDWV5JU84ybVcyQYsgw3
         PjTPVf7ZyrifZtgOZZLigTL7ulhd8IMg7gzgDxwT7rMmFbuu1pCcRUDJVCGVHyE9xC
         F2Qye+z+lAXaw==
Date:   Tue, 6 Dec 2022 16:10:51 +0000
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
Message-ID: <Y49pi54DKsvLOzvb@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221206105908.jzcdnast3yw22eel@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 06 Dec 2022, Uwe Kleine-König wrote:

> Hey Lee,
> 
> On Mon, Nov 21, 2022 at 04:51:21PM +0000, Lee Jones wrote:
> > On Mon, 21 Nov 2022, Uwe Kleine-König wrote:
> > 
> > > Hello Lee,
> > > 
> > > On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> > > > On Fri, 18 Nov 2022, Uwe Kleine-König wrote:
> > > > 
> > > > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > 
> > > > > The probe function doesn't make use of the i2c_device_id * parameter so it
> > > > > can be trivially converted.
> > > > > 
> > > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > ---
> > > > >  drivers/mfd/khadas-mcu.c | 5 ++---
> > > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > > 
> > > > After a week or so, please collect-up all the tags you have received
> > > > and submit a per-subsystem set for me to hoover up, thanks.
> > > 
> > > For mfd I'd do:
> > > 
> > > 	git checkout mfd/for-next
> > > 	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
> > > 	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx
> > > 	git send-email --to .... --cc .... mfd/for-next
> > 
> > That's just crazy enough to work.
> > 
> > Thanks for the tip.
> 
> On irc you said you'd care for application of these patches ("I plan to
> attempt the b4 solution"), they didn't land in next yet. Do you need a
> reminder? Something else?

I applied them, but they fail to build and I haven't had time to
investigate.  I guess they depend on some patches that have been
accepted into another (input?) and are now in -next.  Any idea if they
are available on some immutable branch that I can pull from?

-- 
Lee Jones [李琼斯]
