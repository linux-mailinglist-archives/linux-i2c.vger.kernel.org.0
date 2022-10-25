Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B724860D76C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Oct 2022 00:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbiJYWz3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 18:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbiJYWz3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 18:55:29 -0400
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 974BAAA3F1;
        Tue, 25 Oct 2022 15:55:28 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id g130so16342638oia.13;
        Tue, 25 Oct 2022 15:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6uxw3oD514p0gfRYAWCHyobLdO5fZJMloTcV5kP2jA=;
        b=A8NUfI2EoHWFxnsXTxLpQd178NsecVhD1ePQ0f8cDPKUk7zFXVdzYrS/FbUOkrrIId
         ypc6510Erk9XeJSIACNdeknibukVNjp5yACy2pqngu5FE4KzrI7foBj92Gjnd44ejfBN
         5utCulkyqXXFmCVB9yPmPliVXeTq4xpl8tWXcLsoejbG92sbKVR15rp3FkqafcZaQvej
         ag+0gh6DoQEVnT9R1y8a+ttCylCd1eUU3LZa7vVHqmmRkToyvJb60lD2+5vuddk9jx+J
         yEMpJWMySRXPZQm1Uvgp049ApSvw5gSo0wSE5XT19QFnpfeXd1UzcEzESIgbA/Fph8Vr
         u6Yw==
X-Gm-Message-State: ACrzQf2tTgw6uEFbSMvgGmsNErLW0bpFyMX4boTLw9Iy3cEHAoAyfBmp
        MIHE/xJJAWPvn1v2OXAcEWgvzDQzHQ==
X-Google-Smtp-Source: AMsMyM5cgoQPHm55uOrtrBPsG1M6UiD+7zyACpO7gt+S1XnUauNe58+XLsbrcbOuuiFoK/QYlZniyA==
X-Received: by 2002:a05:6808:11cb:b0:353:f841:e390 with SMTP id p11-20020a05680811cb00b00353f841e390mr315589oiv.149.1666738527607;
        Tue, 25 Oct 2022 15:55:27 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y11-20020a056830208b00b0066193df8edasm1578608otq.34.2022.10.25.15.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 15:55:27 -0700 (PDT)
Received: (nullmailer pid 3415421 invoked by uid 1000);
        Tue, 25 Oct 2022 22:55:28 -0000
Date:   Tue, 25 Oct 2022 17:55:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, wsa@kernel.org,
        linux-i2c@vger.kernel.org, xuwei5@huawei.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: [PATCH next v8 2/2] dt-bindings: i2c: add entry for
 hisilicon,i2c-ascend910
Message-ID: <166673852817.3415370.7297380833835419705.robh@kernel.org>
References: <20221024015151.342651-1-chenweilong@huawei.com>
 <20221024015151.342651-2-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024015151.342651-2-chenweilong@huawei.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 24 Oct 2022 09:51:51 +0800, Weilong Chen wrote:
> Add the new compatible for HiSilicon i2c.
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> ---
> Change since v7:
> - Fix yamllint errors, rename i2c-xxx to i2c-ascend910
> Link: https://lore.kernel.org/all/166635752527.3428089.707277745439761591.robh@kernel.org/
> 
>  .../bindings/i2c/hisilicon,i2c-ascend910.yaml | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/hisilicon,i2c-ascend910.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
