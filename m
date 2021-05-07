Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA79376BEA
	for <lists+linux-i2c@lfdr.de>; Fri,  7 May 2021 23:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhEGVuj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 May 2021 17:50:39 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:44672 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhEGVuj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 May 2021 17:50:39 -0400
Received: by mail-ot1-f44.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so9142646otp.11;
        Fri, 07 May 2021 14:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PjEtFCe5+lrFxZTe/Zi9n6poa77xUGPKZ2g66tXrfzo=;
        b=F6O0xFmByoNTvtoO5AlV2pR0fMHloVdjm8lunjtVKiBe0r4DIG7L8OLlp29bfsDm9+
         g6lOgWb4hmCTnKDS2zlhwSbcj+xQuwTIj0mDEVE0HZQcy6M3kbdGllMcHuOxWj/t4Nbr
         z0D9/4VTb0L3DMhQ8HKHw/HNf1IPyRntM0xXXF8WqM9I8hnJIbQHn7E1T0Wbi7OX8CfV
         eDsd1S9sJyP0RZb0ZUf01jqmESqSMj4SCGRcB9E40PusiIgg29BBc2Tgn3m33Ity+Q5E
         BK6T5CGAa3v8bS8HyH7huim4ADuyqlMPGEvjbK6wRdXxuZPiuBXPoJ/KZIC5cJV0eZZI
         SJ1Q==
X-Gm-Message-State: AOAM531g9lqAFvZVoD/8uLXbszOK14yqZ6NYG7MyEmtK/+Hlx0EKxL4X
        l1XTcp/AnVeWmrmD9wSzsQ==
X-Google-Smtp-Source: ABdhPJyQMXenAYcP+muUQjeAoJD82VnM0IixSPbaYREYvzrhdcxF/iI6pg2O2zAGiUqHjjdXcDhQXg==
X-Received: by 2002:a9d:4115:: with SMTP id o21mr10002087ote.52.1620424178375;
        Fri, 07 May 2021 14:49:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 65sm1423105otj.17.2021.05.07.14.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 14:49:37 -0700 (PDT)
Received: (nullmailer pid 2952512 invoked by uid 1000);
        Fri, 07 May 2021 21:49:36 -0000
Date:   Fri, 7 May 2021 16:49:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        andy.shevchenko@gmail.com, mpe@ellerman.id.au,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: mpc: Add
 fsl,i2c-erratum-a004447 flag
Message-ID: <20210507214936.GA2944698@robh.at.kernel.org>
References: <20210507004047.4454-1-chris.packham@alliedtelesis.co.nz>
 <20210507004047.4454-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507004047.4454-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 07, 2021 at 12:40:45PM +1200, Chris Packham wrote:
> Document the fsl,i2c-erratum-a004447 flag which indicates the presence
> of an i2c erratum on some QorIQ SoCs.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> index 7b553d559c83..98c6fcf7bf26 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
> @@ -46,6 +46,13 @@ properties:
>      description: |
>        I2C bus timeout in microseconds
>  
> +  fsl,i2c-erratum-a004447:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Indicates the presence of QorIQ erratum A-004447, which
> +      says that the standard i2c recovery scheme mechanism does
> +      not work and an alternate implementation is needed.

The problem with adding a property for an errata is you have to update 
the dtb. If you use the compatible string, then only an OS update is 
needed. That assumes you have specific enough compatible strings.

Rob
