Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C929D75EA07
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 05:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjGXDV5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jul 2023 23:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjGXDV4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jul 2023 23:21:56 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9AE13D;
        Sun, 23 Jul 2023 20:21:54 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-d124309864dso179434276.3;
        Sun, 23 Jul 2023 20:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690168914; x=1690773714;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5gXp87FdyDQ9jbHfN2VxP5CgykvIrcfvrmu6OPAgs4o=;
        b=VlrmZpAcliY2nHkMtFA29j0IxEkzZClRqlekwMNLB4g//RzSwRjI0p5Phhs8pFSP9H
         Pob6zkHs8lWBQ51MhD1MpfdHfMJEuvNf0tOquED7xJ/QSByn5Sc50fXWTx7A1Ve6mYac
         pVDOHHfwpjBjC7/f8XqLRHTqVZbvzxFn4WYBvyK99c14pCWaofm07TUl/KZXjGg9lvfX
         l8QTB/tVKk4Rry9OiTdzPHvFlxoJY3Yy33zFsusdtoWjFKl5dN4V3jRH24CKLHTeKhC5
         W+rAQbflmgajrraj0tP0CDN62GOQcsC7/2NdUkXGIM+0pOWN76pbAs02YW9WncwnbDbs
         d9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690168914; x=1690773714;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5gXp87FdyDQ9jbHfN2VxP5CgykvIrcfvrmu6OPAgs4o=;
        b=JxYZSWHTmomyhvryzpcG0csPn+lW+zr4SbNOE6tiUdL/rs9zmJC+iuy+K0rQ2yqcUF
         mQeUUnwvkJCSiBFiQXvX6WM7VRCUKBgHppdsafeHdpPm/XboSej/SFgA4ummMZj01kVL
         lpTuysdCsAMWlEfuCbehkiiqc3cthFte4/Xw2omWizqYHpNeaiDN3OfOizFMhTW+NMP1
         MQ65300Zus2DtRCOV+QpdDawMtVVmoiaogOAWQ9URd2Ep6gqgtt/G8MM+8BDjEYG/2AN
         zZ4RXvgeReloFblQ2AgxtdiTwAfhhfO2g95xeCuQv/1/eSfR82GlrplknfScLr+zNasY
         fFmw==
X-Gm-Message-State: ABy/qLaxrA6nmdM9KqWFJ8I76GuDiLo85FPW/aqH+eVyc5qYOK0STqfz
        n72pfdeuuTTHNEIMcs2+nQY=
X-Google-Smtp-Source: APBJJlFFuNlgAGSz0kM5w3Pa5wQXn+44xlh1+P4aHAt0yfJ7fE+6sBOAjN/LdMSBvUZOmPUc9Rtl5w==
X-Received: by 2002:a25:2f85:0:b0:d0a:7e3:fa0 with SMTP id v127-20020a252f85000000b00d0a07e30fa0mr2691363ybv.53.1690168913855;
        Sun, 23 Jul 2023 20:21:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gp20-20020a17090adf1400b0025023726fc4sm7280497pjb.26.2023.07.23.20.21.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jul 2023 20:21:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e093a52d-e36f-ec26-e218-1e3b3b400e34@roeck-us.net>
Date:   Sun, 23 Jul 2023 20:21:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
Cc:     "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-2-Delphine_CC_Chiu@Wiwynn.com>
 <321a84c6-6d74-4042-a6ce-6229073c8d30@roeck-us.net>
 <SG2PR04MB55436F03F6CAD6D415FDEE40A102A@SG2PR04MB5543.apcprd04.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
In-Reply-To: <SG2PR04MB55436F03F6CAD6D415FDEE40A102A@SG2PR04MB5543.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/23/23 19:12, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:

>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - lltc,ltc4286
>>> +      - lltc,ltc4287
>>
>> There is no LTC4287, at least according to the Analog website.
> It has been announced on Analog Devices website.
> Please refer to this link: https://www.analog.com/en/products/ltc2487.html#product-overview
> 

No, that is wrong. You are pointing to ltc2487, which is something
completely different.

Guenter

