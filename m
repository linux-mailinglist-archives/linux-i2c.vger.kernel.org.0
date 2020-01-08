Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9E6134E1C
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2020 21:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgAHUyv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jan 2020 15:54:51 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42121 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbgAHUyv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jan 2020 15:54:51 -0500
Received: by mail-ot1-f68.google.com with SMTP id 66so4956782otd.9
        for <linux-i2c@vger.kernel.org>; Wed, 08 Jan 2020 12:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jf75AHX9cWk938eoPABkjnqB5jtoAKhCXPRF42yiNM0=;
        b=KaKK/2zW/5X5FYArjEafFVBv28N3k/6QI+A4ak2OQNfTwHNrdM1F47pp2XeyqzhysX
         WV+rRN1lbsoGY66utycXyL//jsOTiJX7suW/vN9cecHIHYZj8oa/57Z8jPEFz1+050Kb
         yBSnS5ViPZdvVGH+DmxfiLvAiTbPX7pzpD8PDWVhxKLheep0Hwlj57OKCfBvEgYD20YC
         c6SFe+QzaUgYGEgABUQNipcMdfGJTsgG1gQUK26tuJ/GcKJKMFHrAt2b5K88EXKW4y5V
         rvE9bxvkh9vNRXCc+cl3c9o58lDnhTH0Y2xEt3Mb7jNgVgd//0dW1OONthy/Rr8kDhq5
         TbXQ==
X-Gm-Message-State: APjAAAXaeddLRE5xoVSCHxRsRoN/pDR03v0Tur5alFdO4ro0o2tl1t5z
        77CCMIoLF1AHKYi5RVjgYZPkwcY=
X-Google-Smtp-Source: APXvYqwZ7ilKGbnzqvupRrpSVk/TVCJvcB5zeWMxUN58U85D/ZG6FRfEy8iRDvsTXrQkY3B+fgigHw==
X-Received: by 2002:a05:6830:194:: with SMTP id q20mr5932196ota.92.1578516890207;
        Wed, 08 Jan 2020 12:54:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q13sm1516646otc.5.2020.01.08.12.54.48
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:54:48 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:54:47 -0600
Date:   Wed, 8 Jan 2020 14:54:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linus.walleij@linaro.org, Khouloud Touil <ktouil@baylibre.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: at25: add reference for the wp-gpios
 property
Message-ID: <20200108205447.GA16981@bogus>
References: <20200107092922.18408-1-ktouil@baylibre.com>
 <20200107092922.18408-5-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107092922.18408-5-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue,  7 Jan 2020 10:29:21 +0100, Khouloud Touil wrote:
> As the at25 uses the NVMEM subsystem, and the property is now being
> handled, adding reference for it in the device tree binding document,
> which allows to specify the GPIO line to which the write-protect pin
> is connected.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at25.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
