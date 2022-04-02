Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48CD84F0658
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 23:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbiDBVCz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 17:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbiDBVCz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 17:02:55 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DF0654B3;
        Sat,  2 Apr 2022 14:01:02 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id nt14-20020a17090b248e00b001ca601046a4so1535439pjb.0;
        Sat, 02 Apr 2022 14:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ep31zfzXgtGPRrK4JzjcT4OsqwVUibu1oi7iQV6wMvk=;
        b=omQXM9rtM1ebTOd9z8Ztav/WBoT+BCHziqEXwKWAlkioz9DLMeAftY4UcrbPRF9dvo
         iMHIqhBJ9HMNXG//Hjyk0XTZSaeCqnlM2A5aofHxAibbOUdnvHBjxiXOGuQ5tYYhIyO1
         SoXc5o5jQ0DrsbD4yjkJKCSXvYG4amJfPA2Kl0VW5lUg4Ji/H072psVjvLOq6Wyy1tRq
         OINubE8bnpoZEu78zYfE05TRpk/YnxYkPzAbOMIat9Dv63xoS16Tkya1xAs9dogtMaQW
         BNpctb9fvWMaxbp4kOsrdI33JWavTeVRlusI9oeNfS4484++uizErQPu/8lBwlZB9K7w
         TX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ep31zfzXgtGPRrK4JzjcT4OsqwVUibu1oi7iQV6wMvk=;
        b=pS+aCfcY64YNuluT25mIeNvPiwO1FvhYmZRJf04esUAYUJNRGO+Fb20feZgXrVLJEU
         6Uq0XA3W+IQhVBS8DR/sO95liNb+4LrXjJhSO054kFgq+qrMexwTez2/GJmIvdXF5FIP
         8J5xmxbjdM7gCPIDIrntKOYs7WFpLsxmrNve9yJ3Wl9prSlAzwEIJSsrlrJkCZ/NfkIJ
         lxMu7vB0+z0YRDp05b1OWZvsJvnnecfXVQxDNWlLxAbeA8KJMuraeRDJVtpfNJYdVEqU
         +IF+4ioLDJO9b2iSdM59WM6Ia8ET+I71+gN6yjzWfuz5aQ+dcjX59QLEl5lHUGl3jS7D
         8GlA==
X-Gm-Message-State: AOAM531i0021svKiu1G/hS/byACrDxNz8ZG8BY0srKPoLHUMAI6u0W7e
        7Rgc4e4u6p9r1M0OghOWMPMYZd2fU4E=
X-Google-Smtp-Source: ABdhPJxj78ez9xkFhutTGi0ECjYCluuCwbPoK7lVzjaR9HcfVHQxlmELJUaq1hfN74k4vofie6i9Kg==
X-Received: by 2002:a17:902:bb92:b0:153:4eae:c77e with SMTP id m18-20020a170902bb9200b001534eaec77emr51730419pls.93.1648933261795;
        Sat, 02 Apr 2022 14:01:01 -0700 (PDT)
Received: from 9a2d8922b8f1 ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id f15-20020a056a001acf00b004fb2ad05521sm7259339pfv.215.2022.04.02.14.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 14:01:01 -0700 (PDT)
Date:   Sun, 3 Apr 2022 02:30:54 +0530
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
Message-ID: <20220402210054.GA36286@9a2d8922b8f1>
References: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
 <20220402184011.132465-10-krzysztof.kozlowski@linaro.org>
 <20220402202917.GA36054@9a2d8922b8f1>
 <9a584eac-6ac9-e4ed-ef90-49569f4a4baa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a584eac-6ac9-e4ed-ef90-49569f4a4baa@linaro.org>
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

On Sat, Apr 02, 2022 at 10:38:23PM +0200, Krzysztof Kozlowski wrote:
> On 02/04/2022 22:29, Kuldeep Singh wrote:
> > On Sat, Apr 02, 2022 at 08:40:11PM +0200, Krzysztof Kozlowski wrote:
> >> Convert the Qualcomm General Serial Bus Interface (GSBI) to DT
> >> Schema.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  .../bindings/soc/qcom/qcom,gsbi.txt           |  87 ------------
> >>  .../bindings/soc/qcom/qcom,gsbi.yaml          | 133 ++++++++++++++++++
> >>  2 files changed, 133 insertions(+), 87 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
> >>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
> > 
> > Great initiative to convert everything in one go!
> > 
> > [...]
> > 
> >> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
> >> new file mode 100644
> >> index 000000000000..b97e359f3f90
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
> >> @@ -0,0 +1,133 @@
> >> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/soc/qcom/qcom,gsbi.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm General Serial Bus Interface (GSBI)
> >> +
> >> +maintainers:
> >> +  - Andy Gross <agross@kernel.org>
> >> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> >> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> +
> >> +description:
> >> +  The GSBI controller is modeled as a node with zero or more child nodes, each
> >> +  representing a serial sub-node device that is mux'd as part of the GSBI
> >> +  configuration settings.  The mode setting will govern the input/output mode
> >> +  of the 4 GSBI IOs.
> >> +
> >> +  A GSBI controller node can contain 0 or more child nodes representing serial
> >> +  devices.  These serial devices can be a QCOM UART, I2C controller, spi
> >> +  controller, or some combination of aforementioned devices.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - qcom,gsbi-v1.0.0
> > 
> > Only 1 entry? const.
> 
> v1.0.0 looks like there could be some more, although they did not reach
> mainline. The GSBI seems to be replaced by different blocks, so maybe
> there will be no new entries here.

Yes, GSBI seems pretty old and only v1 rolled out.
Don't think there are more revisions on the cards. Still can't say so.
