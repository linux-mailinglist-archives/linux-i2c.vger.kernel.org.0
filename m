Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F132E4BAC09
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Feb 2022 22:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237403AbiBQVrW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Feb 2022 16:47:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbiBQVrV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Feb 2022 16:47:21 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884EC102423
        for <linux-i2c@vger.kernel.org>; Thu, 17 Feb 2022 13:47:05 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id a42so1408453ljq.13
        for <linux-i2c@vger.kernel.org>; Thu, 17 Feb 2022 13:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=J10hVBWBWzBnN+exLIwaL+UxouWVNqbJLTm7pqSm+BE=;
        b=ATtvKju4b79M/jlGSaaa271oSwLkRpHn1sF4RS9n30WWVnG/sKxH9v1KrfK+KGZ7tR
         F5qjZ782lKPEEcRN9TCSvnV2I/otD2d6CmlmlqIbIpvjwE+fxceX9yLizm5zXgHlXavV
         MwOqYvxdlnn+IEIdY4XdpxIG5ow9vgbN+ea+TjhdJ7UZwQz5YFdu/qCYlZaZeXQOxrJi
         gJVJEd7AY5GnV8/BTymP5P5nQkJ9l9nPi7Gxx6VXy3obBbXGUWON+45cIakbkWyXmDi/
         zY3SpFuBu/A3wLcMh56TzRLtB2pmDgim79NoLO3z1TgZUFbxtivvDkZ0e45Nc1n+IZLb
         WDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J10hVBWBWzBnN+exLIwaL+UxouWVNqbJLTm7pqSm+BE=;
        b=S/9ZyU+o7jOPrdIJApVY06Nc/4DjEMNQP5n0G7tj8repEbW7m464aZPRDA2J5tcdq3
         fi48PlTPhev9poiZaUzews6veuleLcYBUlCMSqXN02XVCF30+cQskmyKwy3AidO5cNB6
         jJazcjVRDYklwO+iEd7Er69b+uiOOaPUYPuAm/i5V+HswJO4iR2SEdYQeaIfRiaJEEAO
         qeegGDM7J7fWsMlF1fMWRbWMvPzmOX9ZA+YMrSnJaSQmePPwucgTd5NoKb3cyvdFbGvN
         c9WzNjbDxC5XNt9VtXQVNxlXDvgrtGAo4iaRi3GLGSLZp5IJmDWhCBwLe/oCOevsa2Dc
         pgTA==
X-Gm-Message-State: AOAM532PJauaCjQ/rQtli436Bo38PMpjf7ivMcwxLqZvjoXANSqLcd+Z
        zdcKunN/mf/tvvtrYU2yR5BYSw==
X-Google-Smtp-Source: ABdhPJxpDQiERpY2zy0r/iVc1+UZAfVfybaXvm5rYIPhgQAZ7dKty2RqqlvPEYAFxFbYqfBHKBbrIg==
X-Received: by 2002:a05:651c:b8c:b0:246:c5c:84d7 with SMTP id bg12-20020a05651c0b8c00b002460c5c84d7mr3596579ljb.15.1645134423863;
        Thu, 17 Feb 2022 13:47:03 -0800 (PST)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id k12sm98678ljh.45.2022.02.17.13.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 13:47:03 -0800 (PST)
Subject: Re: [PATCH 0/9] i2c: qcom-cci: fixes and updates
To:     Wolfram Sang <wsa@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <Yg6oxrlQZIsJCkUY@kunai>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <303a2bfd-b3d2-97a8-2438-fefe13a49962@linaro.org>
Date:   Thu, 17 Feb 2022 23:47:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <Yg6oxrlQZIsJCkUY@kunai>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 2/17/22 9:57 PM, Wolfram Sang wrote:
> 
>> Vladimir Zapolskiy (9):
>>    dt-bindings: i2c: qcom-cci: add QCOM SM8450 compatible
>>    dt-bindings: i2c: qcom-cci: add description of a vbus-supply property
>>    i2c: qcom-cci: don't delete an unregistered adapter
>>    i2c: qcom-cci: don't put a device tree node before i2c_add_adapter()
>>    i2c: qcom-cci: initialize CCI controller after registration of adapters
>>    i2c: qcom-cci: simplify probe by removing one loop over busses
>>    i2c: qcom-cci: simplify access to bus data structure
>>    i2c: qcom-cci: add support of optional vbus-supply regulators
>>    i2c: qcom-cci: add sm8450 compatible
> 
> Patches 3+4 are already upstream. I wonder if patches 1+9 could be
> applied to for-next also? Or is the vbus-supply a hard dependency here?
> Patches 6+7 could probably also be resent individually after some
> rebasing.
> 

thank you for applying the fixes, 1/9 and 9/9 are also good to be applied
for-next, there is no dependency on vbus-supply, so I would appreciate, if
you take two more changes.

As you suggested I'd start working on a generic support of such an optional
bus supplier property, I believe at the moment everything is quite clear,
I'll start from testing the previous solution, however my preference is
to connect regulator on/off to master controller pm ops rather than slave
pm ops. Additionally I am not quite satisfied with 'vbus-supply' name,
some name without a confusing starting 'v' should be preferred IMO, like
'i2c-bus-supply' or 'sda-scl-supply', name suggestions are welcome.

--
Best wishes,
Vladimir
