Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FF44215E2
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 20:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236103AbhJDSD2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 14:03:28 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:37702 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236334AbhJDSDV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 14:03:21 -0400
Received: by mail-ot1-f46.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so22665659otv.4;
        Mon, 04 Oct 2021 11:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pv86mBYYQI6ZTZjtJe5Lu8vOr6IQOHLnJWKdcQKjRzc=;
        b=mO7jbZenEvQ7dSY/pDJIDtKCJnduv67QEVHtGs8+z9XotuaMwKJuIqNDHGWGYjepHS
         Yfi1rYDzq6e9eTtV/J5R5sp07TocWjMM/brxhhvK+x2wOXBHZl/zsOHEeCOmeNBWatsW
         OBj0kRCoJWvSPBAX45WOiDvIWR7q+eD/sVFMZsS23A/gyx44+w1t1vO7FTGZtRlduEpB
         mT7OR+RsdlTLK5CfYluxUvJeiVfWn52cwcV5ryrTsnMQgJIo1liVTFMhFMsseCWi5j3n
         IzkjSppl5EhN972USn+8G44gB+yUkzd9ZG3i9RUSiY5Gp7gYEAtkBlm3gutHc+sOSrbw
         hTJQ==
X-Gm-Message-State: AOAM531WUHyAKvqiNOlwkYz7509j+QPv+OSSv+x+waEMM7jWGug6MO1B
        Ak2NURZO7TBnoZwMKZVq7AJKQWCiUw==
X-Google-Smtp-Source: ABdhPJzhXWNovn9uWaeLJ8IddFdPPa+myX6TR4D87Hapmy4PG1jAlRPPCh0xx7swB3WDfIkmyGc9Rg==
X-Received: by 2002:a9d:7116:: with SMTP id n22mr10788066otj.56.1633370490645;
        Mon, 04 Oct 2021 11:01:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i12sm2820400oik.50.2021.10.04.11.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 11:01:30 -0700 (PDT)
Received: (nullmailer pid 1569210 invoked by uid 1000);
        Mon, 04 Oct 2021 18:01:29 -0000
Date:   Mon, 4 Oct 2021 13:01:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Olof Johansson <olof@lixom.net>,
        Paul Mackerras <paulus@samba.org>,
        Stan Skowronek <stan@corellium.com>,
        Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Hector Martin <marcan@marcan.st>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 01/10] dt-bindings: i2c: Add Apple I2C controller bindings
Message-ID: <YVtBeZKqErioOMkD@robh.at.kernel.org>
References: <20210926095847.38261-1-sven@svenpeter.dev>
 <20210926095847.38261-2-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926095847.38261-2-sven@svenpeter.dev>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 26 Sep 2021 11:58:38 +0200, Sven Peter wrote:
> The Apple I2C controller is based on the PASemi I2C controller.
> It is present on Apple SoCs such as the M1.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  .../devicetree/bindings/i2c/apple,i2c.yaml    | 61 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/apple,i2c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
