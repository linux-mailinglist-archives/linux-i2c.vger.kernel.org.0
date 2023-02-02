Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4B1368796F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Feb 2023 10:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjBBJrq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Feb 2023 04:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbjBBJro (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Feb 2023 04:47:44 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929646B03D
        for <linux-i2c@vger.kernel.org>; Thu,  2 Feb 2023 01:46:59 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id h12so1111299wrv.10
        for <linux-i2c@vger.kernel.org>; Thu, 02 Feb 2023 01:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7LSJNpsdTumzuzb+ZqPJnH76wCvGImRrSuiCZTeWSY=;
        b=G1vY0r6yXxzL/nRzJb6pV+Nb1EqeDUYbvWIgOyXs4H2+WWA2xGHX69HRTWR+vTnoHj
         P2WW6UeCG0TWOoTadmm3NKkp0Khd8j9oFLLzUhohOIEpkM5giK4aQfHIaIZuUeLGD6v2
         QcPwxHJ77YO2JP5CYZ0fV1sJCQDLIAr7fU8Xqbog0UV9jvT7ejGwflkirJh1X4plFBLj
         TAYRRgPMeFyAWAUqvO8MJdU0jhLQ/VWopUMPmoRHg+Ki5YenA/CT53SFslEq5Wmcfzxr
         zJhIeA8J/yvHphV4uhuopo7fOFqV4yepaQsiQy2PMw1vOMVKb8feG/R4G/RoYooPhmj0
         xRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7LSJNpsdTumzuzb+ZqPJnH76wCvGImRrSuiCZTeWSY=;
        b=HPUvVSbX9ZNBhTGnSBcID9PgyZzjhzrPVGQoJVMXhdq93cHutqtjQxSOvVai4ceTCE
         vVkxfye6lO91AcCkJjc+UQCtl0OPnzJQnMxCyYVqhfYNMAv8mkqQEk7oA5+B54wI/4Ck
         IcmO9643n8Q5jC2J6++ZDb8OmHy/FEN6SSVgZuYH3KyvoKsK59UCARrsyYFHZ37+cLy7
         BBatII2YJMy0oI5YVmu4JeHQyf/sYeAPbolrh5c2V9xb5iLR0c1+Z9aXikFIkVeK093a
         GjSoG3lhQsGDTsnvSxOtDU17AgkexXebAQdT+UuBYQ6wu2bFypAFdKhNYLby3XgNvFY+
         FwJw==
X-Gm-Message-State: AO0yUKVGUbFP9GL7q0VbTlbdcLHCA1Hjl0bpSBTgVP1D6Y5XZr/pbI2M
        AqWqXqBfEkPSSxP2HvgiqCBkVA==
X-Google-Smtp-Source: AK7set+AoX32q9cg0KFR87dHq8mO6Z1vlOLkqdhKrS9M/FBzS5RArLO+E9zVRRoL1VEtBTza0SZuzA==
X-Received: by 2002:adf:ce0a:0:b0:2bf:b44d:6dae with SMTP id p10-20020adfce0a000000b002bfb44d6daemr5380729wrn.28.1675331190166;
        Thu, 02 Feb 2023 01:46:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l16-20020adffe90000000b002b8fe58d6desm18852055wrr.62.2023.02.02.01.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 01:46:29 -0800 (PST)
Message-ID: <266a4dec-ec2c-3c21-975e-301e3a7bb5f3@linaro.org>
Date:   Thu, 2 Feb 2023 10:46:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V4 7/9] dt-bindings: i2c: xiic: Add 'xlnx,axi-iic-2.1' to
Content-Language: en-US
To:     Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
        michal.simek@xilinx.com, michal.simek@amd.com,
        devicetree@vger.kernel.org, andrew@lunn.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     git@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
        manion05gk@gmail.com,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <1675330898-563-1-git-send-email-manikanta.guntupalli@amd.com>
 <1675330898-563-8-git-send-email-manikanta.guntupalli@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675330898-563-8-git-send-email-manikanta.guntupalli@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/02/2023 10:41, Manikanta Guntupalli wrote:
> From: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Your subject is corrupted

> 
> compatible
> 
> Added the xilinx I2C new version 'xlnx,axi-iic-2.1' string to compatible
> Added clock-frequency as optional property.

Use imperative, not past tense.

> 
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>
> ---
> Changes for v4:
> Added description for clock-frequency in xlnx,xps-iic-2.00.a.yaml
> ---
>  .../devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml      | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> index 8d241a703d85..92cb9006e8b7 100644
> --- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> +++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
> @@ -14,7 +14,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: xlnx,xps-iic-2.00.a
> +    enum:
> +      - xlnx,xps-iic-2.00.a
> +      - xlnx,axi-iic-2.1

Keep the list sorted alphabetically

>  
>    reg:
>      maxItems: 1
> @@ -30,6 +32,10 @@ properties:
>      description: |
>        Input clock name.
>  
> +  clock-frequency:
> +    description:
> +      Optional I2C SCL clock frequency.

Is maximum known? If this is optional, you should have here default.

Best regards,
Krzysztof

