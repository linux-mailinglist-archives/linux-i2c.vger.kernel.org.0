Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05551E34A4
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 03:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgE0BUQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 21:20:16 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:33146 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbgE0BUQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 21:20:16 -0400
Received: by mail-il1-f193.google.com with SMTP id y17so20241038ilg.0;
        Tue, 26 May 2020 18:20:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=effDvO19Bc+fjZS0vPWPfjiwZviY7P6mmpKeeJGhBDk=;
        b=h9xaxlHTQ7oGkK2v9WXFCdZgEtjBB/7+oJJwc7vFKTe0bN1iYS0tcixRR9HzU/jmGF
         cV5G75FeA3zcJ89WaFUVHtVvHbwZvy5+JbRKu4/TljzUURWc36KYF0QZKtyeWGk+P/F9
         iB5citzH6QKDeVD7WfOnmBQajs00EGWgC1SdOQsUJ/70XCYcioQE82lqmgMP4gLP/pCv
         1LptBm2dHQyGzG4WpS+xytcHLjdfNAuWq8ztE9BmJ2IfCfD6a6jyhb1VjntfVpy6yLJk
         uQ4uszndu98MF6agpAN2VyJ226g9TvB7sy7hY3VZktZcQUFUPReX/VJ1KyhTn0czMoF5
         zr+g==
X-Gm-Message-State: AOAM532e0rAGhsqlgqFIueEfVbV9bIHlnfoPNAh6IuIIlqhCMjNLvy+v
        2XB1y1pwGmpgl/hz16eEYg==
X-Google-Smtp-Source: ABdhPJy4vTUVR47jxAW9SHk3Dr8bCUQFumiwyInbGQwJ8XPeCeH2qbcTmW7wNTRDS7V/Cq49xG0XuA==
X-Received: by 2002:a92:39d2:: with SMTP id h79mr3720593ilf.74.1590542415023;
        Tue, 26 May 2020 18:20:15 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id z82sm842304ilk.75.2020.05.26.18.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 18:20:14 -0700 (PDT)
Received: (nullmailer pid 822583 invoked by uid 1000);
        Wed, 27 May 2020 01:20:13 -0000
Date:   Tue, 26 May 2020 19:20:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        devicetree@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Subject: Re: [PATCH v3 02/12] dt-bindings: i2c: Convert DW I2C binding to DT
 schema
Message-ID: <20200527012013.GA822473@bogus>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
 <20200526215528.16417-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526215528.16417-3-Sergey.Semin@baikalelectronics.ru>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 27 May 2020 00:55:18 +0300, Serge Semin wrote:
> Modern device tree bindings are supposed to be created as YAML-files
> in accordance with dt-schema. This commit replaces Synopsys DW I2C
> legacy bare text bindings with YAML file. As before the bindings file
> states that the corresponding dts node is supposed to be compatible
> either with generic DW I2C controller or with Microsemi Ocelot SoC I2C
> one, to have registers, interrupts and clocks properties. In addition
> the node may have clock-frequency, i2c-sda-hold-time-ns,
> i2c-scl-falling-time-ns and i2c-sda-falling-time-ns optional properties.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Changelog v2:
> - Make sure that "mscc,ocelot-i2c" compatible node may have up to two
>   registers space defined, while normal DW I2C controller will have only
>   one registers space.
> - Add "mscc,ocelot-i2c" example to test the previous fix.
> - Declare "unevaluatedProperties" property instead of
>   "additionalProperties" one.
> - Due to the previous fix we can now discard the dummy boolean properties
>   definitions, since the proper type evaluation will be performed by the
>   generic i2c-controller.yaml schema.
> 
> Changelog v3:
> - Discard $ref from the "-ns" suffixed properties since they've got the
>   uint32-array type by default applied in the common schema. Set "maxItems: 1"
>   there instead to make sure the property will have a single value specified.
> ---
>  .../bindings/i2c/i2c-designware.txt           |  73 ---------
>  .../bindings/i2c/snps,designware-i2c.yaml     | 154 ++++++++++++++++++
>  2 files changed, 154 insertions(+), 73 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-designware.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
