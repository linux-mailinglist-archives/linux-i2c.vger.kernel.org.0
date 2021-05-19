Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE5538929E
	for <lists+linux-i2c@lfdr.de>; Wed, 19 May 2021 17:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354870AbhESPay (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 11:30:54 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:33298 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354785AbhESPav (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 11:30:51 -0400
Received: by mail-ot1-f49.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so12138630oto.0;
        Wed, 19 May 2021 08:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=k1BMeUTbeJ1Ojj2Y28GjLMZTtvIHgmmwd90fSboA3i0=;
        b=mq5TOPpVSfg74PM1+WstRQekcMvU6+0JiR95ovncZqLbt2aWU/yuNCMxvpx+8px/a3
         C+/xIK0CwSP/R0XT7GiXFc7UP69QKKIluxlMKZfrHVKJotIvQNIonBnuyvnU8UE81Rhr
         ODCw4bcplkboKtEqdUOOGBqtMRZUGE4IZ+MG5E+VvjJLJOscvmlZYcL0WCW36V5yWj8X
         Zj6GWmSqRl6FOx6jGGTYmvx3PLH/JeuZ+6hg3V5USQadBJYA7F1QMVmLKE5SqPrPX1ME
         sCS09Bc57IaGI8HnWOD2633MY67xzcuV0Q1hn2K9I48LvPRXm00aK1TKhFORfRcP42Wo
         pgKQ==
X-Gm-Message-State: AOAM533ofd+5zF2ZPanR3z4tQd/06L4btETifigrXMu9dTgfEEp5Lq1N
        8eazZETbIfoz0+FWyUflpQpkqPwtJA==
X-Google-Smtp-Source: ABdhPJzfHwRubC4A+GJbwqXIPluC9VWdzE3LtUHkth8w8OcmezXF1dBV+tE1V5FeZG+SaSCglQKYiQ==
X-Received: by 2002:a9d:58c1:: with SMTP id s1mr9206990oth.361.1621438170894;
        Wed, 19 May 2021 08:29:30 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r124sm4101937oig.38.2021.05.19.08.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 08:29:30 -0700 (PDT)
Received: (nullmailer pid 3134234 invoked by uid 1000);
        Wed, 19 May 2021 15:29:24 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jamin Lin <jamin_lin@aspeedtech.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        steven_lee@aspeedtech.com, Rayn Chen <rayn_chen@aspeedtech.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        chiawei_wang@aspeedtech.com, Joel Stanley <joel@jms.id.au>,
        ryan_chen@aspeedtech.com, Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        troy_lee@aspeedtech.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
In-Reply-To: <20210519080436.18975-4-jamin_lin@aspeedtech.com>
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com> <20210519080436.18975-4-jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed-i2c: Convert txt to yaml format
Date:   Wed, 19 May 2021 10:29:24 -0500
Message-Id: <1621438164.132520.3134233.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 May 2021 16:04:29 +0800, Jamin Lin wrote:
> Add global-reg node for AST2600. Document the properties for
> "aspeed,ast2600-i2c-global" compatible node.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 89 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    | 49 ----------
>  2 files changed, 89 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i2c/aspeed,i2c.example.dt.yaml:0:0: /example-0/i2c-global-regs@0: failed to match any schema with compatible: ['aspeed,ast2600-i2c-global', 'syscon']

See https://patchwork.ozlabs.org/patch/1480769

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

