Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74AD16E6B96
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 19:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbjDRR7a (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Apr 2023 13:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjDRR73 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Apr 2023 13:59:29 -0400
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704753A91;
        Tue, 18 Apr 2023 10:59:28 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6a5dd2558a1so443278a34.2;
        Tue, 18 Apr 2023 10:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681840767; x=1684432767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8MFstXuLa8k8cja4E1yfkQtBdGNGfZiKSVN/L2SzdI=;
        b=Btk4ELy6MmLHg2/1I844KvoEhh5qY+9xPqJuT9MdTIDriHWl21T4a81l3K3dvp2EFr
         cbqhIAOOyQhLsnV6+jHd7pEPU4Q15yYtyr9FUpeWky3Ok1L+l1vwvmmpNdolLT4FpmIq
         LiF9hWbqTm6TBVya7IwR1JNDW0Ks9xC8RtyoNRHc9FU/IoX+5gNKCN1snj/Pls7lRQiq
         MeFpj2b/evarvKsnCaqWFiBIiVkvY10Mwy7+SmW0HryxEDEDrCgUji8kNbFqrMYmBOd6
         SEREdwyzO3nNMS5xJukh6Qnmk8y/8QAXAyIUPyA/9sXICCA8BQc2tKcwVXs2fjpkF7sc
         BgVQ==
X-Gm-Message-State: AAQBX9fw/Kztpr2HSs+RkbXtvFg15lF0sPh3SCh1ZY1h4NOddC/9rszI
        m85ZGOF3N1aWMCq+gGQ9sQ==
X-Google-Smtp-Source: AKy350YX+DABGEPqChIGWsAxGnJ8chTKJTpXdwcLz28bMyClLDoDeX5tdKFk9D3+Z+MO2zUKRE3t7Q==
X-Received: by 2002:a05:6830:1db5:b0:6a2:f3e2:d5b with SMTP id z21-20020a0568301db500b006a2f3e20d5bmr1410214oti.9.1681840767612;
        Tue, 18 Apr 2023 10:59:27 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u4-20020a056830118400b006a5e22458e9sm2715655otq.80.2023.04.18.10.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 10:59:27 -0700 (PDT)
Received: (nullmailer pid 2050189 invoked by uid 1000);
        Tue, 18 Apr 2023 17:59:26 -0000
Date:   Tue, 18 Apr 2023 12:59:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: samsung: Fix 'deprecated' value
Message-ID: <20230418175926.GA2049178-robh@kernel.org>
References: <20230418150643.1529895-1-robh@kernel.org>
 <04d21b26-afb8-3ef8-ce21-f97c1752ea99@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04d21b26-afb8-3ef8-ce21-f97c1752ea99@kernel.org>
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

On Tue, Apr 18, 2023 at 06:01:02PM +0200, Krzysztof Kozlowski wrote:
> On 18/04/2023 17:06, Rob Herring wrote:
> > 'deprecated' is a boolean type which should have a value of 'false' rather
> 
> I think you meant 'true'.

That is so true. ;)

> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> > than 'yes'.
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> Best regards,
> Krzysztof
> 
