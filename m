Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F39032C23F
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Mar 2021 01:04:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386869AbhCCXIH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Mar 2021 18:08:07 -0500
Received: from air.basealt.ru ([194.107.17.39]:51952 "EHLO air.basealt.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1582433AbhCCKVh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Mar 2021 05:21:37 -0500
Received: by air.basealt.ru (Postfix, from userid 490)
        id 26C8C58943D; Wed,  3 Mar 2021 10:11:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
        sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from nickel-ws.localdomain (obninsk.basealt.ru [217.15.195.17])
        by air.basealt.ru (Postfix) with ESMTPSA id 46B3258943B;
        Wed,  3 Mar 2021 10:11:50 +0000 (UTC)
Reply-To: nickel@basealt.ru
Subject: Re: Need some help on "Input: elantech - add LEN2146 to SMBus
 blacklist for ThinkPad L13 Gen2"
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "jingle.wu" <jingle.wu@emc.com.tw>
References: <0d1eaadd-5350-63a4-fe6d-f8f357c49504@basealt.ru>
 <CAO-hwJLmByHHULhJF60qOUAqprkqZpSvVh-GFXLZ_ndL0guvPQ@mail.gmail.com>
 <e1fd99ae-8e46-0b21-1011-db73cd75523b@basealt.ru>
 <20210225093801.GA1008@ninjato>
From:   Nikolai Kostrigin <nickel@basealt.ru>
Organization: BaseALT
Message-ID: <3ffc29f8-cdf1-15fe-6406-28872bba5716@basealt.ru>
Date:   Wed, 3 Mar 2021 13:11:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225093801.GA1008@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

25.02.2021 12:38, Wolfram Sang пишет:
> Hi,
>
>> I had a preliminary discussion with Benjamin Tissoires and according to
>> our agreement I repost it for wider audience.
>> Blacklisting the device was decided to be a bad idea.
>> But actually I managed to get touchpad totally operational via SMBus
>> using a following hack:
>>
>> providing a parameter to i2c_i801 driver:
>>
>> modprobe i2c_i801 disable_features=0x2 (i.e. disable the block buffer).
> So, from an I2C perspective, there are two things to mention here:
>
> a) I am in the process of extending the I2C core to allow block
> transfers > 32 byte. This is a slow process, though, because we need to
> pay attention to not break userspace ABI. If this is done *and* the i801
> driver supports length > 32 bytes, too, then it would work natively. If
> the i801 can do this, this is a question for Jean Delvare.
>
> b) I don't know Elantech HW but there are devices out there which allow
> configuration for the block size. Something like a bit specifying if
> block transfers > 32 are allowed. Or the SMBus version to support. Block
> transfers > 32 are SMBus 3.0+ only. If your HW does not have that,
> disabling SMBus is an option, too. Disabling it in the i801 driver is
> too much of a hammer, I'd say.
>
> Hope this helps! Happy hacking,
>
>    Wolfram
Thank you for the information, Wolfram!

Finally it turned out that the solution was near me from the very
beginning, but I failed to check mainline code at that moment (which is
now 5.11).
Happily Jingle Wu has pointed me to a couple of  patches of his
(co-authored by Dmitry Torokhov):

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=next&id=056115daede8d01f71732bc7d778fb85acee8eb6

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=next&id=e4c9062717feda88900b566463228d1c4910af6d

I applied those to 5.10.17 and trackpoint works like a charm.
So I guess theese patches are worth being backported to the longterm
5.10 branch.
I'm really sorry for the noise.

-- 
Best regards,
Nikolai Kostrigin

