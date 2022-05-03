Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2781151852D
	for <lists+linux-i2c@lfdr.de>; Tue,  3 May 2022 15:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235464AbiECNON (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 May 2022 09:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236032AbiECNOC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 May 2022 09:14:02 -0400
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1B6193D3;
        Tue,  3 May 2022 06:10:30 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id i25-20020a9d6259000000b00605df9afea7so11267085otk.1;
        Tue, 03 May 2022 06:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IpqIzgphhCdmYF4OcPG4cl/7KB4HmQKnYBXclbeY+EM=;
        b=hcTyTPPqWU/jeS7QnKnZXRWoqK5L886svbncT38n8/L+Fyyl3NGEi+yf9YSALIXPTi
         WV6R1X6Fnk1GV/aepPSDftpKkcbSTwhUSK0KIQaSrYOYB+t3xYftob4bsjidMEjm2cvM
         15cXwzkF78i+GK8bYG5NSuUhmL7CVNL2GSDkrXjCTWDdHoaIDb4X7ajakNbTK6AlGOLX
         ChzBGws1zgjBSAZOyFCGkIoSdBO2odQpqe8AqrYr4ODsbNnyPQXiXZpOemCu70f/Gw7Q
         +ASapoDr3oUL1Jn98dpNlHvgEOUuIJB7dQyTpLgG60rXGr5VC8KD8NOhuuQN4ZcBsHKh
         HeNA==
X-Gm-Message-State: AOAM533hFx19uvhAc0ipl3Zvx3EsthUWfVO9vk/xSrIFMzfegIJyZKe1
        tYt49L8YKyZMvOb13UXbJA==
X-Google-Smtp-Source: ABdhPJyQkrZSrMV59N970ZN+JMFQ8vc17D6rWTzqXy9EpoHa6uDya1nmYFVY1c6bDGawGt4Q2EPCtQ==
X-Received: by 2002:a9d:1ec:0:b0:5ff:a72c:99b1 with SMTP id e99-20020a9d01ec000000b005ffa72c99b1mr5776732ote.31.1651583429323;
        Tue, 03 May 2022 06:10:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k7-20020a4ad987000000b0035eb4e5a6c3sm4926592oou.25.2022.05.03.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 06:10:28 -0700 (PDT)
Received: (nullmailer pid 3471438 invoked by uid 1000);
        Tue, 03 May 2022 13:10:28 -0000
Date:   Tue, 3 May 2022 08:10:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: I2C: Add Qualcomm Geni based QUP I2C
 bindings
Message-ID: <YnEpw55zGCRj2QpE@robh.at.kernel.org>
References: <20220404182938.29492-1-singh.kuldeep87k@gmail.com>
 <20220404182938.29492-2-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404182938.29492-2-singh.kuldeep87k@gmail.com>
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

On Mon, 04 Apr 2022 23:59:34 +0530, Kuldeep Singh wrote:
> GENI(generic interface) based Qualcomm Universal Peripheral controller
> can support multiple serial interfaces like SPI,UART and I2C.
> 
> Unlike other I2C controllers, QUP I2C bindings are present in parent
> schema. Move it out from parent to an individual binding and let parent
> refer to child schema later on.
> 
> Please note, current schema isn't complete as it misses out few
> properties and thus, add these missing properties along the process.
> 
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
> v2:
> - Change compatible from enum to const
> - Drop clock-frequency description
> - Sort nodes
> ---
>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 100 ++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> 

This series should have been applied all together, but as it seems it's 
already in multiple trees, I've applied.

Rob
