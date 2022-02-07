Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C22084AC8A0
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 19:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiBGSc6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 13:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbiBGSbe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 13:31:34 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A06C0401D9
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 10:31:33 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id z7so20975811ljj.4
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 10:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NddTA8JTEM8uEkIveiNRta0hpicmCOBMWm+eYHHc8p8=;
        b=IWuDFDU4wr0TiaPoaW3kU1CsX3fnzJMnTSop6BprigMbs90GF/cdHHKM7rF4pEE4WI
         mlnsP6VI6SmNyZwlryimRJDrModfe4+U0uePAo3vb+Fs1P4LVlM01a1vuwmcJzJ+BhX9
         wtQPBaN2qUPAsTj2NK+NDnBb3I/LUZ88RqBsmpSKjeyqnjz51RecaN3iv/qBt3t4KPvF
         2iU5WBPtOTJK+k/hpKekECzjJeqwgBrjVf+BChiVNpM7iNRl8hGf+CfiNeFxpn+CiP56
         i5jvxeRyGK/0RA3BvUIhXR+1zUdYau+UqwYjmWEtlOe/JxNutp5y7uzP6KbCSod2Wj6R
         s87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NddTA8JTEM8uEkIveiNRta0hpicmCOBMWm+eYHHc8p8=;
        b=dHqXmrhU5rOdaCR7YWV6qEUVE785vp19kVRaIxgWqouhgyI8ZHACr3l79GRb5Xn6jG
         WBTLPIQPOAptz6bCIz9N/KsglMuuKYXNQoXKKOD+3B5avzlrDejpFRmND/DRoSqHaIPF
         9aw6WD4SMzXOLm8/doMPWoUte12XQ1isKRe7gumkI2JFl9f5Un18sk2uTuB+h4TVUEeW
         EpuicqijXUeYLkNTMdubBAL5EGp5VEAVD+NlApSNTeAHh4zXvMonYAruSsDWVqrdw49n
         Jl0A/GL5WXGrkU6NDANJYRagbJ2ZPPHbBMTNi+Jgc84UdEaF/fL5O0exTP3IM3vGSuck
         xHGA==
X-Gm-Message-State: AOAM532cVLojjqw8QcqLuPifIooQZ6TE21XrJexHsG0tTCC7FZXWwEi7
        czgz0fHGpNtzYgOlPKDG3nQkJw==
X-Google-Smtp-Source: ABdhPJzS7ltlwsGJn6FZ15E+lK+3hhf4ZXz0pU4Wl811KANBgWF+2pB0plDEmASKTBGFh0MNaO8llA==
X-Received: by 2002:a2e:9847:: with SMTP id e7mr499578ljj.238.1644258692051;
        Mon, 07 Feb 2022 10:31:32 -0800 (PST)
Received: from [192.168.0.102] ([217.71.236.28])
        by smtp.gmail.com with ESMTPSA id y17sm81028lfk.57.2022.02.07.10.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 10:31:31 -0800 (PST)
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
To:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linus.walleij@linaro.org, Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
 <Yf1q+wlXo2LAeZX+@ripper> <Yf1zhojUSxlMNZgV@sirena.org.uk>
 <Yf14LADJ26G9ByZu@ripper> <Yf1/X1rXm4QbyoFN@sirena.org.uk>
 <846cdc17-891d-2ee4-fc89-7cf6fbdebc1d@linaro.org>
 <YgEvN0lXXu4lDCN5@sirena.org.uk>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <682b7ffe-e162-bcf7-3c07-36b3a39c25ab@linaro.org>
Date:   Mon, 7 Feb 2022 20:31:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YgEvN0lXXu4lDCN5@sirena.org.uk>
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

On 2/7/22 4:39 PM, Mark Brown wrote:
> On Mon, Feb 07, 2022 at 04:08:01PM +0200, Vladimir Zapolskiy wrote:
>> On 2/4/22 9:32 PM, Mark Brown wrote:
> 
>>> Oh, good.  I forsee no problems here.  Probably this is something that
>>> should be in the I2C core if it's going to be dynamically managed,
>>> though just setting the supply as always on is probably more expedient.
> 
>> vbus-supply property has been added recently to another I2C master controller,
>> see commit c021087c43c8 ("dt-binding: i2c: mt65xx: add vbus-supply property").
> 
> Note that some devices do have supplies that I/O is referenced against
> and it's not clear that this isn't what's goin on here.
>
>> It serves right the same purpose, and its handling is going to be done in i2c
>> core, however since the latter is not yet completed, I would propose to add
>> the property to i2c-bus subnodes of QCOM CCI and its support in the driver,
>> later on both the property and its generic support would be better to see in
>> i2c core.
> 
> The bindings are ABI, it doesn't seem like a good idea to add new ABI as
> a temporary bodge.

The bindings are supposed to describe hardware, thus it's natural to extend
them, I believe there is a trilemma in this particular case:
1) add optional vbus-supply property to all I2C master controllers or I2C
    busses in case of multiple I2C busses managed by a single controller,
2) add optional vbus-supply property to all I2C slave devices,
3) ignore peculiarities of particular (multiple in fact) PCB designs and
    a necessity of adding a regulator finely described as a pull-up for I2C
    bus lines.

My assumption is that a decision should be generic for all similar cases,
Wolfram, could you share your point of view on the subject?

--
Best wishes,
Vladimir
