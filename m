Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6902F7D8997
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 22:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjJZUSE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 16:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbjJZUSD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 16:18:03 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCA61B1;
        Thu, 26 Oct 2023 13:18:01 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-1e10ba12fd3so899800fac.1;
        Thu, 26 Oct 2023 13:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698351480; x=1698956280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=07Ui+9lOZ5SHQZ2es0x0P8HbzMtRlHTTlpZsM2IC7m0=;
        b=iksQDlbm4pAR7GqAl6wtbFnw7EtNZ/Yt/2TVUHLMvRImXBoZM35M47zZOUTA9zq41d
         tl2bjU5wFwuPfLupNuXPBzXZcbfPL/SzBHcZnJ7SlqzPq1hZbgK2AhbBzXWDT8v/zjED
         nVWpjVyKuutuyW7gcyB4lOdhSk5GDSmePF0lgibenE3PugpkbngojkL/x8huS8CK3H4N
         0wBTV8NbtO32GDRAsRBuLe0ban1B2t4vjt1xiNuFyehijAnMePt1i9bWXQKU7X6fJPAo
         6lJM2hD16EeepIrlFgs//v7ACd0irBvD68azkrvJ25NhnO74N/2A8RyB+YnYKfk6ZoOW
         2OlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698351480; x=1698956280;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07Ui+9lOZ5SHQZ2es0x0P8HbzMtRlHTTlpZsM2IC7m0=;
        b=o+bwJMvbJkXQElnANVZNH2APmFamavTtuMVnTnpgS6UwlKqkzKfi5Du85c0JObvPkS
         TkJay5L1/4u9I0Bm2MrW47CVTM2o3oefYc5wWEk8mj52fQ1Qaz2X5M+yIGm6AQPQSQl7
         BZngJKSxRe1lGLoNKytiAsgr3HjRV1NtEPjyorPkitsst+8s9EUxxyJhPJ2BzryI2GAc
         9JsECyzUkGl/SjBjgr3Cjda821y6YUQX2G5DF1vdtG2ySM1TlHCcp3rHjn0blVtPjwlE
         EWFnvmCx+q7Re0jUPHyHcT0MIq3OxdwnndB31ENyE466ogfPBknGpU9JJGlWhnceFPXQ
         jCmw==
X-Gm-Message-State: AOJu0YzhTVX8TVRFMkNCTS/O8ONAaxt8dfuZCns/U/IzweJwa3lpx1KH
        o4x1NrQ1OBGsN3V0hOGugvtdGHkrshA=
X-Google-Smtp-Source: AGHT+IE4aJUBYDPZBs+yPfTzhtb9gDAa54bBXzEeO5fpsTqB3xOZHDAPVFC5rFkbzO1MJG70SVUTWA==
X-Received: by 2002:a05:6871:8785:b0:1ea:206e:cb10 with SMTP id td5-20020a056871878500b001ea206ecb10mr916993oab.22.1698351480388;
        Thu, 26 Oct 2023 13:18:00 -0700 (PDT)
Received: from ?IPV6:2a02:3100:95bf:4b00:95bb:38e6:4df0:e5c4? (dynamic-2a02-3100-95bf-4b00-95bb-38e6-4df0-e5c4.310.pool.telefonica.de. [2a02:3100:95bf:4b00:95bb:38e6:4df0:e5c4])
        by smtp.googlemail.com with ESMTPSA id w20-20020a056830411400b006b8c87551e8sm1022ott.35.2023.10.26.13.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 13:18:00 -0700 (PDT)
Message-ID: <91ce35e4-8796-4d29-8121-20a39daedea8@gmail.com>
Date:   Thu, 26 Oct 2023 22:17:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ACPI: Add helper acpi_use_parent_companion
To:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        linux-acpi@vger.kernel.org
References: <90bd1071-317e-4dfe-b94b-9bcee15d66c5@gmail.com>
 <6e935761-5b36-411a-ac82-cbc394bba7b6@gmail.com>
 <20231024173338.haei2py7izlqxjmw@zenone.zhora.eu> <ZTqhNCNCtUk+mz1n@shikoro>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZTqhNCNCtUk+mz1n@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26.10.2023 19:26, Wolfram Sang wrote:
> 
>> Wolfram, can we take this in i2c? Otherwise this will take two
>> release rounds to get in.
> 
> In general, I can, no problem. But there is still on-going discussion
> regarding patch 2. So, I will wait for a conclusion there. I am not
> familiar enough with ACPI to have an own opinion about that topic.
> 
Not sure whether the discussion is ongoing, my impression is it stalled.
Rafael as ACPI maintainer thinks the helper makes sense and therefore
acked it. Andi shares this opinion, and others like Jean have doubts.
For sure I won't receive a Turing award for this helper, but it's IMO
better than the cascaded macros.

