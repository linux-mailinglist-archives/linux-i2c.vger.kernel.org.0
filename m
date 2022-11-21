Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0107D632A06
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 17:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbiKUQv3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 11:51:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiKUQv2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 11:51:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 531113C6EE;
        Mon, 21 Nov 2022 08:51:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2C1A6130B;
        Mon, 21 Nov 2022 16:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02EBC433D6;
        Mon, 21 Nov 2022 16:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669049487;
        bh=H3MOV+zhDBog7YBuduJdC2EhLMPiAYaQkSwiFUKZo9A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pSbxPlTV5pOA4HehPMNHk7I8oMAxpCcopMQO/hfAGAuDHjq+NrOJqgiucVhk8EY96
         Nmh949/Q5VwDmHOHA+q4v/+29dWAyvWacaPXUnH3l85AYf1NSyAX7GPHzLQ+Bg55Sk
         puAOqI7DORw/x2BO9U84jZI6gOi1HVyQ3DZDtd4V2TQVVBaQwMDNNV3vi1ixmu5h9r
         1FU5t3AJV++5EFOW00xkLDA30OjaE6twzfh32GTyZrMwplmKQssSgoOniQXeIQmUXI
         dmlVIhV8TrgaQv7d7UwOWroxLpf/b4F2cE3U1bOV3duM/JS0LHjPYReAQsqbHt9Me7
         PSZMNqb04c8cA==
Date:   Mon, 21 Nov 2022 16:51:21 +0000
From:   Lee Jones <lee@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        linux-amlogic@lists.infradead.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Message-ID: <Y3usiUm1K+5xCWhY@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
 <Y3tvypIDVdCYxAVB@google.com>
 <20221121150854.3mwczqtbusawho4m@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221121150854.3mwczqtbusawho4m@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 21 Nov 2022, Uwe Kleine-König wrote:

> Hello Lee,
> 
> On Mon, Nov 21, 2022 at 12:32:10PM +0000, Lee Jones wrote:
> > On Fri, 18 Nov 2022, Uwe Kleine-König wrote:
> > 
> > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > 
> > > The probe function doesn't make use of the i2c_device_id * parameter so it
> > > can be trivially converted.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > ---
> > >  drivers/mfd/khadas-mcu.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > After a week or so, please collect-up all the tags you have received
> > and submit a per-subsystem set for me to hoover up, thanks.
> 
> For mfd I'd do:
> 
> 	git checkout mfd/for-next
> 	b4 am -P 413-481 20221118224540.619276-1-uwe@kleine-koenig.org
> 	git am ./20221118_uwe_i2c_complete_conversion_to_i2c_probe_new.mbx
> 	git send-email --to .... --cc .... mfd/for-next

That's just crazy enough to work.

Thanks for the tip.

> to accomplish that. I can do that, but feel free to do it yourself at a
> moment that suits you (of course without the send-email part and maybe
> adding -l and -s to b4 am).
> 
> For backlight the patch range is 585-593.
> 
> Cheers,
> Uwe
> 



-- 
Lee Jones [李琼斯]
