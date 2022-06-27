Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A93D455E383
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 15:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241649AbiF0WES (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jun 2022 18:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242741AbiF0WDG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jun 2022 18:03:06 -0400
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54DEA1E3F4;
        Mon, 27 Jun 2022 15:01:01 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id a16so6954104ilr.6;
        Mon, 27 Jun 2022 15:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TZkUYB3BYeJsEsDSI6PmO4Ag8GHC0FQvV7iN+YB5Q0Q=;
        b=zCp96mdzfFQ20ZZJPRmAEPFKrfLyyMs7EZ6is7dWfXsrtHO7OtKrjNg0wxaPeuz9ju
         Z9yaEMaNFcFm7Cayu8tTQeKZFtgxQs5j/r+rzr1FGSec1/enyqQMRJoEY/3mOijncGXE
         rpHKRK3/x2p6J8Z8zXi706446KG9/WEJjnSh9q7UMwwDp9YQBc4ZJpE4AIWE9OqHxi6L
         qjU/zLR5rVIH/6wYzlXshsv2F65jfnRUT/OPDS8e5SIaj5oo55ZhApWuF/8i3CVa4HZw
         VXasQ7qWsaH3YtSdRi//P+7fEzecaXW0FsdopgFl5oVf2UG+nfg7xgPjHQwCTOu2w3aj
         K6zg==
X-Gm-Message-State: AJIora/6z3SsFJ4Q4YYpArAv+GoMFZEQFfNrBf3bRE9WE1IOQMK+Ldw5
        H4suWLQ2xww/0QPoDSc7Kg==
X-Google-Smtp-Source: AGRyM1ssOJCADmXqWwlgb8kDzOGggbdItlatIWFU04SmaYPNYTJ0Nxv2RE7Xu59Xf0OzqmtEW0/lww==
X-Received: by 2002:a05:6e02:188a:b0:2d4:7fd:dbf with SMTP id o10-20020a056e02188a00b002d407fd0dbfmr8113049ilu.217.1656367260514;
        Mon, 27 Jun 2022 15:01:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id bo22-20020a056638439600b0033c8edf022bsm2409410jab.144.2022.06.27.15.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 15:01:00 -0700 (PDT)
Received: (nullmailer pid 3041223 invoked by uid 1000);
        Mon, 27 Jun 2022 22:00:58 -0000
Date:   Mon, 27 Jun 2022 16:00:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa@kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v8 2/3] bindings: ipmi: Add binding for SSIF BMC driver
Message-ID: <20220627220058.GA3036977-robh@kernel.org>
References: <20220615090259.1121405-1-quan@os.amperecomputing.com>
 <20220615090259.1121405-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615090259.1121405-3-quan@os.amperecomputing.com>
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

On Wed, Jun 15, 2022 at 04:02:58PM +0700, Quan Nguyen wrote:
> Add device tree binding document for the SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v8:
>   + None
> 
> v7:
>   + Change compatible string from "ampere,ssif-bmc" to "ssif-bmc"  [Jae]
> 
> v6:
>   + None
> 
> v5:
>   + None
> 
> v4:
>   + Fix warning with dt_binding_check [Rob]
>   + Change aspeed-ssif-bmc.yaml to ssif-bmc.yaml [Quan]
> 
> v3:
>   + Switched to use DT schema format [Rob]
> 
> v2:
>   + None
> 
>  .../devicetree/bindings/ipmi/ssif-bmc.yaml    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ssif-bmc.yaml

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
