Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09CE656A801
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 18:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbiGGQZD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 12:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbiGGQZB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 12:25:01 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55ED42E6B0;
        Thu,  7 Jul 2022 09:25:00 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id r2so23437778qta.0;
        Thu, 07 Jul 2022 09:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3VGbYolSlDiEhY/VabI8iFo+GCRoLkzg2s9g/7zjqB8=;
        b=N16L+Y8wbnd0qlANzZEJStEvz3yNC4S/81Rf3uh9YxjNgLrWdVXNhuqhVWlvtUiSbT
         i0sH0L49paG1AjFwROoA1BZ4vjp4A0iJkUz91FyBtGa1Hhmy9nQZxCP68LqZw87qhtQ7
         wfy69mr0jIjXo2tv45OOj1j63Q9PbRq4sEyNGENfK8hex3RjoKKTAaMe9W2aASww7nsZ
         7OC68SfWJBe++wTDJB7vPMYKe2HyAtpTF2MVL7spt6FTzb92hJE9bWBsUqEYSzG8H8KM
         1MCTa7vc+ZgoZ1sXD+coWQ0Q9hrzCRleN9JDOmGpSwE2pA9/TTPjBg1yiLxjRrh9PCY+
         Cfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3VGbYolSlDiEhY/VabI8iFo+GCRoLkzg2s9g/7zjqB8=;
        b=XHvSBpmVJocGFIDR6mCYXLp+2DCwmcF6sICs9Ixkx2BZG/fukKkVkwAxRKHgRPMA1I
         7socmbLu4MrRrMpCEyB0JMxy1zf8MGIloJXWIky4upmzHPnTA42oTOfXK0R6RdNQnCSc
         Bf2DUugqe9FqoOOUt885UCnL21Dq5RIqdmezoC8hjNFNUTklwo4C5u4+N5lWiCGg1QxU
         V6/jFvnLht2VngVLBuSLd+Qi6sOQKdh2lnAjU2YErKKLuyPqlMOhwu+YySQOejUWbaXp
         1L3yhpEGMGweKkbpQBWNrJnokYcQ944q/W1opUyLPRE2V4L893XnclpCY/37wUyb0bSi
         qLwA==
X-Gm-Message-State: AJIora8UbaYXV0MTQDAoUbmi7hcT+ri9Ega9SP1/IGrJbrKkYVlBxoYu
        TZMygbkaF7AwmThTeUHHcHA=
X-Google-Smtp-Source: AGRyM1vZ+LxZTw2nMDLMF8bezlmKv5ca9GHOnAuZ3uNqIWP81etiaN1NnA3iaLRzGyFeRU4kUiV+xQ==
X-Received: by 2002:a05:622a:4c:b0:31d:289f:84af with SMTP id y12-20020a05622a004c00b0031d289f84afmr37575013qtw.540.1657211099384;
        Thu, 07 Jul 2022 09:24:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id g6-20020ac842c6000000b00317ccc66971sm26248829qtm.52.2022.07.07.09.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 09:24:58 -0700 (PDT)
Message-ID: <c546adbe-482a-1fe2-039a-b5780a0fdbcf@gmail.com>
Date:   Thu, 7 Jul 2022 09:24:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND PATCH 5/8] i2c: brcmstb: bcmbca: Replace ARCH_BCM_63XX
 with ARCH_BCMBCA
Content-Language: en-US
To:     William Zhang <william.zhang@broadcom.com>,
        Linux ARM List <linux-arm-kernel@lists.infradead.org>,
        Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc:     anand.gore@broadcom.com, dan.beygelman@broadcom.com,
        kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
        f.fainelli@gmail.com, Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jie Deng <jie.deng@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>,
        Tyrone Ting <kfting@nuvoton.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220707065800.261269-1-william.zhang@broadcom.com>
 <20220707065800.261269-5-william.zhang@broadcom.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220707065800.261269-5-william.zhang@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/6/22 23:57, William Zhang wrote:
> Prepare for the BCM63138 ARCH_BCM_63XX migration to ARCH_BCMBCA. Make
> I2C_BRCMSTB depending on ARCH_BCMBCA.
> 
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Acked-by: Wolfram Sang <wsa@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

There is no cover letter for this 8 patch series :/ it is not clear to 
me whether each subsystem maintainer will be in a position to merge 
these patches individually, yet still have all 8 (7 of them actually, 
see comment to patch 1) land in 5.20.

Alternatively, we can merge these patches through the Broadcom ARM SoC 
pull request(s) to ensure they all land at the same time.
-- 
Florian
