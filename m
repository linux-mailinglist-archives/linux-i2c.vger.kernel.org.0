Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887704BD409
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Feb 2022 03:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343920AbiBUCgs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Feb 2022 21:36:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343905AbiBUCgs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Feb 2022 21:36:48 -0500
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C84E3DDE0;
        Sun, 20 Feb 2022 18:36:26 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id 195so4185847iou.0;
        Sun, 20 Feb 2022 18:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=EErPlw8IoKnm8FwUL5fnBoVB6JsQj/Ci/9SJLAoTs+E=;
        b=DJmMpdvPcXJFnseJ7w3gUXTLNxmh7waAWcD1vjcT7NKH/Ed7QV3wfcCj4ugpTDijHq
         ZPTN0Lrcv1/YI1mvEhAPAw+MgNP182SCBwuIsGBV5bupK4y24uQuXOm55XTLKnYlWAr5
         64vj/BjL5cQRqMXpApORYsjLwYdZL3AFI4HJxdumviy18wy/Yl/l2+lfdEmm3FJb0CMI
         DKZbs7V5L/Z+h5KnuOI6bTxU3pTAIh2R/QqtpUXwwvlP8Az6KKavqYncrZ21n7o10uAO
         0EthnSmyPzW2KIZi1i6jD7dpOWYk0dDpTpR9jVIBGHTTIaTEPn23MFyQgv9yzTeGekHg
         EmiA==
X-Gm-Message-State: AOAM530mGSCPZS7KoF2+mplgVBti5fKx5LJeee7QEGpgkHCjBYxOfEm3
        ywqf9wCYBJ+T8basdIxbRu4YS5rz6g==
X-Google-Smtp-Source: ABdhPJzC5b+zjhjMASmEgL11ZCPh6cCVKCz/8t1vDpotzNKaTj2G8qKb5Xk9MNyYc5SgGXikmBoIaQ==
X-Received: by 2002:a5e:950c:0:b0:640:de00:c18c with SMTP id r12-20020a5e950c000000b00640de00c18cmr4162188ioj.68.1645410985359;
        Sun, 20 Feb 2022 18:36:25 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id q9sm7270371ilo.56.2022.02.20.18.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 18:36:24 -0800 (PST)
Received: (nullmailer pid 2041549 invoked by uid 1000);
        Mon, 21 Feb 2022 02:36:09 -0000
From:   Rob Herring <robh@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     semen.protsenko@linaro.org, andriy.shevchenko@linux.intel.com,
        yuenn@google.com, digetx@gmail.com, devicetree@vger.kernel.org,
        tmaimon77@gmail.com, krzysztof.kozlowski@canonical.com,
        lukas.bulwahn@gmail.com, Avi.Fishman@nuvoton.com,
        JJLIU0@nuvoton.com, tali.perry1@gmail.com, jie.deng@intel.com,
        openbmc@lists.ozlabs.org, sven@svenpeter.dev,
        linux-i2c@vger.kernel.org, tali.perry@nuvoton.com,
        robh+dt@kernel.org, benjaminfair@google.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, olof@lixom.net,
        wsa@kernel.org, kfting@nuvoton.com, avifishman70@gmail.com,
        yangyicong@hisilicon.com, bence98@sch.bme.hu,
        christophe.leroy@csgroup.eu, venture@google.com,
        linux-kernel@vger.kernel.org, arnd@arndb.de
In-Reply-To: <20220220035321.3870-3-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com> <20220220035321.3870-3-warp5tw@gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: i2c: npcm: support NPCM845
Date:   Sun, 20 Feb 2022 20:36:09 -0600
Message-Id: <1645410969.402841.2041548.nullmailer@robh.at.kernel.org>
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

On Sun, 20 Feb 2022 11:53:12 +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> Add compatible and nuvoton,sys-mgr description for NPCM i2c module.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml       | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml:19:6: [warning] wrong indentation: expected 4 but found 5 (indentation)
./Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml:20:7: [warning] wrong indentation: expected 7 but found 6 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1595125

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

