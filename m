Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163B831D647
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Feb 2021 09:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhBQIIe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Feb 2021 03:08:34 -0500
Received: from mail-wr1-f49.google.com ([209.85.221.49]:36860 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbhBQIIc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Feb 2021 03:08:32 -0500
Received: by mail-wr1-f49.google.com with SMTP id u14so16361850wri.3;
        Wed, 17 Feb 2021 00:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U+fDZ975xL8Hj6o7r3HYdRzIxYB9Qn2UcitDVPde2lk=;
        b=b0XHsg4Sy7LuD0AEwuE5fcZsGgAhoklAKupmZTb/VXaWVzo4sHc82WDqY6OphSc7TX
         r598VzNsoErV0oS97fe6ZpTe6HmXH9V1bUwS5pyif7+YDA4t07QuMOR0r2cLluotFudO
         vSATl3gjq8cFlsVwYKgptaPXk36RsYIqcxYu2DPSbd6wLCBterwLEbCfROc03+wWwFp3
         IZ7027HYrXkSlRK08L46i+/FVx2fnJLc/nmM8eBhW6uFz7U+cam2tug4RzezV0bhWfXZ
         Zw0ideHQw292l58bGW992U4WlMsh9qZPmOBdaNF1lCWn75jMN7MHSed6xqaxkda4fA5+
         1LVg==
X-Gm-Message-State: AOAM531jjXHnaxKI0z7tnmL0nuTL0rELY3BVNQbQMhGksEqk/WG/MXbJ
        pTm42VFLorywXzCuCmgTrgk=
X-Google-Smtp-Source: ABdhPJwNT+lcJ8Ykcqd/E88u6ALDtw/JWkUv3IEXbdQLstE1LEVNDwPI3r2r7w5nhQbEelsQ5+QVYw==
X-Received: by 2002:adf:cf06:: with SMTP id o6mr27655581wrj.169.1613549269872;
        Wed, 17 Feb 2021 00:07:49 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id y6sm1847778wma.10.2021.02.17.00.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 00:07:48 -0800 (PST)
Date:   Wed, 17 Feb 2021 09:07:47 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marten Lindahl <martenli@axis.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH] i2c: exynos5: Preserve high speed master code
Message-ID: <20210217080747.a7nqzbotszwlb3dd@kozik-lap>
References: <20210215190322.22094-1-marten.lindahl@axis.com>
 <20210216075141.o4wjnwmmjze2p3cn@kozik-lap>
 <20210216220933.2wzmft72bhjptzl3@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216220933.2wzmft72bhjptzl3@axis.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 16, 2021 at 11:09:33PM +0100, Marten Lindahl wrote:
> > Any reason why not "|= MASTER_ID(i2c->adap.nr)" here instead of more
> > expensive IO read? It's quite important because your current code will
> > bitwise-or old I2C slave address with a new one... This should break
> > during tests with multiple I2C slave devices, shouldn't it?
> > 
> 
> You are correct. It is better to use the macro instead, and yes,
> safer too. I only have one device that supports high speed i2c, but
> I get your point. It could potentially break.
> 
> > On which HW did you test it?
> 
> I used an Artpec development board as master and INA230EVM board
> as slave.

Artpec development board with? What SoC?

Best regards,
Krzysztof

