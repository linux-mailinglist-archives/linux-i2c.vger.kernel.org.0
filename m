Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6D777F548
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 13:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236405AbjHQLaH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 07:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350380AbjHQL3v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 07:29:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA57030FD
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 04:29:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E22966631F
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 11:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49185C433CC;
        Thu, 17 Aug 2023 11:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692271746;
        bh=KDB20w3zVcSKTTV5vUMmLZF/S01IHbzFRhKTMQ0FMVI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h9MrRiFY8Yj+Ldr0w6ovtXICKQ3vFTOyUsQEohwW9UFpjgRFYbF2Wm2zpqcVj9XZ7
         hAzP5TTEZYZ0GvXApYjfKYkZ1w3z2G+J94OwKSDzHCR254/q4h84WFpBEC2aE20iNc
         S0qQRZqdPq0wGmt7n3w9sFQfZDUnBRCS4SoT/AYUnQcpuoFdaPw8zWZXHOrxviWGk3
         cU4oCo5SK5bTk24Cbyih8EMWzTEHZR2++VMA3+9SLCk5YFaqsGe9OnziCZcAZIQfcM
         4V6poiYMRYIRTBf/FmJ0VSFomIQDSLgU2TslvNtwy3vPpXs/E2BrIcAN4kydkLQEwR
         U44dOMVHlhcbQ==
Date:   Thu, 17 Aug 2023 12:29:00 +0100
From:   Lee Jones <lee@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pavel Machek <pavel@ucw.cz>, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] i2c: Drop legacy callback .probe_new()
Message-ID: <20230817112900.GB986605@google.com>
References: <20230626094548.559542-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230626094548.559542-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 26 Jun 2023, Uwe Kleine-König wrote:

> Now that all drivers are converted to the (new) .probe() callback, the
> temporary .probe_new() can go away. \o/
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> I was planning to send out this patch for inclusion into next after
> v6.5-rc1 as I thought there were only three drivers left to be converted
> before (on top of today's next/master). While preparing to submit this
> patch I noticed that a few more .probe_new were introduced in next even
> after commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
> parameter"). I just sent out patches for all drivers in next that are
> still using .probe_new. These are:
> 
>  - w1: ds2482: Switch back to use struct i2c_driver's .probe()
>    https://lore.kernel.org/lkml/20230612072807.839689-1-u.kleine-koenig@pengutronix.de
>    Krzysztof Kozlowski already signaled this won't go into 6.5-rc via
>    his tree, and he's ok if it goes in via i2c then.
> 
>  - drm/i2c: Switch i2c drivers back to use .probe()
>    https://lore.kernel.org/dri-devel/20230611202740.826120-1-u.kleine-koenig@pengutronix.de
>    Currently applied to
> 
> 	https://anongit.freedesktop.org/git/drm/drm-misc.git drm-misc-next
> 
>    as d13b5d2b2b45. This won't make it onto v6.5-rc1 either.
> 
>  - watchdog: ziirave_wdt: Switch i2c driver back to use .probe()
>    https://lore.kernel.org/linux-watchdog/20230525210837.735447-1-u.kleine-koenig@pengutronix.de
>    Given that the merge window is open now, I doubt this will make it
>    into v6.5-rc1.
> 
>  - c4cfa2436ff6 hwmon: max31827: Switch back to use struct i2c_driver::probe
>    https://lore.kernel.org/linux-hwmon/20230626085145.554616-1-u.kleine-koenig@pengutronix.de
> 
>  - leds: aw200xx: Switch back to use struct i2c_driver::probe
>    https://lore.kernel.org/linux-leds/20230626090254.556206-1-u.kleine-koenig@pengutronix.de
> 
>  - media: i2c: ov01a10: Switch back to use struct i2c_driver::probe
>    https://lore.kernel.org/linux-media/20230626090533.556406-1-u.kleine-koenig@pengutronix.de
> 
>  - usb: typec: nb7vpq904m: Switch back to use struct i2c_driver::probe
>    https://lore.kernel.org/linux-usb/20230626091314.557122-1-u.kleine-koenig@pengutronix.de
> 
>  - regulator: raa215300: Switch back to use struct i2c_driver::probe
>    https://lore.kernel.org/lkml/20230626091544.557403-1-u.kleine-koenig@pengutronix.de
> 
>  - mfd: Switch two more drivers back to use struct i2c_driver::probe
>    https://lore.kernel.org/lkml/20230626091941.557733-1-u.kleine-koenig@pengutronix.de
> 
> The last six were only sent today, so I guess we have to wait another
> development cycle and then get this patch into next after v6.6-rc1
> (together with the patches from above list that will have failed to get
> into v6.6-rc1).
> 
> Until we're there, feel free to already look at this patch. I was unsure
> if I should split of the change to Documentation/hwmon/pmbus.rst. As
> .probe() already works in v6.3-rc2 this hunk could go in already
> earlier, e.g. via the hwmon tree. While thinking about that, the hunk
> for Documentation/i2c/writing-clients.rst could go in before, too.
> So tell me your thoughts, then I can split as desired.
> 
> Best regards
> Uwe
> 
>  Documentation/hwmon/pmbus.rst         |  2 +-
>  Documentation/i2c/writing-clients.rst |  2 +-
>  include/linux/i2c.h                   | 11 +----------
>  3 files changed, 3 insertions(+), 12 deletions(-)

Reviewed-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
