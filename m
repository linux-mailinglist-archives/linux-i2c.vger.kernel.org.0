Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD0D44BC5A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 08:45:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhKJHsQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 02:48:16 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44776
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230022AbhKJHsP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 02:48:15 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 73C2F3F1A7
        for <linux-i2c@vger.kernel.org>; Wed, 10 Nov 2021 07:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636530327;
        bh=N83ESKUHB/kqrmHqZ+hpUE8Wq2iA/YnywAyf4v9xq00=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=DrjT1UGU6tGN12zPCrmSmBheEVMGEr0bAg14ms71wqc11rWWUeCRZHGB+NgDg8RWR
         CZNunqRTDBgYWhoJ27OM1k/QUAtPFg8C+E5/bQeHk18IqhqKiGmHls1yNu5YIULHbh
         AR3AKeoNeaDyDrr3Vx0sxw2dQDDsk0doT52nc9z+hc4JSZETbc2kYKcrKZBWnhYVlF
         Pl14s/EXqMFzZJFYH0DDXkYlMP3ul+8VC2b1a6nPfwj62FnpiLmukFAHHc1dS7uha/
         PDczwIkfFENeBlPrLYmm4qOAXun1BxGs9T+1xN7lhMwLmPbDOZzIjYpo24VIRn20Ii
         LRoO4VZ5iqc0Q==
Received: by mail-wm1-f71.google.com with SMTP id m14-20020a05600c3b0e00b0033308dcc933so839168wms.7
        for <linux-i2c@vger.kernel.org>; Tue, 09 Nov 2021 23:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N83ESKUHB/kqrmHqZ+hpUE8Wq2iA/YnywAyf4v9xq00=;
        b=OUPaT09HHr86iP+IgUQT3WKBeFjmU6tUCH4pp1YnXyZIdJOXOBb2uPK1rH6pvC5qTG
         W2VJLts1ZsVbGW2JO/WkwXS+2/gqYjBQlN1hYKG/Hh+qcVI6RaEtXX771Y71zpX0N0ZT
         ru9CS2SFLG2bhk4VQkmFr5WJxgqSq45FR93Dz12LyDceEAjSUJnONCp7dAgZmqYaqbG5
         RQxzcpTr0ARwfZ8XYfg4DILbklj0yME1W21jNjjEUFxWxa5qNMbEnz6mal45FgJWaasd
         G2cwnnVbukU45qk367qZG0ZoElH67a2yvJVT/2fvmgLdCzqFEK+r8a2tm15Oqqrj6Zoa
         e8ug==
X-Gm-Message-State: AOAM53066sbIR52HNNHP144PEdOOA9PJ0b/tqNBgX1coNZo5rWctsYpI
        K68GrUouphYZEbdJ+IOCvenxpJ5mbQfTnTR0j5GLINlUb5IELLx0rOCR/EnoT1ewUe3P8pS0erm
        eYgh4zIfXZnhCDrkbm7XZOgAymDT7aBqtbfQPFw==
X-Received: by 2002:a05:651c:11cf:: with SMTP id z15mr13724613ljo.30.1636530316474;
        Tue, 09 Nov 2021 23:45:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxj/L+35JjL2smH5MiuFZkelZYQSjo3AZ/1hVDezSpzMKpDS3vieitpkj9D1r3Hbn/gkMU6Bw==
X-Received: by 2002:a05:651c:11cf:: with SMTP id z15mr13724596ljo.30.1636530316282;
        Tue, 09 Nov 2021 23:45:16 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b22sm2384886lfi.67.2021.11.09.23.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 23:45:15 -0800 (PST)
Message-ID: <978563c0-95fd-1c76-42a2-5e0ab9cbc61d@canonical.com>
Date:   Wed, 10 Nov 2021 08:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Content-Language: en-US
To:     Conor.Dooley@microchip.com, robh@kernel.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
        aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        linux-usb@vger.kernel.org, Daire.McNamara@microchip.com,
        linux-spi@vger.kernel.org, geert@linux-m68k.org,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-gpio@vger.kernel.org, broonie@kernel.org, palmer@dabbelt.com,
        bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
        linux-crypto@vger.kernel.org, Ivan.Griffin@microchip.com,
        atish.patra@wdc.com, Lewis.Hanly@microchip.com,
        bin.meng@windriver.com, alexandre.belloni@bootlin.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        a.zummo@towertech.it
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
 <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
 <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
 <bd26a633-7c71-b00b-00c3-54688ee42297@microchip.com>
 <cd789074-53a0-72c1-76f0-b2b86a434247@canonical.com>
 <a2ce221d-5ab7-52c5-176e-e64a081a6805@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <a2ce221d-5ab7-52c5-176e-e64a081a6805@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/11/2021 14:20, Conor.Dooley@microchip.com wrote:
> On 09/11/2021 13:04, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 09/11/2021 13:58, Conor.Dooley@microchip.com wrote:
>>> On 09/11/2021 12:53, Krzysztof Kozlowski wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 09/11/2021 13:16, Conor.Dooley@microchip.com wrote:
>>>>> On 09/11/2021 04:06, Rob Herring wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
>>>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>>>
>>>>>>> Add device tree bindings for the {q,}spi controller on
>>>>>>> the Microchip PolarFire SoC.
>>>>>>>
>>>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>>> ---
>>>>>>>     .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>>>>>>>     1 file changed, 72 insertions(+)
>>>>>>>     create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>>>>>>>
>>>>>>
>>>>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>>>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>>>>
>>>>>> yamllint warnings/errors:
>>>>>>
>>>>>> dtschema/dtc warnings/errors:
>>>>>> Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
>>>>>>       19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
>>>>> Rob,
>>>>> Should I drop the header from the example or is there a way for me
>>>>> specify the dependent patch to pass this check?
>>>>
>>>> The error has to be fixed, although not necessarily by dropping the
>>>> header, but by posting it. How this can pass on your system? There is no
>>>> such file added in this patchset.
>>> I linked the patch adding the clock as a dependency in the cover letter
>>> [1], which is why I was wondering if there was a better way to do so
>>> that would get picked up by the checker bot.
>>
>> It's not only about the bot, but dependency when applied. If you did not
>> warn clk maintainer that clock bindings should go via Rob's tree or
>> should be provided as a tag, the patches here cannot be applied in this
>> cycle.
> It was not my (our) intention to send the clock patches via rob's tree.
> And since this is my first time trying to upstream wholescale changes to 
> a device tree I honestly didn't expect this series to get accepted in 
> this cycle anyway.

OK :)

Assuming your new bindings pass db_binding_check with
DT_CHECKER_FLAGS=-m (on top of clock patch), I propose to keep the
header here.

Another idea would be to submit without the header and use raw IDs
(numbers) and convert it later. I prefer the first- base on clock patches.


Best regards,
Krzysztof
