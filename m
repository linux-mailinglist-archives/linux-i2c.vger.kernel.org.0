Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE534419D4
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 11:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbhKAKaG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 06:30:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28000 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232033AbhKAKaF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 06:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635762451;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sbRv0LbOwweVcKPem1CDYmre/eBu7RPmgKjL80bCTNo=;
        b=L0vEIW8YoAmHcoztbqAS04R1wc0VrAoOZH7LBK+6Ps0HOvLcbrlKwBjUti4JsTGwzPAW1V
        I2YuPt16xjO5OD5ufdRpKt7ECJCT4+6vnEXlWgRj12mqp6AOaJbBCYgKfD724kWT+UvFt1
        wbEe/CPGO6sl7ZNk8ydah2Yn32zTAas=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-yhCZUZBSOHyW1L5w9-3f2Q-1; Mon, 01 Nov 2021 06:27:30 -0400
X-MC-Unique: yhCZUZBSOHyW1L5w9-3f2Q-1
Received: by mail-ed1-f71.google.com with SMTP id r25-20020a05640216d900b003dca3501ab4so15054221edx.15
        for <linux-i2c@vger.kernel.org>; Mon, 01 Nov 2021 03:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sbRv0LbOwweVcKPem1CDYmre/eBu7RPmgKjL80bCTNo=;
        b=n9ndNiIVulu3vOlj5HNqNBGcng66+q5q++FHKecH8kBMmzzfCbW/xNJoL0DAOTa4Tn
         n1ymBr2zYj3AsalCwJZcX79v1sdLrNb+JKoAXlZGF58aXhTY4ihtnMmw8BKFJyywBsZ3
         bpYL9mqICFKuKLkv4DiAzLcXOfdr8sIwz7OIPdi4yifvysxC0I7xHzgCNa5lYAc8j8rN
         2JsBfX5KCu+kpsVnPJLE3HuMo3AwrzR12omdTxxK5KDXHyQKndwKhCHBU+GaEzRAKysD
         gA1WNngrTj9HF7DuXsqJcKh2Qrlbjs5H/C29G6WgdZFxR+L3WjsYgn8AgDFUfNd5VIsc
         Q/PQ==
X-Gm-Message-State: AOAM532qnoXI+G0VZVZju/Gfme+ycPneQtaG4fqzRfWxXk6rNWHRyk/b
        LqS5RxOSpMPhyYdXbdUvVMXaartVTGc10jQAwnY4S62FNGymhy5s/vLaR7xPijUjuzBhf3epGRE
        izFmlYKXpYnkc58TrojU4
X-Received: by 2002:a17:907:96a4:: with SMTP id hd36mr723474ejc.407.1635762449536;
        Mon, 01 Nov 2021 03:27:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze8NyVmpBw7YgYiWD+CZnyOJgLe1lkQHSyHpWXs1dtzDSwFrSGxpNbxzdwHMmlXFZDjJJAyA==
X-Received: by 2002:a17:907:96a4:: with SMTP id hd36mr723456ejc.407.1635762449305;
        Mon, 01 Nov 2021 03:27:29 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id d3sm6726825ejb.35.2021.11.01.03.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 03:27:29 -0700 (PDT)
Message-ID: <ff8c8418-8e73-f949-3734-c0e2e109f554@redhat.com>
Date:   Mon, 1 Nov 2021 11:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 05/11] clk: Introduce clk-tps68470 driver
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211025094119.82967-1-hdegoede@redhat.com>
 <20211025094119.82967-6-hdegoede@redhat.com>
 <CAHp75VdfwA_3QK2Fo1S34rRZWHCMNzzHug4AKsRfOrKu4CU_YA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdfwA_3QK2Fo1S34rRZWHCMNzzHug4AKsRfOrKu4CU_YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/25/21 13:24, Andy Shevchenko wrote:
> On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The TPS68470 PMIC provides Clocks, GPIOs and Regulators. At present in
>> the kernel the Regulators and Clocks are controlled by an OpRegion
>> driver designed to work with power control methods defined in ACPI, but
>> some platforms lack those methods, meaning drivers need to be able to
>> consume the resources of these chips through the usual frameworks.
>>
>> This commit adds a driver for the clocks provided by the tps68470,
>> and is designed to bind to the platform_device registered by the
>> intel_skl_int3472 module.
> 
> ...
> 
>> +/*
>> + *  The PLL is used to multiply the crystal oscillator
>> + *  frequency range of 3 MHz to 27 MHz by a programmable
>> + *  factor of F = (M/N)*(1/P) such that the output
>> + *  available at the HCLK_A or HCLK_B pins are in the range
>> + *  of 4 MHz to 64 MHz in increments of 0.1 MHz
> 
> Missed (grammatical) period.

Thx, fixed for v5.

> 
>> + *
>> + * hclk_# = osc_in * (((plldiv*2)+320) / (xtaldiv+30)) * (1 / 2^postdiv)
>> + *
>> + * PLL_REF_CLK should be as close as possible to 100kHz
>> + * PLL_REF_CLK = input clk / XTALDIV[7:0] + 30)
>> + *
>> + * PLL_VCO_CLK = (PLL_REF_CLK * (plldiv*2 + 320))
>> + *
>> + * BOOST should be as close as possible to 2Mhz
>> + * BOOST = PLL_VCO_CLK / (BOOSTDIV[4:0] + 16) *
>> + *
>> + * BUCK should be as close as possible to 5.2Mhz
>> + * BUCK = PLL_VCO_CLK / (BUCKDIV[3:0] + 5)
>> + *
>> + * osc_in   xtaldiv  plldiv   postdiv   hclk_#
>> + * 20Mhz    170      32       1         19.2Mhz
>> + * 20Mhz    170      40       1         20Mhz
>> + * 20Mhz    170      80       1         24Mhz
> 
>> + *
> 
> Redundant empty line.

Removed for v5.

>> + */
> 
> ...
> 
>> +       /* disable clock first */
> 
> Disable
> first...
> 
>> +       /* and then tri-state the clock outputs */
> 
> ...and

Fixed for v5.
> ...
> 
>> +       for (i = 0; i < ARRAY_SIZE(clk_freqs); i++) {
>> +               diff = clk_freqs[i].freq - rate;
>> +               if (diff == 0)
>> +                       return i;
> 
>> +               diff = abs(diff);
> 
> This needs a comment why higher (lower) frequency is okay.

This function is called in 2 places:

1. From tps68470_clk_round_rate(), where higher/lower clearly is ok,
(see the function name) so no comment needed.

2. From tps68470_clk_set_rate() where it is NOT ok and this is
enforced in the caller:

        unsigned int idx = tps68470_clk_cfg_lookup(rate);

        if (rate != clk_freqs[idx].freq)
                return -EINVAL;

This is not easy to describe in a comment, while being obvious
if someone looking at this actually looks at the callers.

> 
>> +               if (diff < best_diff) {
>> +                       best_diff = diff;
>> +                       best_idx = i;
>> +               }
>> +       }
> 
> ...
> 
>> +       if (pdata) {
>> +               ret = devm_clk_hw_register_clkdev(&pdev->dev,
>> +                                                 &tps68470_clkdata->clkout_hw,
>> +                                                 pdata->consumer_con_id,
>> +                                                 pdata->consumer_dev_name);
> 
> if (ret)
>   return ret;
> 
>> +       }
>> +
>> +       return ret;
> 
> return 0;

That was the code in v2, but Stephen (the clk maintainer) asked to
simplify it to its current form, so I'm not going to change this back.

Regards,

Hans

