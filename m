Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B232CD57D
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 13:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgLCM0S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 07:26:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730297AbgLCM0R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Dec 2020 07:26:17 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D89AC061A4E;
        Thu,  3 Dec 2020 04:25:37 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p8so1683621wrx.5;
        Thu, 03 Dec 2020 04:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xQY5AbzujeliSiWY2E/G4LEsHJG3L2qcBmGWXG44TV4=;
        b=CQnUcBAS2skp/TXF3SD6blZcjbwS5Rl+nd+ZnQB+o8GST+cCkfbQxi+NvgnrOYj9b1
         Mz8lbBe3WDUMywvVP7qv0EygFJ4OoklVewUKFA91MaLqxKAD/wL0j+WxVPC8pkc/KnJD
         tCo8XmVsSNexBZzpQ3+a8C26iRe/wYsAxXz2nnwoUYHdb2kcXPBNRjiZoRGU6oFo7G+4
         m7I3yik0vBvBKew9GlWXjsrSi8WinBSsv102KAVI/Yugw90oYNQIAXMQI4HZ5jv2jQeX
         nbway0x6c3pwxG7WVxOMPcDupcZT01ALcVJyjfHswc5H5ORmDDFjd/e9fzhLHAIGJ8bb
         5naA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xQY5AbzujeliSiWY2E/G4LEsHJG3L2qcBmGWXG44TV4=;
        b=nk/nNlF3KEPrrFBZGIi5xkNvGIW2WOMVGNBosl2FW24jjVB/82e8nQ0VaUPuEWHG5f
         BvkyweqW+ZJdC+Rt7NWKfMWK0Xo8IxcL0cQYVUkUG3FiOMEusJs2P2LfHBSIwYWs74ZP
         P83ZjRy2ZbRqhPFZPHSBXVnj5z58kSDpwiUquICixvjuR0fj3yUHjcVSLGNZxrURolPm
         1XzJOOkC/9Ts/hvmdEAo3mHam/ZqSl9fscdxfo8ARsOnJhCMhzHVOA5KRe8Ch+zcTLtp
         +hvHWRn0akxv7nkDPWCIh7MiNerXUKMNxlRmMKfAs8UwkVnIPNO6CAk6J+yhL1D9irGX
         pqNA==
X-Gm-Message-State: AOAM533y6K/+oLVGkZVL+RxevjmHHdDQ1SuHCF02U1/bn+sqdWbH4JYR
        szJRZpxnkh+dXVNkqxQTLQY=
X-Google-Smtp-Source: ABdhPJyKOeFWO0jrA2mT1UQ2VqaNnYXsenWU01+yH9N1p3sy7QqnRJnqZoNYkhxfeEqPxNnBrcYZKA==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr3535666wrv.170.1606998335845;
        Thu, 03 Dec 2020 04:25:35 -0800 (PST)
Received: from [192.168.1.211] ([2.31.225.57])
        by smtp.gmail.com with ESMTPSA id o67sm1361569wmo.31.2020.12.03.04.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 04:25:35 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
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
 <4181e6a6-a60f-0a2b-1b46-13a2359d8753@gmail.com>
 <20201202093952.GU4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <56008891-9b86-f318-aae0-1ea36bc2a0eb@gmail.com>
Date:   Thu, 3 Dec 2020 12:25:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202093952.GU4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/12/2020 09:39, Andy Shevchenko wrote:
> On Tue, Dec 01, 2020 at 08:59:53PM +0000, Dan Scally wrote:
>> On 01/12/2020 18:49, Andy Shevchenko wrote:
> 
> ...
> 
>>> Seems we can do this, by locating intel_int3472.c under PDx86 hood and dropping
>>> ACPI ID table from TPS68470 MFD driver. The PMIC can be instantiated via
>>> i2c_acpi_new_device() (IIRC the API name).
>>>
>>> And actually it makes more sense since it's not and MFD and should not be there.
>>>
>>> (Dan, patch wise the one creates intel_int3472.c followed by another one that
>>>  moves ACPI ID from PMIC and introduces its instantiation via I²C board info
>>>  structure)
>>
>> I'm mostly following this, but why would we need an i2c_board_info or
>> i2c_acpi_new_device()? The INT3472 entries that refer to actual tps68470
>> devices do have an I2cSerialBusV2 enumerated in _CRS so in their case
>> there's an i2c device registered with the kernel already.
> 
> Because as we discussed already we can't have two drivers for the same ID
> without a big disruption in the driver(s).
> 
> If you have a single point of enumeration, it will make things much easier
> (refer to the same intel_cht_int33fe driver you mentioned earlier).
> 
> I just realize that the name of int3472 should follow the same pattern, i.e.
> intel_skl_int3472.c

Ah! I didn't read intel_cht_int33fe_common.c before, just the typec.c.
Having reviewed common I think I'm clear on the method now, thank you :)


>> I think we need those things when we get round to handling the
>> VCM/EEPROM that's hidden within the sensor's ACPI entry, but I've not
>> done any work on that yet at all.
> 
> Let's consider this later — one step at a time.

Agree!

