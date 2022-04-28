Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF01512906
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Apr 2022 03:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbiD1Brp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Apr 2022 21:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiD1Bro (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Apr 2022 21:47:44 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2CBF98F5C;
        Wed, 27 Apr 2022 18:44:31 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id bo5so3011939pfb.4;
        Wed, 27 Apr 2022 18:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iFHqCQRjOjnZR4+Edhuht6dyVV23jVkd4G8gkgGiMd8=;
        b=KkxJxoypCAU4IHX3T8/MwB3JJzUPsS7qKN8rj1qlGEDB7aweXU/UwntjuzFNfWlov0
         1+QgRqC5aM29/cz/twV+pwJhD6TeqZ+0l5W9cGo5LzyWga8DAKyuPclsVU7advwHfNx6
         eYI9+cpzYcKh6pM3FwwLt8o2kdvoAMzd4demBH8aS9969MYDVElqwNKVKNc55IoJZBxC
         4kTMrPvxGKyRFxZtamUUwNzb3b7ZEOqesOFY7mDgtO4jQ/hv3UXcUNwO7POXcYSzKJvo
         g0Hevg2GzKUN5C1u+h9HoFNCUiyEAm7rqI9OE1hb5iXmrB35UgRXyt/YzAMAuHac8mIw
         PX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iFHqCQRjOjnZR4+Edhuht6dyVV23jVkd4G8gkgGiMd8=;
        b=Rxj7J0MJ+/oYTm26zPAUGGiQgpDkNhSOoXiPGsYhEymMKWTmglf7j3HFIgI8Q5EvW1
         knIq1TuMh/vYSKlFpkUtBa4iHqNRXLFMr5TrNbXSN5Mf74Cy7ZlPCvntspN5nMhL1Cs9
         8U+9fW2rjacW5N1uIxbI2HOwBwYGguay6S3h5ej98ys5oRDfCFg2PXQZgrrd+O4b6b6x
         VbS78aY0hKVQmzYP/Srxy8n1Y+vLBlZnCvuOw5SRbXKRe4diMdnN+0R/anCBc5conu/b
         5qhe4kEWO75bzudisEYoU5EiTLbXS7j36NG3/MatiZ9dau8kEu4eCAkfCI10iospVUhr
         D9tg==
X-Gm-Message-State: AOAM530w0n3otJ6KYsrF3Fkek+hJeQz/nce8fDe1do8Ms9FLVor4rbCa
        5RLK8FYYIIfMu2GWgrPUxaU=
X-Google-Smtp-Source: ABdhPJyLAcse4aT8yNI3XvKGkp0gEKbv+Sqha9Wd+n+TT2mpsyGXnI0AG2KhVUjMh6NJMyYFA6EcsQ==
X-Received: by 2002:aa7:9085:0:b0:50d:35ae:271 with SMTP id i5-20020aa79085000000b0050d35ae0271mr21469622pfa.42.1651110271497;
        Wed, 27 Apr 2022 18:44:31 -0700 (PDT)
Received: from 9a2d8922b8f1 ([122.161.52.85])
        by smtp.gmail.com with ESMTPSA id w137-20020a62828f000000b0050d2f9c3409sm14420842pfd.199.2022.04.27.18.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 18:44:31 -0700 (PDT)
Date:   Thu, 28 Apr 2022 07:14:25 +0530
From:   Kuldeep Singh <singh.kuldeep87k@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: I2C: Add Qualcomm Geni based QUP I2C
 bindings
Message-ID: <20220428014425.GB72033@9a2d8922b8f1>
References: <20220404182938.29492-1-singh.kuldeep87k@gmail.com>
 <20220404182938.29492-2-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404182938.29492-2-singh.kuldeep87k@gmail.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 04, 2022 at 11:59:34PM +0530, Kuldeep Singh wrote:
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

Gentle ping to revive this thread.
Patch 2,3,4 are accepted in this series and this one is only left.

Bjorn, could you please help in picking this up if there are no further
review comments. Thanks!
