Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6714BCDD4
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 11:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbiBTJbM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Feb 2022 04:31:12 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243557AbiBTJbH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Feb 2022 04:31:07 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B664C7A3
        for <linux-i2c@vger.kernel.org>; Sun, 20 Feb 2022 01:30:47 -0800 (PST)
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3C3953FE41
        for <linux-i2c@vger.kernel.org>; Sun, 20 Feb 2022 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645349446;
        bh=ZhlW2P314Xp7IVd+FJpw1KLggsQP1D5CsVCti6D2Xfc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=XHG4W2j7babX68q6gJ/Yectbq8kBu9j+RbwGzoc/VpUDpVBtmYhosE0VWSpjZU08o
         fIZs2jTlXIauWkvj92ei38Y9PzqEx1mDmcen4frOiRE3IpJEDGDaUqCpHj2TnrtDbA
         6fTa5dbwQyI4Sdp57A/jebKDGJaJFMRl8THNbBdL8kLOjilBqOpKZgsVXGXWEiR2de
         tDxTjB3wsVg+ZSp56vZYmNMoo9zOqNnqLnJE6k5qbNq1mQ2KAUDhr0fYEWJRAiiaBV
         JBKV+I2l3pI32ZHyfPjKIkQkw45974wGvD7dYe4XuqwpzBECGUDGuwv73RCM5yBGL5
         S7Wi9V92PvgSw==
Received: by mail-lf1-f70.google.com with SMTP id a5-20020ac25205000000b00443a34a9472so2075929lfl.15
        for <linux-i2c@vger.kernel.org>; Sun, 20 Feb 2022 01:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZhlW2P314Xp7IVd+FJpw1KLggsQP1D5CsVCti6D2Xfc=;
        b=o1TeO6lxLgu4+QPbXQe+XOtHEb4hZeMSJrNHNUvOCUprz2kBXmN/144fCFb3dPDiCj
         68r9umUyVXysYVFTpNkAMB9qHjeHAtnWlltfq2eRNskRhBaRK4fTDMQ9euWXvX+ubBH6
         e3QB/LpntkD385lvddnxQwjWtno6YHjdEEIZx1qn0Ha6slk8AJ7Ts5N3aGRJxCgCNOxJ
         oHpu1HUD9eaYoSNHMQIHPvtBcKQBk9qqPpCG8ogXLoe5SDN/8LOXmcj14Yk1quYrlUqN
         TwqAKJOzL4GXlxssj/FRgJOspav6S5nNA1ttokTFgXF+ft1nXmsPGCtZ3Lz53gcI8dw8
         7IeQ==
X-Gm-Message-State: AOAM532+wF0RrEaGW9+QMyxWlBzryENISoJaELy0ZQ6c7hUsUbcnM3Sk
        QVhrsvgiFxj0hXJQwYQzQl1wZqrqtBIl7O6OLWq6Ng8tWtLRtRRDH18idwBanJ/eEdDd5JeuSb7
        WIqYbaqe4xs0NUh8/pN/p4l6Ve5E27IIt5JH8TA==
X-Received: by 2002:a5d:568a:0:b0:1e4:7cc8:fa6d with SMTP id f10-20020a5d568a000000b001e47cc8fa6dmr11679929wrv.48.1645349433229;
        Sun, 20 Feb 2022 01:30:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDPzoJ3r3Cf/g14eN02kggEVtqJQJJBBiuuP/xysWCL9EyAUqqQm+LFlX4Qx6fEQSqO5pRiw==
X-Received: by 2002:a5d:568a:0:b0:1e4:7cc8:fa6d with SMTP id f10-20020a5d568a000000b001e47cc8fa6dmr11679891wrv.48.1645349432988;
        Sun, 20 Feb 2022 01:30:32 -0800 (PST)
Received: from [192.168.0.117] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id x7sm39145432wro.21.2022.02.20.01.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Feb 2022 01:30:32 -0800 (PST)
Message-ID: <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
Date:   Sun, 20 Feb 2022 10:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious
 interrupts
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This patchset includes the following fixes:
> 
> - Add dt-bindings description for NPCM845.
> - Bug fix for timeout calculation.
> - Better handling of spurious interrupts.
> - Fix for event type in slave mode.
> - Removal of own slave addresses [2:10].
> - Support for next gen BMC (NPCM845).
> 
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
> 
> Addressed comments from:
>  - Jonathan Neuschäfer : https://lkml.org/lkml/2022/2/7/670
>  - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/760

How did you address the ABI change comment? I still see you break the
ABI with the introduction of a new, required property.


Best regards,
Krzysztof
