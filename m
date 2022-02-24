Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80B9F4C2D8D
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 14:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234913AbiBXNtC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 08:49:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234800AbiBXNtA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 08:49:00 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6181A58D3
        for <linux-i2c@vger.kernel.org>; Thu, 24 Feb 2022 05:48:31 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id i20so1138173wmc.3
        for <linux-i2c@vger.kernel.org>; Thu, 24 Feb 2022 05:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y6XYZppzb13xLXqFFu+ajD27M8IiQ/biSpno2EH25M0=;
        b=pEivyOT5ulYJ8VlQWq8msOTtZSHSfZ3oZPUoczvtNyW+oR7jRcikMolq3eXuAZuWnq
         Vo7G7UQYSLQS0rglQVYbgOqlITssODljoBqsytok35C+pTOd9pIDMHBl810MjPXGlCJx
         VsdzPJnC0Kd3XSLme+oVSIQWGpVm39LZ0M0ZxSnex0iUmBEKYT2ZP4HZgdY7cju/NyEC
         cK5bOhh+4t549hq3mQ/MjrZjyFhAwxgNgvvy7S2+GE24uOeAsP4PxCJbr/MJTzHhzDsH
         QLDMkwXvg2t92O0erAHUS5k+sQ0BoChgQla9C8vWsH+IA1/c9oyPF5M26Hh8RNsMzI4q
         dp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y6XYZppzb13xLXqFFu+ajD27M8IiQ/biSpno2EH25M0=;
        b=iqBrbIBcnOoRsAK04U700W+SBn2E+rnGUnXIOGH/pNFZ53cbmkZJrbGVEJ06wLr2XQ
         +8E2N2d1XKJgdjFhOqO5trNbRZ5ZuNVyb6iirA8K24o60oSJTlsSfAAUxmlNkswNnMCk
         zDdRnNfwbcTlOZ4ARORYNEA3KSUTskwwhJhZpaGS6LgKr4WRxCv9BfhDrThPMhB2qRJI
         PnueX7nDrwX4iGaJI1+uyXnHyxgeZtY0OJ1zeW1RCrrCejJ79FDTkGs2ijwp6h7af2u8
         1PyhsGECK9Hb/iRPsXMgRmCp4Ic7CrxMuulEKsAYimgo6QorygZo1VyOEIUwJurz0J6+
         nC1Q==
X-Gm-Message-State: AOAM530faGgcYmhv4RuFDRTd4Xe2UjvWogcrCAkhSpt0E6i1X6RbcRMf
        KbF3g26UehoBxtKQH6b727cPWw==
X-Google-Smtp-Source: ABdhPJxPuK1rTPTgTvRp50LaZ8ASOalj6sW2lj7K+Rp12o9MnZHsT3Lejh0FWmothSCI/ZmmSiC4Dw==
X-Received: by 2002:a1c:7216:0:b0:37b:f84d:d56e with SMTP id n22-20020a1c7216000000b0037bf84dd56emr11654546wmc.177.1645710509675;
        Thu, 24 Feb 2022 05:48:29 -0800 (PST)
Received: from [10.205.160.65] ([95.83.233.50])
        by smtp.gmail.com with ESMTPSA id b14sm809513wrj.101.2022.02.24.05.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 05:48:29 -0800 (PST)
Message-ID: <4fa6664a-2362-b9eb-f279-12bcbf567e5e@conchuod.ie>
Date:   Thu, 24 Feb 2022 13:51:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Conor Dooley <Conor.Dooley@microchip.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Daire.McNamara@microchip.com,
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
 <YheLklKvZqR1qY90@robh.at.kernel.org>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <YheLklKvZqR1qY90@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 24/02/2022 13:43, Rob Herring wrote:
> On Thu, Feb 24, 2022 at 02:34:18PM +0100, Geert Uytterhoeven wrote:
>> Hi Conor,
>>
>> On Thu, Feb 24, 2022 at 2:15 PM <Conor.Dooley@microchip.com> wrote:
>>> On 24/02/2022 12:58, Geert Uytterhoeven wrote:
>>>> On Thu, Feb 24, 2022 at 1:55 PM <Conor.Dooley@microchip.com> wrote:
>>>>> On 24/02/2022 12:31, Geert Uytterhoeven wrote:
>>>>>> make dt_binding_check:
>>>>>>
>>>>>>        Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
>>>>>
>>>>> Hey Geert,
>>>>> I've run dt_binding_check locally but I dont get a warning, is there
>>>>> something I am missing?
>>>>
>>>> Interesting. Are you using the latest dtschema?
>>>> https://github.com/devicetree-org/dt-schema.git
>>>
>>> I was on v2021.12, but have now tried v2022.01 & master
>>> (2022.2.dev1+gf677c85).
>>>
>>> Is there something other than running "make dt_binding_check" in a fresh
>>> checkout that I need to do?
>>
>> You did update your installation after the fresh[1] checkout?
>>
>> $ cd dt-schema
>> $ pip3 install -e .
>>
>> [1] What about "git pull"? ;-)
> 
> yamllint is not installed. It's optional from the kbuild perspective.

Safe to say I won't forget yamllint next time I do an os reinstall..

Thanks.
