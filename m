Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9832143299E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Oct 2021 00:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhJRWRH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 18:17:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39640 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhJRWRH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Oct 2021 18:17:07 -0400
Received: from [IPv6:2401:4900:1c20:2044:d49c:4fd9:7471:bb74] (unknown [IPv6:2401:4900:1c20:2044:d49c:4fd9:7471:bb74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: shreeya)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2CD7D1F4128C;
        Mon, 18 Oct 2021 23:14:53 +0100 (BST)
Subject: Re: [PATCH] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>, kernel@collabora.com
References: <20211014110437.64764-1-shreeya.patel@collabora.com>
 <CACRpkdbwx+6xB0=rwm60=2jM4OfyDKxkwAEZMgU=10LuijsW1A@mail.gmail.com>
From:   Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <b88701a1-65eb-83ce-81f5-9e400294cf12@collabora.com>
Date:   Tue, 19 Oct 2021 03:44:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbwx+6xB0=rwm60=2jM4OfyDKxkwAEZMgU=10LuijsW1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 14/10/21 10:21 pm, Linus Walleij wrote:
> On Thu, Oct 14, 2021 at 1:05 PM Shreeya Patel
> <shreeya.patel@collabora.com> wrote:
>
>> We are racing the registering of .to_irq when probing the
>> i2c driver. This results in random failure of touchscreen
>> devices.
>>
>> Following errors could be seen in dmesg logs when gc->to_irq is NULL
>>
>> [2.101857] i2c_hid i2c-FTS3528:00: HID over i2c has not been provided an Int IRQ
>> [2.101953] i2c_hid: probe of i2c-FTS3528:00 failed with error -22
>>
>> To avoid this situation, defer probing until to_irq is registered.
>>
>> This issue has been reported many times in past and people have been
>> using workarounds like changing the pinctrl_amd to built-in instead
>> of loading it as a module or by adding a softdep for pinctrl_amd into
>> the config file.
>>
>> References :-
>> https://bugzilla.kernel.org/show_bug.cgi?id=209413
>> https://github.com/Syniurge/i2c-amd-mp2/issues/3
>>
>> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> I understand the issue.
>
> There is one problem.
>
>> @@ -3084,7 +3084,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
>>
>>                  return retirq;
>>          }
>> -       return -ENXIO;
>> +       return -EPROBE_DEFER;
> If you after five minutes plug in a USB FTDI or similar UART thing
> with a GPIO expander, and someone request an IRQ from
> one of those lines (they do not support interrupts), why should
> it return -EPROBE_DEFER?
>
> The point is that I think this will in certain circumstances return
> a bogus error.

I was worried about the same but didn't really know under what scenario 
this could occur.
Thanks for pointing this out.

>
> We cannot merge this other than with a fat comment above:
>
> /*
>   * This is semantically WRONG because the -EPROBE_DEFER
>   * is really just applicable during system bring-up.
>   */
> return -EPROBE_DEFER;
>
> Can we use some kind of late_initcall() to just switch this over
> to -ENXIO after a while?


I have sent a v2 which tries to fix this in an easy way. Let me know 
what do you
think about that approach or else we could also think about using 
late_initcall().



Thanks,
Shreeya Patel


> Yours,
> Linus Walleij
