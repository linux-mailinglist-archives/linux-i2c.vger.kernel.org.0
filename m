Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02EDC4AC15E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 15:37:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344128AbiBGOgk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 09:36:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391021AbiBGOIg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:08:36 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B15FC03FEC6
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 06:08:29 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id u6so6066592lfc.3
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 06:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fLhp+WWUm1vVXS5XWMKEtv0+L1QgW8Rkp/k7i+gibrs=;
        b=MSuqqIF5LI72mYLzJaJPbv0ML26XhrEI3+Js/u5uNtPisvYGis6UxutY+EziIH7xXb
         5DnKb+IxWH1XIfbLz3oP04dPWLg2WFRAs2oMgBKkCycXMQF9xRhAZW57gc0thQE11ZJl
         h/OHTXfotsK8zM+Jahgem9vxDtqJbslSode/na37fmosQblelrm6+lXWdjGX86t811vQ
         uiY8QnVDepzvCeruhnbV1e8Sw2DYnvutsPA+GqtHfh+WfYWLuLdEMP4QMkEVUjLydgz8
         g4MYOQ3KPgM/lWJvyE6tU4Ag8n5wnNfGidUEa5GYFXv50HL/aqOulQE451Cc/jJ2YT27
         DulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fLhp+WWUm1vVXS5XWMKEtv0+L1QgW8Rkp/k7i+gibrs=;
        b=0G608y3vXueIXhaap7nZdW2NF6y2CU8lta3qhxkE3NT7pbZeHKeMwVaCd1Av+s64Ss
         ++gL0yI1tQrBW6b7XBrRhK3jKwDNIXnoaA74NpnipbjEZV5TMcYK073TQYLWlpg/wUM4
         CygzQ9s773twR/o57Fl3ni+KpWIJqioxulH14CrOYqQQIIanSLQEEbL25g100fXmF49Q
         Cq/3InYzKhLy9Y286RK4QyJOm/Y8UGOBpg8Luc515XqWRPGrv11f7bEk30ZJck4L1go3
         iIEtiz2d5W8ZdUmSBu4lZHR0+tDuYfHSefuCZ295q+VGtOKXtpna99nedDToa8acGz6b
         dzPQ==
X-Gm-Message-State: AOAM532g5EZXdrCleEdD6BWp9rsLnrKUVveAJu0er4iaRr+f+en28Kzj
        MUAdkysFLszODP4tYD16WJmpng==
X-Google-Smtp-Source: ABdhPJy0awm/eN/ckVzUS1VOXJf7aP/mshK1zmoOblk/KvzKdLmKpxuXzvyZv2bVR/T0LfwdSgkMfw==
X-Received: by 2002:a05:6512:3b9a:: with SMTP id g26mr8515824lfv.71.1644242907805;
        Mon, 07 Feb 2022 06:08:27 -0800 (PST)
Received: from [192.168.0.102] ([217.71.236.28])
        by smtp.gmail.com with ESMTPSA id f21sm1504616lfg.300.2022.02.07.06.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 06:08:27 -0800 (PST)
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
To:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linus.walleij@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
 <Yf1q+wlXo2LAeZX+@ripper> <Yf1zhojUSxlMNZgV@sirena.org.uk>
 <Yf14LADJ26G9ByZu@ripper> <Yf1/X1rXm4QbyoFN@sirena.org.uk>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org>
Date:   Mon, 7 Feb 2022 16:08:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <Yf1/X1rXm4QbyoFN@sirena.org.uk>
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

Hi Bjorn, Mark,

On 2/4/22 9:32 PM, Mark Brown wrote:
> On Fri, Feb 04, 2022 at 11:02:04AM -0800, Bjorn Andersson wrote:
>> On Fri 04 Feb 10:42 PST 2022, Mark Brown wrote:
>>> On Fri, Feb 04, 2022 at 10:05:47AM -0800, Bjorn Andersson wrote:
> 
>>>> Typically we don't don't mention the bus-supply because it happens to be
>>>> pulled up either by io-supply for the block, or by some always-on
>>>> regulator in the system.
> 
>>> If the bus is being pulled up to some supply other than the supply that
>>> the bus is referenced to that doesn't sound like the greatest electrical
>>> engineering ever...  without any context it's hard to comment about this
>>> particular system.
> 
>> That's what the schematics says...
> 
> Oh, good.  I forsee no problems here.  Probably this is something that
> should be in the I2C core if it's going to be dynamically managed,
> though just setting the supply as always on is probably more expedient.
> 

vbus-supply property has been added recently to another I2C master controller,
see commit c021087c43c8 ("dt-binding: i2c: mt65xx: add vbus-supply property").
It serves right the same purpose, and its handling is going to be done in i2c
core, however since the latter is not yet completed, I would propose to add
the property to i2c-bus subnodes of QCOM CCI and its support in the driver,
later on both the property and its generic support would be better to see in
i2c core.

--
Best wishes,
Vladimir
