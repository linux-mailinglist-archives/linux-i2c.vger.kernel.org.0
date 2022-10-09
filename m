Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8215F8CC0
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Oct 2022 20:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbiJISDr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 9 Oct 2022 14:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiJISDq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 9 Oct 2022 14:03:46 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401D31F9E3;
        Sun,  9 Oct 2022 11:03:45 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bu25so13756752lfb.3;
        Sun, 09 Oct 2022 11:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZeTfTjXc7OkReoe4FpCa6GFYv1CghAHRNl32tJkSPto=;
        b=KsOMvriaP/nr6gLbljzJr9NTpBaUUezCDxJSRMoFRdKWSjf8rWxghNbzjAdbqMFxtk
         N6cGR1m6HcIdxLdJ+ZDXk2N+iyZxVa9HacsMpAKIz36pUlyXThcybhL6cVNPnN6BEOGf
         D7ASV8DMXvMBU9zt68o+CmL+O49OJwVKAUIFstzEkhrnzwAtoYZ8VCMRXW4uEhFt/1MS
         YpMY6fYbu2IqT0yml0hVQv9MRvjKiixxBT+9IKyBecG1dHWvBW/Qfi5GsYuqtvAc623u
         wMNUj64FT2vPG5G0lqF35uo6lU22VpSAy5Owrun2SxmacOlDezSOdmE3+BEE4UhFbhrp
         l6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeTfTjXc7OkReoe4FpCa6GFYv1CghAHRNl32tJkSPto=;
        b=28QQSx/g9aX3jKNf08PjNWN5nGM1unui5p1iXuBY9X7aobQ+VvxnawMc0zd4EGgJnh
         6pOA5wyyBI7S1zLDlDi3T8U/c133v1gEkRptFM7KPS+pA64dAoitBYD2KsxrrIe1CWTb
         O1vHTnBDF6fiNZULdapT/U2Fjs85bBsKrVqZoXXbp90svKCz8vTixipPLbhYKNjvBzTE
         7YvUVDQ+KekqCl0ZzgEV9q41fi9TGQkyFbYUmaIR2zjcob+U00qTtGCkaD6OQ5sV2H/O
         LxGoeCn6wvMiSvc6uI4Ocb/cDSUUP8hBm/wVlBw7vWdMJuVpmSigxGOIU7ne0+32fK2m
         26jw==
X-Gm-Message-State: ACrzQf1fEfEOha2xAUTFz7xqAxf5hLDFj25H+2aFLE+6HpTF2Urk+SXw
        MVz9u51IDhyLGPf/yjeyW97Ya0Nulng=
X-Google-Smtp-Source: AMsMyM72vRsZKj/IdSM0xPwtFDEtbGqD+BvgCUNRiZj1DDZDZvnTKJAzqx6K7IoGmtZ7ySMqd4cYJQ==
X-Received: by 2002:a05:6512:2207:b0:4a2:6b5d:8afc with SMTP id h7-20020a056512220700b004a26b5d8afcmr4736942lfu.261.1665338623397;
        Sun, 09 Oct 2022 11:03:43 -0700 (PDT)
Received: from mobilestation ([95.79.133.202])
        by smtp.gmail.com with ESMTPSA id j13-20020a056512344d00b00497a41b3a42sm1100000lfr.88.2022.10.09.11.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 11:03:42 -0700 (PDT)
Date:   Sun, 9 Oct 2022 21:03:40 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        robh@kernel.org, wsa@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v9 1/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Message-ID: <20221009180340.hqt3ngp5d26g3euw@mobilestation>
References: <20221007075354.568752-1-patrick.rudolph@9elements.com>
 <20221007075354.568752-2-patrick.rudolph@9elements.com>
 <20221008115019.6jxsbawtye7cdkfh@mobilestation>
 <68327197-6835-1ec4-e8f1-217b5d2ef947@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68327197-6835-1ec4-e8f1-217b5d2ef947@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Oct 09, 2022 at 05:25:22PM +0200, Krzysztof Kozlowski wrote:
