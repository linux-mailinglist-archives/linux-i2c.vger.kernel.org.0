Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E4C4C2D86
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 14:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235223AbiBXNq5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 08:46:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbiBXNq5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 08:46:57 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA26D26F4E6
        for <linux-i2c@vger.kernel.org>; Thu, 24 Feb 2022 05:46:26 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c18-20020a7bc852000000b003806ce86c6dso3489819wml.5
        for <linux-i2c@vger.kernel.org>; Thu, 24 Feb 2022 05:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fE7kl2GhZCQLmfysy3Jz8Q5rFJOjnbH3GgpHqDMSeJg=;
        b=rv0aGpluioskNTfLPijWXUXmUgO1Csy1GuyIJGrZ9VWydqKZSfq/olkTeEL6+M5jqm
         vA9zrwS9nP0w30Fj2n+MIHm3iobZnSk8Qbaay8GSSWcs8OcTzssPLEEoQ1t2mmVst9Ma
         JxBcB1ieYaQ7pjwelUGXRwiO/mDHAXjJSRNSZoQeSCyEzsewt0TU/MSJ7X4dn1HjU4t/
         3MXY/QhzzD7TUJsG4EJf84mlhBtN0/Yw1nZ1/7dOHdwgPrve4uHjtMcQQa4HPXA0umQr
         QgaW1+cj3LC1+AxFqKmVNGizKTLIwKeyBN2TSsgau79mRPaiu8sI6+zfhDXESazxgLuy
         UhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fE7kl2GhZCQLmfysy3Jz8Q5rFJOjnbH3GgpHqDMSeJg=;
        b=WWxiGHiL3nMnSjSLsi7/j9KdJrloVhu+zcuyIPabH3bu9X/9SatAWnH2uDGJ+F/c96
         EVu8nsbdHItp2AQJ38PV5t9gSbqXUl5AIAixCKnIoGmJDFS3glNFs6E+OJWvaYE1sxRO
         TlEjJwIRjr6J1rB96HYwauVbQGFBJDVLLnAy7IsqsDCquhG4P2MmwjcjneLga+Jkd+UX
         mxsb5fbboC1/HvKzqjB7MH7DNwPBxPiWmxRjPFnTH1UCOLnCBUSbp6ZKFSA9tuICaF1S
         GMGHj+Ijl9ZoYMH2vS+obSdajNxYaPp1HKzeBW6bRVVVeROzk+oy+Ae5diI4x3ZOvDR1
         eNuA==
X-Gm-Message-State: AOAM533mYsQlfxL0ZfdYiH8sX7c+G+GU0AG2z0UYnD0vAUxhdn1JNlMW
        TpFJE9CNxTh+LoZRir7vA14Lf8xYla0USF0hnnl19g==
X-Google-Smtp-Source: ABdhPJyh9rNJY6AS+e904Xmv+hju2DcFQtoseCfyBNBL9hQgNOxtDno2T3TB9eCXAs5sdguoqBwM3g==
X-Received: by 2002:a1c:c910:0:b0:37d:1f4a:224e with SMTP id f16-20020a1cc910000000b0037d1f4a224emr11543849wmb.124.1645710385222;
        Thu, 24 Feb 2022 05:46:25 -0800 (PST)
Received: from [10.205.160.65] ([95.83.233.50])
        by smtp.gmail.com with ESMTPSA id u12sm2792859wrs.2.2022.02.24.05.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 05:46:24 -0800 (PST)
Message-ID: <d64555a6-79ce-bff0-bb06-bc0b02fa27ff@conchuod.ie>
Date:   Thu, 24 Feb 2022 13:49:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Conor Dooley <Conor.Dooley@microchip.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Daire.McNamara@microchip.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
 <97b69b3a-bf17-6a43-bf96-da19822051b3@microchip.com>
 <CAMuHMdXGQDqMagqzD8VNYm2oucE=_nas9mM2sT_RoW2GKhr4vw@mail.gmail.com>
 <ae6b0849-a3e3-33fe-b540-6dc77c868f4b@microchip.com>
 <CAMuHMdV5ghvAze-zOVAm9LSv9261PE0hh3nxyv5db18azmo2=w@mail.gmail.com>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <CAMuHMdV5ghvAze-zOVAm9LSv9261PE0hh3nxyv5db18azmo2=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 24/02/2022 13:34, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Thu, Feb 24, 2022 at 2:15 PM <Conor.Dooley@microchip.com> wrote:
>> On 24/02/2022 12:58, Geert Uytterhoeven wrote:
>>> On Thu, Feb 24, 2022 at 1:55 PM <Conor.Dooley@microchip.com> wrote:
>>>> On 24/02/2022 12:31, Geert Uytterhoeven wrote:
>>>>> make dt_binding_check:
>>>>>
>>>>>        Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
>>>>
>>>> Hey Geert,
>>>> I've run dt_binding_check locally but I dont get a warning, is there
>>>> something I am missing?
>>>
>>> Interesting. Are you using the latest dtschema?
>>> https://github.com/devicetree-org/dt-schema.git
>>
>> I was on v2021.12, but have now tried v2022.01 & master
>> (2022.2.dev1+gf677c85).
>>
>> Is there something other than running "make dt_binding_check" in a fresh
>> checkout that I need to do?
> 
> You did update your installation after the fresh[1] checkout?
> 
> $ cd dt-schema
> $ pip3 install -e .
> 
> [1] What about "git pull"? ;-)
> 

I went for the option of "pip3 install 
git+https://github.com/devicetree-org/dt-schema.git@master"
If I alter check_dtschema_version to spit out the version, its as 
expected. The checkout was of Linux not the dt-schema.

I have found the issue however, realised just before Rob pointed it out 
that I missed yamllint when I reinstalled my OS recently.
