Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4F444BC46
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Nov 2021 08:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhKJHqO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Nov 2021 02:46:14 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58772
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229831AbhKJHqN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Nov 2021 02:46:13 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 187CE3F340
        for <linux-i2c@vger.kernel.org>; Wed, 10 Nov 2021 07:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636530204;
        bh=kNwihk9+TZU7Lmf8DShsoXNExCm0rcNJhlWEmsYrxyI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=DO9043g8CykCyu65JaHpEUrJcNzhsVOyr9c9mlQqz66JKmi4RHnjG5jiEd/P6Kx14
         IQ4haN0dDv6Rfpg2yQRE8L7iA79XVBpo8MOEY6Anx+t74IbtoUo4uB5vQXByw/Pz53
         gZlspmAtkvYgQT4s9EsvzhgDMW3df/Fy2dMNEET4XR2HDxonEbNoWiqfC5oi7e1xT8
         8M4WdaKhpk8VZnCMHvGWnjBSmTepeLXNno3BoBZ1fcHtkOm+UeO8AtY9kEynFjnTFy
         zA0EYXLeZBSC7ma7VI/9AeDKnivBR+Mve/SqWfFoaP88fyyiQ5oMf0deP6f6/TfAx0
         GneQLuSKnh2GA==
Received: by mail-lf1-f72.google.com with SMTP id bq29-20020a056512151d00b003ffce2467adso919926lfb.3
        for <linux-i2c@vger.kernel.org>; Tue, 09 Nov 2021 23:43:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kNwihk9+TZU7Lmf8DShsoXNExCm0rcNJhlWEmsYrxyI=;
        b=T+P/+FkJHwAThSzBlZt4N2OldVm3efHYTE3MB3PclZW3VA9kbi/dfwUPVJFr1q+P/Y
         gnuC7wecnZIKAFGsSaxJ4e7t1u1JFlsmbrGu/W31Mo/8HWTyT3MUCGrb3yq0Q7CnJ1xB
         yiEsEk1uODxxJsf25JjTrdP6OIJyADY0FsAcYAKD0l26qLxiM18Tc9dWQFQiQCzhlT5+
         dnK7j4dpwTZDL506TQkV36claME7HHnAEdUuNFS0ffff2rR/UFGjaOg5pvFdDJmaLK94
         M2UfWit2J+qcIjFBHcPbOXfI0OCCk3jIF/R3p1QhvH6Xb7p4E3pRiHa4D/6ANL9VRr+W
         oW3g==
X-Gm-Message-State: AOAM533qCiCOTdKlAxNhhxg68TAJRc65Q4WfTqRQXEX5HJdYcpzmM8Zk
        JI6uYnw0L9wkt6PZP4Vn+8d4wOgfDVbFy4sBHSjGKE/WWMefy/CMxBndT1xdSRWVzrz6zH9hN9R
        KnNcA5i9x+xLKEqFN8Pn74mZng3CBVBEKOugNQw==
X-Received: by 2002:a19:495c:: with SMTP id l28mr13327775lfj.484.1636530203161;
        Tue, 09 Nov 2021 23:43:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX+kjYjN8x46mRk3Aya4zrud8jozXCf15P8hF9wfWX3cQCPgmfP5uU1NUQOpol1NYR50a10A==
X-Received: by 2002:a19:495c:: with SMTP id l28mr13327746lfj.484.1636530202958;
        Tue, 09 Nov 2021 23:43:22 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a12sm1669240ljb.19.2021.11.09.23.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 23:43:22 -0800 (PST)
Message-ID: <a0713a10-3409-4401-e612-0a9c06f88ea1@canonical.com>
Date:   Wed, 10 Nov 2021 08:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs
 rng
Content-Language: en-US
To:     Conor.Dooley@microchip.com
Cc:     broonie@kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        palmer@dabbelt.com, paul.walmsley@sifive.com,
        jassisinghbrar@gmail.com, atish.patra@wdc.com,
        Daire.McNamara@microchip.com, Lewis.Hanly@microchip.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        geert@linux-m68k.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-usb@vger.kernel.org, bin.meng@windriver.com,
        linux-i2c@vger.kernel.org, alexandre.belloni@bootlin.com,
        Ivan.Griffin@microchip.com, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, a.zummo@towertech.it,
        gregkh@linuxfoundation.org
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-7-conor.dooley@microchip.com>
 <f60cf7e0-4f67-f4b3-2596-01114cff6623@canonical.com>
 <71c6917e-1463-c708-550a-726e5fe1566d@microchip.com>
 <ca17d6ac-ef8e-b01c-3278-7cbb0d5745e3@canonical.com>
 <ea871add-bddc-c4ae-ac9d-e86b4fad5a02@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <ea871add-bddc-c4ae-ac9d-e86b4fad5a02@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/11/2021 14:36, Conor.Dooley@microchip.com wrote:
> On 09/11/2021 12:56, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 09/11/2021 13:54, Conor.Dooley@microchip.com wrote:
>>> On 08/11/2021 21:16, Krzysztof Kozlowski wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 08/11/2021 16:05, conor.dooley@microchip.com wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> Add device tree bindings for the hardware rng device accessed via
>>>>> the system services on the Microchip PolarFire SoC.
>>>>>
>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>> ---
>>>>>    .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
>>>>>    1 file changed, 31 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..e8ecb3538a86
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
>>>>> @@ -0,0 +1,31 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
>>>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>>>> +
>>>>> +title: Microchip MPFS random number generator
>>>>> +
>>>>> +maintainers:
>>>>> +  - Conor Dooley <conor.dooley@microchip.com>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: microchip,polarfire-soc-rng
>>>>> +
>>>>> +  syscontroller:
>>>>> +    maxItems: 1
>>>>> +    description: name of the system controller device node
>>>>
>>>> There are several issues with this:
>>>> 1. You need to describe the type.
>>>> 2. Description is not helpful (just copying the name of property) and
>>>> actually misleading because you do not put there the name of device node.
>>>> 3. What is it? Looks like syscon (or sometimes called sysreg). If yes,
>>>> please use existing syscon bindings.
>>> 1 & 2 - Correct, it is bad & I'll write a better description for it.
>>> 3 - Its a system controller implemented as a mailbox. The syscontroller
>>> is the mailbox client, which the rng and generic drivers both use.
>>
>> I understood that pointed device node is a mailbox, not this node. But
>> here, what is it here? How do you use it here?
> The system controller is the means of access to the random number 
> generator. The phandle to the sys controller is provided here so that 
> the rng driver can locate the mailbox client through which it requests 
> random numbers.

I am asking this to understand whether there is a generic or existing
property which should be used instead.

If I understand correctly, the rng driver needs a mailbox client?  If it
is mailbox client, then there is a property: "mboxes". Use this one
(look for existing bindings, e.g.
Documentation/devicetree/bindings/firmware/arm,scmi.yaml).


Best regards,
Krzysztof
