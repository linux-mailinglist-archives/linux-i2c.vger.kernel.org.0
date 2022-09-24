Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946435E8EF5
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Sep 2022 19:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbiIXRb2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Sep 2022 13:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiIXRb1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Sep 2022 13:31:27 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84C03868E;
        Sat, 24 Sep 2022 10:31:26 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-127ba06d03fso4254271fac.3;
        Sat, 24 Sep 2022 10:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=jdt37FqOHKoNX5KKgEN9cN6IwsGzfTtbkKEvY7gE7kU=;
        b=F7toIBGF8mlAGDT8J5by0s34w7yzH1UVYeD4Bmj7D+K1+jFjRj75dFwe1IkMYhcQ9n
         qg1UWL8M8KwF9z4xT1hE6FMNp0NtokSLc4YC5UFmhDcXms8MHoTW8pZ2837zSFrSVaru
         ALnd1PWltqdIgCfexrD3ZoTmRnqJmEXKH1UcPquoYw/TPnf2M4+YJWFiYgSBRShD565/
         uX9Ww/PjqRFf2Ma0bp/4dPzpvysUyYln+Naq+kd3dlCNFYCpk+ncna8xsciAtySPcQ6a
         CfIfqkHrNEPYYCbvJphBFmFp+lwQFYq6WtNQAo6FHvreVV0Ufp4BPV1Mcd+RwUVM58Ib
         oTrw==
X-Gm-Message-State: ACrzQf3KJcGqossJR1PzWYMltYhINO/G8xQtCqKZlhQV67v5yO+GGLJ/
        YoYpfXNWs3nZorVMZoevTlyl/0uqCwB7
X-Google-Smtp-Source: AMsMyM6pfeK8XxwoPfZmh1rxKATls+nfuJRqCQzPH+cb9SjggXj79qeP6d9n6/XnejpYON6Qs1odqw==
X-Received: by 2002:a05:6870:b68d:b0:12d:484a:2643 with SMTP id cy13-20020a056870b68d00b0012d484a2643mr14780018oab.105.1664040686123;
        Sat, 24 Sep 2022 10:31:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p6-20020a9d76c6000000b00616e2d2204csm5589976otl.21.2022.09.24.10.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 10:31:25 -0700 (PDT)
Received: (nullmailer pid 1008225 invoked by uid 1000);
        Sat, 24 Sep 2022 17:31:25 -0000
Date:   Sat, 24 Sep 2022 12:31:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: How to remove DT support from a driver? (was Re: [PATCH v5 8/8]
 i2c: i2c-mlxbf.c: Update binding devicetree)
Message-ID: <20220924173125.GA989070-robh@kernel.org>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-9-asmaa@nvidia.com>
 <20220921065506.6cu6p2cpu3zfhtie@krzk-bin>
 <CH2PR12MB3895572575B5BED5DAFFAA29D74F9@CH2PR12MB3895.namprd12.prod.outlook.com>
 <Yyttt3DiQpMZYejA@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yyttt3DiQpMZYejA@shikoro>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 21, 2022 at 10:01:59PM +0200, Wolfram Sang wrote:
> Hi,
> 
> > I have a question for you and Wolfram, we don’t use device trees and
> > are not planning to use device trees; we only use ACPI tables. But I
> > think when Khalil submitted the first version of the i2c-mlxbf.c
> > driver, it was requested from him to add devicetree support. Do you
> > know why? Is it possible to remove the device tree support and so this
> > doc? or is devicetree support a requirement regardless of the actual
> > implementation? 
> 
> The first version sent from Khalil to the public I2C mailing list already
> had DT bindings [1]. I don't see a sign of someone of the public list
> requesting DT bindings. Maybe it was company internal?
> 
> Technically, there is no requirement to support DT, especially since you
> have working ACPI. I don't know the process, though, of removing DT
> support. You would basically need to be sure that no user made use of
> the DT bindings introduced before. I don't know to what degree you can
> assume that.

There's the whole using DT bindings in ACPI bindings thing, but I have 
little interest (or time) in supporting that. Maybe that's what's 
happening here? I haven't looked. The whole concept is flawed IMO. It 
may work for simple cases of key/value device properties, but the ACPI 
model is quite different in how resources are described and managed.

Rob
