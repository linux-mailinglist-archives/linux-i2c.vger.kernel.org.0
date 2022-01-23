Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6FE4975AD
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jan 2022 22:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240192AbiAWVHV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jan 2022 16:07:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbiAWVHU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jan 2022 16:07:20 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0D1C06173B;
        Sun, 23 Jan 2022 13:07:20 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id u6so13532229lfm.10;
        Sun, 23 Jan 2022 13:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=7Fptv/d36Inx1g/nl3sp/HBXOUVPHRuV+KU3uJ6QILk=;
        b=oTsgsifraku/GW/gfz0NeJXIMsYLdBRnNvv0d7deBVIG2KXuxMzmhV1o7zHSSi1exp
         NlqIBbJObdHbrcNS5BH+JwBa27Mf1AQYo2flTX0hS9blqkLaucmkNsVp4ZWl19l50xOR
         fSAwOzOc37eNCjyXlfnSMvzoQ0RQ4prjzaGux3JI5rCJOuZtxvzXpvX9zdOqoRBbBnme
         rDySvv9D+ctu3qbX6HrSgmZ0JxrLJrwfJEwtuSt015I9JIMwdSC/q2k8LKIEumBIhjzQ
         G+3qB3yfhZ6Eq/KB0TMy5XDxUHIkYPeJ2DohVoQk2EfveEXHt05ErTgagbThKizs4awR
         QX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7Fptv/d36Inx1g/nl3sp/HBXOUVPHRuV+KU3uJ6QILk=;
        b=SAvv2Tl1NTRMRmQerS2dzdJsKZAi6Uceh5p1N6q0L8M2b0NcyyGLChpiJttNfuE1mA
         5C2zqjL1eP/pMcra9rFhqzIlKw4C9BWqCMloztBgdFs4crW9vjjWrKBYa+4/4Ul0USkI
         Y8tjmbYXwLXWvqGbt/NAviayxhIk2do/3JmhvlRxhkmDRPBJ5DVstk9cWYL6vcxmQA7H
         SeSp+2ofFhrCKp1s7qxASHvlNlTVwdEIuOsFEKwRbycmtY9+sVb1Pm37ncP8+cgZC711
         51b9kRQcuxFq3O3BoyEzy2qDVdVHTgNNm5KGtswMusCFZM9weQZLZf+qH2KZMMxH/o9b
         RBvw==
X-Gm-Message-State: AOAM5324Xbynbwwt+4VkZ5zOX7fSMXSuFUZYU+GGhnw2erHq0JNbUIxV
        MldkZ6UG32Sj+WNeTgt1AZvUwmw7O/k=
X-Google-Smtp-Source: ABdhPJwMPa1G20sU4czNbsXZXFVFm2GNtDELu+rqNjAsqsWRAHzwT+4wJotjYZb5N64KY0JIen90IA==
X-Received: by 2002:a05:6512:2203:: with SMTP id h3mr1237595lfu.228.1642972038290;
        Sun, 23 Jan 2022 13:07:18 -0800 (PST)
Received: from [192.168.2.145] (109-252-139-36.dynamic.spd-mgts.ru. [109.252.139.36])
        by smtp.googlemail.com with ESMTPSA id m26sm587716lfo.107.2022.01.23.13.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 13:07:17 -0800 (PST)
Message-ID: <a937a784-ad37-0c70-33ae-89d9907b1f68@gmail.com>
Date:   Mon, 24 Jan 2022 00:07:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] dt-bindings: Add headers for Tegra234 I2C
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>
References: <1642850607-20664-1-git-send-email-akhilrajeev@nvidia.com>
 <1642850607-20664-2-git-send-email-akhilrajeev@nvidia.com>
 <103960bf-ed5c-4a0c-9142-65ffc2e4bca0@gmail.com>
 <DM5PR12MB18503A9968008AE5E25D328BC05D9@DM5PR12MB1850.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <DM5PR12MB18503A9968008AE5E25D328BC05D9@DM5PR12MB1850.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.01.2022 19:56, Akhil R пишет:
