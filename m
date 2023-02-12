Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED13769365E
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Feb 2023 08:25:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjBLHZS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Feb 2023 02:25:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjBLHZR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Feb 2023 02:25:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0404B86AC;
        Sat, 11 Feb 2023 23:25:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56C77B80956;
        Sun, 12 Feb 2023 07:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53CCC433EF;
        Sun, 12 Feb 2023 07:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1676186714;
        bh=9LP+f5rD8fGgE8ZJ3N4Te/c1JBlz0yj/2Rx8Zdcaly8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=chlVfwC8HoTvcexZr7TukM8v18KIG09L+Oy/u/GW3zwxfku6yny9HlSdSaNDT4LDm
         g6+YtfoPE5/DkLMYnm4gocqtmwDsLK3azPbPD121bU47P+hkOwJxzDMuIdTwf91z++
         Edr2t9AxVJkpWJ+gQ+h7RgpL4wWf2B70NINETASc=
Date:   Sun, 12 Feb 2023 08:25:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 482/606] misc: ad525x_dpot-i2c: Convert to i2c's
 .probe_new()
Message-ID: <Y+iUVhnyB3Hy9SE9@kroah.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-483-uwe@kleine-koenig.org>
 <20230211225446.lrbswlde6q2fzdxu@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211225446.lrbswlde6q2fzdxu@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Feb 11, 2023 at 11:54:46PM +0100, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On Fri, Nov 18, 2022 at 11:43:36PM +0100, Uwe Kleine-König wrote:
> > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > that explicitly in the probe function.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> This is one of the very few patches that I didn't get a feedback for.
> Given that I want to change the prototype of .probe after the upcoming
> merge window, it would be great to get this patch either applied during
> the merge window (my preferred option) or at least get an Ack to get
> this patch in via the i2c tree together with the patch changing .probe.
> 
> In case you don't have the original any more:
> 
> 	https://lore.kernel.org/r/20221118224540.619276-483-uwe@kleine-koenig.org

Oops, missed it, sorry about that:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
