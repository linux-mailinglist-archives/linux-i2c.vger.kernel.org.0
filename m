Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC85D67E659
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 14:16:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234666AbjA0NQJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 08:16:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234674AbjA0NPt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 08:15:49 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3DA790A1
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 05:15:23 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id rl14so13672735ejb.2
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 05:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iHkUhEVRPMP3NveU+Wy0L7G6Q4+mtQgaqKDo2k8993M=;
        b=yLDFHcNqI5yLZb1QoRHjrTt6MuHLALVachw3IoxqeeuZWsaSh63leWZE2HNSO4AaDR
         aIozyK8o906ffIyqf17f9Bl93k/ARLoMcc2WV85yy4mejc5Dg+otNSN1SqbmpWsooDpL
         KkdKJaaSFSRi/aIml5oSzP8XeZVZROWS4iH9yC4HoOI5rwiq0bR/IHeTtmlVmhCx7YkS
         LP/jOR/VnOpIy+H2+FtMDjNfi91Xh6yrVZHIiby0vyEAok8SG1JzrX+JjLdUesqs9K5e
         AuZrWON6VodqpKSUXIHiWqz8pa/R3Zm8No6OA2D26aDShjLwTctPbzjEUXG607zDVD4l
         Ying==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHkUhEVRPMP3NveU+Wy0L7G6Q4+mtQgaqKDo2k8993M=;
        b=MREtOFw/A2XIo/RXmalyaLJ8iZu15xHf7bOEC32yafHMOII9Aihc3lXyiJ3xOSwikr
         N3VlJcu4WVyen2aJ1AT87lIttTyiEl+upiWPfQ5CbTLw0YSOVMxlN7R2+b0mDWO+cf85
         sHuP0yRnYKgdXgucIHFlpKiyy5oytTOf1aFX4Qa9wlITMT3nYdhGEkiWEpS7QWoJu3NR
         83cLjN0tQAhK29kw6rt4U0zhv949kQsBfSI77GKO5zNNgY5DXH/Bp3GovNyTmP6cpHca
         8tNLouFxXgjXAlTg2/WZdOI9k1hgKrIsDD2jxqc1zb/j7HzbAg5SuFKFapUgQxgVbCbd
         4BPQ==
X-Gm-Message-State: AFqh2kolzxYcDc84jjbenUHXqDnwbGR01xpRSCi5dhT/TTwXH2EmzXbT
        oltjVcQDMfR2cczap09OPcLzRA==
X-Google-Smtp-Source: AMrXdXvWc8OAEpLOHe9XuMSWvT5rx+JxUq/A7uaYRzNur3jexY/O8PIr0uipN0gLgNDzL/+xQFUdWg==
X-Received: by 2002:a17:907:a68a:b0:7c1:4d35:a143 with SMTP id vv10-20020a170907a68a00b007c14d35a143mr59338645ejc.3.1674825298693;
        Fri, 27 Jan 2023 05:14:58 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id u25-20020a170906069900b0086dee4e5555sm2223289ejb.87.2023.01.27.05.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 05:14:58 -0800 (PST)
Message-ID: <10a23abc-837b-4f7c-0332-e0b318f49b9d@linaro.org>
Date:   Fri, 27 Jan 2023 14:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm6350: Add camera clock
 controller
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
 <20221213-sm6350-cci-v2-2-15c2c14c34bb@fairphone.com>
 <e5ff49d4-45c7-8c4a-d624-d8f7cc9ce2cb@linaro.org>
 <CQ0I4ONEI6J4.3KWS1KBE7RTKD@otso>
 <3ae863df-3260-4863-d88f-da4d3f442174@linaro.org>
 <CQ2ZDQKO11XZ.HA5CXLK5MTFB@otso>
 <2989138a-8f4b-50a0-3e90-98b6785f2690@linaro.org>
 <CQ2ZY0W1M4F5.32SLTSYMILGOS@otso>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CQ2ZY0W1M4F5.32SLTSYMILGOS@otso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 27.01.2023 14:11, Luca Weiss wrote:
> On Fri Jan 27, 2023 at 1:49 PM CET, Bryan O'Donoghue wrote:
>> On 27/01/2023 12:45, Luca Weiss wrote:
>>> Can I reference <&camcc TITAN_TOP_GDSC> from itself? I know that having
>>> it on is required to turn on at least some clocks (maybe all clocks).
>>> But from what I understand how power domains are normally handled, the
>>> driver core enables them before the driver is probed, so self
>>> referencing wouldn't work.
>>>
>>> And at least no other SoC upstream references TITAN_TOP_GDSC in camcc.
>>>
>>> Regards
>>> Luca
>>
>> Doh I meant to say a power-domain to an mmcx a la
>>
>> power-domains = <&rpmhpd SM8250_MMCX>;
>> required-opps = <&rpmhpd_opp_low_svs>;
>>
>> TITAN_TOP should be in your cci and camss dt nodes.
> 
> Okay, that makes more sense.
> 
> What I don't quite understand is why sm8250 only has MMCX listed there
> since downstream has both vdd_mx-supply = <&VDD_MX_LEVEL> and
> vdd_mm-supply = <&VDD_MMCX_LEVEL> and both "supplies" are used for
> different clocks using .vdd_class
> 
> But back to sm6350, downstream has vdd_mx-supply = <&VDD_MX_LEVEL> and
> vdd_cx-supply = <&VDD_CX_LEVEL> and like sm8250 uses cx and mx for
> different clocks.
> Not sure if I should add both, and I guess mainline also currently
> doesn't use higher ops for the power domain when higher clock rate is
> needed, from what I understand?
Basically if you don't need to power any of these power rails to
have access to the clock controller, you don't need any of them.

What you will need to do however, is make sure that they are scaled with
child devices then.. but that's no bueno since they all need TITAN_GDSC.
That's why Bryan suggests leaving a vote on a power rail in the clock
controller, so that if no other votes are present (as improbable as
that may be), you will still be able to get the clocks going.

That OTOH will require you to add power management support (PM ops)
to the clock controller, as otherwise you can say goodbye to battery
life..

Konrad
> 
>>
>> ---
>> bod
> 
