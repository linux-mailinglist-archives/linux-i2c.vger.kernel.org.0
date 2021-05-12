Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE9FB37EE34
	for <lists+linux-i2c@lfdr.de>; Thu, 13 May 2021 00:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346334AbhELVND (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 17:13:03 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:37828 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385278AbhELUIA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 16:08:00 -0400
Received: by mail-oi1-f175.google.com with SMTP id k25so23420967oic.4;
        Wed, 12 May 2021 13:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=kyyZKIpa+isk/I+3Wcw7Vxw0ujugSMU4FOyrzbAVzpw=;
        b=FId1qL7Jf82knP6bkNwrFzR7O19bz0dTv2kUZgmp7vQwUnszrckt8mX3zy1nvAPZQr
         9wFYgoXpwUaTz/V9rLmw51EMHVutsjlt/kbUITx//KXFKgI743sLjWDcqASoNxGHCvgi
         djwxZUpGsiVr/EM6t/XHvx1kINuHFvzj+RzsC1kucCm22sc/hkfBnnUYdOMBVsEhjikW
         Fgr/5HzByblUGuOf06TjH6JIu4CGq/VWT515RfSXaOeHwZ0rWXYVNDFDAuB5cXMsSy/9
         m7Zyn/E2I8luCnDAnkkECaKqTFV02n7CzP/p+7KxHcDhP5mC6xkUuk64+vPnSthsJeeL
         Erzg==
X-Gm-Message-State: AOAM530Ug8rkiIHYIFeduuArS9YJtllRa3pbTZxmvItKEqyVLmBnVuHt
        dr3GK/IyMDum/AvBxaJJ4w==
X-Google-Smtp-Source: ABdhPJw3KpvYHYZCV/gfx36/2FQXrVtbHjC67rCvN1gpPTFqtdfvUxaY3gYFIjhKzUizld7WFMP1eA==
X-Received: by 2002:a05:6808:193:: with SMTP id w19mr10842598oic.152.1620850011715;
        Wed, 12 May 2021 13:06:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q26sm185943otn.0.2021.05.12.13.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:50 -0700 (PDT)
Received: (nullmailer pid 204084 invoked by uid 1000);
        Wed, 12 May 2021 18:35:16 -0000
From:   Rob Herring <robh@kernel.org>
To:     daire.mcnamara@microchip.com
Cc:     cyril.jean@microchip.com, linux-i2c@vger.kernel.org,
        palmer@dabbelt.com, robh+dt@kernel.org, wsa@kernel.org,
        padmarao.begari@microchip.com, conor.dooley@microchip.com,
        devicetree@vger.kernel.org, lewis.hanly@microchip.com,
        david.abdurachmanov@gmail.com
In-Reply-To: <20210512112024.1651757-2-daire.mcnamara@microchip.com>
References: <20210512112024.1651757-1-daire.mcnamara@microchip.com> <20210512112024.1651757-2-daire.mcnamara@microchip.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: microchip: Add Microchip PolarFire host binding
Date:   Wed, 12 May 2021 13:35:16 -0500
Message-Id: <1620844516.507815.204083.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 12 May 2021 12:20:23 +0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Add device tree bindings for the Microchip PolarFire I2C controller
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/i2c/microchip,mpfs-i2c.yaml      | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1477553

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

