Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA0287E7276
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 20:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbjKITuY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 14:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjKITuX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 14:50:23 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B3F3C14;
        Thu,  9 Nov 2023 11:50:21 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5bcfc508d14so1029224a12.3;
        Thu, 09 Nov 2023 11:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699559421; x=1700164221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EBtLQKS0NK7CR945P937kTGYgAdDYuND1Sz4PktQEo8=;
        b=AxQChHjm/LV3CIuRkdNBRAKpobENOLcE12/cQegtLhk/6or92EjK+v8ZM875qPe25S
         56X7LrL734bM3U9Y9YxBlKy4TuO1hTFJB9U+g8omBaAPQxKqFLT09iwrVROLaFPQGNIa
         zM9Q4evMOrFHQLQVAsfJ1OImvxo+w2+rvrdaaUPg3shiNp+I/a2qGsBA8coZCnYpyqJM
         nfn4B4PYV1Lm/tFkphIhKy0k33K80hQwV/HV1ePwMxod8av8CQjqZVFIZ5VlTGUpyimj
         DQ6uyhiX0F9sZ5NyNf/PgeQepPabABzsjohXGjiPdufJwaGy2zWUJSRAsDKUnXOeL1ym
         J+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699559421; x=1700164221;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBtLQKS0NK7CR945P937kTGYgAdDYuND1Sz4PktQEo8=;
        b=CgCQP/8UNCNI7RY1C3bPo/3duwvRiTsmNBD1G+XwoeHkjFfCjfQgdnfmgdhRzdybjX
         jy5xnUq3NHwJw0T/4tvOGiuUf3Al2I7rnF//UMEtg0+wVeK9dW+PmlFBJWSctvYZgzMm
         8llNRYeIGAD+Bvbq12I7rCOLoyTv1wbV7bQLH3Lu8Yuxh5P6kfIOBrFe//cXzVGrVXM9
         d9Jk4yIzv5CYRNnwJUl26TFj6h2CP8EBAyvH9sUJ4allrXaY50EVIVKXoj+ueQFSn5BR
         T8hSEQovHVdJPOMUOOwthJZtzkY0ifUGf4dSw5ljHS3CDWAzMIcip8H4EdE1NInzSo3x
         xZ7Q==
X-Gm-Message-State: AOJu0Yz8cRQDc7Ekwv0uitnPL3WlNM7wk1oplGTj8/KziGSaXP7wn9E0
        zTDcj54ZKBLnBmcQGvV0azA=
X-Google-Smtp-Source: AGHT+IHgEn896T8HF0M77ehIx6l76xd9t8FpRIr2oRCUxIxjdDPqwp+PRiY6WW9LNacKmPHYmDRqEg==
X-Received: by 2002:a17:90a:1a04:b0:281:61c:1399 with SMTP id 4-20020a17090a1a0400b00281061c1399mr2653144pjk.3.1699559421145;
        Thu, 09 Nov 2023 11:50:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a17-20020a17090abe1100b002775281b9easm170807pjs.50.2023.11.09.11.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 11:50:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1fcf588d-ea37-4f86-a920-4da21302192c@roeck-us.net>
Date:   Thu, 9 Nov 2023 11:50:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: pmbus: Add ltc4286 driver
Content-Language: en-US
From:   Guenter Roeck <linux@roeck-us.net>
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231109014948.2334465-3-Delphine_CC_Chiu@Wiwynn.com>
 <065e97b5-23ce-45f3-95ec-40e798c8a22e@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <065e97b5-23ce-45f3-95ec-40e798c8a22e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/9/23 09:27, Guenter Roeck wrote:
> On 11/8/23 17:49, Delphine CC Chiu wrote:

>> +        info->m[PSC_POWER] = temp_setting;
>> +    } else {
>> +        info->m[PSC_POWER] = rsense;
> 
> I told you before, the default range needs to be set. The range may have been
> changed by the BIOS/ROMMON, or someone could have changed it manually with
> i2cset or some other application, or some other operating system was loaded
> earlier which did its own setting.
> 
> I do understand by now that you don't want to do that, but I won't accept
> the driver without it, sorry.
> 

As a follow-up on this, it turns out that LTC4287 supports an external EEPROM to
store its configuration as well as "STORE_USER_ALL" and "RESTORE_USER_ALL"
PMBus commands. It is therefore very well possible and even likely that the
voltage range (together with other configurable parameters) was set during
system production.

With that in mind, it seems to me that not only the default (property not present)
case has to be handled, but that a boolean property to reflect the voltage range
is insufficient. I think what is needed instead is a property which specifies
the requested range and which, if not present, explicitly means "use whatever
is currently programmed into the chip".

Thanks,
Guenter

