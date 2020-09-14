Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79542691FF
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 18:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbgINQqZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 12:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgINQoG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Sep 2020 12:44:06 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB31C06174A;
        Mon, 14 Sep 2020 09:43:43 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id i17so516864oig.10;
        Mon, 14 Sep 2020 09:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lXMk4QeQIMhGNoMx4cVDajUP7rFeHi/N5faNXUWz4B8=;
        b=fhkF0ai/iqsFgS5J0BSy3VjIz0gdC22qT46YgH3DCATOjggT4rXpOAv0Rbw0BbkhcI
         UdCwm8nMkjg0d94M2F07TCZXlz+n62fvzLs0gxwKvpF+srZI8D1UMkL6Yci0CDpGs6bf
         KG56cmwEXNo3f1K9asd3qMLXcjP+CCWexbJ7+5Udj9fCnsrTSsw8Qy4O4RjlbIQyFQpZ
         /DFHa0xZHUVpDYEZNRcZ13Ee/lLrB3mbVZ0iR31T7fbge+487e+5+BoqwlvcvN6q8IUW
         jyQxhlnNq8U51NYZmytctqTrfZJyH3L9cMS5iiUTzLVV8l6Ey9LzGuM8TGm4qEawp+KU
         o9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lXMk4QeQIMhGNoMx4cVDajUP7rFeHi/N5faNXUWz4B8=;
        b=jK+IINQe+jrl/0liyMq5lBe5ipluMFy3bv9ADPSh1eEVfTzxoeJVJdZo7TXvxrPZLf
         JErJofHvligp6QgK4ccXbmHOljGV0OKPIttd42DPiXRKoZLUCfvd7Jbh0JX66HZndKgX
         ip97dNrZTSwJDRMPy17mJuNafUuf4yI2tZL67MnxbLBGrUyOkHlwz9fN4Kzdzvj5Qcsr
         UFl26p0Pi+5Jj+rEmTATOTXsX05iGKFJnqLY3mNAHhtE6rP+AaYYYh2xHM9gBOAjA78Z
         zQexqfwguraUd9/s+B4xl2ThZmzaNVGaQdFoxtdqBWKyaDZDejIS+54Ox7slRN8G1pzu
         eYBg==
X-Gm-Message-State: AOAM530YPmmne/9mRCBGnSabu3VhwgC7sq+XFwUY18hLzoH340H5S73Y
        ecY2hL8g6PK94tyRbzuStQkb4C1I6Bk=
X-Google-Smtp-Source: ABdhPJxzV/HiPhato6PguWo5Vrm/DcxOZrM7TdwbM6gHDFnHMsDr9pbWK9WSj8zX9lX/PlQpWq4jlg==
X-Received: by 2002:aca:c7d6:: with SMTP id x205mr161324oif.51.1600101822235;
        Mon, 14 Sep 2020 09:43:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v7sm3951468oie.9.2020.09.14.09.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 09:43:41 -0700 (PDT)
Subject: Re: [RFC PATCH 0/2] Throttle I2C transfers to UCD9000 devices
To:     Andrew Jeffery <andrew@aj.id.au>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     jdelvare@suse.com, wsa@kernel.org, joel@jms.id.au,
        linux-kernel@vger.kernel.org
References: <20200914122811.3295678-1-andrew@aj.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e7a64983-fe1d-1ba2-b0c3-ae4a791f7a75@roeck-us.net>
Date:   Mon, 14 Sep 2020 09:43:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200914122811.3295678-1-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/14/20 5:28 AM, Andrew Jeffery wrote:
> Hello,
> 
> While working with system designs making use of TI's UCD90320 Power
> Sequencer we've found that communication with the device isn't terribly
> reliable.
> 
> It appears that back-to-back transfers where commands addressed to the
> device are put onto the bus with intervals between STOP and START in the
> neighbourhood of 250us or less can cause bad behaviour. This primarily
> happens during driver probe while scanning the device to determine its
> capabilities.
> 
> We have observed the device causing excessive clock stretches and bus
> lockups, and also corruption of the device's volatile state (requiring it
> to be reset).  The latter is particularly disruptive in that the controlled
> rails are brought down either by:
> 
> 1. The corruption causing a fault condition, or
> 2. Asserting the device's reset line to recover
> 
> A further observation is that pacing transfers to the device appears to
> mitigate the bad behaviour. We're in discussion with TI to better
> understand the limitations and at least get the behaviour documented.
> 
> This short series implements the mitigation in terms of a throttle in the
> i2c_client associated with the device's driver. Before the first
> communication with the device in the probe() of ucd9000 we configure the
> i2c_client to throttle transfers with a minimum of a 1ms delay (with the
> delay exposed as a module parameter).
> 
> The series is RFC for several reasons:
> 
> The first is to sus out feelings on the general direction. The problem is
> pretty unfortunate - are there better ways to implement the mitigation?
> 
> If there aren't, then:
> 
> I'd like thoughts on whether we want to account for i2c-dev clients.
> Implementing throttling in i2c_client feels like a solution-by-proxy as the
> throttling is really a property of the targeted device, but we don't have a
> coherent representation between platform devices and devices associated
> with i2c-dev clients. At the moment we'd have to resort to address-based
> lookups for platform data stashed in the transfer functions.
> 
> Next is that I've only implemented throttling for SMBus devices. I don't
> yet have a use-case for throttling non-SMBus devices so I'm not sure it's
> worth poking at it, but would appreciate thoughts there.
> 
> Further, I've had a bit of a stab at dealing with atomic transfers that's
> not been tested. Hopefully it makes sense.
> 
> Finally I'm also interested in feedback on exposing the control in a little
> more general manner than having to implement a module parameter in all
> drivers that want to take advantage of throttling. This isn't a big problem
> at the moment, but if anyone has thoughts there then I'm happy to poke at
> those too.
> 

As mentioned in patch 2/2, I don't think a module parameter is a good idea.
I think this should be implemented on driver level, similar to zl6100.c,
it should be limited to affected devices and not be user controllable.

In respect to implementation in the i2c core vs in drivers: So far we
encountered this problem for some Zilker labs devices and for some LTC
devices. While the solution needed here looks similar to the solution
implemented for Zilker labs devices, the solution for LTC devices is
different. I am not sure if an implementation in the i2c core is
desirable. It looks quite invasive to me, and it won't solve the problem
for all devices since it isn't always a simple "wait <n> microseconds
between accesses". For example, some devices may require a wait after
a write but not after a read, or a wait only after certain commands (such
as commands writing to an EEPROM). Other devices may require a mechanism
different to "wait a certain period of time". It seems all but impossible
to implement a generic mechanism on i2c level.

Thanks,
Guenter

> Please review!
> 
> Andrew
> 
> Andrew Jeffery (2):
>   i2c: smbus: Allow throttling of transfers to client devices
>   hwmon: (pmbus/ucd9000) Throttle SMBus transfers to avoid poor
>     behaviour
> 
>  drivers/hwmon/pmbus/ucd9000.c |   6 ++
>  drivers/i2c/i2c-core-base.c   |   8 +-
>  drivers/i2c/i2c-core-smbus.c  | 149 +++++++++++++++++++++++++++-------
>  drivers/i2c/i2c-core.h        |  22 +++++
>  include/linux/i2c.h           |   3 +
>  5 files changed, 157 insertions(+), 31 deletions(-)
> 

