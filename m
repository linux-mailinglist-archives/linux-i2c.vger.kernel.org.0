Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6F05A6939
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 19:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiH3RFm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 13:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiH3RFl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 13:05:41 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A94FF2E69D
        for <linux-i2c@vger.kernel.org>; Tue, 30 Aug 2022 10:05:37 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bt10so16420492lfb.1
        for <linux-i2c@vger.kernel.org>; Tue, 30 Aug 2022 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=lYF9MfFRrV4XpO3M6oKX5MFynoiXFXl2xfJRMlgcOXs=;
        b=rB3ailKFlhr99Dkue6ZGBuSHO9P3bwRGe2PybLNl5asBy4gk90PC+I8SZ7UYBGHtnf
         GTKvRRMbww2USQdgxG5P1qHbHdDZMp4NJ0dGuk0Mj8S5QmXpH3f/o3Yg7olp5XkMwgI+
         kqiFkgPMOOZ+5qXlpQ5h0BnUxsZY3/OJE0xJGn7SwtfSK0ZMgn/U4AFoADbLehvIMEcK
         mL/+51NGwtJ3I1KgxqC14NKhNpBFjdjeDFGblMYhvQp4ZkSVYlcxKQPICVvEloEybmTj
         M+8NwZkZDBVExXZcuPCAwcU31pzNAjPvcUUqbTDTP/cmr2Oz3m0o5yUlVuX6cQCi4uqP
         0tyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=lYF9MfFRrV4XpO3M6oKX5MFynoiXFXl2xfJRMlgcOXs=;
        b=MX7w2kucywdafX9fkVeX3O5EvP60RnV0SWvpRQRxSIVGKuco8Lb2SjqLSbqqNwGEgq
         Ybd1LqKznWUSa8w2s1Q34B15EqR5P6amknPg31VrcRaDgcO/P0vtO6P/7lBr7QvilCI7
         HVedNhkwYltvcDjoaKTtR14S2oI3Rroja8CLp3APOXKqownr0xYNU+WnUj1XLr0ek3co
         UvP4n949pCxZQfeWM5VvA4/01Y7uWmFzepdOhZQv9EXkz4+/E/z8tXZ3VADjySM7kDOb
         ACHEmOjxmxO8ipyGcT+ANDBapN6gSWt5im+Y3FqRNFoGeH00KlY9oonFGlF3rzFCPs8w
         6X4A==
X-Gm-Message-State: ACgBeo2vie2pI6SCgcRJL5GgDCywiUJUN+wQM6evqiz9gnzYgLVUb1qm
        ygz/0FMF0lsRZ05ZK4J4t93I1g==
X-Google-Smtp-Source: AA6agR5zsSe2GoY9FGRHRGqwJpl24jp7i1Y4rLceq6QeFcpwm/RG2tjItVfcPEQK/WUD7mvmIZ4gFw==
X-Received: by 2002:ac2:4f02:0:b0:481:43a8:e368 with SMTP id k2-20020ac24f02000000b0048143a8e368mr7672885lfr.65.1661879135404;
        Tue, 30 Aug 2022 10:05:35 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id b22-20020a056512071600b0049467f0194csm960467lfs.265.2022.08.30.10.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:05:34 -0700 (PDT)
Message-ID: <8b9f49c6-86fa-b072-9cd0-5e363596593c@linaro.org>
Date:   Tue, 30 Aug 2022 20:05:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: at24: add new optional power-supply
 property
Content-Language: en-US
To:     "Farber, Eliav" <farbere@amazon.com>, Rob Herring <robh@kernel.org>
Cc:     brgl@bgdev.pl, mark.rutland@arm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        talel@amazon.com, hhhawa@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, ronenk@amazon.com, itamark@amazon.com,
        shellykz@amazon.com, shorer@amazon.com, amitlavi@amazon.com,
        almogbs@amazon.com, dkl@amazon.com, dwmw@amazon.co.uk
References: <20220822105830.22790-1-farbere@amazon.com>
 <20220822105830.22790-2-farbere@amazon.com>
 <20220822214623.GA907654-robh@kernel.org>
 <9e8a39d0-6267-cbac-da29-00e41871e14b@amazon.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9e8a39d0-6267-cbac-da29-00e41871e14b@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 28/08/2022 18:45, Farber, Eliav wrote:
> On 8/23/2022 12:46 AM, Rob Herring wrote:
>>>  Documentation/devicetree/bindings/eeprom/at24.txt | 3 +++
>>>  1 file changed, 3 insertions(+)
>>
>> This file doesn't exist any more. Use the latest -rc1 kernel unless
>> there is a reason you need a different (even later) base.
> I applied the change on top of v6.0-rc1

Not really. The file is gone since v5.5-rc1 as you can easily see in the
sources.

Since you did not Cc-me, it's another proof you based your work on some
old kernel.

Best regards,
Krzysztof
