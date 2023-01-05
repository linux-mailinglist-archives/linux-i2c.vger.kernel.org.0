Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0926D65EF26
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jan 2023 15:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjAEOri (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Jan 2023 09:47:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233974AbjAEOrJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Jan 2023 09:47:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72A332E88;
        Thu,  5 Jan 2023 06:47:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D2CEB81AFB;
        Thu,  5 Jan 2023 14:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E85BC433EF;
        Thu,  5 Jan 2023 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672930026;
        bh=N4FnVBpExQOJilmXX74XeUkbiTayhc/IA7MLU+ePIDU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aP4dI15L24xyDTGn5Pi6hW4dS3Jl+3N83+OwSu1C7t8JfcQ7ADE0X+/hQPPD4Oefq
         Hmr3Dg2uJYSoohBBzh7QoALKQYgtoK8LGr/c3GLYbs0CTOE77eJ7Uu9XqOW4ZxLdNU
         jRLvIRqNMwR8jMz9vc/GF+bgH3jFfCsDT5mWo3oPh2vfxfji4N2MImfeFANBKG8jYh
         kviLyMcBXr8n8y0itZomUwZpTAUR9CCWXNg3XSVXd5W6qyfmkD+soy0nX4ocVM3qEI
         JFTEf8Hxw/74NX1JcndxAoUjlWZffnoS2K++32GUhmHjrHV71GC/QKfCJV6S+64Z3x
         6OVewy87I0Djg==
Date:   Thu, 5 Jan 2023 14:47:00 +0000
From:   Lee Jones <lee@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH 288/606] leds: turris-omnia: Convert to i2c's .probe_new()
Message-ID: <Y7bi5CaGsQFgODrZ@google.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-289-uwe@kleine-koenig.org>
 <20221202111221.zl7w6guy4bgqwkdp@pengutronix.de>
 <20221222214225.xed7qi5c5ksjylho@pengutronix.de>
 <Y6WQJ5JTYCIytOpK@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6WQJ5JTYCIytOpK@google.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 23 Dec 2022, Lee Jones wrote:

> On Thu, 22 Dec 2022, Uwe Kleine-König wrote:
> 
> > Hello Pavel,
> > 
> > On Fri, Dec 02, 2022 at 12:12:21PM +0100, Uwe Kleine-König wrote:
> > > On Fri, Nov 18, 2022 at 11:40:22PM +0100, Uwe Kleine-König wrote:
> > > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > 
> > > > The probe function doesn't make use of the i2c_device_id * parameter so it
> > > > can be trivially converted.
> > > > 
> > > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > 
> > > I didn't get any feedback from your side about this patch set.
> > > 
> > > In case the problem is "only" to get the led patches out of this
> > > series, I recommend:
> > > 
> > > 	b4 am -l -s -P268-288 20221118224540.619276-1-uwe@kleine-koenig.org
> > 
> > Still no feedback. A big part of the series was applied to the various
> > trees, but the led patches are not. :-\ Would be great if you queued
> > them for next after the merge window closed. (Or if you have concerns,
> > speak up.)
> 
> If it's okay with Pavel, I can pick these up after the holidays.

Applied now, thanks.

-- 
Lee Jones [李琼斯]
