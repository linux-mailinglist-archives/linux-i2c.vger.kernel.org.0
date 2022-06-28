Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF49555E840
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 18:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbiF1NlW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 09:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346654AbiF1NlV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 09:41:21 -0400
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E68325E9B;
        Tue, 28 Jun 2022 06:41:19 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id y18so12856950iof.2;
        Tue, 28 Jun 2022 06:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mwOBShGTICMgOdqz3MT5Sv+scZgbcai7ONXkEa1E170=;
        b=svx3We+T9dCliv7EEPUxeFnewO6crVYP9ncfoMOFoUn9xQtPbwRvePw939bGy4di4g
         lTl+KjySkmT3GJW3V5Qxl3aBt9ytWNS9etCbzQb9DbpkKGw3O9+6Tx5lBM5KXIx/R/QY
         ImW+R9cMAWOyZnRr7YRlKO4/UUGUrl7Wf+7oAcoMt4CRNVuZXJdY2SV6IBhpS+etBbVf
         L2FAlZlOzXx/WyMYETgIYGMXLxdStkOXAuliBXbR99Qub6Sgn6bHEB3UB8yG9zxGWONA
         FoouAFHr+XWuBCxP4tvk5WYsdgrQ9q+18/GuW7lDe9B4jr5q6P2URQqPy9fMjSUMeBhi
         tiPA==
X-Gm-Message-State: AJIora+fhvGhVjewFFzvlUNzINpp9jAlzYV5PU8Hd+DX8dvW8y/9CeX9
        rlVtLCLhmrKuBbZG4c2fJQ==
X-Google-Smtp-Source: AGRyM1vezFgpYiRSAOEMIGspLW0FyDakiQT+VyWz3hQV83fc87ID8ATA7tp7O9Lc6ulOVPgPAdG4Sg==
X-Received: by 2002:a05:6638:2481:b0:331:e12a:5e32 with SMTP id x1-20020a056638248100b00331e12a5e32mr11010467jat.90.1656423678724;
        Tue, 28 Jun 2022 06:41:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c13-20020a02330d000000b00334748f85easm6124556jae.106.2022.06.28.06.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 06:41:18 -0700 (PDT)
Received: (nullmailer pid 348635 invoked by uid 1000);
        Tue, 28 Jun 2022 13:41:15 -0000
Date:   Tue, 28 Jun 2022 07:41:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alain Volmat <alain.volmat@foss.st.com>
Cc:     wsa@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@foss.st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
Subject: Re: [PATCH 1/4] dt-bindings: i2c: st,stm32-i2c: don't mandate a
 reset line
Message-ID: <20220628134115.GA345270-robh@kernel.org>
References: <20220620105405.145959-1-alain.volmat@foss.st.com>
 <20220620105405.145959-2-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620105405.145959-2-alain.volmat@foss.st.com>
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

On Mon, Jun 20, 2022 at 12:54:02PM +0200, Alain Volmat wrote:
> Update the dt-bindings of the i2c-stm32 drivers to avoid the
> needs for a reset property in the device-tree.

That is clear from the diff, but why. Some chips don't have a reset? 
If so, this should be combined with patch 2 as part of changes needed 
for a new version.

> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> index dccbb18b6dc0..8879144fbbfb 100644
> --- a/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml
> @@ -94,7 +94,6 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - resets
>    - clocks
>  
>  unevaluatedProperties: false
> -- 
> 2.25.1
> 
> 
