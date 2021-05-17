Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA7A386C7C
	for <lists+linux-i2c@lfdr.de>; Mon, 17 May 2021 23:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238170AbhEQVpI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 May 2021 17:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhEQVpH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 May 2021 17:45:07 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E98C061573;
        Mon, 17 May 2021 14:43:50 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso329557wmm.3;
        Mon, 17 May 2021 14:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kT6r2KItAdyXr6Yj4HdvbNeNJJn3Kyatb3yqGTbZ49U=;
        b=t774CtYem/0kL0GO8c0Bs8Binz7Qh2ivYr4qAbt8k4M/ZEpxVwVSn7PxZKdCCfDPWI
         XIgkJMHsFbL7qrWvQPHwg5hv+RiSmkr2GUqw7gLFzExzf0ujDt6WqjWkeDL9ZlT/DeY1
         8MlFE+jjXUFRRdXRsPWDlpZnZZYIAaZNXHiKwek3g/XSWHNQrIQ0zem5rm9WEZ/Gzxap
         Djjllf7Hbput/A9u2DDd2elcAwPIxBQMY3ST6R3TRtUat/N3bz6agPjrcHVswLkdXStY
         vMDLot3oqKh8L0fMl2fNZTlUullwqPLKCJsEz/s2g++bn7UXXm3/RimqHr7fisUEpRQk
         bEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kT6r2KItAdyXr6Yj4HdvbNeNJJn3Kyatb3yqGTbZ49U=;
        b=Haqh+uZSyT7eQyzZd/oRGqdlal2DB3M8phbyTBljlIbKluaX5LYIhXv9Vxd4B5cVSd
         o7U1pTvkFq4fYHDuRyCO4ERh/020vy12EijRdJNIGPHPVOqZOpooeUs855lFQUj+7e5n
         sGZb5DBIdVHodKEJhAa+V0Ax9G00+7krJ75QOixE3AMinzfp9/R5Zb8RMoq2BWQI+1fy
         KkIOFfxBsXOtU2Tq5ms5UonvNa/Z8T5nImCNWT0DO7rQoVECIuZHQxvnQY4tyil3V53g
         2v4LNlv304VvoS6hxSe8jGJIU1rmLrW/W5x3CZ4o/NxGV2+x5q+v+KYtNAoDvo5oUYOX
         PqNw==
X-Gm-Message-State: AOAM533BopXfV16uHThuzvHBXwAeBkh/90fZt/55kYXs7aDkr+Mp/JSg
        H8E4sKVFmtsWlk9GixAb0eCgnebUUxHMmQ==
X-Google-Smtp-Source: ABdhPJz2ABsZ8o6YhIcD0a0iLMmS93uLHc4hH1gSeT5wk1jKbW0GKfSe05V0FUr/5hs+hSkuknD6vw==
X-Received: by 2002:a1c:f303:: with SMTP id q3mr1079231wmq.9.1621287829079;
        Mon, 17 May 2021 14:43:49 -0700 (PDT)
Received: from [192.168.1.158] ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id u16sm748429wmj.27.2021.05.17.14.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 14:43:48 -0700 (PDT)
Subject: Re: [PATCH v3 5/6] platform/x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>, me@fabwu.ch,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        devel@acpica.org
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-6-djrscally@gmail.com>
 <CAHp75Vd2Dc2Poq7VNRXRT-0VjkYdEFY2WKpz8fWpAQViQRO4jA@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <0241df24-11cb-fd3b-12a5-f98dea55fac5@gmail.com>
Date:   Mon, 17 May 2021 22:43:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd2Dc2Poq7VNRXRT-0VjkYdEFY2WKpz8fWpAQViQRO4jA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

On 22/02/2021 14:58, Andy Shevchenko wrote
>> +#include <linux/clk-provider.h>
> 
> This is definitely not for *.h. (Not all C files needed this)
> 
>> +#include <linux/gpio/machine.h>
> 
> Ditto.
> 
>> +#include <linux/regulator/driver.h>
>> +#include <linux/regulator/machine.h>
> 
> Ditto.

Bit more delayed than I wanted to be, but I'm just finishing off the v4
of this. For these includes, I'm using the actual structs from them
rather than pointers, so removing these would mean moving the definition
of struct int3472_discrete_device into one of the source files; you're
happy with that?
