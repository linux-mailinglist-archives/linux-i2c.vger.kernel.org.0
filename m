Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0F326B04F
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Sep 2020 00:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgIOWGY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Sep 2020 18:06:24 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:32985 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727977AbgIOUZc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Sep 2020 16:25:32 -0400
Received: by mail-il1-f194.google.com with SMTP id x2so4327384ilm.0;
        Tue, 15 Sep 2020 13:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hqrDKh/wQTHsjpamDIm7+3eHpp2tofZ94H9jUy28gw0=;
        b=FJiSYHDrb4G+Kfhvx53ksMNzAWsC3A19koW6Wu1qBxmHGCRgeo9c/kVADzqjUqn3zE
         SPLrR6parJtY/lpCBeqLvyOLByhnPuuhnXWB5yYfFglcua9gh0lE43TK2Xyh3wv/SBda
         LUew6SP6RnzYvzcsl6/B51ceEH77g3TeMLte0VdBqywgXLHKJ4xMXlfoKh9yrra6oupw
         XkzAqxZLCmm+aBuXIeMm2bObrqn8GlkGEwXD2E3HEL1hspTdrFzTnZoLpyIZuMLMC9HE
         D5ktN0yf1BYRbwSjBFUHzujYQ7PtIXAyMwqLPTIksSYPJ2UuDOiK2QBTmGtP9DjWa0yl
         63GQ==
X-Gm-Message-State: AOAM533K+F/4jRQUBaFcB320/LN0GjY7lGKSPEL7pS0BPqBajJLzT1SW
        cHSeqwzFP5wPWNV8mgAwMwz819prJmq7vVA=
X-Google-Smtp-Source: ABdhPJzQEujayl0AnjerHGru4325MxbnU2cDr4EIKJMKs2nkbXcqIgtDujwc4j4UUUHjKfQS9RjVAw==
X-Received: by 2002:a92:b74c:: with SMTP id c12mr18335573ilm.237.1600201513104;
        Tue, 15 Sep 2020 13:25:13 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id j77sm1847287ili.31.2020.09.15.13.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 13:25:12 -0700 (PDT)
Received: (nullmailer pid 2449085 invoked by uid 1000);
        Tue, 15 Sep 2020 20:25:09 -0000
Date:   Tue, 15 Sep 2020 14:25:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: eeprom: at24: Add label property for
 AT24
Message-ID: <20200915202509.GA2448287@bogus>
References: <20200910134239.192030-1-jonathanh@nvidia.com>
 <20200910134239.192030-3-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910134239.192030-3-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 10, 2020 at 02:42:36PM +0100, Jon Hunter wrote:
> Add a label property for the AT24 EEPROM to allow a custom name to be
> used for identifying the EEPROM on a board. This is useful when there
> is more than one EEPROM present.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index 4cee72d53318..5c00d8a146b0 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -114,6 +114,10 @@ properties:
>            - const: renesas,r1ex24128
>            - const: atmel,24c128
>  
> +  label:
> +    description: Descriptive name of the EEPROM.
> +    maxItems: 1

label is always a single string, so drop 'maxItems'.

> +
>    reg:
>      maxItems: 1
>  
> -- 
> 2.25.1
> 
