Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1202C55D547
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 15:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbiF0JRz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jun 2022 05:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233932AbiF0JRu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jun 2022 05:17:50 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2372A639D
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jun 2022 02:17:40 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id cf14so12039180edb.8
        for <linux-i2c@vger.kernel.org>; Mon, 27 Jun 2022 02:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=j45LSOHH3JiD4etOLa648Qq9hJpooPqyedr7q+VjXHU=;
        b=ufwbGIdKNbXPH8Wz04so0lL3KGsbit4ttintNEHvPRPe+Kt4AdOJOOMOUYmCFo1tnu
         eR14C9G92k19LoxmXRkN/ZJrgPVtIqoxjy5S5Cv41g9b+nRCSuZbV/E1IONtlHLgPxuX
         lCdNMnCg9xD6MK5wLh3M4U38b3SCxZ2x8++tKsWkfhoBWgfjhLrAAtjC2RAiusWs7vws
         /i2JY1CLzP7ma+mvGp/Lo66H8GP8SoVFsLo4fNQzttC2xq+bgfYojxKZVXf9ZxQe7Tp2
         ZKFJ5Eyuwviit4SZjs4aD5R3T6bKWBgI1JIvBqDHCwlRwx5Eigju0gXmhOV4BgBTnt8Y
         x6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j45LSOHH3JiD4etOLa648Qq9hJpooPqyedr7q+VjXHU=;
        b=iCFCf0Pd+Y3e7MjWH8jmfEB+dQgvi6mOQUbjDBhGGFouZe4XWAqa9tuBx3UNp8vQ41
         ms9k3ZrdxkDV0zk+fswJdj3Q0NdR8JSmprBNAWFb5pfrrEbjMnlTMzQks9QL2ON4jb/Q
         ekfw11D+c4dUzpFjcgDEqL5EhiaBZ7IHJAL62kwMF7U1LHYcNkYeRZEy1zFzQi+FTaQG
         WVAxj3G/N7k3+vQwm98I4BcdZ1vhiC+cWgAMPF5RJ/t+BYpF0gIee40CSkfiQeXD/CXx
         uP/4UuhfMYNBYj9gPuKIngd6rW/L9hzEhfAPOUKpHIj7zI7uINE2oZi/RZZkrwfCw+kk
         i8Eg==
X-Gm-Message-State: AJIora+Oy7++cprTJwzjbm3nBi/DHCzOz25mrDwy7a9GCpWGsL4Q67y/
        BLjQHiWzE88C6yxCwPtl62iWog==
X-Google-Smtp-Source: AGRyM1sywnG4AoJoUKNejA/e+NFvcRiA0U6+mWnexBl80A39LsB4bnm6VB95gY/41HlbVTxa8ZqdRw==
X-Received: by 2002:aa7:d484:0:b0:435:65b0:e2d8 with SMTP id b4-20020aa7d484000000b0043565b0e2d8mr15314344edr.373.1656321458755;
        Mon, 27 Jun 2022 02:17:38 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l2-20020a170906078200b006fe89cafc42sm4840141ejc.172.2022.06.27.02.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 02:17:38 -0700 (PDT)
Message-ID: <227af263-e52e-d2bb-2467-77c6439bad79@linaro.org>
Date:   Mon, 27 Jun 2022 11:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
Content-Language: en-US
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
References: <20220624101736.27217-1-phil.edworthy@renesas.com>
 <20220624101736.27217-2-phil.edworthy@renesas.com>
 <2f2b2544-9c53-3a6a-d9c9-375e75b112f3@linaro.org>
 <TYYPR01MB70869F902F8367DDFC4A9EDFF5B99@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <TYYPR01MB70869F902F8367DDFC4A9EDFF5B99@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27/06/2022 09:17, Phil Edworthy wrote:
> Hi Krzysztof,
> 
> Thanks for you review.
> 
> On 25 June 2022 21:43 Krzysztof Kozlowski wrote:
>> On 24/06/2022 12:17, Phil Edworthy wrote:
>>> Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.
>>>
>>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> ---
>>>  .../bindings/i2c/renesas,rzv2m.yaml           | 76 +++++++++++++++++++
>>>  1 file changed, 76 insertions(+)
>>>  create mode 100644
>> Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>> b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>>> new file mode 100644
>>> index 000000000000..9049461ad2f4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
>>> @@ -0,0 +1,76 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/i2c/renesas,rzv2m.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Renesas RZ/V2M I2C Bus Interface
>>> +
>>> +maintainers:
>>> +  - Phil Edworthy <phil.edworthy@renesas.com>
>>> +
>>> +allOf:
>>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - renesas,i2c-r9a09g011  # RZ/V2M
>>> +      - const: renesas,rzv2m-i2c
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: Data transmission/reception interrupt
>>> +      - description: Status interrupt
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: tia
>>> +      - const: tis
>>> +
>>> +  clock-frequency:
>>> +    description:
>>> +      Desired I2C bus clock frequency in Hz. The absence of this
>> property
>>> +      indicates the default frequency 100 kHz.
>>
>> Instead of last sentence, just add "default: 100000".
> Right, I'll also and an enum for this as the HW can only support 100
> or 400kHz.

Sure, sounds good. Thank you.

Best regards,
Krzysztof
