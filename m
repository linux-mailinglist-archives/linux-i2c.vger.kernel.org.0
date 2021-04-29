Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3CC36ED57
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Apr 2021 17:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240705AbhD2P0J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Apr 2021 11:26:09 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:45970 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240701AbhD2P0I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Apr 2021 11:26:08 -0400
Received: by mail-ot1-f43.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so56582774otf.12;
        Thu, 29 Apr 2021 08:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=i0xoMhXwtne9LnlYePyFNsxRYqWjGV7vCqvSAINSLGU=;
        b=RfEp4CUW0pqNhQDpLk/Aq1jI/lMXjcOSpVw2PNUm/v6ssViZcYx3H2OTWqnAo1iPVx
         OdvpVeobtSgynEGy/Alr9BKJ9HW28RtR+hOfQf/kWp9I4ga8VqV4G4BoXHU9EIJg0muA
         vl7fi314upJtnjUtf2CO6DDjdTa9THhJHwoivVL48j2psGIf6MXZyaOpXUa1ZJbp99px
         g6ufrymb8/b3Ck4DSfibNsk4J9UVsMI3Rs2dvixvhVu788UZevMwVlhJnpINmt9ovP9Y
         1t4TUcgveT5YFB1pW0vEYEV9kEU31kqOvWdnV4Z/50efMDbhGSWXJScROVwTAWVM4tgk
         q2fA==
X-Gm-Message-State: AOAM533JTZt9RffmYM3oNuX4OMo9BxV5DOPUR9qpZl255bB4CfqIFj53
        /9L5zewyNS5ucZBCgqIO0w==
X-Google-Smtp-Source: ABdhPJxEU28Uo1HsSxBn20WvETdomdWerhn4crR+liE7z6I2O6zQ+ZVGdv7UMW7On1mtAFTke7piXQ==
X-Received: by 2002:a05:6830:2456:: with SMTP id x22mr28339399otr.262.1619709920279;
        Thu, 29 Apr 2021 08:25:20 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m5sm25975ots.13.2021.04.29.08.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 08:25:19 -0700 (PDT)
Received: (nullmailer pid 1303438 invoked by uid 1000);
        Thu, 29 Apr 2021 15:25:15 -0000
From:   Rob Herring <robh@kernel.org>
To:     cl@rock-chips.com
Cc:     zhangqing@rock-chips.com, uwe@kleine-koenig.org, heiko@sntech.de,
        jensenhuang@friendlyarm.com, devicetree@vger.kernel.org,
        linux@roeck-us.net, michael@amarulasolutions.com,
        linux-watchdog@vger.kernel.org, jay.xu@rock-chips.com,
        mail@david-bauer.net, linux-rockchip@lists.infradead.org,
        wens@csie.org, linux-serial@vger.kernel.org,
        ulf.hansson@linaro.org, jamie@jamieiles.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, jbx6244@gmail.com, linux-i2c@vger.kernel.org,
        wim@linux-watchdog.org, shawn.lin@rock-chips.com,
        jagan@amarulasolutions.com, david.wu@rock-chips.com,
        cnsztl@gmail.com, gregkh@linuxfoundation.org,
        huangtao@rock-chips.com, maz@kernel.org, linux-mmc@vger.kernel.org
In-Reply-To: <20210429081321.17855-1-cl@rock-chips.com>
References: <20210429081151.17558-1-cl@rock-chips.com> <20210429081321.17855-1-cl@rock-chips.com>
Subject: Re: [PATCH v4 07/10] dt-bindings: soc: rockchip: Convert grf.txt to YAML
Date:   Thu, 29 Apr 2021 10:25:15 -0500
Message-Id: <1619709915.260424.1303436.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 29 Apr 2021 16:13:21 +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> Current dts files with 'grf' nodes are manually verified. In order to
> automate this process grf.txt has to be converted to YAML.
> 
> Add new descriptions for:
> "rockchip,rk3568-grf", "syscon", "simple-mfd"
> "rockchip,rk3568-pmugrf", "syscon", "simple-mfd"
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  .../devicetree/bindings/soc/rockchip/grf.txt  | 61 -------------------
>  .../devicetree/bindings/soc/rockchip/grf.yaml | 60 ++++++++++++++++++
>  2 files changed, 60 insertions(+), 61 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/rockchip/grf.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/rockchip/grf.yaml: properties:compatible: [{'items': [{'enum': ['rockchip,px30-grf', 'rockchip,px30-pmugrf', 'rockchip,px30-usb2phy-grf', 'rockchip,rk3036-grf', 'rockchip,rk3066-grf', 'rockchip,rk3188-grf', 'rockchip,rk3228-grf', 'rockchip,rk3288-grf', 'rockchip,rk3288-sgrf', 'rockchip,rk3308-core-grf', 'rockchip,rk3308-detect-grf', 'rockchip,rk3308-grf', 'rockchip,rk3328-grf', 'rockchip,rk3328-usb2phy-grf', 'rockchip,rk3368-grf', 'rockchip,rk3368-pmugrf', 'rockchip,rk3399-grf', 'rockchip,rk3399-pmugrf', 'rockchip,rk3568-grf', 'rockchip,rk3568-pmugrf', 'rockchip,rv1108-grf', 'rockchip,rv1108-usbgrf']}, {'const': 'syscon'}, {'const': 'simple-mfd'}]}] is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/rockchip/grf.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/soc/rockchip/grf.yaml
Documentation/devicetree/bindings/soc/rockchip/grf.example.dt.yaml:0:0: /example-0/syscon@ff320000: failed to match any schema with compatible: ['rockchip,rk3399-pmugrf', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/soc/rockchip/grf.example.dt.yaml:0:0: /example-0/syscon@ff770000: failed to match any schema with compatible: ['rockchip,rk3399-grf', 'syscon', 'simple-mfd']

See https://patchwork.ozlabs.org/patch/1471595

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

