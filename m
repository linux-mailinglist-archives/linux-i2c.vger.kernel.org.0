Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A1167E5BA
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 13:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234381AbjA0MtN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 07:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234355AbjA0MtM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 07:49:12 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B6B1F490
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 04:49:10 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so5346739wma.1
        for <linux-i2c@vger.kernel.org>; Fri, 27 Jan 2023 04:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d9Bsr7DFt9k0hs2DJVlMaFwbMOMWvruv/P9/ucfP1ow=;
        b=agScGHnFDnvBP+FJsZIRahMZD5/Zus9ycraLbcQm/YSoi6nJrRys5z8XIOVzFlKbEc
         mWV1Kvy+EPULBpQ7o9/SkCXe2xQ6dH9FE2aZr1lzIiN1iB/ftEzv9mOqk1YyqcSy1Cso
         FGpbAEKkhpsrwh7TjKN5QVMBDH85oh8CeI0HKJSA7KkjzwK+Ow+MPH+ZHlbTOrUn4Vij
         1i8A5SyCQBvGE8C02RXGa/AxVO1871iOw/5K7AAYz9ZCIWMcW/QmSByV/xKy58RD2rKx
         3oQ8E5TOm6kApyW42RuLvObwBfqwXKeah0fgjsTkJQF5+ItSzC0S8i2R9lv4b8fRKrkN
         JzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9Bsr7DFt9k0hs2DJVlMaFwbMOMWvruv/P9/ucfP1ow=;
        b=Kgjgr7jPU7YL8kyzc2IcrGmeWY947nL0fdQYd0+BIlWSIzk/sXFytyOAey0vCt1n+u
         NINVXVFvVUIX73a8v02vF5kmbY/TbqfbguaUj6oG7GyoXN7YLZAsbvv8JcL4JwOt+DWj
         L1/Z3ttNjCV5bLBO1HAf7KOYxJxAbCF6NJ/GDsarVBKXBhwo6mf84hOn8qPP0WCumzyo
         C31eD7y4vV/645M/WhBp4rSfKXiUTZVTzplpQ08EVEbZSwAkeqtPtz8TuQncBETXO/LL
         JxVc6/0zD6ABvoj+bk03e4kuLuwQWMejx4tTYYSvH3a/39RNc0xNgJH0FX1A/etTxx3P
         fqEg==
X-Gm-Message-State: AFqh2kp5vk6v36dUylfrgqb+UL79mUpGva8PkvT+TG5Kdcw19daLXv1U
        8LnDsTnxI98W/8HwP5e04fYRJQ==
X-Google-Smtp-Source: AMrXdXsd4ggG4Zq42GESy8acOm7B6Ldu7hFTX6C4RTjcwOhKUpawaEzvKZtvaJbMXC56bgs2+VL38Q==
X-Received: by 2002:a05:600c:4e94:b0:3db:bc5:b2ae with SMTP id f20-20020a05600c4e9400b003db0bc5b2aemr36433923wmq.41.1674823749453;
        Fri, 27 Jan 2023 04:49:09 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f24-20020a05600c491800b003dc0cb5e3f1sm4048133wmp.46.2023.01.27.04.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 04:49:08 -0800 (PST)
Message-ID: <2989138a-8f4b-50a0-3e90-98b6785f2690@linaro.org>
Date:   Fri, 27 Jan 2023 12:49:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm6350: Add camera clock
 controller
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
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
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CQ2ZDQKO11XZ.HA5CXLK5MTFB@otso>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27/01/2023 12:45, Luca Weiss wrote:
> Can I reference <&camcc TITAN_TOP_GDSC> from itself? I know that having
> it on is required to turn on at least some clocks (maybe all clocks).
> But from what I understand how power domains are normally handled, the
> driver core enables them before the driver is probed, so self
> referencing wouldn't work.
> 
> And at least no other SoC upstream references TITAN_TOP_GDSC in camcc.
> 
> Regards
> Luca

Doh I meant to say a power-domain to an mmcx a la

power-domains = <&rpmhpd SM8250_MMCX>;
required-opps = <&rpmhpd_opp_low_svs>;

TITAN_TOP should be in your cci and camss dt nodes.

---
bod
