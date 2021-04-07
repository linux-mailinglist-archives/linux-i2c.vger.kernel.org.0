Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31782357411
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 20:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348465AbhDGSST (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 14:18:19 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:40872 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344500AbhDGSSS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Apr 2021 14:18:18 -0400
Received: by mail-oi1-f181.google.com with SMTP id i3so19691502oik.7
        for <linux-i2c@vger.kernel.org>; Wed, 07 Apr 2021 11:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IIqgbMCcdTpQbpBDClGD0ZP05/JMPK0PAV8/1JK2uX8=;
        b=QE5SGbHekuEa9bLvCadyT/na9tanjSj/TJdL0qs90vesl1lyL6Bw3LpNVExQ0EauZA
         6CA2BxfrZdrLwc09PaHbQslvVCVKX+eyatcZQbG505nrru9jWPKZvqyIUU3THmkb0d5e
         K1ZuURfCNyQDjD3aMUjZfKq/FyVHdMHQOyzUbxoyacWwznua15wYkXutGZTomb7gMSDg
         KwvxLWs9J4t9lsFfF02wlKvjhN+opi1TjM74CTTiI4aKgUtZPEYaSAWLd4HLKinHCWM7
         OusuFFwwYy6BjqoQiwFLeCQidRT8ZcKWH2K852L22yYNW6w+buTmUt/MBl+fU0D/91Rf
         0UYg==
X-Gm-Message-State: AOAM532zaZI0ZotCSJ0s4HiQVXHOI+6Df+/n9HmAls9XkCpJwQuhdCBx
        eukQk7yFZnNocadnfmd281AlOwtIoQ==
X-Google-Smtp-Source: ABdhPJxWBe/pSc7p5tLi9XSf0Ibbr73cKS4GMyX4C01kCKGB7qrVjDCjpwMt3y1opVaiOrXy0su4NA==
X-Received: by 2002:a05:6808:607:: with SMTP id y7mr3038422oih.160.1617819486704;
        Wed, 07 Apr 2021 11:18:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o197sm4920239ooo.44.2021.04.07.11.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 11:18:05 -0700 (PDT)
Received: (nullmailer pid 3998313 invoked by uid 1000);
        Wed, 07 Apr 2021 18:18:04 -0000
Date:   Wed, 7 Apr 2021 13:18:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] i2c: imx: drop me as maintainer of binding docs
Message-ID: <20210407181804.GA3993883@robh.at.kernel.org>
References: <20210329192409.7313-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329192409.7313-1-wsa@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 29, 2021 at 09:24:09PM +0200, Wolfram Sang wrote:
> I dunno why I got added here, but I haven't been using this driver for
> years. Remove me to make space for interested parties.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> index f23966b0d6c6..f33c6b29966b 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> @@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
>  
> -maintainers:
> -  - Wolfram Sang <wolfram@the-dreams.de>
> -

This change breaks the binding:

/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/i2c/i2c-imx.yaml: 'maintainers' is a required property

Either revert or add me if you can't find an i.MX person that cares.

This would have been checked mostly automatically had this been sent to 
the DT list.

Rob
