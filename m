Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7D459E747
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 18:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241955AbiHWQaQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 12:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244710AbiHWQ3z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 12:29:55 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8103111FD08
        for <linux-i2c@vger.kernel.org>; Tue, 23 Aug 2022 05:57:30 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id l8so2031755lfc.12
        for <linux-i2c@vger.kernel.org>; Tue, 23 Aug 2022 05:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1avOVOvremPzgizGcj5WLFA7Q1NR0Z4dLUlm0wTw8OE=;
        b=QYNhoLttpBbbjZVOLBf2tpHXrj7nTjLxZk7vYBZWfrlQ2N/xm2XM3MltGAv9uEPq9i
         znp26aDtxb3ZPogWYZNufhEDrzRKh06hP+7g2rYnX6slKSM501R8AEvVUpq0slHdSY3g
         to82g0OtUM8hx1yl+YcUrP4wRMVl++0l+XE+thuK//m3XcxzQMEpPTXqYSvacdfTDAtg
         g/eTJVjJw6Ll7zuQ6VckPs/6XZSLs5BwCf2I0mrK6iYepQJFnnvnPikd1Iun6jA7vPGi
         BA3EUw5FkFxctIwJfSvdvuomiLLdTYTFdZrZjkO4JAJRTbSGMek9gyQW6gZPC1vXS6EY
         E6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1avOVOvremPzgizGcj5WLFA7Q1NR0Z4dLUlm0wTw8OE=;
        b=SRYSWOPOtJvMbvyUbgwpTMtQt2LshvrBMAnjIsNHWgmehnbkYxxZ1WTJzRCKP6lh7V
         ajze/6DMt8VFHufpH5MRBtgOVYdUyEJmFQX8OwHAXU1EsPPygE3FzkkBahR/8YXez8aq
         84fstv2zi2+GP91N8Hm7rYkjPCgMghVZmXECUIN+XvCF+BtawpgCpN20F/vB0XVREsGx
         p6fD3+5ZTtd9WzS/+hgnUOOT4IIhg3RCkbCLi46R4CGxJ8dfTHG7DDjWEvqSeegoryb+
         46OX1ZZmZgwYuz34p/EDkFJmsvTmshmx9wtAfAqQHoAwNu0UK/Jol0YVTMJcI1XdEOd5
         YXWQ==
X-Gm-Message-State: ACgBeo3942RMQZ2KPsynMwpd8GcDKM4kw/nmlGRppk9L6y4zgjQcy4Zt
        Ci4udLrt1JWhv2irLaVALZfFRw==
X-Google-Smtp-Source: AA6agR5ebvanViW4y7lh+xQR5g7xWi+K4+hnZ5po7ClqW+djA2ZZ4iS62EfTP1uWujzj9Ao043j5sQ==
X-Received: by 2002:a05:6512:2605:b0:492:dbb3:9b85 with SMTP id bt5-20020a056512260500b00492dbb39b85mr4302890lfb.669.1661259448847;
        Tue, 23 Aug 2022 05:57:28 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id b17-20020a056512071100b00492c77c55ddsm2212340lfs.67.2022.08.23.05.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 05:57:28 -0700 (PDT)
Message-ID: <15fdd5c2-9c01-ee4e-98f9-559e926d9925@linaro.org>
Date:   Tue, 23 Aug 2022 15:57:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
Content-Language: en-US
To:     Peng Fan <peng.fan@nxp.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "wsa@kernel.org" <wsa@kernel.org>
Cc:     "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
 <DU0PR04MB9417E7BD5F1FB7A8E00BAA3F88719@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <7eb3cca0-1be6-8f7f-a7bf-f0c9478e7080@linaro.org>
 <DU0PR04MB9417CA946AD601F900500A5488709@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU0PR04MB9417CA946AD601F900500A5488709@DU0PR04MB9417.eurprd04.prod.outlook.com>
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

On 23/08/2022 15:49, Peng Fan wrote:
>> Subject: Re: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
>>
>> On 22/08/2022 11:46, Peng Fan wrote:
>>>> Subject: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
>>>
>>> + Wolfram Sang I2C maintainer.
>>>
>>> Krzysztof,
>>>
>>> Do you have time to give a look whether this patchset is ok for you?
>>> Please forgive if this is too early ping. Some i.MX93 dts update
>>> pending
>>>
>>
>> I don't understand the ping. You got everything needed from us, why still
>> pinging? What that DTS has anything to do with us?
> 
> In last version, you raised a comment that the driver patch broke ABI, not
> backward compatible. So I updated the driver patch to be backward
> compatible in V3 :)

Awesome! But you don't need my ack after such update. The ack or review
is expected from maintainers and I am not the maintainer of IMX I2C
driver or IMX platform/DTS. There is no need in pinging folks just for
some comments. We are all too busy...

Please read:

https://elixir.bootlin.com/linux/v5.19/source/Documentation/process/submitting-patches.rst

https://elixir.bootlin.com/linux/v5.19/source/Documentation/process/1.Intro.rst
https://elixir.bootlin.com/linux/v5.19/source/Documentation/process/5.Posting.rst
https://elixir.bootlin.com/linux/v5.19/source/Documentation/process/6.Followthrough.rst


Best regards,
Krzysztof
