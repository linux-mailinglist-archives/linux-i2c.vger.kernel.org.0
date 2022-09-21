Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13FBB5BFED8
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 15:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbiIUNTL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 09:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbiIUNTK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 09:19:10 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1C690825
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 06:19:08 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a8so9110794lff.13
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YVB1Kvz4KXx+KTfyw8w+Xp2A1fATvwLiAC4PObmzkH4=;
        b=EU2oEl8/dHBl2Kk6XwGi+QOaB5DgZyI61e+mLa64+CLgSGLTK2NN+IT+32aDwgdiYL
         iA3EEZTNET0rUYDq8/y96dcLvKaRw/gGVbDQrUo2h425XCNPsgeJccNVScdTeKkG+cRx
         tbQncLoxOe7QXqAo+K4BzjuP+wqcv+xKKmQjjT7lQyio2uUTlKsYqx8+x3Ek5rt1b+Xt
         HSrOwCjeBMng6kJvTgksCFpdAVtWCftIQ2l14uAUgmHcQsVz6d0Q0d1cAJm1/2ErfrW8
         VCsWqfuXZGgaHbNE5J4G+rBecs3d/+iyXJwdInDLY7vjvq2PjY5HE1vrO7kNXNoUGweU
         qerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YVB1Kvz4KXx+KTfyw8w+Xp2A1fATvwLiAC4PObmzkH4=;
        b=Ia45mvm+mwYLFQUHLYoGKP0bBj5C5w3GHpq0NqK4lhrBmRTdJhNnNRBNE3CquZ/nx1
         R1TocYdzErkizxct/XC8YUF0TD+vivZZ3viJ74M9hkPNZ9+Q/LHh4ldm9pl5tRUht/P5
         Z28JFEP0jSkx7esjUfnp9rj0PqreuzFmbf2kV5thL/CSF082KZ6ciPj3G2Rv2G8w233M
         raztPrUwwMg9D7vCrFMcu2YSYo9cNoavMgYknQFQtoa3IURUOoVEX7ISNIzd/cT9/PXK
         4Se1Wjfyn+9BsB7nvB25EU6X3ekGOkBYFiL7Ol5v6hFD/l7sqesknaCL8KNYh5CNIMzP
         QXYw==
X-Gm-Message-State: ACrzQf0cs0V2PK/pTN2LliTpoYWVKi5j15rtz55Cr6yrBppZPQVCquFQ
        KPL6Yqb//RE72LstAAqPogv1Fw==
X-Google-Smtp-Source: AMsMyM6irXewtTFRf+tz3B1tmQ1RJQuEf2CWgBWeNL4RR4+2Soiwa8OF1ZTI74mqcvH83Ma8YbyF/Q==
X-Received: by 2002:a05:6512:706:b0:498:b7ea:f2e8 with SMTP id b6-20020a056512070600b00498b7eaf2e8mr10200319lfs.570.1663766346581;
        Wed, 21 Sep 2022 06:19:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x8-20020a056512078800b0049468f9e697sm422248lfr.236.2022.09.21.06.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 06:19:05 -0700 (PDT)
Message-ID: <10464d03-0dd5-fec2-31ce-02af25a407da@linaro.org>
Date:   Wed, 21 Sep 2022 15:19:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 8/8] i2c: i2c-mlxbf.c: Update binding devicetree
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-9-asmaa@nvidia.com>
 <20220921065506.6cu6p2cpu3zfhtie@krzk-bin>
 <CH2PR12MB3895572575B5BED5DAFFAA29D74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CH2PR12MB3895572575B5BED5DAFFAA29D74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21/09/2022 15:12, Asmaa Mnebhi wrote:
> I have a question for you and Wolfram, we don’t use device trees and are not planning to use device trees; we only use ACPI tables. But I think when Khalil submitted the first version of the i2c-mlxbf.c driver, it was requested from him to add devicetree support. Do you know why? Is it possible to remove the device tree support and so this doc? or is devicetree support a requirement regardless of the actual implementation? 

I don't think I am the right person to answer your question. I don't
know why you do things and did things in your driver. I also I do not
have any interest in your driver supporting anything. However if you do
support DT, I have interest in its correctness.

Best regards,
Krzysztof

