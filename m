Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A885459551A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 10:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbiHPIX6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 04:23:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbiHPIW0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 04:22:26 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E1514412E
        for <linux-i2c@vger.kernel.org>; Mon, 15 Aug 2022 23:01:17 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z6so13423841lfu.9
        for <linux-i2c@vger.kernel.org>; Mon, 15 Aug 2022 23:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=PAMUhBr06KwCKHsM3sO1lYBEEZWlxVT7ve7Atz0HZas=;
        b=GM6XplvTYolWK6bpn3JGPwaID/eKHSCcUhxiQAkTWQzIHVnyWLb1bm1jiveDw6OgIc
         tH9ZEQaiRJ7pgRETWduYR9V9xCCyWzcgPvoFEv95Z3NE1sxBQCmcArSp1a7L0WLeJv1+
         mpDNv37OLwxrrj5YQVlsin2o6KTfgpUEbz6nhvWHeTpisgWh0TqFnzvX+zJjyCrqCIKp
         gG8Mmo4u7fzsf+5BOvTQ901Lt7r8fjYs8sndMzJRnPDJXL3IQ1J46xKfTLnJuHdm9xz2
         U8Q5GQ07SywOJm9nJ2oGb8OcSax0eRNkyOMeUfaMS1kk36XvRLdWvmPsZTaFV1B8Om+l
         vYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=PAMUhBr06KwCKHsM3sO1lYBEEZWlxVT7ve7Atz0HZas=;
        b=emSUy7XrTnsD2dBLOkB5MQ+kk3ENMJZ+ZT/HIVtp4YQ7ejnQKCMPh5dcY2ViNGc6bq
         zC8rqrR/GebeF2i5OqXB6QnwXXTmRrXIr2MkqN5rQIb1kjS3UkPs6NUpOLMQk6Opq3MN
         L3TWdII/BWwngPKnqMW6HmRoY+Q/SeAtaaY6m2XkHr6dclNHL9fECVmc0yHWRTr48WE3
         VKdA0iKfSZO4Mksg6OUmoIIv0b6kvwB5XYUz2yIA7zYcTVR1FzRx89B82qLiI6r/SsXD
         gYuqbo6Z2Y2rhRjJ1Ab4s7JMRSgIiNNN0xkrQTWNpG+JYwJFqDtVaHmBXYLeFK1XQnS1
         R6qA==
X-Gm-Message-State: ACgBeo3jUFJzh2kz0563Q9nDEdZ+oL19J4+QNZnP/wCzJQaxoXSq2srA
        ghFun4Ox7ulPrlKOUm5I+9e/OQ==
X-Google-Smtp-Source: AA6agR6bpZbcz037p9eeWUeoTOyZ9uO3sjHuYjc4nklWxeIVjCvwsK+J1RQUjPq0p9CsM64SX9W9wg==
X-Received: by 2002:ac2:55af:0:b0:48d:3b2c:dd4f with SMTP id y15-20020ac255af000000b0048d3b2cdd4fmr6883004lfg.329.1660629675831;
        Mon, 15 Aug 2022 23:01:15 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id a10-20020a195f4a000000b0048a891e4d88sm1275440lfj.193.2022.08.15.23.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 23:01:15 -0700 (PDT)
Message-ID: <039566a7-5c65-b2d8-7b45-c616863cb292@linaro.org>
Date:   Tue, 16 Aug 2022 09:01:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/6] i2c-imx-lpi2c: add IPG clock
Content-Language: en-US
To:     Peng Fan <peng.fan@nxp.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Cc:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>
References: <20220812043424.4078034-1-peng.fan@oss.nxp.com>
 <f1add9c7-fc2e-a600-49a6-a6579f17db1b@linaro.org>
 <DU0PR04MB9417D62230578AC8CA4234F288689@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU0PR04MB9417D62230578AC8CA4234F288689@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15/08/2022 03:52, Peng Fan wrote:
> Hi Krzysztof,
> 
>> Subject: Re: [PATCH 0/6] i2c-imx-lpi2c: add IPG clock
>>
>> On 12/08/2022 07:34, Peng Fan (OSS) wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> The i.MX LPI2C needs PER and IPG clock, not just PER or IPG clock.
>>> This patch is to enable both PER and IPG clock for imx-i2c-lpi2c.
>>
>> This patchset breaks the ABI and is not bisectable. The justification is very
>> limited (one sentence), so not really enough.
> 
> ARM32 i.MX7ULP and ARM64 i.MX8QXP/i.MX8ULP all need to use two
> clocks, PER and IPG. But current dt-bindings and dts, use one clock.
> 
> This patchset includes dts changes patch 4 and patch 5.
> Patch 6 is to update driver use two clocks.
> 
> I think the patch order in this patchset would not break git bisect, it
> just break ABI. But I not find good way how could not break ABI,
> because only use one clock is wrong whether in dt-bindings or dtbs.

Driver changes always go via separate branch than DTS, so your patch
breaks git bisect. I already pointed it out in other patch. This is not
really acceptable. Breaking ABI is another problem which could be
justified with your explanation in other cases... but not in this one,
since it is easy to make it backwards compatible,

> Should I use a fixes tag to dt-bindings, then break ABI is allowed?

No. For such patch ABI break is also not allowed in that case. Just make
the driver backwards compatible and both problems - non bisectability
and ABI break - go away.

Best regards,
Krzysztof
