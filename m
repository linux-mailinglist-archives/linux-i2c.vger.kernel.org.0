Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E83B0134E00
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 21:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbgAHUyF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 15:54:05 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38271 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727510AbgAHUyF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jan 2020 15:54:05 -0500
Received: by mail-ot1-f67.google.com with SMTP id d7so4973056otf.5
        for <linux-i2c@vger.kernel.org>; Wed, 08 Jan 2020 12:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fdVvruvENSVDnyxa3WruHxJs8BWU7Yt+OMrPNBUFY8A=;
        b=t1nWDDQ8WHM573kxjVTPn1vt87U9ptbDFvHkIDY5KnBggmGmyLM+AIUnHlk2kpRqBX
         xls2KUyfqtG6fjxrrJK+ONsg1kzxZ6RcTzPsnzT8qd1x59AZ10f9Tt/eB0pmohR7GDKX
         T4ASaZhX2oreloF+NfRaWtQUSV4VyMoM2CGYHa6oDcAAWDg9WnzYyCHD61UKWaTGK2gR
         gIpFsOuCigrnlYN4VOtcSE5+qvZ5chSnsJs5BF1Fna2nXu9GqRS8qpdzvj7RwARVmrIw
         280WnEkhfzcAW2guONv0PBstS9rtSTJ712/wTBmFnIm91gIzsDqppdL5NeNA+qW7AK+U
         H1IA==
X-Gm-Message-State: APjAAAVPPX6yE4+MUwBrxEJYvX1Tsmqwk2O3VbGftblNRt9EsJqHtSZB
        Pbne3/EFVzoqSxBmIj68Svath6k=
X-Google-Smtp-Source: APXvYqzfnGrgCk+W9KwE/DE6w66EWamhv/o0KQsSrjIMJQTbjNAFu1CIM//JFeoM6gTlGPbLCOVJIQ==
X-Received: by 2002:a05:6830:1d5b:: with SMTP id p27mr5300271oth.263.1578516844204;
        Wed, 08 Jan 2020 12:54:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i7sm1433712oib.42.2020.01.08.12.54.02
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:54:03 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:54:01 -0600
Date:   Wed, 8 Jan 2020 14:54:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linus.walleij@linaro.org, Khouloud Touil <ktouil@baylibre.com>
Subject: Re: [PATCH v4 1/5] dt-bindings: nvmem: new optional property wp-gpios
Message-ID: <20200108205401.GA15674@bogus>
References: <20200107092922.18408-1-ktouil@baylibre.com>
 <20200107092922.18408-2-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107092922.18408-2-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue,  7 Jan 2020 10:29:18 +0100, Khouloud Touil wrote:
> Several memories have a write-protect pin, that when pulled high, it
> blocks the write operation.
> 
> On some boards, this pin is connected to a GPIO and pulled high by
> default, which forces the user to manually change its state before
> writing.
> 
> Instead of modifying all the memory drivers to check this pin, make
> the NVMEM subsystem check if the write-protect GPIO being passed
> through the nvmem_config or defined in the device tree and pull it
> low whenever writing to the memory.
> 
> Add a new optional property to the device tree binding document, which
> allows to specify the GPIO line to which the write-protect pin is
> connected.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> ---
>  Documentation/devicetree/bindings/nvmem/nvmem.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
