Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 744E5525D91
	for <lists+linux-i2c@lfdr.de>; Fri, 13 May 2022 10:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242563AbiEMI0l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 04:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346174AbiEMI0k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 04:26:40 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E055549D
        for <linux-i2c@vger.kernel.org>; Fri, 13 May 2022 01:26:39 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t6so10413579wra.4
        for <linux-i2c@vger.kernel.org>; Fri, 13 May 2022 01:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CQr2lQ0BpUyS5Xt/rcO0Hz/zPT6SpMUvVDsgFdPucec=;
        b=eLnuN3jNL3QgB2V+cJ3V/G4OpU/pgWfizVirVqV0Oam+vkkNjZOd1+XDUluTqmQUr2
         nFfa7Elk6SFH8fdejP159rN0L+94dapRY2yJFGUlTA+gNWJgIoXqaTLCrykZ9VLBWXrz
         Un0loP/tFxsQ9AyPSE+mGNxKEoL5LC4xSIvGOnNQU9pjKaH31UI0TK3sDZuJYfGrcoF4
         DACps+IKzYXwcBe8cr/IND7haLi27NF9H5NQ1dTjdLlVR8kPajGqvCfj9lki9cQLjPfw
         53rk94pNEOsCLd6SlMA9uF8Ac+OntXVhnss/nX0DA6c83idarEPBAmp8iylcyV3GQJr+
         5uGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CQr2lQ0BpUyS5Xt/rcO0Hz/zPT6SpMUvVDsgFdPucec=;
        b=2XmvRwJB83Oml0YHcmcydpF8ftwGlg/JK9B12imvdblcz/mN5sEKjOZX6vZEjMjDIx
         qw0cvQQAodl+piN0Qd1UhLMK+wnepVjbpeBkhUm50/af6Q4yF4BIOCg4fEPX14buHUtH
         myfxBvIf3hbTes0CkV+lFoSZhymzbaj0XlbV4tQ4dSVBZMyIw8ZFmGPSN91epMshq9No
         iVOW9c2t4Um869kPcAARa/iuvfvAn2bUm3y8nVHtkAynHYMT9mroZ26zy5cjyivvKjUF
         8QP2NiqSY7YTWcofpNV5JRl2uRIZ/5qNp/63NctVmmWU6dstqzhanmwDmjH3ARSUvz/K
         O/RA==
X-Gm-Message-State: AOAM530BrXg/6V65eQKY5wMJ9/ftGG+Qpc2qBL0flbF0xNOjNcbclBO1
        Q3r3CEtuZQJQCB7yUPRlz7BVlA==
X-Google-Smtp-Source: ABdhPJxAC3dbIQI8wH8Zl2izEVgbPOPuifQewNKMTJhApNX+1K22FesBmNzvIBwX1HcTbWqhc015kQ==
X-Received: by 2002:adf:9dcc:0:b0:20a:ed44:fd48 with SMTP id q12-20020adf9dcc000000b0020aed44fd48mr2930024wre.120.1652430397773;
        Fri, 13 May 2022 01:26:37 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q4-20020a05600c040400b003942a244f2esm4705631wmb.7.2022.05.13.01.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 01:26:37 -0700 (PDT)
Message-ID: <4928005a-d5a6-9107-02ce-5556ade126f5@linaro.org>
Date:   Fri, 13 May 2022 10:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/9] dt-bindings: i2c: npcm: support NPCM845
Content-Language: en-US
To:     Tyrone Ting <warp5tw@gmail.com>, Rob Herring <robh@kernel.org>
Cc:     sven@svenpeter.dev, JJLIU0@nuvoton.com,
        linux-kernel@vger.kernel.org, olof@lixom.net,
        lukas.bulwahn@gmail.com, jarkko.nikula@linux.intel.com,
        yuenn@google.com, arnd@arndb.de, tali.perry1@gmail.com,
        openbmc@lists.ozlabs.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-i2c@vger.kernel.org,
        tmaimon77@gmail.com, benjaminfair@google.com,
        tomer.maimon@nuvoton.com, kfting@nuvoton.com,
        semen.protsenko@linaro.org, Avi.Fishman@nuvoton.com,
        jsd@semihalf.com, wsa@kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, KWLIU@nuvoton.com,
        tali.perry@nuvoton.com, avifishman70@gmail.com, venture@google.com
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-2-warp5tw@gmail.com>
 <20220511152422.GA339769-robh@kernel.org>
 <CACD3sJbiPYcckyLncXcVR-TFBo_-3XwSDYbmid4qwnoHX-JtUw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACD3sJbiPYcckyLncXcVR-TFBo_-3XwSDYbmid4qwnoHX-JtUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/05/2022 03:31, Tyrone Ting wrote:
> Hi Rob:
> 
> Thank you for your review. I would like to apply Krzysztof's comment
> from the link https://www.spinics.net/lists/linux-i2c/msg56795.html
> and remove the
> quotes of the statement "$ref: "/schemas/types.yaml#/definitions/phandle"".
> 
> If it's okay with you, I'll come up with a new patch with
> "Reviewed-by" from you and Krzysztof.

Go ahead and keep the review-tags in new patch.

Best regards,
Krzysztof
