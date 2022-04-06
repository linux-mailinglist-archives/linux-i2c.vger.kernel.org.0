Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 341B04F6B52
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 22:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233836AbiDFUZL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 16:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236725AbiDFUYM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 16:24:12 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC2E349538;
        Wed,  6 Apr 2022 11:43:20 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-e1dcc0a327so3925332fac.1;
        Wed, 06 Apr 2022 11:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pe8sju6wPvJSrNfF1Eq2d0NpTEsa+xATy6yZpivcyyo=;
        b=kOivRFEJHI+w2eouwoiLEYmGL0JgO6ICU+xkf93gZTD45eeepp2HBg9Yis+a0JDDS4
         r2YrhPcMOu+edjcuJANfFRrlNqpv7K2tsBmb+KK1d8i3OayzdAFGeiLvfg4y4XFfG7Cn
         jHyChCHMl9e57crE+l6k1YWVTMg4fKkvWAETAbsAWsEbeOGBgxHzDnjf9DZRwmD2Luxd
         gc+bhBZx7lroSBiZqU4+FRu71qVqv76eKl+LSczEEvEkkkQ4LZz8VJ/pxEXdh5vbMoS/
         iFKSvGnIKaLn/bxm9p8Ih90PDsviOaJssFsyBU4kfLh73QtNOFmDMs4Eu3bLzLB/Hasw
         2kWw==
X-Gm-Message-State: AOAM5321d6EQZJDptj4e8qZS2Bcx6JF0iUYKUhVkxaC/NBN5FVUF1gkp
        bU/ZSHNlLLElKBtif/EXnTmKAOegKg==
X-Google-Smtp-Source: ABdhPJybK5lLCphfL1x0DdD+DcfV1Sz7fJ99SXLEoZA420LGZz9AqrPtiqQNcfxb94eXkneiXCVC3g==
X-Received: by 2002:a05:6870:e30e:b0:de:ecf4:df7e with SMTP id z14-20020a056870e30e00b000deecf4df7emr4782781oad.114.1649270599990;
        Wed, 06 Apr 2022 11:43:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v17-20020a9d69d1000000b005b2319a08c4sm7048316oto.18.2022.04.06.11.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 11:43:19 -0700 (PDT)
Received: (nullmailer pid 2564513 invoked by uid 1000);
        Wed, 06 Apr 2022 18:43:19 -0000
Date:   Wed, 6 Apr 2022 13:43:19 -0500
From:   Rob Herring <robh@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v7 1/3] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
Message-ID: <Yk3fR2CaeiJBEPKk@robh.at.kernel.org>
References: <20220405120552.433415-1-patrick.rudolph@9elements.com>
 <20220405120552.433415-2-patrick.rudolph@9elements.com>
 <YkxIOgTl876orHbf@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkxIOgTl876orHbf@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 05, 2022 at 04:46:34PM +0300, Laurent Pinchart wrote:
> Hi Patrick,
> 
> Thank you for the patch.
> 
> On Tue, Apr 05, 2022 at 02:05:49PM +0200, Patrick Rudolph wrote:
> > Update the pca954x bindings to add support for the Maxim MAX735x/MAX736x
> > chips. The functionality will be provided by the exisintg pca954x driver.
> > 
> > While on it make the interrupts support conditionally as not all of the
> > existing chips have interrupts.
> > 
> > For chips that are powered off by default add an optional regulator
> > called vdd-supply.
> > 
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > ---
> >  .../bindings/i2c/i2c-mux-pca954x.yaml         | 44 ++++++++++++++-----
> >  1 file changed, 34 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > index 9f1726d0356b..132c3e54e7ab 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > @@ -4,21 +4,48 @@
> >  $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: NXP PCA954x I2C bus switch
> > +title: NXP PCA954x I2C and compatible bus switches
> >  
> >  maintainers:
> >    - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >  
> >  description:
> > -  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> > +  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices,
> > +  and the Maxim MAX735x and MAX736x I2C mux/switch devices.
> >  
> >  allOf:
> >    - $ref: /schemas/i2c/i2c-mux.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - maxim,max7367
> > +              - maxim,max7369
> > +              - nxp,pca9542
> > +              - nxp,pca9543
> > +              - nxp,pca9544
> > +              - nxp,pca9545
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 1
> > +
> > +        "#interrupt-cells":
> > +          const: 2
> > +
> > +        interrupt-controller: true
> 
> It feels a bit out of place to have those properties listed before the
> main "properties" property, but we can only have a sincel allOf. I
> wonder if the i2c-mux schema could be selected automatically based on
> node name, but that's out of scope for this patch.

Yes, just move the allOf below 'properties'
 
> I thought it was more customary to define properties in the main
> "properties" property, and then have

Yes, please do.

Rob
