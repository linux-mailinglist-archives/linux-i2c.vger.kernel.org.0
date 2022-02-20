Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8A94BCDE5
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 11:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243571AbiBTJc5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Feb 2022 04:32:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243557AbiBTJc5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Feb 2022 04:32:57 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9CBAF08
        for <linux-i2c@vger.kernel.org>; Sun, 20 Feb 2022 01:32:36 -0800 (PST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E955D3F1A1
        for <linux-i2c@vger.kernel.org>; Sun, 20 Feb 2022 09:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645349554;
        bh=LKjm5LjPQkt9S6ejT9o1cKax4Elbs5PxSQyHCZobrC4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=HvRvyfvrpqPOsrYvI9g6sYiIWC5bTn/r6pK0ZyZNU12lonAERvt8O3yM/0srMYv0l
         nKLOYI8Sivbw4O2lR5qaT2sJBSyAS77iDVJqsHrCLyL2CSSBD3QsWKiXAd1AK/EIO+
         mEfqKowZRPddrXnNd7Tekon53bYeh3rmjAJ8cj7rlF4DywY33hSnT1lv6BYINb/zRV
         h1eUxeMDpmXYY6eyiM4UjPj+1YGb9yJAQxqY1nqGvjF+D/HtEdWtc2UnfiQIPdsp8U
         cOrXaJiFNrOCDe5C2soibXqS4Qi/Gsg9NOoPuuVRjRVVvLv3SiJVnZKVi0TXpA2mMC
         CiQDZ66TQRaWQ==
Received: by mail-wm1-f72.google.com with SMTP id 7-20020a1c1907000000b003471d9bbe8dso3919521wmz.0
        for <linux-i2c@vger.kernel.org>; Sun, 20 Feb 2022 01:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LKjm5LjPQkt9S6ejT9o1cKax4Elbs5PxSQyHCZobrC4=;
        b=t6XXbTzwdaTnYnnu/XNq5achv7X3ugN3QMTFfPiF6N7wH4j6zyLQpdz+iHh2OY63l8
         kDay+FuV2Z+6Tx+knQ2sK0I9qU2Ghsuh9/GcxAX6dU+9re7gzA5G6muK9durB5TADLqy
         2qBjyg44UER24UQ9WF7eXOQtSjEBFVeW5a9IhP6IOp2WmqdxoQ7dZ2sH3eY6nzsekKHv
         rt9xEwTNo13BKrbokZg2HXqstDm6zsW8fy1T+7KtYisT69O36memA2XCGx0Ry2UZIQni
         KsPFQo4xN4XjqDNP6IGZYLnA7mRdINPJ5wchkTRkcX00Ow/iWFxTZh4+g2S5riTKaX/A
         sxgw==
X-Gm-Message-State: AOAM532opoB0Mdh8xTjtus8s8ySzsv8VaLmDunDTzSgAZVWmt+emnpy2
        sqdr7+2wyvNh2FLrt4qUOdRTzFMnFaYNkMTy1bwG/J2iIjN5MA0nSgwAwDsjlxzIrL9PChhMWva
        NupMRFsXsrqH+P32auh8i0tJ9fMr7G7WyaDsvqw==
X-Received: by 2002:a05:600c:230d:b0:37d:5882:ec9b with SMTP id 13-20020a05600c230d00b0037d5882ec9bmr17101286wmo.162.1645349544159;
        Sun, 20 Feb 2022 01:32:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5VMR9zGe0H8y1LkWbw0H010mPlQxgB9BfhaHQlQDN2Ch3MW7W25dEBO2fUvk53yZ3IM4IIw==
X-Received: by 2002:a05:600c:230d:b0:37d:5882:ec9b with SMTP id 13-20020a05600c230d00b0037d5882ec9bmr17101254wmo.162.1645349543973;
        Sun, 20 Feb 2022 01:32:23 -0800 (PST)
Received: from [192.168.0.117] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id i3sm50975818wrq.72.2022.02.20.01.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 01:32:23 -0800 (PST)
Message-ID: <ae927203-794b-06c6-3bcc-d67f13ab841d@canonical.com>
Date:   Sun, 20 Feb 2022 10:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 04/11] i2c: npcm: Update gcr property name
Content-Language: en-US
To:     Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-5-warp5tw@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220220035321.3870-5-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/02/2022 04:53, Tyrone Ting wrote:
> From: Tali Perry <tali.perry1@gmail.com>
> 
> Use a generic name for NPCM system manager reigster.

The subject is not accurate and you entirely skipped in commit msg the
fact of an ABI break.

You do not update a property name but you change the way of getting GCR
regmap.

Best regards,
Krzysztof
