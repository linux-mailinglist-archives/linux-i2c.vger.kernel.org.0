Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFAD14F05F1
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 21:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbiDBTqy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 15:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbiDBTqw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 15:46:52 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B680D21809;
        Sat,  2 Apr 2022 12:45:00 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id i10-20020a17090a2aca00b001ca56c9ab16so1464023pjg.1;
        Sat, 02 Apr 2022 12:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+si7rb/80RTkZ0HPi34L84T3FsNep37xaj1A3ObJQzc=;
        b=M7l1aKwNiO8SUVPZnpeX+NpPOb/LnEa8X6Vjc/opgP1CVAyscOWzpxH64PZpjSWl4d
         ckAjnViy5ZOFtr2HRn/7OVVALyt8NSx/Q+FzwSn6rsgipR5R70B0cylPCOW2cE82AHoQ
         EK1jmxHN0kGEFwVCF7MN45c75+jmIgifu7v069T45xorJ5E2hIVE0TCdfDkJrL5XjHO3
         enORZIgQCR0ha8DHyypbPI3CAdCR6yf+Ojyryg0SNHaiPgoujdI4XiQYEb1eXs81l/GP
         VAVPJVEG4zdDOR+fMi3q6/M0uFpxfjkH5ANYjqCpf15vQKaw08Wv9Ks0M/8spv4N2Y/C
         eomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+si7rb/80RTkZ0HPi34L84T3FsNep37xaj1A3ObJQzc=;
        b=G6yEHAtwgQ5Pe6xjg38Jsnpw5C6v2VkupUZHy10y2Wvp0olAgWJdtXdmnVxVL34Y7H
         v6pzIS+EwhIw89mGG/9n2Gn5yZ6/FJzonXqKiB2tx+zebhSWHtdbwMIbPHcgJqcp+1gi
         m6akXQoHP2fbhHSebr5xLusUISe6hNLhe9siJ2VXiGSxlpJnHW0uq0kAfzV2pREhLkq4
         pbfg7lINsjOvVsrFLnuoHmlz114EvVQykd6j5ZTeRKlZuKdRChrd+DZ43/hHvGpvGH7p
         wbJobeZBfUZsQcFD7nt4xu1uH/Wd3SMwiOncYCJ+2Yt4rlC1Jkt306lRCLeMIHmL7N2t
         VJlw==
X-Gm-Message-State: AOAM532Iwt9TeL4WeVO8VAmykCDWm1MPR43B4u/kEx+QvYrYIOUWPMEK
        WiDOiVRBDrvK8Fr+zEIARVU=
X-Google-Smtp-Source: ABdhPJzgzoX1P++nnwDl+lNt08h/t4t5jMy0+K7GQg442Hp5oAc/0s9ii5BYjwrktJp0JYwOWxp0eg==
X-Received: by 2002:a17:902:f543:b0:156:5f55:a75d with SMTP id h3-20020a170902f54300b001565f55a75dmr11547320plf.72.1648928700147;
        Sat, 02 Apr 2022 12:45:00 -0700 (PDT)
Received: from 9a2d8922b8f1 ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id b2-20020a056a000a8200b004e1414f0bb1sm7395700pfl.135.2022.04.02.12.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 12:44:59 -0700 (PDT)
Date:   Sun, 3 Apr 2022 01:14:53 +0530
From:   Kuldeep Singh <singh.kuldeep87k@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: Add Qualcomm Geni based QUP i2c
 bindings
Message-ID: <20220402194453.GE35664@9a2d8922b8f1>
References: <20220402051206.6115-1-singh.kuldeep87k@gmail.com>
 <20220402051206.6115-2-singh.kuldeep87k@gmail.com>
 <b27db209-d146-e104-6f0c-b0d860e9cc8c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b27db209-d146-e104-6f0c-b0d860e9cc8c@linaro.org>
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

On Sat, Apr 02, 2022 at 02:29:59PM +0200, Krzysztof Kozlowski wrote:
> On 02/04/2022 07:12, Kuldeep Singh wrote:
> > GENI(generic interface) based Qualcomm Universal Peripheral controller
> > can support multiple serial interfaces like spi,uart and i2c.
> > 
> > Unlike other i2c controllers, QUP i2c bindings are present in parent
> > schema. Move it out from parent to an individual binding and let parent
> > refer to child schema later on.
> > 
> > Please note, current schema isn't complete as it misses out few
> > properties and thus, add these missing properties along the process.
> > 
> > Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> > ---
> >  .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 110 ++++++++++++++++++
> >  1 file changed, 110 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> > new file mode 100644
> > index 000000000000..01a02e680ea3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/i2c/qcom,i2c-geni-qcom.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Qualcomm Geni based QUP I2C Controller
> > +
> > +maintainers:
> > +  - Andy Gross <agross@kernel.org>
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +allOf:
> > +  - $ref: /schemas/i2c/i2c-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,geni-i2c
> 
> Just const, no enum. There are no other flavors of this (unless you
> think there are?).

There are no other users. Will change it to const.

> 
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: se
> > +
> > +  clock-frequency:
> > +    description: Desired I2C bus clock frequency in Hz
> > +    default: 100000
> > +
> > +  interconnects:
> > +    maxItems: 3
> > +
> > +  interconnect-names:
> > +    items:
> > +      - const: qup-core
> > +      - const: qup-config
> > +      - const: qup-memory
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  required-opps:
> > +    maxItems: 1
> 
> I have doubts this is correct property. Usually it is part of the
> opp-table. I see sc7180 needs this, but I think it is a mistake. Do you
> know how it is supposed to work?

Not sure how exactly it works. I took reference from
Documentation/devicetree/bindings/clock/qcom,videocc.yaml on how to add
required-opps.

-Kuldeep
