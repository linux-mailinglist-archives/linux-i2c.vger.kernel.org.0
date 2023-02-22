Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63FFB69FB59
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Feb 2023 19:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbjBVSre (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Feb 2023 13:47:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbjBVSrd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Feb 2023 13:47:33 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EBA3E61C
        for <linux-i2c@vger.kernel.org>; Wed, 22 Feb 2023 10:46:55 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k37so3461579wms.0
        for <linux-i2c@vger.kernel.org>; Wed, 22 Feb 2023 10:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=skuCIMzdXVRwoYI+VmugGgits0upO5wf/eyqFb3T6p0=;
        b=ZRVz9U8eOgOEdv9yLJQJC9zAil69EdrhWJT9TuFbvf8r9kE2tIwdmF5Oy5d98mYnXa
         sDK1BjxsSP49nTHhvFlr/fwV0qcVQbYE1u/VuKH1u4LHc4WwDN8SdtRsbdFT+ijVXE04
         4k8fEfWO8SByWXviMlERIjWJF/ud+GOHUNvaV6ld5W0TkbMleggjJj+zkOxxSazNW5E4
         3br8kRp+aasBSQOyuG2fyjee+po5ajeuLg094pyZg14QcXc4RckisHauGy9z7uh9nI+W
         ac/wja/VbT1+vECtjfCyDLTaF8P3Ia1ncXCa/wjRQNrbGZALuYIkwDWFyzrnBA+/0zCH
         1UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skuCIMzdXVRwoYI+VmugGgits0upO5wf/eyqFb3T6p0=;
        b=Vb7m9mOAnZJVMg5aDDIbzQy8B/YgNDQSbRvTIyYZjoD/fuZ/02qELU/aZ4vu4MZuND
         /7blyDW5GwSBMQir48eAuDMIFWUIJ0e/eNtLLb/6u/vbb03ugYB7J87N1OTVH3VBFE6i
         cVjs1bsEDYT5+TjpQb3e/ck0j++oBfHlzvnrsymmkMPupjXhWpBg8dpn1X++fzhdIG89
         Hbz4HkUSwp5bjTla9mar64OclWxw/VS6TolzvCWc94ZNgn0B6U0Eg8i7UIzHoTaL48Qw
         s1GW/liN75FmzMD4OBFHGITATNr3UQ/CGJhxLd09Qin6VLEPKFPIjc8HZn0zb5VbeKwB
         SP2A==
X-Gm-Message-State: AO0yUKWJeFh2U0eeZ1z7fk9haAxUL33hEKj7504pOFmfm8Lc+AbsQRg7
        o7/T5FNtKu5XJr/BjEVSJk/J/Q==
X-Google-Smtp-Source: AK7set9+LFmeEbLy5YAz6Ze7EnEQPH7JVkRV7xkmNU+cJ2jCtT0NaFWu+u650El0GShdrYOP4Dz91A==
X-Received: by 2002:a05:600c:3196:b0:3da:acb1:2f09 with SMTP id s22-20020a05600c319600b003daacb12f09mr6996815wmp.19.1677091587670;
        Wed, 22 Feb 2023 10:46:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e7-20020adffc47000000b002c70f5627d5sm210876wrs.63.2023.02.22.10.46.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 10:46:27 -0800 (PST)
Message-ID: <06f29d66-f16a-039c-ecd0-155bdcce00c1@linaro.org>
Date:   Wed, 22 Feb 2023 19:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] auxdisplay: ht16k33: Make use of
 device_get_match_data()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org
References: <20230221133307.20287-1-andriy.shevchenko@linux.intel.com>
 <20230221133307.20287-3-andriy.shevchenko@linux.intel.com>
 <Y/TJs+Arban0ats8@smile.fi.intel.com>
 <be203dfd290e67c8ce74d11c5c9478a4@protonic.nl>
 <Y/UD3HWNy8uKYShC@smile.fi.intel.com>
 <0235f0fed989a8b027db720663699f5d@protonic.nl>
 <Y/ZKdN4nuHcL4DgE@smile.fi.intel.com> <Y/ZOyGo8X7r258EC@smile.fi.intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y/ZOyGo8X7r258EC@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22/02/2023 18:20, Andy Shevchenko wrote:
>>
>>> Which effectively breaks i.e. user-space instantiation for other display
>>> types which now do work due to i2c_of_match_device().
>>> (so my suggestion above is not sufficient).
>>>
>>> Are you proposing extending and searching the I2C ID table to work around
>>> that?
>>
>> See (1) above. This is the downside I have noticed after sending this series.
>> So, the I²C ID table match has to be restored, but the above mentioned issues
>> with existing table are not gone, hence they need to be addressed in the next
>> version.
> 
> I see now what you mean. So, we have even more issues in this driver:
> - I²C table is not in sync with all devices supported

Does anything actually rely on i2c_device_id table? ACPI would match
either via ACPI or OF tables. All modern ARM systems (e.g. imx6) are
DT-based. Maybe just drop the I2C ID table?

> - the OF ID table seems has something really badly formed for adafruit
>   (just a number after a comma)

Maybe it is a model number? It was documented:
Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml

> 
> The latter shows how broken it is. The I²C ID table mechanism is used as
> a backward compatibility to the OF. Unfortunately, user space may not provide
> the data except in form of DT overlays, so for the legacy enumeration we
> have only device name, which is a set of 4 digits for adafruit case.
> 
> Now imagine if by some reason we will get adafruit2 (you name it) with
> the same schema. How I²C framework can understand that you meant adafruit
> and not adafruit2? Or did I miss something?
> 

Best regards,
Krzysztof

