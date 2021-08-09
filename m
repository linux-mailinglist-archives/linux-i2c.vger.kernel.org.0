Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81B13E4CBA
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Aug 2021 21:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbhHITLl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Aug 2021 15:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235300AbhHITLj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Aug 2021 15:11:39 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68DCDC0613D3
        for <linux-i2c@vger.kernel.org>; Mon,  9 Aug 2021 12:11:18 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id m12so22778774wru.12
        for <linux-i2c@vger.kernel.org>; Mon, 09 Aug 2021 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bbAIZ1vNgh/bM5/vbDYSEQlGPw5WrAadNLMcENZpysE=;
        b=sbDf9q4d03+WhnTk05/k0UWkXy0DNMmf0QIruGkTk3M+lGsukimhoRQlZb248ObbPI
         A2lVYsYjFxsnomjZFwxKPJelDQOa5YGqQcPW/6tHpPvHZ4RDKuGd54rlXsYZeJshWn+X
         64JSeQifqgVVRFBh/J7gf/+ytEH1oiltCwDI9RkyKDjA75bE1GpgLC+c7P8CmmvuHLeH
         p5btlAUGrDewn8cSUwqi2BGLvyZK+5on1c+f//DTHOXx8k5l4gN58iff36YihFPxhTb8
         gAQJhH7qMJTHyQpNgAuSI0NabYArIdvq6pmLV//Vq0KY7g+/TRSErZ36/c/biZ/zoZTl
         FIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bbAIZ1vNgh/bM5/vbDYSEQlGPw5WrAadNLMcENZpysE=;
        b=QruCcnecLgeU+auOD6c5/OfSjQwdPXg8inoOcJ5+0MeMeGiFqi1b17ApJ91Guo9i/B
         Oiw5NBywfp815UOQT53LVDDtndsQCNv2LUyPCUONElGzTdGopMFMoCq9Le4+/0VeVuu0
         vssCmAwnAopN822nc5Q7v/EBGIZxJKo8zZzqy44kXjXHjZlu9hYbdMQS2hznw8AN+XCu
         CsZ69fvhakxvAlOEr5FmpsipupuqRDbSht/WTQWNdqBdCgzMN9oK5rWNY/QND9pmAqP+
         WJUdf3bfPOTnRWTP8pVdSov3rTEB3zUShOgAvQDTrGZIjwRt5Nu+yzEd8pCD0y6lZVwU
         e2LQ==
X-Gm-Message-State: AOAM533qN+O2ZKbYUKHasONmm0Uda+G0EnRaX6+yI+qrOlHUTs5GJeya
        UzyLU1Fo+TTUc1HQYz+Dl52FoP8YxPP5Pw==
X-Google-Smtp-Source: ABdhPJwnzLDn0NFasflfgUR+raHaXA4pT9UT6x16NRSALgJjrJfL2zAjha3BC5a/TeNdQYq47lTAkQ==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr26869593wru.368.1628536276808;
        Mon, 09 Aug 2021 12:11:16 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:50b3:512f:3b7:fe04? (p200300ea8f10c20050b3512f03b7fe04.dip0.t-ipconnect.de. [2003:ea:8f10:c200:50b3:512f:3b7:fe04])
        by smtp.googlemail.com with ESMTPSA id i5sm20912011wrs.85.2021.08.09.12.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 12:11:16 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <5d8e72e2-085b-32ea-0a86-eeecfe1e94f3@gmail.com>
 <20210805162309.14dbaf63@endymion>
 <72f456d2-8b6c-16b1-23c6-e117bbf5b3ee@gmail.com>
 <20210809153304.2944d07a@endymion>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 09/10] i2c: i801: Improve
 register_dell_lis3lv02d_i2c_device
Message-ID: <c40dbf38-8fd9-f784-73d2-dcf6b71b5f36@gmail.com>
Date:   Mon, 9 Aug 2021 21:11:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210809153304.2944d07a@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09.08.2021 15:33, Jean Delvare wrote:
> Hi Heiner,
> 
> On Fri, 6 Aug 2021 22:49:00 +0200, Heiner Kallweit wrote:
>> On 05.08.2021 16:23, Jean Delvare wrote:
>>> On Sun, 01 Aug 2021 16:23:34 +0200, Heiner Kallweit wrote:  
>>>> +		if (dmi_match(DMI_PRODUCT_NAME, dell_lis3lv02d_devices[i].dmi_product_name)) {  
>>>
>>> This causes dmi_get_system_info(DMI_PRODUCT_NAME) to be called for
>>> every iteration of the loop, slowing down the lookup. It's an exported
>>> function so it can't be inlined by the compiler. I know this happens
>>> only once, but we try to keep boot times as short as possible.
>>>   
>> I'm aware of this. However we just talk about a small in-memory operation and
>> the performance impact should be neglectable. dmi_get_system_info() is just
>> the following:
>>
>> const char *dmi_get_system_info(int field)
>> {
>> 	return dmi_ident[field];
>> }
>> EXPORT_SYMBOL(dmi_get_system_info);
>>
>> I'd rate the simpler and better maintainable code higher.
>> But that's just a personal opinion and mileage may vary.
> 
> I'm not worried about multiple calls to dmi_get_system_info(), which is
> indeed simple and inlined anyway, but about multiple calls to dmi_match
> (which can't be inlined). Function calls have a high cost (which is the
> very reason why the compiler will try to inline functions whenever
> possible).
> 
> I wouldn't mind if you were replacing several lines of code,
> but here you are only removing one local variable and one simple line
> of code, or 15 bytes of binary code total. But you add up to 8 function
> calls, and that number could grow in the future as we add support for
> more devices. That's why I say the benefit of the change is
> questionable.
> 

This code is called only if is_dell_system_with_lis3lv02d() returns true,
what further reduces the impact of what you mention. But sure, the preference
is a question of personal taste. Let me know whether you have any other
review comments regarding v2 of the series, then I'll drop this change in v3.

> If it was new code, I probably wouldn't mind. But when changing
> existing code, I need to be convinced that the new code is
> unquestionably better than what we had before. That's not the case here.
> 
> (And don't get me wrong, I would love to live in a world where you don't
> have do choose between best performance and and systematic use of
> existing APIs. Alas, we often have to make choices in either direction.)
> 

