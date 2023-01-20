Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB1B675350
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 12:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjATLRm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 06:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjATLRl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 06:17:41 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744231E291
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 03:17:39 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so5599276wma.1
        for <linux-i2c@vger.kernel.org>; Fri, 20 Jan 2023 03:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUigsRmkXItA6bUlKwYNj2lqkTiqf/I1oCA6A0jR9ew=;
        b=HOYUi5u8nNi6mfzhsiaQo4s/O6EAuoDO7t8cZHJB5e64BXNrnptRP56upnmwhc/rCh
         3jZwWoss2pnA7D6QJPCu3+2ba2I0NqjU1uMO5N1vjgLozGKsBPBrdRmeU7wiQzSkQ4kX
         ottKKbrkunQsBa1SS7z0Vxcg+VefpGjqSicMx+o9pmOXVpGmmKML7FaBjV2eFzNfJA6R
         M977axLvmi40HdEHzIlycK0UPoSVwSI52oIUtuAncV6mQsqm4+6tmFedNrez5VnMdmCA
         wUEbZWEH0JS/9RMCO6g19INkouC2zyuofjqTMmfjc/ymP9sUo97cO5/nyE6siGUuvl26
         ev/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUigsRmkXItA6bUlKwYNj2lqkTiqf/I1oCA6A0jR9ew=;
        b=HdjaMz5d3FnffwvAjt+cNDGn1sOnCQW2F8vsnxlvOuPA5mbEn4pNfU3oA4Q/Wa3GjQ
         Pa7KyK7QaYo5CPFhKfan3WPRyH86WX6+6X1HyKNbM9lGIOvp9HbR9WGh+8FGDH0CcD76
         IqV4qC3O1LJojq9v1FewWwiVx8ZBWJBetp5YgVxlUnRIDa0O8wU6gnKwHSnKx2SGsqrb
         i2SWRsrZQwi0bOq1ks97xR6vZoCnRXqo1fmyYe5JOBGZCKNh4J7Equ0vj+6wRtBngfUF
         DEHOeUFnlM+JLge0IaCEnGVUYKrofVsfiL2LfPTRumEXXhZ/Gc12ktJKowxRxT9gGnml
         hXFw==
X-Gm-Message-State: AFqh2kpfvcKghHia7GWEzcPHVrXQhcucJmte11MP2SrICKiHUzcy6BHN
        nLZ7BOQtkokcRMFnOUkKdvpnuw==
X-Google-Smtp-Source: AMrXdXv1GyW15lzWgOsJbli/Sm2gt987OIIchyWtf68r8s7aNtwe7bTFmb2cPTgluncvv68Cno2jug==
X-Received: by 2002:a05:600c:3b1e:b0:3cf:497c:c4f5 with SMTP id m30-20020a05600c3b1e00b003cf497cc4f5mr14014830wms.13.1674213458038;
        Fri, 20 Jan 2023 03:17:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u3-20020a7bc043000000b003d1d5a83b2esm1949560wmc.35.2023.01.20.03.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 03:17:37 -0800 (PST)
Message-ID: <7a4ab7df-5790-bdde-388d-8a848d2ebeea@linaro.org>
Date:   Fri, 20 Jan 2023 12:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SM6350
 compatible
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
References: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
 <20221213-sm6350-cci-v1-1-e5d0c36e0c4f@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213-sm6350-cci-v1-1-e5d0c36e0c4f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 20/01/2023 12:11, Luca Weiss wrote:
> Document the compatible for the CCI block found on SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

