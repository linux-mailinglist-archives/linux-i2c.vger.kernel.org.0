Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAD2C4ABF10
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 14:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386950AbiBGNTi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 08:19:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442251AbiBGMUt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 07:20:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172BCDF8E3EC;
        Mon,  7 Feb 2022 04:07:01 -0800 (PST)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B2FC499;
        Mon,  7 Feb 2022 13:06:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644235617;
        bh=uH3r+Qyhm3NdERrDEidXSeR4RXvMj+L+e0iwChpe9eA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=X0ZFIBgrcyPspRGiprabJFQGAPllvw9rkYosOiAtQ8it/1sdpTdjN/XbbNE5n5b00
         hRSZH5PAYGhr0M7mSGyPct4Davqo6sqFlsu5oaDgse1FQehzu+OxFQtAdeCUXeDi2H
         +OJzJV7ZrUpVKmjHkxse+x87Lpt2QTBzAZ64aM2U=
Message-ID: <7e5af144-bd5f-cd0e-2109-49b318449a78@ideasonboard.com>
Date:   Mon, 7 Feb 2022 14:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFCv3 0/6] TI camera serdes and I2C address translation (Was:
 [RFCv3 0/6] Hi,)
Content-Language: en-US
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-media@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        matti.vaittinen@fi.rohmeurope.com
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220206115939.3091265-1-luca@lucaceresoli.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca,

On 06/02/2022 13:59, Luca Ceresoli wrote:
> this RFCv3, codename "FOSDEM Fries", of RFC patches to support the TI
> DS90UB9xx serializer/deserializer chipsets with I2C address translation.
> 
> I sent RFCv2 back in 2019 (!). After that I have applied most of the
> improvements proposed during code review, most notably device tree
> representation and proper use of kernel abstractions for clocks and GPIO. I
> have also done many improvements all over the drivers code.

Thanks for sending this! I'll have a closer look at the code in the near 
future.

> However I still don't consider these drivers "ready", hence the RFC status.
> 
> One reason is that, while the I2C ATR idea has been considered good by
> Wolfram, its implementation requires I2C core changes that have been tried
> but never made it to mainline. I think that discussion needs to be reopened
> and work has to be done on that side. Thus for the time being this code
> still has the alias pool: it is an interim solution until I2C core is
> ready.
> 
> Also be aware that the only hardware where I sould test this code runs a
> v4.19 kernel. I cannot guarantee it will work perfectly on mainline.
> 
> And since my hardware has only one camera connected to each deserializer I
> dropped support. However I wrote the code to be able to easily add support
> for 2 and 4 camera inputs as well as 2 CSI-2 outputs (DS90UB960).
 >
> Finally, I dropped all attempts at supporting hotplug. The goals I had 2+
> years ago are not reasonably doable even with current kernels. Luckily all
> the users that I talked with are happy without hotplug. For this reason I
> simplified the serializer management in the DS90UB954 driver by keeping the
> serializer always instantiated.
> 
> Even with the above limitations I felt I'd send this v3 anyway since
> several people have contacted me since v2 asking whether this
> implementation has made progress towards mainline. Some even improved on
> top of my code it their own forks. As I cannot afford to work on this topic
> in the near future, here is the latest and greatest version I can produce,
> with all the improvements I made so far.

I've discussed with Luca in private emails, but I'll add a short status 
about my work in this thread:

About a year ago I took Luca's then-latest-patches and started working 
on them. The aim was to get full multiplexed streams support to v4l2 so 
that we could support CSI-2 bus with multiple virtual channels and 
embedded data, and after that, add support for fpdlink devices.

Since then I have sent multiple versions of the v4l2 work (no drivers 
yet, only the framework changes) to upstream lists. Some pieces have 
already been merged to upstream (e.g. subdev state), but most of it is 
still under work. Here's a link to v10 of the streams series:

https://lore.kernel.org/all/20211130141536.891878-1-tomi.valkeinen@ideasonboard.com/

It has a link to my (now slightly outdated) git branch which contains 
the driver work too.

The fpdlink drivers have diverged from Luca's version quite a bit. The 
most obvious difference is the support for multiplexed streams, of 
course, but there are lots of other changes too. The drivers support 
DS90UB960 (no UB954 at the moment), DS90UB953 and DS90UB913. UB960 
supports all the inputs and outputs. I have also dropped some code which 
I did not need and which I wasn't sure if it's correctly implemented, to 
make it easier to work on the multiplexed streams version. Some of that 
code may need to be added back.

I have not changed the i2c-atr driver, and my fpdlink driver uses it 
more or less the same way as in Luca's version.

Considering that you're not able to work on this, my suggestion is to 
review the i2c-atr patches here (or perhaps send those patches in a 
separate series?), but afaics the fpdlink drivers without multiplexed 
streams is a dead-end, as they can only support a single camera (and no 
embedded data), so I don't see much point in properly reviewing them.

However, I will go through the fpdlink drivers in this series and 
cherry-pick the changes that make sense. I was about to start working on 
proper fpdlink-clock-rate and clkout support, but I see you've already 
done that work =).

But, of course, I'm open to other ideas on how to proceed.

  Tomi
