Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80E647198B
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Dec 2021 10:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbhLLJ5Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Dec 2021 04:57:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhLLJ5Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Dec 2021 04:57:24 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D8CC061714
        for <linux-i2c@vger.kernel.org>; Sun, 12 Dec 2021 01:57:24 -0800 (PST)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1mwLbe-0000Rx-Hk; Sun, 12 Dec 2021 10:57:22 +0100
Message-ID: <3472bee7-9974-ed13-1d56-79a08d4073f7@leemhuis.info>
Date:   Sun, 12 Dec 2021 10:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [bisected][regression] Applications that need amdgpu doesn't run
 after waking up from suspend
Content-Language: en-BS
To:     "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <1295184560.182511.1639075777725.ref@mail.yahoo.com>
 <1295184560.182511.1639075777725@mail.yahoo.com>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <1295184560.182511.1639075777725@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1639303044;0de1c0b6;
X-HE-SMSGID: 1mwLbe-0000Rx-Hk
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[TLDR: adding this regression to regzbot; most of this mail is compiled
from a few templates paragraphs some of you might have seen already.]

Hi, this is your Linux kernel regression tracker speaking.

Thanks for the report.

Adding the regression mailing list to the list of recipients, as it
should be in the loop for all regressions, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

To be sure this issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced 5a7b95fb993ec399c8a685552aa6a8fc995c40bd
#regzbot title drm: amdgpu: apps that need amdgpu do not start after
system is woken from suspend
#regzbot ignore-activity

Reminder: when fixing the issue, please add a 'Link:' tag with the URL
to the report (the parent of this mail), then regzbot will automatically
mark the regression as resolved once the fix lands in the appropriate
tree. For more details about regzbot see footer.

Sending this to everyone that got the initial report, to make all aware
of the tracking. I also hope that messages like this motivate people to
directly get at least the regression mailing list and ideally even
regzbot involved when dealing with regressions, as messages like this
wouldn't be needed then.

Don't worry, I'll send further messages wrt to this regression just to
the lists (with a tag in the subject so people can filter them away), as
long as they are intended just for regzbot. With a bit of luck no such
messages will be needed anyway.

Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave thus might sent someone reading this down the wrong
rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.

On 09.12.21 19:49, Tareque Md.Hanif wrote:
> Hi,
> I am getting some issues listed below when waking up from suspend on my
> laptop.
> 
> Issues:
> 1. After waking up from suspend in my laptop, anytime I open a game, the
> window is just blank. But it works after reboot or if I don't suspend
> the system.
> 2. The system takes almost 7-8 seconds to wake up in 5.14 or later but
> it's almost instant in 5.13 .
> 3. If the laptop is connected with AC and then suspended and woken up,
> there are no issues. This issue occurs if laptop is running on battery.
> 
> No issues in Kernel 5.13.13 and the issues exist in 5.14 to 5.15.7 . So
> I bisected the bug with
> git(https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux).
> first bad commit: [5a7b95fb993ec399c8a685552aa6a8fc995c40bd] i2c: core:
> support bus regulator controlling in adapter
> 
> I have attached full journalctl output of starting the system, then
> suspend, then wake up and then running `DRI_PRIME=1 glxgears` (which
> make my monitor 1fps) and then shutdown. I have also attached lsmod and
> lspci output.
> 
> Kernel version: Linux version 5.15.7-arch1-1 (linux@archlinux) (gcc
> (GCC) 11.1.0, GNU ld (GNU Binutils) 2.36.1) #1 SMP PREEMPT Wed, 08 Dec
> 2021 14:33:16 +0000
> 
> Device Information:
> Laptop model: Dell Inspiron 15 5567
> GPU 0: Intel HD Graphics 620
> GPU 1: AMD ATI Radeon R7 M445
> 
> Regards,
> Tareque Md Hanif.
>  

