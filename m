Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341E446F306
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 19:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238107AbhLIS36 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 13:29:58 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58346
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238073AbhLIS36 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 13:29:58 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 63FC13F1D7
        for <linux-i2c@vger.kernel.org>; Thu,  9 Dec 2021 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639074378;
        bh=bnnx6rQGK8n7h6ddt6DQom8TrVyPspLo7R1sX2CesnA=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=Az07j4PMtkxjV12gLkaWoxA0nwnXVT/T9K3dcrzSAVRPysrfxTc3Sbl8uRPpkTFLT
         HqXm1L0/+Gzc1ET3ERcQfygbqWH1hwllw8LA+trjsACdXqgfSqGQu0eadnBE2AmYgI
         7zSqn8YjXNzqDV/0zT5aGC3wBQ4+V7NXrUDgouU+Ocmr2XnJ6e9zDEli/TgA68wrhu
         k8BLDKN8K7BQ4lKzYXAqGSIO2Ex9Ap9xEXVvmwwgYx6HbvOPOSav3gLikCsEeqoQlv
         DbflfoDjXU4NYbMd89/0dLRIHakWEe8h7qgM+zUbo6IQilYZlKO7VpDsxhEpy/U5pe
         KrUw8rT0ikiQQ==
Received: by mail-lf1-f69.google.com with SMTP id m1-20020ac24281000000b004162863a2fcso2954666lfh.14
        for <linux-i2c@vger.kernel.org>; Thu, 09 Dec 2021 10:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bnnx6rQGK8n7h6ddt6DQom8TrVyPspLo7R1sX2CesnA=;
        b=phNopP0Y9xrz17K2IDy2cHf9y0+LheuSsEucoxtoCPtNQWScUK6x9CFpgxJJyLXgev
         7gKZGFF7e3ThOedYXNK8T0r9i5ZoR60fqBFQpv2u9+xrexlixOY7vVYpD8lu48PVHcBe
         h6OAUJAfFYlqwU0Q+S/OvztCSyW0avyKJIuIldITKBsq+KQNy16mMLBuK9Kl6Uxic6We
         f9FmrA5cBhyGeU50QHdZTujRPUWKqh40wUU9Ittz9IaRUYHlqEWh1IyN0r3qB62en6MZ
         b6CEzWDRzXLLXSxZksNrLKwOTeuOSnfDf9c9aO7cA7h4maBZ/goQRg99P0uUfWCPbgmD
         oDLw==
X-Gm-Message-State: AOAM533hs8DOlOxT0jstXw9kmJF3500rq4M064kQzQl2c3JfXwyskc0Y
        EqjRptSSPA577JYGWEVKj9w64EY2X0o0z7d1cYn58gwU2rahA3lYEA2JI8WSUmEV7znDfDG72Cn
        BUUtnSmapgZyO+Adg14HsA1Mqj42s8cP4RftS/A==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr8105551ljb.214.1639074377379;
        Thu, 09 Dec 2021 10:26:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbURx088TRAYYq+SKkON5HsFd14aKjJlvCcvIqppT8KViqIKSlq9u0BdyeXxUl2UrGefiszw==
X-Received: by 2002:a2e:b907:: with SMTP id b7mr8105529ljb.214.1639074377174;
        Thu, 09 Dec 2021 10:26:17 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s6sm58531lfo.48.2021.12.09.10.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 10:26:16 -0800 (PST)
Message-ID: <f0e01fda-b153-9d74-ae7d-7ef0fc2112aa@canonical.com>
Date:   Thu, 9 Dec 2021 19:26:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 RESEND 7/8] arm: dts: exynos: Rename hsi2c nodes to i2c
 for Exynos5260
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
 <20211204215820.17378-8-semen.protsenko@linaro.org>
 <YbIXVw+as1Sj6yDW@ninjato>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YbIXVw+as1Sj6yDW@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/12/2021 15:48, Wolfram Sang wrote:
> On Sat, Dec 04, 2021 at 11:58:19PM +0200, Sam Protsenko wrote:
>> In Device Tree specification it's recommended to use "i2c" name for I2C
>> nodes. Now that i2c-exynos5 dt-schema binding was added, it shows some
>> warnings like this when validating HS-I2C nodes:
>>
>>     hsi2c@xxxxxxxxx: $nodename:0: 'hsi2c@xxxxxxxx' does not match
>>                                   '^i2c(@.*)?'
>>     From schema: Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>>
>> Rename hsi2c@* to i2c@* to fix those warnings.
>>
>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
> Applied to for-next, thanks!

I applied the DTS patches, because they should go via arm-soc tree.
Please drop them from I2C.

Best regards,
Krzysztof
