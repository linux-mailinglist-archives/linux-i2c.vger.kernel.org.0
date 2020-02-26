Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5E011704BD
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 17:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgBZQqn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 11:46:43 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46259 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgBZQqn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Feb 2020 11:46:43 -0500
Received: by mail-oi1-f195.google.com with SMTP id a22so94863oid.13;
        Wed, 26 Feb 2020 08:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=euaE0a/F9iYPW3bW8ux6dEgfNohg5LV/qaPC46bfJbM=;
        b=RJeyE8iFfcHbSDDdapgV8Z5rbedFK6kZcHQtkFk2/RLsL016vequeWlQSYs+xAKgq5
         /mfJ5iYv+o6pzAJjtHQFE9ZmSo+qOIzuUBZPHeoDfgtxHkhRibQgjDIVJcuuQhs6aqir
         g8/drjO8dVj0u8y/tK8VQo5R+Mu0mdOltE53dllbXtjI8dyVhEIthu51cixxyHq/42ML
         ru0CVI5aHi7VV6Gt30t9A1LFCZ7HW+o2TZEiFaPaLrwGoaXFSTZ4xXlgd8iiEnJQK1yl
         H+GJsp9UTgzwpq1kCH5G4JntPyg3Z1CXOk/c3XGjM/TiaK7rnfEK9OrUPoNyoWCpQDMd
         FTnw==
X-Gm-Message-State: APjAAAUnepM32+dX6C2+16Mu/PCKQ4ZE3sPw5GIl7KGKVDJRPXUOF094
        TUa87N9CsYwUZcEVGCp01D9PNXokYQ==
X-Google-Smtp-Source: APXvYqzvFmpRltCmQ98B2SbSzE+zSJMuj+TzJyd3FWc6UU39WI1WJ12+22L0RBnizVTQyeY8Y+GqkA==
X-Received: by 2002:a54:408f:: with SMTP id i15mr3758403oii.64.1582735603027;
        Wed, 26 Feb 2020 08:46:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 15sm967111ois.20.2020.02.26.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 08:46:42 -0800 (PST)
Received: (nullmailer pid 17386 invoked by uid 1000);
        Wed, 26 Feb 2020 16:46:41 -0000
Date:   Wed, 26 Feb 2020 10:46:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Convert UniPhier I2C controller to
 json-schema
Message-ID: <20200226164641.GA17311@bogus>
References: <20200221025535.30311-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200221025535.30311-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 21 Feb 2020 11:55:33 +0900, Masahiro Yamada wrote:
> Convert the UniPhier I2C controller (FIFO-less) binding to DT schema
> format.
> 
> There are two types of I2C controllers used on the UniPhier platform.
> This is the legacy one without FIFO support, which is used on the
> sLD8 SoC or older.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> When I search for a subsystem-common schema, I need to
> look in both dt-schema project and the kernel tree.
> 
> For example,
> the i2c-controller.yaml is located in the dt-schema project.
> dt-schema/schemas/i2c/i2c-controller.yaml
> 
> The dma-controller.yaml is located in the kernel tree.
> Documentation/devicetree/bindings/dma/dma-controller.yaml
> 
> I am still wondering about the policy...
> 
> As far as I understood, the schema written by Rob
> tend to go in the dt-schma project. Is this correct?
> 
> 
>  .../devicetree/bindings/i2c/i2c-uniphier.txt  | 25 ----------
>  .../bindings/i2c/socionext,uniphier-i2c.yaml  | 50 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-uniphier.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/socionext,uniphier-i2c.yaml
> 

Applied, thanks.

Rob
