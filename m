Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7384F062B
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 22:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344372AbiDBUbT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 16:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236741AbiDBUbS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 16:31:18 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493DA19298;
        Sat,  2 Apr 2022 13:29:25 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id bx24-20020a17090af49800b001c6872a9e4eso5469440pjb.5;
        Sat, 02 Apr 2022 13:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0ZZWZbWVcWALwCo5lpRKmJjxkwFkNhYPr/C5DWHbhT0=;
        b=QfGkIx0JPjRc5n7t5Yfx71SDzVU5CTuyo+MlvZTRTPYWe9cis64OBUNVTdPgo03kiV
         8gU+pbcPDEdDrvyp3huVYl/fCr0aMX1l6X48I/2XkwnbhRMEtMmP4dZ1hA/96ORjg3hq
         ELx+obSg+l0u3y0AAdtIjAJ5RWBeHrub3prefWFCh6g3x8Si9BiglXUvThMlpw1niL7d
         42ORuM1Ld5c7XQk/0Ef7EGMjDnMT1nw2ugE7AnbSiSlPRioVu2xG7wKWSgqM1ZLQpZzN
         uYuBPZYgvTA5gnIc4moXip5nxOFnmnpexl69PlDNwuttYxWrIDXj6QJiUwyspxztOahP
         c4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0ZZWZbWVcWALwCo5lpRKmJjxkwFkNhYPr/C5DWHbhT0=;
        b=5WgJcG+emLvcQjui6Zdn/Gg6F1i2Zdh5MU2SNyzOTC7/K/pbuDVb4iBjq4suqDm/pC
         ajoygtm6xXIs3hkvxJjmcKMneSCehj/R6ej0TuceJqWRTxAgQ1/hpyuhueMciz3W4mY4
         Gk0QmwqaQol1I7qd/161MCSLHmOTLy8CW717w/vALlyETKzGX+VPdSqVjT988wJfNDUM
         6LIFvZFXfb57WKb37Lu76j+Xhx0JL2iPeqg/+PHMno/aWHT+1NWYe3U2jV4gnaCfVKOg
         ap0pTt7pfr5jNKbqiQ6gS72g7Gw5/73rJS2cCq3R7Na3s03r8qwUIxA7rfLdZZwEDtXH
         yjgw==
X-Gm-Message-State: AOAM532vB87x9SxUQ4V7AVuCExHcKEfXadRCpqioiMRh49gOw4/BWOhT
        Gf/WV3inUTnoldJMZU82b0Y=
X-Google-Smtp-Source: ABdhPJzg147N+TLrxT1k5Kesry9LS4W5ZxqaatIs3zKUWUcmXitOzexhEfjdZHWAe8+m/a+dTAR2Yg==
X-Received: by 2002:a17:90b:4ad2:b0:1c7:cee:b126 with SMTP id mh18-20020a17090b4ad200b001c70ceeb126mr18207889pjb.219.1648931364799;
        Sat, 02 Apr 2022 13:29:24 -0700 (PDT)
Received: from 9a2d8922b8f1 ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id k62-20020a17090a4cc400b001c7ea7f487asm5848735pjh.39.2022.04.02.13.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 13:29:24 -0700 (PDT)
Date:   Sun, 3 Apr 2022 01:59:17 +0530
From:   Kuldeep Singh <singh.kuldeep87k@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 9/9] dt-bindings: qcom: qcom,gsbi: convert to dtschema
Message-ID: <20220402202917.GA36054@9a2d8922b8f1>
References: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
 <20220402184011.132465-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402184011.132465-10-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Apr 02, 2022 at 08:40:11PM +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm General Serial Bus Interface (GSBI) to DT
> Schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,gsbi.txt           |  87 ------------
>  .../bindings/soc/qcom/qcom,gsbi.yaml          | 133 ++++++++++++++++++
>  2 files changed, 133 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml

Great initiative to convert everything in one go!

[...]

> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
> new file mode 100644
> index 000000000000..b97e359f3f90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
> @@ -0,0 +1,133 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,gsbi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm General Serial Bus Interface (GSBI)
> +
> +maintainers:
> +  - Andy Gross <agross@kernel.org>
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> +
> +description:
> +  The GSBI controller is modeled as a node with zero or more child nodes, each
> +  representing a serial sub-node device that is mux'd as part of the GSBI
> +  configuration settings.  The mode setting will govern the input/output mode
> +  of the 4 GSBI IOs.
> +
> +  A GSBI controller node can contain 0 or more child nodes representing serial
> +  devices.  These serial devices can be a QCOM UART, I2C controller, spi
> +  controller, or some combination of aforementioned devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,gsbi-v1.0.0

Only 1 entry? const.

-Kuldeep
