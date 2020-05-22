Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989801DF222
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 00:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731397AbgEVWmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 May 2020 18:42:21 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:37358 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731391AbgEVWmV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 May 2020 18:42:21 -0400
Received: by mail-il1-f196.google.com with SMTP id r2so1159167ila.4;
        Fri, 22 May 2020 15:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JuCuXLGKu/Cpaze8rVHktM6qeXHp4VtIRO2ypPo4gW0=;
        b=MwBXZT4VluQgaBM4YTyhs1WPQLrUoC0Y5JISmCV1P/8Yc7s/kN2vZIjJWYQCmqItZa
         2ievMRPCbuB8UqZb5Si2tFgAMVYoTMriR4D5LAHccy9oafDf9edjYvAVn1kwzqImP3z2
         d7W0OPTF8csEa6Fbe8IidaTJnAz5PXohNKAXlXQPfUY2wOCBg7g55WUR+5OvxPg9cfOG
         JaAMmrDYPyS+yLZOZh0Iam9f5KhaLwP07tyCcxEim+IO8N1rvL5QTufGQGdzu2FkUoq/
         bkjSBuHLKagc1B4zlMeMFo+ABOLS8Eibx8D46q36bGVH2uVWE8ohr3nGxAbDm6sWEAK3
         RKug==
X-Gm-Message-State: AOAM5320Yz6j7q1EJZqf7F+BKCYC3flVmv8QRkzZdxnlbYYZGrqAGKAo
        LftA9f59EWdyjCFz+EOvnodInfc=
X-Google-Smtp-Source: ABdhPJzavXPf6QraDSSP+C8Cf0zAAigF73AyOksGDL0HvQxYO0MhIQUfBalrWcaf30LuSiDr4uw5bQ==
X-Received: by 2002:a05:6e02:130e:: with SMTP id g14mr15735257ilr.38.1590187339802;
        Fri, 22 May 2020 15:42:19 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id e26sm4195065ioe.39.2020.05.22.15.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 15:42:19 -0700 (PDT)
Received: (nullmailer pid 848403 invoked by uid 1000);
        Fri, 22 May 2020 22:42:17 -0000
Date:   Fri, 22 May 2020 16:42:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kfting@nuvoton.com, benjaminfair@google.com,
        avifishman70@gmail.com, yuenn@google.com,
        andriy.shevchenko@linux.intel.com, openbmc@lists.ozlabs.org,
        tmaimon77@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, wsa@the-dreams.de,
        brendanhiggins@google.com, robh+dt@kernel.org, venture@google.com,
        ofery@google.com
Subject: Re: [PATCH v13 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C
 controller
Message-ID: <20200522224217.GA847856@bogus>
References: <20200522113312.181413-1-tali.perry1@gmail.com>
 <20200522113312.181413-2-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522113312.181413-2-tali.perry1@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 22 May 2020 14:33:10 +0300, Tali Perry wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM I2C controller.
> 
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dts:22.28-29 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:312: recipe for target 'Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1296162

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

