Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6326667E72B
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 14:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbjA0N4y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 08:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbjA0N4w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 08:56:52 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9EA7CC9F
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 05:56:50 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id g11so4769787eda.12
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 05:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXA46BdA2s0F2yreUEYFr6AiDGQqI1YBsrC9BTQ1VjY=;
        b=B5tnFz61tRu/w0bu3UUA6g2CJbLy6qum2pJHpXh/UqrC+3aXQtkWnKBUvNcH+qQb3w
         F3nRhVHNflBWo1/L9jwe5S6TzQ7+/Ze3X5HCUnlynOtmyf3Jf3rWc39HGojfwz/tqEw5
         b6qtJNIs4CWtYLNAuxOLDylJEcNfIo0nsivOxG9NUAodn068NachewhCLgzyOdv+yp1L
         mD2n+1fI2pvhUDxzFVOb69JdqGvxxg5hV7lMPNFgWgwnBi+dvfCwWhF8RGG/sZrzfxu5
         3F/KtdkAGfqSk2iQcYnfnw95eQLVp+tqUxPhsKQfq9HbiBoRTESpV+RMNRdWqNs9SGrA
         rPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yXA46BdA2s0F2yreUEYFr6AiDGQqI1YBsrC9BTQ1VjY=;
        b=u3jTXkack3WSuCuJ+NYbglhbH+EdDYFy8Dqg+Ap8cYZJKjkHYRFDnh9DjfcMtrMFbk
         7Aq4iM4rIy+1Io+S8/xqg1qst1xz+yDH8pgMKOiMlX41TYHwPpcROZA/wGW7SOuc+g5m
         gGQkWw7R7emvg/bT9gNpW5b3LteCQ0+7rzcqt3Kq2pTYWPeOrC0liRI42vNbCuiD+F68
         oroFmwip4GkX6hDypWZHy36tH+MjtOZv27axc/ZjX6IXRr8YFD5JTEyWHnGtSsVxAOMW
         30pwpUpsOyqpQoGsMETbaNtE9P1ZoiIULP7GalAACoK4dGpbwwu8itamjFNO77Flp6HK
         oBjQ==
X-Gm-Message-State: AFqh2kpXmYWwD/CPa2WKNEbtGEap6plZhshbzkLBvJkH0oaUEfAo//PH
        xGRw2Af9UjHJ7VcR93Zaip+0ObTdmQzMNovp
X-Google-Smtp-Source: AMrXdXuwhrwldFsvH3ia+JZ4iUQf2dgKsJOxomlz5XN6l+4R/avTB57m49f1J8bn5L0CNVp+46p3uw==
X-Received: by 2002:a05:6402:5110:b0:492:846d:e86d with SMTP id m16-20020a056402511000b00492846de86dmr52421707edd.23.1674827809163;
        Fri, 27 Jan 2023 05:56:49 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id y8-20020a056402134800b004610899742asm2344343edw.13.2023.01.27.05.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 05:56:48 -0800 (PST)
Message-ID: <7456978a-47ce-2e8d-e030-2917da992c34@linaro.org>
Date:   Fri, 27 Jan 2023 14:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm6350: Add camera clock
 controller
Content-Language: en-US
To:     Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Luca Weiss <luca.weiss@fairphone.com>,
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
 <951e4459-6d98-f083-1dd9-fc0b12e53c96@nexus-software.ie>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <951e4459-6d98-f083-1dd9-fc0b12e53c96@nexus-software.ie>
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



On 27.01.2023 14:54, Bryan O'Donoghue wrote:
> On 27/01/2023 13:11, Luca Weiss wrote:
>>> Doh I meant to say a power-domain to an mmcx a la
>>>
>>> power-domains = <&rpmhpd SM8250_MMCX>;
>>> required-opps = <&rpmhpd_opp_low_svs>;
>>>
>>> TITAN_TOP should be in your cci and camss dt nodes.
>> Okay, that makes more sense.
>>
>> What I don't quite understand is why sm8250 only has MMCX listed there
>> since downstream has both vdd_mx-supply = <&VDD_MX_LEVEL> and
>> vdd_mm-supply = <&VDD_MMCX_LEVEL> and both "supplies" are used for
>> different clocks using .vdd_class
> 
> power-domains = <&rpmhpd SM8250_MMCX>; == MMCX_LEVEL required for camcc
> power-domains = <&camcc TITAN_TOP_GDSC>; required for cci/camss
> 
> now that you ask the question about MX_LEVEL you're making me doubt we have a 100% complete representation upstream TB perfectly honest, warrants a deep dive..
> 
> I just remember that on 8250 we tripped over MMCX not being switched on when - display I think was switched off.
There's no MMCX on 6350 and MX is a parent of CX, so if we just stick
CX here and add the lowest level to required-opps and add corresponding
PM ops to the clk driver, it'll all be taken care of!

Konrad

> 
> ---
> bod
> 
