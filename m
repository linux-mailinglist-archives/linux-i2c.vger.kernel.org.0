Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9840E7CDB73
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Oct 2023 14:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjJRMTk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Oct 2023 08:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbjJRMTj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Oct 2023 08:19:39 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C59112;
        Wed, 18 Oct 2023 05:19:37 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9b2f73e3af3so1036250466b.3;
        Wed, 18 Oct 2023 05:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697631575; x=1698236375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vaxG9BdfDpTJ0J4uCdMqlRiCCbJ9onzj1KKLOh8EEyg=;
        b=WRqqhnctDMUiKJHTrVeKDdXHcSeYqdBIMthKo+Q/pIrIkDh+Jq3VjfBZPLqTSLreDV
         UV34cdSiFKBkuGQvh+VuYH+wysSCEXP4DUC6VJz3nXQRy0v3K2AVtKRaRQmGR5VBWfwa
         01Li9Zp+FQ1faRCnZB9cb1pV2iT8plYoRy9XazY4Cb2qJxksS5YTCbd576xjnRwLtPGm
         Js7K6mJ8TSbQO5jFpOrPdD7p3tU6L3KDfdGbYOYZfJvi7337ZIbSU1K80ObkODPCEvyd
         9QSei3APoH9KnObyVZo9Ts+Can5qNwLZaST06xd/HHPA3V07pU57O0LxrvurCf7j+nB9
         1Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697631575; x=1698236375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaxG9BdfDpTJ0J4uCdMqlRiCCbJ9onzj1KKLOh8EEyg=;
        b=h3u7q+hIHjHoj/ES0SB+FzcGBaORFEI2hU5xO0IppP0TmJaQyliDD8snty2ui+wdrJ
         u4rgiCgGUAuUE21HEsv1EvDtcGKcyt0HjW+9RXV+mBboiMpQzqtPo94sewSI3re1ctjN
         P/UVaYY/PfknPsWiaVL699d6OnlflnzF4RK1OaKwrnoWs5oryTwRr6HLPsqMSFwCAXJH
         qSV6OIvRgmXy9d/Hce4r1KSdnHVRJu5L7/AMk1zNTI8qsrS2beuG7prLERp5zfpRgIlP
         SufO0083lqKq5MUhxg2JNqowudOFngbDTgipSxg2JARUIFwSBPiWCcaeLffZVbJytdbh
         mBKw==
X-Gm-Message-State: AOJu0Yyx6V5jmHH6I9ZbxAThDKsxk+vpDzjQTgFf821LEps46gUDfbvT
        CxF3SP0thaX/dS8ue51sMls=
X-Google-Smtp-Source: AGHT+IFaGBVf7Ds4k179/DQW+RGqxhKUSpreNp+jBEe4euWK435N/IponWevhTxEcr/fwY6/5CYKqw==
X-Received: by 2002:a17:906:4fc8:b0:9ba:fe6:225 with SMTP id i8-20020a1709064fc800b009ba0fe60225mr3742009ejw.55.1697631575180;
        Wed, 18 Oct 2023 05:19:35 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7be7:d300:7832:27d2:6e86:87ba? (dynamic-2a01-0c22-7be7-d300-7832-27d2-6e86-87ba.c22.pool.telefonica.de. [2a01:c22:7be7:d300:7832:27d2:6e86:87ba])
        by smtp.googlemail.com with ESMTPSA id jl9-20020a17090775c900b00985ed2f1584sm1587220ejc.187.2023.10.18.05.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 05:19:34 -0700 (PDT)
Message-ID: <48e2fa55-ae7c-4865-99ef-61d451c02b41@gmail.com>
Date:   Wed, 18 Oct 2023 14:19:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ACPI: Add helper acpi_use_parent_companion
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
 <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
 <CAJZ5v0gtH2sVo8Y1rH9SCarkfwJbwCX9BD4n+KpKpy3HRhM2Og@mail.gmail.com>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <CAJZ5v0gtH2sVo8Y1rH9SCarkfwJbwCX9BD4n+KpKpy3HRhM2Og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18.10.2023 12:51, Rafael J. Wysocki wrote:
> On Sun, Oct 15, 2023 at 11:34 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> In several drivers devices use the ACPI companion of the parent.
>> Add a helper for this use case to avoid code duplication.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> or do you want me to apply it?
> 
Patch 2 of the series will apply cleanly only after the following
patch that has been reviewed/acked, but not applied yet.
https://patchwork.ozlabs.org/project/linux-i2c/patch/2192294e-99ab-4c7d-86b1-edff058d82f3@gmail.com/
So my preference is to apply the series through the i2c tree.
+Wolfram

>> ---
>>  include/linux/acpi.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
>> index ba3f601b6..89efb1658 100644
>> --- a/include/linux/acpi.h
>> +++ b/include/linux/acpi.h
>> @@ -1541,4 +1541,9 @@ static inline void acpi_device_notify(struct device *dev) { }
>>  static inline void acpi_device_notify_remove(struct device *dev) { }
>>  #endif
>>
>> +static inline void acpi_use_parent_companion(struct device *dev)
>> +{
>> +       ACPI_COMPANION_SET(dev, ACPI_COMPANION(dev->parent));
>> +}
>> +
>>  #endif /*_LINUX_ACPI_H*/
>> --
>> 2.42.0
>>
>>

