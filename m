Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91F3389297
	for <lists+linux-i2c@lfdr.de>; Wed, 19 May 2021 17:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354766AbhESPar (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 11:30:47 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:38768 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344451AbhESPaq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 11:30:46 -0400
Received: by mail-oi1-f174.google.com with SMTP id z3so13458003oib.5;
        Wed, 19 May 2021 08:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=6sgw4dZNi4BFtEEc+m0JLU9MKkrHkvN3LLqqxVCcWAY=;
        b=j2FpOQMXxV3EPfoiNla8JC5JaavgBbHkq4A6LC43AhG6v2vXKuT4IZ/NDJyzpSZboi
         /sTCijFo3M35UJ5jKNiRH9HY3o28vxO8smSCilYRVF6r5Us5jpT9lMNmcsVQIf+oQ5NE
         X0gFHHsgSdT5EiZUnEvGic9XW0Q3utlxYoJdIKI86Ex+nnUSUSge3urG+LjcH3WrK7d9
         iAxERfaB2bt9Qj+ohN6z+arpVh1CM6LFQ7ePZQaTkgrlXbFcH2yBz+1Fk6RR5ZZKRNpr
         G9useTT8egNcyjqxeXClJi6HGlwxwjXeg3NtUUT9e1SqEgh+CzEpj1MDPpk4wZhSS45p
         FkrQ==
X-Gm-Message-State: AOAM531Hxk2Pc9XwSk5Ae7f753YsfKUdvV3jXZrsoXlh/d0sEVD/V/zw
        7cyqJPKZBEsFMT5TGRLWIoXfX/kljQ==
X-Google-Smtp-Source: ABdhPJxpcJcisKTasg8QiYFuZTHsZe6ssMjCsGuLZrRJywLDzjgJu1juj+3zcOycyjoKvnHHz5hSzA==
X-Received: by 2002:a54:481a:: with SMTP id j26mr7226575oij.154.1621438166265;
        Wed, 19 May 2021 08:29:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b18sm1458otk.62.2021.05.19.08.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 08:29:25 -0700 (PDT)
Received: (nullmailer pid 3134231 invoked by uid 1000);
        Wed, 19 May 2021 15:29:24 -0000
From:   Rob Herring <robh@kernel.org>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     openbmc@lists.ozlabs.org, Wolfram Sang <wsa@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Open Source Submission <patches@amperecomputing.com>,
        openipmi-developer@lists.sourceforge.net,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        devicetree@vger.kernel.org, Corey Minyard <minyard@acm.org>,
        Joel Stanley <joel@jms.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Phong Vo <phong@os.amperecomputing.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-aspeed@lists.ozlabs.org,
        Brendan Higgins <brendanhiggins@google.com>
In-Reply-To: <20210519074934.20712-8-quan@os.amperecomputing.com>
References: <20210519074934.20712-1-quan@os.amperecomputing.com> <20210519074934.20712-8-quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 7/7] bindings: ipmi: Add binding for Aspeed SSIF BMC driver
Date:   Wed, 19 May 2021 10:29:24 -0500
Message-Id: <1621438164.118346.3134230.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 May 2021 14:49:34 +0700, Quan Nguyen wrote:
> Add device tree binding document for the Aspeed SSIF BMC driver.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + Switched to use DT schema format [Rob]
> 
>  .../bindings/ipmi/aspeed-ssif-bmc.yaml        | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dts:21.13-26: Warning (reg_format): /example-0/ssif-bmc@10:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.example.dt.yaml: example-0: ssif-bmc@10:reg:0: [16] is too short
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml

See https://patchwork.ozlabs.org/patch/1480727

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

