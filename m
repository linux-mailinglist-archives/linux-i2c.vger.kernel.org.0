Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF746449C6
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Dec 2022 17:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbiLFQ5M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Dec 2022 11:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235686AbiLFQ5J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 6 Dec 2022 11:57:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F165223;
        Tue,  6 Dec 2022 08:57:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 13DCDB81AD0;
        Tue,  6 Dec 2022 16:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DCDC433C1;
        Tue,  6 Dec 2022 16:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670345825;
        bh=fiUZBItsIAyK+jAMIGNz3fSXYzREKztDb3GufaNBNhQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bnxEhZdA5VKyk53pDOuFbgYwJsTOx4Vg5dWwHZQaraMMJ/xbTXISKf5d1sGwEAz1U
         ATyrFA1yTURMPJdFmDDCSXcoicjWOKRgCZnPtVvlZZDH5Miz437R/AD9M1vMrPTrdm
         TreNWutBQ/l/koa+MfEnw0H85qR72HOXUplbQwVwybfXAP+ohyyWtbxf31FB9iIHq7
         aKG/04trW9ZErW+KBBPd/a+qiLrplRreb0aBbxqvN5ou2buRhL5Dm8V6e/gd2yKWOa
         0cHKS4kyaFYFkz9O6NR9Qk9jyx5fFTQcNqtkFodYNGyFZyo65hixFh2Z5Wgp6f02e/
         VnnCgzeK5k76A==
Date:   Tue, 6 Dec 2022 16:56:59 +0000
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
Message-ID: <Y490W6k4N8iBxLHf@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
 <Y3usiUm1K+5xCWhY@google.com>
 <20221206105908.jzcdnast3yw22eel@pengutronix.de>
 <Y49pi54DKsvLOzvb@google.com>
 <20221206163516.i6rzewxts7do75y5@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221206163516.i6rzewxts7do75y5@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 06 Dec 2022, Uwe Kleine-König wrote:

> On Tue, Dec 06, 2022 at 04:10:51PM +0000, Lee Jones wrote:
> > On Tue, 06 Dec 2022, Uwe Kleine-König wrote:
> > 
> > > Hey Lee,
> > > 
> > > On Mon, Nov 21, 2022 at 04:51:21PM +0000, Lee Jones wrote:
> > > > On Mon, 21 Nov 2022, Uwe Kleine-König wrote:
> > > > 
> > > > > Hello Lee,
> > > > > 
> > > > > On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> > > > > > On Fri, 18 Nov 2022, Uwe Kleine-König wrote:
> > > > > > 
> > > > > > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > > > 
> > > > > > > The probe function doesn't make use of the i2c_device_id * parameter so it
> > > > > > > can be trivially converted.
> > > > > > > 
> > > > > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > > > ---
> > > > > > >  drivers/mfd/khadas-mcu.c | 5 ++---
> > > > > > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > > > > > 
> > > > > > After a week or so, please collect-up all the tags you have received
> > > > > > and submit a per-subsystem set for me to hoover up, thanks.
> > > > > 
> > > > > For mfd I'd do:
> > > > > 
> > > > > 	git checkout mfd/for-next
> > > > > 	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
> > > > > 	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx
> > > > > 	git send-email --to .... --cc .... mfd/for-next
> > > > 
> > > > That's just crazy enough to work.
> > > > 
> > > > Thanks for the tip.
> > > 
> > > On irc you said you'd care for application of these patches ("I plan to
> > > attempt the b4 solution"), they didn't land in next yet. Do you need a
> > > reminder? Something else?
> > 
> > I applied them, but they fail to build and I haven't had time to
> > investigate.  I guess they depend on some patches that have been
> > accepted into another (input?) and are now in -next.  Any idea if they
> > are available on some immutable branch that I can pull from?
> 
> If in your tree i2c_client_get_device_id() is missing, you want to pull
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/client_device_id_helper-immutable

Ideal, thanks.

-- 
Lee Jones [李琼斯]
