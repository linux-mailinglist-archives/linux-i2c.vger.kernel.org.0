Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC9A2D90FC
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Dec 2020 23:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731614AbgLMWtZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Dec 2020 17:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728955AbgLMWtZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Dec 2020 17:49:25 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0202C0613CF;
        Sun, 13 Dec 2020 14:48:44 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id y17so14592074wrr.10;
        Sun, 13 Dec 2020 14:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/WorH3BnykMxRTvls0BDQbtEUswMG/rB3w2zpNBPDJ4=;
        b=bVQjfb6v6Vmy52tG903p9j8aSsoKAVtCyvWNu6QxISsUzJkl3rhsxgTOdA91pbDdEx
         6Dy5pGneJizXvZqR1n67PIm8/Gy4otg0Lp4y3oL7tO1lx18qLTgHD7guWfHNDrU3p+BQ
         h/A1gd2+oQyR7UyZsEVXOzv/cXIIQKxq93wdcjYZqtx9haI3nFF4bQAiYKtEq8PLd/v5
         KILnHmIp43IUhPSUno+kQgS6ppYOW3rO4t7E3PvQ6n4LkMSlu9MAh7yvd3UdnOrQIBsE
         8yY7ZNMv8ZorlksHWrxJbWNep7u/dsMOTP47eDGrtClSdZJXhh6dUtFxxRM/pgFmo7DB
         SdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/WorH3BnykMxRTvls0BDQbtEUswMG/rB3w2zpNBPDJ4=;
        b=osPqUES/GP8FjKyj0Lr9M4oPDa+tO9FAfU/tXKY6TOUEQADsWckQUidp87PPMqlwHM
         RcXQ4CnsNEbA5MIAY7/YSB7afGzYlWmliXEqVvczIBVezAL/3adyC8bB2ZnefQa5yQ0J
         iqgqIt1FMJCQZ2hoMnq217YD3AdCm+yLTjeeOgLqPe7qYMHEVNsHpSq0+8JNpQDosUFS
         1G8eok1aZXcq/iHfVtseR3Mjo3Ie0TNkRgzFvZ1hBqiiO2QcE7/rAYIAsUr+f8Kfi42o
         E2L3PXtr7PHRlSA68d3VIPse1LfpdkTfT0CunwUbsBHpfb7F8vcULbin9ApJckFSyHu5
         H3xw==
X-Gm-Message-State: AOAM533ITu4vXEdPdgHZWja9QFspZKh1cG0KEGPif3oSgAopQ2IJ/FZR
        Y/wwUd+z0XUOl9fWPs2kOqs=
X-Google-Smtp-Source: ABdhPJxd/kl+xA0aHJWlDHhHlvpnfNUYRoSkXF/Sx8DbHXoI/4Gr9adJHVY9orF5gWFX9kmMvGczRQ==
X-Received: by 2002:adf:f605:: with SMTP id t5mr25416354wrp.39.1607899723586;
        Sun, 13 Dec 2020 14:48:43 -0800 (PST)
Received: from [192.168.1.158] ([2.29.208.56])
        by smtp.gmail.com with ESMTPSA id y130sm29246086wmc.22.2020.12.13.14.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Dec 2020 14:48:42 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
 <20201201184925.GJ4077@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <6f3b0d7b-1ce7-aaf1-63c6-08a22dc77791@gmail.com>
Date:   Sun, 13 Dec 2020 22:48:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201184925.GJ4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01/12/2020 18:49, Andy Shevchenko wrote:
>>>> +	table_entry = (struct gpiod_lookup)GPIO_LOOKUP_IDX(acpi_dev_name(adev),
>>>> +							   ares->data.gpio.pin_table[0],
>>>> +							   func, 0, GPIO_ACTIVE_HIGH);
>>>
>>> You won't need this if you have regular INT3472 platform driver.
>>> Simple call there _DSM to map resources to the type and use devm_gpiod_get on
>>> consumer behalf. Thus, previous patch is not needed.
>>
>> How does the consumer (the camera sensor) retrieve the GPIO though ? The
>> _DSM is in the PMIC device object, while the real consumer is the camera
>> sensor.
> 
> 1. A GPIO proxy
> 2. A custom GPIO lookup tables
> 3. An fwnode passing to the sensor (via swnodes graph)
> 
> First may issue deferred probe, while second needs some ordering tricks I guess.
> Third one should also provide an ACPI GPIO mapping table or so to make the
> consumer rely on names rather than custom numbers.
> 
> Perhaps someone may propose other solutions.

Hi Andy

Sorry; some more clarification here if you have time please:

1. Do you mean here, register a new gpio_chip providing GPIOs to the
sensors, and just have the .set() callback for that function set the
corresponding line against the INT3472 device?
2. I thought custom GPIO lookup tables was what I was doing, are you
referring to something else?
3. I guess you mean something like of_find_gpio() and acpi_find_gpio()
here? As far as I can see there isn't currently a swnodes
equivalent...we could just pass it via reference of course but it would
mean the sensor drivers would all need to account for that.
