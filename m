Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DBB51A53E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 18:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353356AbiEDQV3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 12:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351824AbiEDQVW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 12:21:22 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9D725EAA
        for <linux-i2c@vger.kernel.org>; Wed,  4 May 2022 09:17:46 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id q23so2730707wra.1
        for <linux-i2c@vger.kernel.org>; Wed, 04 May 2022 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q1QS1h63jdwlMuyWNP8xmEDpzxKjGMK4DEb1a7HY6v8=;
        b=B5/wgTRM47Tl6PkYtUKKGOHAofL12q1D1XeQV2au8EsqDuKXxnhiEQ1NxmJNWAzdP2
         3x4xdSeMWZUJQ+cV0ZMU+IeYQqTjTKcy168mCV6zySdGCVFpO5pgWlWaC5G3JLOGOmms
         vBeH+yOKH0ArVlnht8uegF3WR1oh1AfRINI8z2Iy/QvIl4OMwngm41/ddl3h18Ga+Zm/
         Pe5WXPQ25sM2RmJwQqg/8XprcUfWZtCcvwPuUVHQLVeCXkpEM6GNMbteVBkz0N1d6BY1
         ec9Ls/wwmM1dRLKpVWHS1mVSPryPH9WniYE24/zlS9edV9v3RgFvDj/us7VuKziCRZgn
         eC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q1QS1h63jdwlMuyWNP8xmEDpzxKjGMK4DEb1a7HY6v8=;
        b=0RWgfdxuJ+1N1wG8nyoWngkPVn2kSGUBk628YbTC0y8+MFLkpSXRaojj9sdv6rA38U
         dlM7aaU3NLHt6POyEoTR67zd5DOtiIS1BdxYnSbMn6F9O+BN/6leVYr/oJKYZF2DB0VD
         /0rrPCLoZQbVnWPXSPO+jOA7l0dHPVJVQ9rc4WvmExxKOwT5VcHvQkLtpR1OkFTuy5I2
         qGA2vOnCZSHCzyjKwm3ECmF3hieBs4eJe4YlukjJfZgi7kcn74IPYmakt9tWG4wBe26Q
         reFxdgLi521eYRri6g0yMv+iff2lvOjBAO6o+zUdyk02fjg2Aim2go6hfna5mRLX+Kjb
         5Iyg==
X-Gm-Message-State: AOAM530+xoHKcMGFNgTlgP46sCR7vcB0u3w3pvTRoF8de6iLvYWleCz3
        SBS8AAt+mtIHWMamTEAtNAY4VA==
X-Google-Smtp-Source: ABdhPJwuSiqhD1Cyjq81kfirw20i4hiDQULPYQWg/PuvNNeMNt1Vngp/iBTK7LXsBJS82EKqd4hhDg==
X-Received: by 2002:a5d:474f:0:b0:20a:cb5c:bbd7 with SMTP id o15-20020a5d474f000000b0020acb5cbbd7mr16610323wrs.21.1651681065007;
        Wed, 04 May 2022 09:17:45 -0700 (PDT)
Received: from [192.168.2.222] ([109.77.36.132])
        by smtp.gmail.com with ESMTPSA id p20-20020a7bcc94000000b003942a244f38sm4153161wma.17.2022.05.04.09.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 09:17:44 -0700 (PDT)
Message-ID: <1e6de466-eefc-c5f7-5db7-6a87ff1608ed@conchuod.ie>
Date:   Wed, 4 May 2022 17:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] i2c: add support for microchip fpga i2c controllers
Content-Language: en-US
To:     Conor.Dooley@microchip.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org
Cc:     ben.dooks@codethink.co.uk, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, Daire.McNamara@microchip.com,
        geert@linux-m68k.org
References: <20220321125855.3227057-1-conor.dooley@microchip.com>
 <cad04bc5-ce7b-d7db-f967-8b2bb67897ae@microchip.com>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <cad04bc5-ce7b-d7db-f967-8b2bb67897ae@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04/05/2022 09:40, Conor.Dooley@microchip.com wrote:
> On 21/03/2022 12:58, Conor Dooley wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Add Microchip CoreI2C i2c controller support. This driver supports the
>> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
>> set for "soft" i2c controller implemtations in the FPGA fabric.
>>
>> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> Changes from v1:
>> - Use byte write and read functions
> 
> So it turns out that how I made this change, which worked in my
> test app, has issues.
> I will rework and send a v3.
> 

Welp, as it turns out we can chalk the issues up to user error,
aka me entirely forgetting what the correct i2cdetect options
were - d'oh.

Apologies for the noise & unless something else changes, don't
expect a V3.

Sorry,
Conor.
