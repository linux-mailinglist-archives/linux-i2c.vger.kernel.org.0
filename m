Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E3C35A5D7
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Apr 2021 20:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbhDISeb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Apr 2021 14:34:31 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:43967 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbhDISea (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Apr 2021 14:34:30 -0400
Received: by mail-oi1-f171.google.com with SMTP id n8so6686938oie.10;
        Fri, 09 Apr 2021 11:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aq5he8JKUoPFVKipccRMX0cptU5/xg/8LkRNl2CRCQs=;
        b=k23Mly5nryJcsuWaM5HJtgcpgj+0rzhTNiiBe/LYJ9Gs3W8jX6u5NkYci0vn3tZf7I
         2lpFP8WJbj8CKid6+IvwGpywZlP5/Ai1DI0sPFMdgdpxSIpePPFoVCgw75WqoQV9CFJU
         2ewG8j5kf2+9gxPraeYc1TqJ9ywrsNLvIJ0H85U7UaVDoj7whEPy80wG6qyUBXyIpbC2
         JpMQzVbMIb71zwQ9VEtFWoVbyIpzmmDDqh/I+gmc85f9dPfQVU5+wj6PIBLza9UEbeZc
         KZcTbYbb3IbqVPeKxjID0EeDNQjgaP04383c01E9iOyID40201ZU59P4vBZii8vukWFW
         VUdg==
X-Gm-Message-State: AOAM530obE26Vb/n87Q1Tedk/CXyAaxR7GPpzX17YWuR+TUSrguZGvoy
        ldfUNbO13yWwXKxyihQE2A==
X-Google-Smtp-Source: ABdhPJy70GWdlLZUHeW+3gtm8uHRBTjvmjBW74AgNh8X4qYXwxiaxJutOZ2nRxOVWv/+vn12BTocOA==
X-Received: by 2002:aca:fc41:: with SMTP id a62mr11019797oii.92.1617993257038;
        Fri, 09 Apr 2021 11:34:17 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m127sm649411oib.32.2021.04.09.11.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:34:16 -0700 (PDT)
Received: (nullmailer pid 3927698 invoked by uid 1000);
        Fri, 09 Apr 2021 18:34:15 -0000
Date:   Fri, 9 Apr 2021 13:34:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Manish Varma <varmam@google.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: add "dev-name" property to
 assign specific device name
Message-ID: <20210409183415.GA3919775@robh.at.kernel.org>
References: <20210407185039.621248-1-varmam@google.com>
 <20210407185039.621248-2-varmam@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407185039.621248-2-varmam@google.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 07, 2021 at 11:50:38AM -0700, Manish Varma wrote:
> I2C devices currently are named dynamically using
> <adapter_id>-<device_address> convention, unless they are instantiated
> through ACPI.
> 
> This means the device name may vary for the same device across different
> systems, infact even on the same system if the I2C bus enumeration order
> changes, i.e. because of device tree modifications.
> 
> By adding an optional "dev-name" property, it provides a mechanism to
> set consistent and easy to recognize names for I2C devices.

So? Why do you need 'easy to recognize names'?

Why is I2C special? If we wanted this in DT, it wouldn't be I2C specific 
and we probably would have added it long ago.

> Signed-off-by: Manish Varma <varmam@google.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index df41f72afc87..6fb03f464b81 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -130,6 +130,11 @@ wants to support one of the below features, it should adapt these bindings.
>  - wakeup-source
>  	device can be used as a wakeup source.
>  
> +- dev-name
> +	Name of the device.
> +	Overrides the default device name which is in the form of
> +	<busnr>-<addr>.

What's 'busnr'? No such thing in DT.

> +
>  Binding may contain optional "interrupts" property, describing interrupts
>  used by the device. I2C core will assign "irq" interrupt (or the very first
>  interrupt if not using interrupt names) as primary interrupt for the slave.
> -- 
> 2.31.1.295.g9ea45b61b8-goog
> 
