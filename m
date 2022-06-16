Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B27E54E565
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 16:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377047AbiFPOxj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 10:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233993AbiFPOxj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 10:53:39 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C825220BF0;
        Thu, 16 Jun 2022 07:53:36 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id p69so1759394iod.0;
        Thu, 16 Jun 2022 07:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=noJzuG2EgYsSXIT61u1YIsPaCEjRt5ye3SQVTsSN4U8=;
        b=CIZ8a77SDwweUBOGNgII2b8y5/WfszC4zHsGvXE+zftomD+nN0gq1qFR2HzWFRYN5K
         hpEhbGBopNmx3GlEh+glZLRXJhwIx2SwESaYp/7c+H2+x3MzsIKty7bImMbRMF0YGCVU
         1z2PqX5O9AXmPnmNjgtHV+aWq+wFLluDGmmhi1+Jz3ENEavDVQ0CtNTzm0FJHR4i4kmd
         atBUlGU2CMspcvvacCVvdsGjTNV8klc5bzSEOKuZPXH65L3o11x3SvSYMjXpebTbL4fH
         0CIFIjl4J8623xiCo87jPzcp2eMQvYi42rfVp3Iotoy4uj0kVgKAcnFkkVXFnFJdJUfM
         TyYg==
X-Gm-Message-State: AJIora+9uXk2JQmNy0lexMmXsK1v/xndKTvgaXHL0rYRA5gKZ9I8QfbP
        OlBqmRynoRuRZ6sPt8yzckIoCfYc7g==
X-Google-Smtp-Source: AGRyM1u4nGZS+8jkLQspL8OqMilFtD1URp8KZikaKmVKIUBkw4uX4MYV01kHev1qyBWkrdJm6b53vw==
X-Received: by 2002:a05:6602:2f0d:b0:669:e058:9a18 with SMTP id q13-20020a0566022f0d00b00669e0589a18mr2721297iow.26.1655391216014;
        Thu, 16 Jun 2022 07:53:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y8-20020a056e020f4800b002d658a34081sm1052037ilj.86.2022.06.16.07.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 07:53:35 -0700 (PDT)
Received: (nullmailer pid 3459426 invoked by uid 1000);
        Thu, 16 Jun 2022 14:53:34 -0000
Date:   Thu, 16 Jun 2022 08:53:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: move ibm,p8-occ bindings to proper
 folder
Message-ID: <20220616145334.GA3458950-robh@kernel.org>
References: <20220615211619.6742-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615211619.6742-1-wsa@kernel.org>
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

On Wed, 15 Jun 2022 23:16:19 +0200, Wolfram Sang wrote:
> It accidently ended up in i2c, but it should be in the hwmon folder.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  .../devicetree/bindings/{i2c => hwmon}/ibm,p8-occ-hwmon.txt       | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/{i2c => hwmon}/ibm,p8-occ-hwmon.txt (100%)
> 

Applied, thanks!
