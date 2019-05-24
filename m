Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3D629FFB
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2019 22:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404149AbfEXUkO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 May 2019 16:40:14 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33251 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403762AbfEXUkO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 May 2019 16:40:14 -0400
Received: by mail-oi1-f193.google.com with SMTP id q186so8008948oia.0;
        Fri, 24 May 2019 13:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dx7F2tb05aWTZPXIYGXtVkVDpMKUEB0sugnYrUDSEP4=;
        b=P78IcKu7WJg4jCcKSloQgjWIj4cMcSEISgo0HQ352FUEyyeie6JW8wc1D8aQE3exHd
         82UT7Gq2nBBUHk77N6pYfizYz8r+xMA0jczOsk6P8DsMKK3Bj6lsFEoxBww1WuibY7Bc
         ly526uSWPvsA96/yG68FAVrKreHnPmSOIRzTMpn/ZUEivQazmGFYitnmj1hCud9IqcYh
         434GxF0yGffJziaZwCNKGSeWLrD637/jvJHOCZrMYDjKx39YKMiDtwJh0gqOZLTBqfc3
         pYma7ffSjSQeaTE3s/12ugiDWz0WHJ5fYVM8bwumuABpl+s1PF0DOSKtQ5hduDvRgy6M
         aKgw==
X-Gm-Message-State: APjAAAVDUpLh9YAQNmc7Zxs3TM8LAv9r0ref3mNxy9shRsXFC3It+ke6
        dfUR0k8mPMafRMiEb7fulA==
X-Google-Smtp-Source: APXvYqwl0+0Ie8Od8OqQ6UiwN8QOUNPXf4lB+czpxJ/RNSAqP54n83yRE/iuWBu2oUEGNFxf1Cnjsg==
X-Received: by 2002:aca:f183:: with SMTP id p125mr7644441oih.13.1558730413479;
        Fri, 24 May 2019 13:40:13 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g102sm1186465otg.59.2019.05.24.13.40.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 13:40:12 -0700 (PDT)
Date:   Fri, 24 May 2019 15:40:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Cc:     mark.rutland@arm.com, peter@korsgaard.com, andrew@lunn.ch,
        palmer@sifive.com, paul.walmsley@sifive.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: i2c: extend existing opencore
 bindings.
Message-ID: <20190524204012.GA2580@bogus>
References: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
 <1558515574-11155-2-git-send-email-sagar.kadam@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558515574-11155-2-git-send-email-sagar.kadam@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 22, 2019 at 02:29:32PM +0530, Sagar Shrikant Kadam wrote:
> Reformatted compatibility strings to one valid combination on
> each line.
> Add FU540-C000 specific device tree bindings to already available
> i2-ocores file. This device is available on
> HiFive Unleashed Rev A00 board. Move interrupt under optional
> property list as this can be optional.
> 
> The FU540-C000 SoC from sifive, has an Opencore's I2C block
> reimplementation.
> 
> The DT compatibility string for this IP is present in HDL and available at.
> https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> index 17bef9a..db96951 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
> @@ -1,9 +1,13 @@
>  Device tree configuration for i2c-ocores
>  
>  Required properties:
> -- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
> +- compatible      : "opencores,i2c-ocores",
> +                    "aeroflexgaisler,i2cmst",
> +                    "sifive,fu540-c000-i2c","sifive,i2c0".

space needed                                   ^

And drop the end of line commas and period.


> +                    For Opencore based I2C IP block reimplemented in
> +                    FU540-C000 SoC.Please refer sifive-blocks-ip-versioning.txt

And here too.

And 'refer to'

> +                    for additional details.
>  - reg             : bus address start and address range size of device
> -- interrupts      : interrupt number
>  - clocks          : handle to the controller clock; see the note below.
>                      Mutually exclusive with opencores,ip-clock-frequency
>  - opencores,ip-clock-frequency: frequency of the controller clock in Hz;
> @@ -12,6 +16,7 @@ Required properties:
>  - #size-cells     : should be <0>
>  
>  Optional properties:
> +- interrupts      : interrupt number.
>  - clock-frequency : frequency of bus clock in Hz; see the note below.
>                      Defaults to 100 KHz when the property is not specified
>  - reg-shift       : device register offsets are shifted by this value
> -- 
> 1.9.1
> 
