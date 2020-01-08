Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA3CB134E19
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 21:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgAHUy0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 15:54:26 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42128 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbgAHUyZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jan 2020 15:54:25 -0500
Received: by mail-oi1-f195.google.com with SMTP id 18so3917576oin.9
        for <linux-i2c@vger.kernel.org>; Wed, 08 Jan 2020 12:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=irwHBzNJL11iS3DIpsshB1iOiTtfFrxmr67ljB2o42w=;
        b=YV7WHBhD/jnxpQtky1en//2xmgBQWRSN0pvNjw1QVlazshWGEE9+qKg2MXPlzitq2e
         AChNynuvfobJ8khrmwF93WuVKvzW4/HSnmiOgO0K7ldaTS53a38ySQtXCZZewlUTR1vK
         J1CikO65VIkee9OywrK6ap2YEcqMScghQ7pEAqsBzYChgbBLmkjtUAx23kQ/jZGLLi4/
         hniRBZSCU4SeoDDtDm9RDWEJ+yBW+rTfKugRuBN7yIRrMHfBHulQ3pVYgV+rYPa/ZWQz
         9CAm8/8ixMvt03CfRlGeDCUc7m8ZEq+3610aeggevH0tcRWbeL4JJzaGDn2SPkuCDt8i
         aawA==
X-Gm-Message-State: APjAAAVOylEUmV41L6QMPwZdhhsOtFWtt7ZDj/6aXZoeHDyCi5MRYPCn
        glGoU+PcbjxNStPOcVyO0+z7gaw=
X-Google-Smtp-Source: APXvYqxZkzXEDT2suO81OHCeBrP4ngXe6225/z/79CvhHUISGxTKq5YiFkMSDAvFEV28Kf9LTCIaVA==
X-Received: by 2002:aca:814:: with SMTP id 20mr407122oii.159.1578516864147;
        Wed, 08 Jan 2020 12:54:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n19sm1462831oig.57.2020.01.08.12.54.20
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:54:21 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:54:19 -0600
Date:   Wed, 8 Jan 2020 14:54:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linus.walleij@linaro.org, Khouloud Touil <ktouil@baylibre.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: at24: make wp-gpios a reference to
 the property defined by nvmem
Message-ID: <20200108205419.GA16184@bogus>
References: <20200107092922.18408-1-ktouil@baylibre.com>
 <20200107092922.18408-4-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107092922.18408-4-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue,  7 Jan 2020 10:29:20 +0100, Khouloud Touil wrote:
> NVMEM framework is an interface for the at24 EEPROMs as well as for
> other drivers, instead of passing the wp-gpios over the different
> drivers each time, it would be better to pass it over the NVMEM
> subsystem once and for all.
> 
> Making wp-gpios a reference to the property defined by nvmem.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
