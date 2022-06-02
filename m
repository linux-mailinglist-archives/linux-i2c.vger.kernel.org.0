Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D602653B93F
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jun 2022 15:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234375AbiFBNB4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jun 2022 09:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiFBNBz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jun 2022 09:01:55 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081059FDD;
        Thu,  2 Jun 2022 06:01:53 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id i66so6392643oia.11;
        Thu, 02 Jun 2022 06:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zH0vAIDZXcoFpFqiWQ5v3Gj8I+dG4f2c74XYlrF44os=;
        b=BVsqTs5DhCAGULvB7/KJYST1VsWJ3Hq/xSvVQ6cMGtcB07mqdETgqieieSQExud7Il
         XshOtBWK4DYHrUgaUf/vIhWrwxTnaibiGAqhLylodxP47j6+4ZoHvSwVTQsi3tH7bDMV
         JBZAa0E8vylDOABJlSPUNJh0YE//azj0JXe9S9At+gp4l22rjTW5hOzi0CtLGv1bLC33
         5eZuHrRT/he++FnBb3c/OVFObJ08OYUgPFLeyLMmWNXgPIQcFsbRkAt+139UBN6tbLKk
         y2XNVALfBRSAjDv1P6uEFKN54vTOwuCy5x2bvUxxDfzU1ixJF2LG7B8AdMpqk56izs6s
         O75w==
X-Gm-Message-State: AOAM530jwyCtUUlCgYH3GfiG+kN5CH3I+A+Yh1ScE6wbhj+yiguZcdnl
        UQbA6harl5XfyvmdwHeTiA==
X-Google-Smtp-Source: ABdhPJz1YCMnZKdEqJ9Nc4Y7GX22TlUyGIgRVd47MrHyXORgKllboWODdHg/Pjcr4JPyEHqstG5PWQ==
X-Received: by 2002:a05:6808:170a:b0:2fa:7168:392b with SMTP id bc10-20020a056808170a00b002fa7168392bmr18341645oib.84.1654174912162;
        Thu, 02 Jun 2022 06:01:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i7-20020a056870890700b000f32e094abbsm2156532oao.23.2022.06.02.06.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:01:51 -0700 (PDT)
Received: (nullmailer pid 2100950 invoked by uid 1000);
        Thu, 02 Jun 2022 13:01:50 -0000
Date:   Thu, 2 Jun 2022 08:01:50 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
Subject: Re: [RFC PATCH 01/14] media: dt-bindings: media: camss: Add
 qcom,msm8974-camss binding
Message-ID: <20220602130150.GA2095683-robh@kernel.org>
References: <20220522162802.208275-1-luca@z3ntu.xyz>
 <20220522162802.208275-2-luca@z3ntu.xyz>
 <170dd20b-ab0b-0f61-bfe9-cb9167a2e133@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <170dd20b-ab0b-0f61-bfe9-cb9167a2e133@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 23, 2022 at 12:07:10PM +0200, Krzysztof Kozlowski wrote:
> On 22/05/2022 18:27, Luca Weiss wrote:
> > From: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > 
> > Add bindings for qcom,msm8974-camss in order to support the camera
> > subsystem on MSM8974.
> > 
> > Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> >  .../bindings/media/qcom,msm8974-camss.yaml    | 321 ++++++++++++++++++
> >  1 file changed, 321 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml
> > new file mode 100644
> > index 000000000000..f8f71e477535
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml
> > @@ -0,0 +1,321 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/media/qcom,msm8974-camss.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Qualcomm CAMSS ISP
> > +
> > +maintainers:
> > +  - Robert Foss <robert.foss@linaro.org>
> > +
> > +description: |
> > +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,msm8974-camss
> > +
> > +  clocks:
> > +    minItems: 31
> 
> No need for minItems, they are equal to max by default.
> 
> > +    maxItems: 31
> > +
> > +  clock-names:
> > +    items:
> > +      - const: top_ahb
> > +      - const: ispif_ahb
> > +      - const: csiphy0_timer
> > +      - const: csiphy1_timer
> > +      - const: csiphy2_timer
> > +      - const: csi0_ahb
> > +      - const: csi0
> > +      - const: csi0_phy
> > +      - const: csi0_pix
> > +      - const: csi0_rdi
> > +      - const: csi1_ahb
> > +      - const: csi1
> > +      - const: csi1_phy
> > +      - const: csi1_pix
> > +      - const: csi1_rdi
> > +      - const: csi2_ahb
> > +      - const: csi2
> > +      - const: csi2_phy
> > +      - const: csi2_pix
> > +      - const: csi2_rdi
> > +      - const: csi3_ahb
> > +      - const: csi3
> > +      - const: csi3_phy
> > +      - const: csi3_pix
> > +      - const: csi3_rdi
> > +      - const: vfe0
> > +      - const: vfe1
> > +      - const: csi_vfe0
> > +      - const: csi_vfe1
> > +      - const: iface
> > +      - const: bus
> > +
> > +  interrupts:
> > +    minItems: 10
> 
> Same.
> 
> > +    maxItems: 10
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: csiphy0
> > +      - const: csiphy1
> > +      - const: csiphy2
> > +      - const: csid0
> > +      - const: csid1
> > +      - const: csid2
> > +      - const: csid3
> > +      - const: ispif
> > +      - const: vfe0
> > +      - const: vfe1
> > +
> > +  power-domains:
> > +    items:
> > +      - description: VFE GDSC - Video Front End, Global Distributed Switch Controller.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    description:
> > +      CSI input ports.
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port for receiving CSI data.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              clock-lanes:
> > +                items:
> > +                  - const: 1
> > +
> > +              data-lanes:
> > +                minItems: 1
> > +                maxItems: 4
> > +
> > +            required:
> > +              - clock-lanes
> > +              - data-lanes
> > +
> > +      port@1:
> 
> These look all the same, so just use patternPropreties (in "ports") with
> proper pattern.

That's fine, but whatever difference there is in ports 0, 1, and 2 needs 
to be described.

> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description:
> > +          Input port for receiving CSI data.
