Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1E334F1EDB
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 00:25:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245124AbiDDVyw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Apr 2022 17:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376926AbiDDVkx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Apr 2022 17:40:53 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C01D33886;
        Mon,  4 Apr 2022 14:32:02 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id e25-20020a0568301e5900b005b236d5d74fso8169889otj.0;
        Mon, 04 Apr 2022 14:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+07kO28dFRNl++frOuuEHcQWMhh8FAnFdVPRkyeq1vs=;
        b=3/Ez9KBC7T+eyR0ADXVgUuzliRSjO1cyFVVarj4MgMvlM8NYVXd8y7Ag/IpdlZo275
         8R9c6WBWjlbTJU0NaAXYOS4C3vYcpPf53F6WsqAqdtOw2V8dY3cKq1RCdTwgsL88ZG7J
         0XFQ5vJW2YzK2d5DGamES81niw1I6jN91asfI0bDgCur1ucfLOOOUXSpxKtPA1sIG5eF
         gvyrtB7RbpkLx2GIQyRd6x/hnwbc/MGgGtDStIgO7Lwm+8KwXdctuqwg8t/zBXA4IXOH
         xY3HxKyWQC1MnDWQTxntYAHounTrjQVDN2HUurlxOB5XHPwCPfvY5+n0c2YPLMe1xeaV
         Q5IA==
X-Gm-Message-State: AOAM533vQff4dwapPbV667q/vhOP506WHP1B2xNsxJoC2HUZ9aJOTgSX
        x/+/cxaGLipGHmCALSl2oA==
X-Google-Smtp-Source: ABdhPJx9wTS78TofuET7EaiRXYKntvxJfzeG77NmKVU/w2+gt1bmiW+xL+XcPdGwkEdoiiJmw5k/wA==
X-Received: by 2002:a9d:6b18:0:b0:5e6:926c:7412 with SMTP id g24-20020a9d6b18000000b005e6926c7412mr105198otp.43.1649107887357;
        Mon, 04 Apr 2022 14:31:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k124-20020aca3d82000000b002ef4c5bb9dbsm4639052oia.0.2022.04.04.14.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 14:31:27 -0700 (PDT)
Received: (nullmailer pid 2019995 invoked by uid 1000);
        Mon, 04 Apr 2022 21:31:26 -0000
Date:   Mon, 4 Apr 2022 16:31:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 9/9] dt-bindings: qcom: qcom,gsbi: convert to dtschema
Message-ID: <YktjrqMjPb3jNF8L@robh.at.kernel.org>
References: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
 <20220402184011.132465-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220402184011.132465-10-krzysztof.kozlowski@linaro.org>
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

On Sat, 02 Apr 2022 20:40:11 +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm General Serial Bus Interface (GSBI) to DT
> Schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,gsbi.txt           |  87 ------------
>  .../bindings/soc/qcom/qcom,gsbi.yaml          | 133 ++++++++++++++++++
>  2 files changed, 133 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
