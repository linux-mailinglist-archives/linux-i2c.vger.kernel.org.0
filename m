Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DABE86A17E2
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 09:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjBXIZP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 03:25:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBXIZO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 03:25:14 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460A51630D
        for <linux-i2c@vger.kernel.org>; Fri, 24 Feb 2023 00:25:12 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id l25so12651237wrb.3
        for <linux-i2c@vger.kernel.org>; Fri, 24 Feb 2023 00:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=905wi/lKsrlDl7OSJlE8SBp+T9mWktWnoMsLMCtGb68=;
        b=l8hjhj8qsLGlchpSClCJJjrSLh3uBo30Cp+lBZDUbfAbcpomkIiJUAZ7VT9DVlTxKZ
         chJ+GDZDzfSV/lx1VRRUw5BClmjJt6uA84+KXYUAniE0EXtMnGWWb2BRcaPG9m6yB2v4
         lO2561RKBFtN1O2JbYnAmnKSkbptEfeczt//quzkC9dIBvxHb7DWku+3hJv01J2vXk0r
         J4OsQ72YkSn//t3z3EHtvVCh0doR42tuZ6IxWMKMLyvAJXBaxW66+5KxStd6TCuug78z
         8qm6wochtWKKbI9FWxugMXDxV9osB796CopRHlcUULKguXfpPh0AgidzXf2GnvdNfzik
         J2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=905wi/lKsrlDl7OSJlE8SBp+T9mWktWnoMsLMCtGb68=;
        b=EzfbebNermg6keXnLp4vdUpZi6MAcGDPQGZd/sxo3LC6le6l7G7Wyc1ffR8w/GCPht
         +QD1O2oSSCzrjiWIerf5Nu9DQrC9uuGHd30DAoX30kkLUiQI2knrmDqOPlClh9thyewt
         G1NaAHiBRd6zxThJ8fTa66/VdxDEo05jvIkL077hQQsONdwm1z6i6ycMA3fVEOl5/oVT
         a3Xjj2ym7zM4dgYgrkYkDaq16R7w4h+M+V3rIjgq+OUmL9KCL+RaU11xn23JZK6pU12r
         PZruTtTgh7YtaaU5FmJd4DsX5Zw+lMXbi6hmwPLOea+c/eNMtHljr+JeeHI4QyP11bbB
         XM3g==
X-Gm-Message-State: AO0yUKWtAEM2kgpdVU9FDhauu1OMEp0QTA++Tbh73bs6fYvNH905HhZb
        4JQ6kYSU8qq93M1wUu89CHXtnY5RqfvldgOm
X-Google-Smtp-Source: AK7set/T508aYOyceeyepwWS6ucFOkGUoXO+rb63rjJECxiAvJu/a2srSXKoC/J6pUbI9l3IC2FfYA==
X-Received: by 2002:adf:f0c3:0:b0:2c7:144a:3ac1 with SMTP id x3-20020adff0c3000000b002c7144a3ac1mr3972950wro.14.1677227110808;
        Fri, 24 Feb 2023 00:25:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k2-20020adff282000000b002c6e8cb612fsm11204861wro.92.2023.02.24.00.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 00:25:10 -0800 (PST)
Message-ID: <3df61f49-4d0f-5d96-459d-acc33ff0fa3a@linaro.org>
Date:   Fri, 24 Feb 2023 09:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 3/5] ARM: dts: hpe: Add I2C Topology
To:     "Hawkins, Nick" <nick.hawkins@hpe.com>,
        "Verdun, Jean-Marie" <verdun@hpe.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "wsa@kernel.org" <wsa@kernel.org>
References: <20230217155054.99757-1-nick.hawkins@hpe.com>
 <20230217155054.99757-4-nick.hawkins@hpe.com>
 <dc708865-6005-760f-cbb0-cb2d1d989b9d@linaro.org>
 <66D4DB5E-46AA-4280-A073-E22262F7FD58@hpe.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <66D4DB5E-46AA-4280-A073-E22262F7FD58@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/02/2023 22:02, Hawkins, Nick wrote:
>> clock-frequency is a property of the board. If it is fixed in the SoC,
>> then make it fixed in the driver and there is no point for this property
>> in DT.
> 
> Greetings Krzysztof,
> 
> It can be other values however

Hm, are you sure? On the same SoC, same or different I2C controllers
will have different frequency, entirely independent of board configuration?

Best regards,
Krzysztof