>>> Add dt-bindings header files for I2C controllers for Tegra234
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>> ---
>>>  include/dt-bindings/clock/tegra234-clock.h | 19 +++++++++++++++++++
>>> include/dt-bindings/reset/tegra234-reset.h |  8 ++++++++
>>>  2 files changed, 27 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/clock/tegra234-clock.h
>>> b/include/dt-bindings/clock/tegra234-clock.h
>>> index 8d7e66e..5d05c19 100644
>>> --- a/include/dt-bindings/clock/tegra234-clock.h
>>> +++ b/include/dt-bindings/clock/tegra234-clock.h
>>> @@ -30,5 +30,24 @@
>>>  #define TEGRA234_CLK_PLLC4                   237U
>>>  /** @brief 32K input clock provided by PMIC */
>>>  #define TEGRA234_CLK_CLK_32K                 289U
>>> +/** @brief output of mux controlled by
>> CLK_RST_CONTROLLER_CLK_SOURCE_I2C1 */
>>> +#define TEGRA234_CLK_I2C1                    48U
>>> +/** @brief output of mux controlled by
>> CLK_RST_CONTROLLER_CLK_SOURCE_I2C2 */
>>> +#define TEGRA234_CLK_I2C2                    49U
>>> +/** @brief output of mux controlled by
>> CLK_RST_CONTROLLER_CLK_SOURCE_I2C3 */
>>> +#define TEGRA234_CLK_I2C3                    50U
>>> +/** output of mux controlled by CLK_RST_CONTROLLER_CLK_SOURCE_I2C4
>> */
>>> +#define TEGRA234_CLK_I2C4                    51U
>>> +/** @brief output of mux controlled by
>> CLK_RST_CONTROLLER_CLK_SOURCE_I2C6 */
>>> +#define TEGRA234_CLK_I2C6                    52U
>>> +/** @brief output of mux controlled by
>> CLK_RST_CONTROLLER_CLK_SOURCE_I2C7 */
>>> +#define TEGRA234_CLK_I2C7                    53U
>>> +/** @brief output of mux controlled by
>> CLK_RST_CONTROLLER_CLK_SOURCE_I2C8 */
>>> +#define TEGRA234_CLK_I2C8                    54U
>>> +/** @brief output of mux controlled by
>> CLK_RST_CONTROLLER_CLK_SOURCE_I2C9 */
>>> +#define TEGRA234_CLK_I2C9                    55U
>>> +
>>> +/** @brief PLLP clk output */
>>> +#define TEGRA234_CLK_PLLP_OUT0                       102U
>>>
>>>  #endif
>>> diff --git a/include/dt-bindings/reset/tegra234-reset.h
>>> b/include/dt-bindings/reset/tegra234-reset.h
>>> index 50e13bc..e07e898 100644
>>> --- a/include/dt-bindings/reset/tegra234-reset.h
>>> +++ b/include/dt-bindings/reset/tegra234-reset.h
>>> @@ -12,6 +12,14 @@
>>>   */
>>>  #define TEGRA234_RESET_SDMMC4                        85U
>>>  #define TEGRA234_RESET_UARTA                 100U
>>> +#define TEGRA234_RESET_I2C1                  24U
>>> +#define TEGRA234_RESET_I2C2                  29U
>>> +#define TEGRA234_RESET_I2C3                  30U
>>> +#define TEGRA234_RESET_I2C4                  31U
>>> +#define TEGRA234_RESET_I2C6                  32U
>>> +#define TEGRA234_RESET_I2C7                  33U
>>> +#define TEGRA234_RESET_I2C8                  34U
>>> +#define TEGRA234_RESET_I2C9                  35U
>>
>> Why ID order isn't maintained?
> Do you mean RESET_UART4, SDMMC4 etc should be
> below RESET_I2C*?

Yes, please see T186/194 headers for the example and do the same for
T234. Always try to use existing examples in general to maintain
consistency.
