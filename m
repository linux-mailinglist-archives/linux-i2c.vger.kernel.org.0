Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F14E6E9D3D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Apr 2023 22:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbjDTUag (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Apr 2023 16:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbjDTUaC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Apr 2023 16:30:02 -0400
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1F77EC2;
        Thu, 20 Apr 2023 13:29:02 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-187ec6a5504so973745fac.2;
        Thu, 20 Apr 2023 13:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682022536; x=1684614536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+n+UehpmOijcFs37eU9VlhyyKc5NwCU3d7QfPvG7ns=;
        b=Wz/kd1KXtKCVfD2sahZyaVBAYwXdjFYY8cA6HodnQ9qWeCYPFxE4iBfdTmqPT9dT5Q
         g/8mMc+SwROstWFYfuPCZDKaMmAsuGv+q8I7BecWGP/h8OTtp9r2ZPI0iBuafkwIMDoG
         bq5OSYK9OpMZZQrqiu8+aKSDhxqukrcMMvQ+Q6FC2jok9kDrgvzWXJFn9JuTrGfzg8i4
         R4fgj0rBRiwzrrN2sVluq/9iVofBea0wg5QIrcYrb0kcQqIVyxBQQptkRuCLOWgvG5F2
         /r27kFM0Jejs3CU60yLoHmN3hTUJq3Bvlh00YIEvg0XTEoF/ALL3izFBpOTLIJtbWXiL
         ljdQ==
X-Gm-Message-State: AAQBX9c5GbCKWg8Z6etAal6ARiQME2qz+EM5vRXCryNzqMyfRhEQWyW5
        LTKcoQkCaKqgVi8CEb2xxcdOAN7WMw==
X-Google-Smtp-Source: AKy350a1bcr41LwfVfG6qIlFziv9ccAqjhBow6+UsPDOWyfId1lmx58YpQaFBNHuf1gAjD6+FSB4SA==
X-Received: by 2002:a05:6870:61cb:b0:188:fb2:c208 with SMTP id b11-20020a05687061cb00b001880fb2c208mr2056820oah.11.1682022535860;
        Thu, 20 Apr 2023 13:28:55 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w22-20020a056870a2d600b00172428894e0sm1113473oak.28.2023.04.20.13.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 13:28:55 -0700 (PDT)
Received: (nullmailer pid 3448770 invoked by uid 1000);
        Thu, 20 Apr 2023 20:28:54 -0000
Date:   Thu, 20 Apr 2023 15:28:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] dt-bindings: i2c: samsung: Fix 'deprecated' value
Message-ID: <168202243267.3446630.2282935889963812276.robh@kernel.org>
References: <20230418150643.1529895-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418150643.1529895-1-robh@kernel.org>
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


On Tue, 18 Apr 2023 10:06:42 -0500, Rob Herring wrote:
> 'deprecated' is a boolean type which should have a value of 'false' rather
> than 'yes'.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Fixed the commit message and applied.

