Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF6FD4AD1A4
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 07:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347620AbiBHGhc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 01:37:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347615AbiBHGhc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 01:37:32 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04DCC0401F1;
        Mon,  7 Feb 2022 22:37:31 -0800 (PST)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1nHK80-00008M-MC; Tue, 08 Feb 2022 07:37:28 +0100
Message-ID: <80db7043-b854-ed20-16aa-e25552e0748e@leemhuis.info>
Date:   Tue, 8 Feb 2022 07:37:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: 5.17-rc regression: X1 Carbon touchpad not resumed
Content-Language: en-BS
To:     Hugh Dickins <hughd@google.com>,
        Derek Basehore <dbasehore@chromium.org>
Cc:     Rajat Jain <rajatja@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1644302251;6714fcf3;
X-HE-SMSGID: 1nHK80-00008M-MC
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[TLDR: I'm adding the regression report below to regzbot, the Linux
kernel regression tracking bot; all text you find below is compiled from
a few templates paragraphs you might have encountered already already
from similar mails.]

Hi, this is your Linux kernel regression tracker speaking.

On 07.02.22 20:45, Hugh Dickins wrote:
> 5.17-rc[1-3] on Lenovo ThinkPad X1 Carbon 5th gen: when lid closed
> and opened and system resumed, the touchpad cursor cannot be moved.
> 
> Some dmesg from bootup:
> [    2.211061] rmi4_smbus 6-002c: registering SMbus-connected sensor
> [    2.263809] ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-95)
> [    2.291782] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: TM3289-002, fw id: 2492434
> [    2.371377] input: Synaptics TM3289-002 as /devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/input/input8
> [    2.380820] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
> ...
> [    2.725471] input: PS/2 Generic Mouse as /devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/rmi4-00.fn03/serio2/input/input9
> 
> Some dmesg from resume:
> [   79.221064] rmi4_smbus 6-002c: failed to get SMBus version number!
> [   79.265074] rmi4_physical rmi4-00: rmi_driver_reset_handler: Failed to read current IRQ mask.
> [   79.308330] rmi4_f01 rmi4-00.fn01: Failed to restore normal operation: -6.
> [   79.308335] rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
> [   79.308339] rmi4_physical rmi4-00: Failed to suspend functions: -6
> [   79.308342] rmi4_smbus 6-002c: Failed to resume device: -6
> [   79.351967] rmi4_physical rmi4-00: Failed to read irqs, code=-6
> 
> Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
> ("i2c: enable async suspend/resume on i2c client devices")
> and reverting that fixes it for me.

Thanks for the report.

To be sure this issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced 172d931910e1db800f4e71e8ed92281b6f8c6ee2
#regzbot title i2c/input/hid: X1 Carbon touchpad not resumed
#regzbot ignore-activity

Reminder for developers: when fixing the issue, please add a 'Link:'
tags pointing to the report (the mail quoted above) using
lore.kernel.org/r/, as explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'. This allows the bot to connect
the report with any patches posted or committed to fix the issue; this
again allows the bot to show the current status of regressions and
automatically resolve the issue when the fix hits the right tree.

I'm sending this to everyone that got the initial report, to make them
aware of the tracking. I also hope that messages like this motivate
people to directly get at least the regression mailing list and ideally
even regzbot involved when dealing with regressions, as messages like
this wouldn't be needed then.

Don't worry, I'll send further messages wrt to this regression just to
the lists (with a tag in the subject so people can filter them away), if
they are relevant just for regzbot. With a bit of luck no such messages
will be needed anyway.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

-- 
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
CC the regression list and tell regzbot about the issue, as that ensures
the regression makes it onto the radar of the Linux kernel's regression
tracker -- that's in your interest, as it ensures your report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include 'Link:' tag in the patch descriptions pointing to all reports
about the issue. This has been expected from developers even before
regzbot showed up for reasons explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'.