> On 08/10/2022 13:50, Serge Semin wrote:
> > On Fri, Oct 07, 2022 at 09:53:50AM +0200, Patrick Rudolph wrote:
> >> Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> >> chips. The functionality will be provided by the exisintg pca954x driver.
> >>
> >> While on it make the interrupts support conditionally as not all of the
> >> existing chips have interrupts.
> >>
> >> For chips that are powered off by default add an optional regulator
> >> called vdd-supply.
> >>
> >> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> >> ---
> >>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 39 ++++++++++++++++---
> >>  1 file changed, 34 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> >> index 9f1726d0356b..efad0a95806f 100644
> >> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> >> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> >> @@ -4,21 +4,25 @@
> >>  $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> >>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >>  
> >> -title: NXP PCA954x I2C bus switch
> >> +title: NXP PCA954x I2C and compatible bus switches
> >>  
> >>  maintainers:
> >>    - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>  
> >>  description:
> >> -  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> >> -
> > 
> >> -allOf:
> >> -  - $ref: /schemas/i2c/i2c-mux.yaml#
> > 
> > Why do you move the allOf statement to the bottom of the schema?
> 

> Because it goes with 'ifs' at the bottom of the schema...

Is there a requirement to move the allOf array to the bottom of the
schema if it contains the 'if' statement? If only there were some
kernel doc with all such implicit conventions...

> 
> > 
> >> +  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
> >> +  and the Maxim MAX735x and MAX736x I2C mux/switch devices.
> > 
> > What about combining the sentence: "The binding supports NXP
> > PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C mux/switch devices." ?
> > Currently it does look a bit bulky.
> 
> Drop "The binding supports". Instead describe the hardware.
> 
> > 
> >>  
> >>  properties:
> >>    compatible:
> >>      oneOf:
> >>        - enum:
> >> +          - maxim,max7356
> >> +          - maxim,max7357
> >> +          - maxim,max7358
> >> +          - maxim,max7367
> >> +          - maxim,max7368
> >> +          - maxim,max7369
> >>            - nxp,pca9540
> >>            - nxp,pca9542
> >>            - nxp,pca9543
> >> @@ -59,10 +63,33 @@ properties:
> >>      description: if present, overrides i2c-mux-idle-disconnect
> >>      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
> >>  
> >> +  vdd-supply:
> >> +    description: A voltage regulator supplying power to the chip.
> >> +
> >>  required:
> >>    - compatible
> >>    - reg
> >>  
> >> +allOf:
> >> +  - $ref: /schemas/i2c/i2c-mux.yaml#
> >> +  - if:
> >> +      not:
> >> +        properties:
> >> +          compatible:
> >> +            contains:
> >> +              enum:
> >> +                - maxim,max7367
> >> +                - maxim,max7369
> >> +                - nxp,pca9542
> >> +                - nxp,pca9543
> >> +                - nxp,pca9544
> >> +                - nxp,pca9545
> >> +    then:
> > 
> >> +      properties:
> >> +        interrupts: false
> >> +        "#interrupt-cells": false
> >> +        interrupt-controller: false
> > 
> > I'd suggest to add an opposite definition. Evaluate the properties for
> > the devices which expect them being evaluated instead of falsing their
> > existence for the devices which don't support the interrupts.
> 

> The properties rather should be defined in top-level than in "if", so I
> am not sure how would you want to achieve opposite way.

With one more implicit convention like "preferably define the
properties in the top-level than in if" of course I can't. Otherwise I
thought something like this would work:
+allOf:
+  - ...
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum: [...]
+    then:
+      properties:
+        interrupts: ...
+        "#interrupt-cells": ...
+        interrupt-controller: ...
...
-  interrupts:
-  "#interrupt-cells":
-  interrupt-controller: ...

With unevaluatedProperties set to false and evaluation performed for
the particular compatibles such schema shall work with the same
semantic.

-Sergey

> 
> 
> Best regards,
> Krzysztof
> 
