Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99D4E5959BD
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 13:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiHPLUu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 07:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234649AbiHPLTz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 07:19:55 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E370CE2C54
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 02:44:40 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id u1so14186302lfq.4
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Enloy5lgKrMKVLbqE4UqCEXL8D9Wgy3KUpK/qyBoIrI=;
        b=bmhY0kYxRm0Pu1Cs0YlMSETk0hz7OlpKbOUt8eVnlNIeRbuboqVaSXl/78n+u1O29t
         RWkFw0mRgGs6O9xp37PVWEjfbpC9cvfDuPeJDbI1CWUKikDaalsk6P+uWh8uNsnn+f/P
         QIFsP8CfQuNuSIih2QvNTFRYGLDmv2wNF3ku4sXH+o83ZAkPRnbVk/wplO4egti048ZD
         ErxTSkVmZxvFPLxaqXZd1gC4KD0DYq32h2XL+NCU4wmEzS981G+5fm+K2KJHHNjFk5CC
         UzE9+Q6LCgzSP1ffDEM/NbheuzW8sp649Ns0J1nneXwCLJwPo+miQhcLwuRVAiQukuJU
         I7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Enloy5lgKrMKVLbqE4UqCEXL8D9Wgy3KUpK/qyBoIrI=;
        b=7SBQV2x04RKqlR0nmKxqAF6skDurb+obq+/N/pYtego3CwolgkPxSIEkT7afmZoMdD
         zh1LypJLC+bNvqtovN0FiRcQ1PCsYCYSq+oDJHs7DZqHxdmtTAO7n+pvxcERS7JYtMth
         8wsaXZkaZX9z2RxBENqmZzZNb+KH7uw6+lwxyeWqHZau/MjLzUJPasOAEdt5Xa3iy2G4
         XdxUnzmsnhwK/OFDQm8bDeTkOsYMMb5WMFkR42gYlotE9XgpkWw+aiUUYNi/OzBIDkeR
         04gIhqvQC3Ye3961Wo9usc37tOn84Y5dJXwXypKFXOT4B1n7JajBarolnowxv5r5Etpi
         80Hw==
X-Gm-Message-State: ACgBeo3vyLOuoplbqrr+qpYpDJcNGSCk+qyTVqc0RBiIRtJIK6+q20oe
        a6OmabJEOs+nSQKN0qT5xl70ug==
X-Google-Smtp-Source: AA6agR54PZx7XS1rYcJtMRhTAqOXN6+VFqLfzj/NiD8GAFWFKJ+lry6TmRGXna2tZtdoMf6GdwYMxQ==
X-Received: by 2002:ac2:44af:0:b0:48a:f361:fe1d with SMTP id c15-20020ac244af000000b0048af361fe1dmr7226313lfm.190.1660643079100;
        Tue, 16 Aug 2022 02:44:39 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id z12-20020a056512370c00b0048b08e25979sm1330665lfr.199.2022.08.16.02.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 02:44:38 -0700 (PDT)
Message-ID: <b630a007-2548-2196-a963-786c6a98b748@linaro.org>
Date:   Tue, 16 Aug 2022 12:44:37 +0300
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
 <039566a7-5c65-b2d8-7b45-c616863cb292@linaro.org>
 <DU0PR04MB9417EF15DD50EC51B4FBBCFF886B9@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU0PR04MB9417EF15DD50EC51B4FBBCFF886B9@DU0PR04MB9417.eurprd04.prod.outlook.com>
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

On 16/08/2022 11:43, Peng Fan wrote:
>> No. For such patch ABI break is also not allowed in that case. Just make the
>> driver backwards compatible and both problems - non bisectability and ABI
>> break - go away.
> 
> One more point that I am not very clear about  
> "non bisectability and ABI break "
> 
> ABI, I suppose you mean dt-binding, right?
> The I2C bindings and dts update will go through different tree, I think. So
> dtbs_check may fail considering the PR merge order.

ABI break means breaking Application Binary Interface, so out of tree
DTS conforming to old bindings stop working with new kernel.

ABI is described by bindings and implemented by driver. You broke it in
the driver.

Best regards,
Krzysztof
