Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 090D966E6FD
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 20:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232741AbjAQTaz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 14:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbjAQT0a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 14:26:30 -0500
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845FB4A1FE;
        Tue, 17 Jan 2023 10:34:22 -0800 (PST)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-12c8312131fso32939875fac.4;
        Tue, 17 Jan 2023 10:34:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diOnHGCP2KkfUXuoNBLRTmdR8TF6f2OGJuqUquePKTE=;
        b=zc8DfupR4Q+nYaHx2WW3K45I7VnfzEU3z2jHpVamBPjJvp26cOT0Thn/q76LlZ4nad
         GmR6cfUIZUnrqhyioucuJhvgaplCqGoHCdRynV81oLSac7O8UQdIIl+BxYsIqhMgsw1i
         5q9J16NOSw7yHZlxIxodzl4Xdu5eBV6MY745Undu7OpCOOcDIw6cL4+ecRI95oWNrqG3
         TvTtHi8Wt7i/aN/sHylp7xp7YJVN1m6kvAC/1+j0GpKmnBd9oAFHTugDEa/raei0+NV7
         Do//qHUZ+Hhb7FWbIGNAjY38sJAgFLyUDBg6zQGLEVLsqVPXcPsCOmi+vpc5jz7s0bSt
         C3Sg==
X-Gm-Message-State: AFqh2kq8A5NbtocLTVNUddAl6ZBMMhMuDphHMaa72Ao46oGG1agq6vVG
        gLAiTTx5a1mzCW+9TqSdqQGs/xrSbw==
X-Google-Smtp-Source: AMrXdXtmdBmrNeSml6EOhXzYwOFHPEozIPMPzPfgpO7pIouHSDtw+CDYTHzJQrl2AUaxfORlVOQ7bw==
X-Received: by 2002:a05:6870:c21e:b0:15b:9290:3905 with SMTP id z30-20020a056870c21e00b0015b92903905mr2721243oae.42.1673980461735;
        Tue, 17 Jan 2023 10:34:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d9-20020a056870d28900b0014b8347e1e3sm16731513oae.12.2023.01.17.10.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 10:34:21 -0800 (PST)
Received: (nullmailer pid 3425506 invoked by uid 1000);
        Tue, 17 Jan 2023 18:34:20 -0000
Date:   Tue, 17 Jan 2023 12:34:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindindgs: i2c: qcom,i2c-geni: document
 operating-points-v2
Message-ID: <167398045871.3425426.13514464196629831045.robh@kernel.org>
References: <20230113144950.78246-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113144950.78246-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri, 13 Jan 2023 15:49:50 +0100, Krzysztof Kozlowski wrote:
> Just like other Geni serial interfaces (qcom,geni-spi and
> qcom,geni-uart), the Geni I2C Controller comes with OPP table:
> 
>   sdm845-sony-xperia-tama-apollo.dtb: i2c@894000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
