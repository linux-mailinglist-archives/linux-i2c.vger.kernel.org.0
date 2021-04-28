Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1486F36E166
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Apr 2021 00:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbhD1WQC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Apr 2021 18:16:02 -0400
Received: from mail-oo1-f52.google.com ([209.85.161.52]:33780 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbhD1WQC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Apr 2021 18:16:02 -0400
Received: by mail-oo1-f52.google.com with SMTP id e9-20020a4ada090000b02901f91091e5acso2162618oou.0;
        Wed, 28 Apr 2021 15:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=gYgk6AJrAYzNx39r/XzjJt1ApfnhLWc9A/uBhzNpze4=;
        b=H6ZLOvmWBwqKmzA/ixZNzWc2BLcpYJg7abevlAGzxXqk0OdCdOT4x4BD7G/ma8MgN2
         AnGEhS91OV/33bJ07WFU0ZCr9Eo6T1fibilt6eMQlwPcscQ04pWDpL7TWma1nFl3fnp3
         RN/nX/AqxtyzJXOGV5nRoiXcV8H2YCXrRKz4i93N+KGuK3coHORarQva+DOOr9JTeS3I
         1qex8m8VAt+i7DFASSXXQ1oOv3GT5RT2+pGBs5PXTnsa227N27CmoZmq1iOxGqihYJ/S
         ksGfNJMj7DA/F1XTFwsjTQ8CJu1mvMjeWSbATZ6cDgbrtpI3jUJwy0+DJAfrDyA9XDiy
         /hdQ==
X-Gm-Message-State: AOAM530gJeLwg0+tLMGodeqHothMBCxFRHO2YGwckVLj00pvdRsnSMZf
        DLiWvOAMK2FOxybebZdtjkAyjShLZw==
X-Google-Smtp-Source: ABdhPJxZArFwbVeIF8l00TfdHEC2VcZYpSALlJgxSt21DhqXruJlYIhnGLdMAytU4YnTNvOcFrdcCw==
X-Received: by 2002:a05:6820:381:: with SMTP id r1mr24594188ooj.79.1619648115937;
        Wed, 28 Apr 2021 15:15:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w2sm284666oov.23.2021.04.28.15.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 15:15:15 -0700 (PDT)
Received: (nullmailer pid 4061033 invoked by uid 1000);
        Wed, 28 Apr 2021 22:15:09 -0000
From:   Rob Herring <robh@kernel.org>
To:     cl@rock-chips.com
Cc:     david.wu@rock-chips.com, jagan@amarulasolutions.com,
        linux-kernel@vger.kernel.org, jay.xu@rock-chips.com,
        jamie@jamieiles.com, ulf.hansson@linaro.org,
        jensenhuang@friendlyarm.com, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org,
        gregkh@linuxfoundation.org, huangtao@rock-chips.com,
        mail@david-bauer.net, linux@roeck-us.net,
        devicetree@vger.kernel.org, heiko@sntech.de, cnsztl@gmail.com,
        wim@linux-watchdog.org, michael@amarulasolutions.com,
        zhangqing@rock-chips.com, maz@kernel.org, robh+dt@kernel.org,
        uwe@kleine-koenig.org, shawn.lin@rock-chips.com,
        linux-mmc@vger.kernel.org, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org, wens@csie.org,
        linux-rockchip@lists.infradead.org
In-Reply-To: <20210428134938.22383-1-cl@rock-chips.com>
References: <20210428134759.22076-1-cl@rock-chips.com> <20210428134938.22383-1-cl@rock-chips.com>
Subject: Re: [PATCH v3 07/10] dt-bindings: soc: rockchip: Convert grf.txt to YAML
Date:   Wed, 28 Apr 2021 17:15:09 -0500
Message-Id: <1619648109.786418.4061032.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 28 Apr 2021 21:49:38 +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> Current dts files with 'grf' nodes are manually verified. In order to
> automate this process grf.txt has to be converted to YAML.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../devicetree/bindings/soc/rockchip/grf.txt  | 61 -------------------
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/rockchip/grf.example.dt.yaml: example-0: syscon@ff320000:reg:0: [0, 4281466880, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/rockchip/grf.example.dt.yaml: example-0: syscon@ff770000:reg:0: [0, 4285988864, 0, 65536] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/rockchip/grf.example.dt.yaml: syscon@ff320000: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3399-pmugrf', 'syscon'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/rockchip/grf.example.dt.yaml: syscon@ff770000: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3399-grf', 'syscon'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/rockchip/grf.yaml

See https://patchwork.ozlabs.org/patch/1471171

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

