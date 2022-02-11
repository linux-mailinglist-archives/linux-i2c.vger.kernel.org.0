Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C30204B22B8
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 11:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348409AbiBKKD4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 05:03:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235417AbiBKKD4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 05:03:56 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D677DE6E;
        Fri, 11 Feb 2022 02:03:54 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: shreeya)
        with ESMTPSA id C68F61F46C0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1644573833;
        bh=EFWC4KDHDq8iIszJtQjvd2nEkpU5s9EQ1vyKADI1IXg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MaCgPIWeVDpK6yQTs4fqczqKXoTBqfoRqIbHrFl36PoVAQ8KJtjxxb4Iw8RcuNw+m
         RTiAIUzykLbjzQ++TSm38i9TJtJkJ1WkS2ltrq3jg5jR1vkisV4hgkQpIMO9b/0eTI
         9YFlCUKxQMtUCydgiO28ZA6mi8qmzrxlJFFlOrSuoGyEKdTBSn/0yBZfxGgtqQo1YC
         FxpOD11Y3MGlNZFvjn4g/Ovtrv5AMfJINjLZPeDm2o3sGA81pba6meEfYyi2iuaYvM
         jlmqtsbke8p6QyADoqHyfs6UmGuXv0UDAVlDENQJL4DMVtmQO+kQQ8mnxBeWDSePXZ
         GWHinXtxc3xHw==
Subject: Re: [PATCH v4] gpio: Return EPROBE_DEFER if gc->to_irq is NULL
To:     Gabriel Krisman Bertazi <krisman@collabora.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        wsa@kernel.org, kernel@collabora.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
References: <20211116093833.245542-1-shreeya.patel@collabora.com>
 <874k56znix.fsf@collabora.com>
 <CAMRc=MdByxO3+hJruvUkULtXAaB7aWewTd=Wv0MbWyX2vykdjA@mail.gmail.com>
 <87v8xmxkg7.fsf@collabora.com>
From:   Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <fb31ea17-2ec2-4acf-94b8-03e850a4c256@collabora.com>
Date:   Fri, 11 Feb 2022 15:33:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87v8xmxkg7.fsf@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 11/02/22 6:56 am, Gabriel Krisman Bertazi wrote:
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
>> My email address changed in September, that's why I didn't see the
>> email you sent in November to my old one.
> Hi Bart,
>
> thanks for the prompt reply and sorry for the wrong email address.
>
>> gpiod_to_irq() can be used in context other than driver probing, I'm
>> worried existing users would not know how to handle it. Also: how come
>> you can get the GPIO descriptor from the provider but its interrupts
>> are not yet set up?
> I'm definitely some context here, as its been quite a while.
> Shreeya, feel free to pitch in. :)


Existing users will probably receive -ENXIO in case to_irq is not
set and wasn't intended to be set.
We are trying to solve the race which happens frequently in cases
where I2C is set as built-in and pinctrl-amd is set as module.
There is no dependency between I2C and pinctrl-amd, while pinctrl-amd is
still trying to set the gc irq members through gpiochip_add_irqchip, I2C
calls gpiod_to_irq() which leads to returning -ENXIO since gc->to_irq is 
still NULL


There have also been cases where gc->to_irq is set successfully but 
other members
are yet to be initalized by gpiochip_add_irqchip like the domain 
variable which is
being used in .to_irq() and ultimately leads to a NULL pointer 
dereference as Gabriel
mentioned. I am working on a fix which would use mutex to not let gc irq 
members
be accessed until they all have been completely initialized.

I2C calls gpiod_to_irq through the following stack trace

kernel: Call Trace:
kernel:  gpiod_to_irq.cold+0x49/0x8f
kernel:  acpi_dev_gpio_irq_get_by+0x113/0x1f0
kernel:  i2c_acpi_get_irq+0xc0/0xd0
kernel:  i2c_device_probe+0x28a/0x2a0
kernel:  really_probe+0xf2/0x460
kernel:  driver_probe_device+0xe8/0x160

and pinctrl-amd makes gc visible through gpiochip_add_data_with_key()


Thanks,
Shreeya Patel


> This is one of the races we saw in gpiochip_add_irqchip, depending on
> the probe order.  The gc is already visible while partially initialized,
> if pinctrl-amd hasn't been probed yet.  Another device being probed can
> hit an -ENXIO here if to_irq is yet uninitialized or enter .to_irq() and
> oops.  Shreeya's patch workarounds the first issue, but is not a
> solution for the second.
>
> There is another patch that has been flying around to address the Oops.
>
> https://lkml.org/lkml/2021/11/8/900
>
> She's been working on a proper solution for that one, which might
> actually address this too and replace the current patch.  Maybe you
> could help us get to a proper solution there?  I'm quite unfamiliar with
> this code myself :)
>
