Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA1D1E8799
	for <lists+linux-i2c@lfdr.de>; Fri, 29 May 2020 21:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgE2TSb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 May 2020 15:18:31 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:41870 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgE2TSa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 May 2020 15:18:30 -0400
Received: by mail-il1-f195.google.com with SMTP id d1so3562958ila.8;
        Fri, 29 May 2020 12:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m/Z4OI9dLCb3KAwh60U7fELRYiT6lEiNOqbsOqlIwBI=;
        b=qNDr7zrBtV2fUj02xAfQFgXu41s8eSz1s6JOz0vnelzIcKmO+UzDfrAi7efeXK/Lqb
         jRBi3aecGT6XcXAdDpH4F6/9dfLI1OPBQnQb7gl2UMt9rOBSikQC8hWBlsbN1NRRvZr9
         H/v885Y0em6Tf9nHmoSbiGFFEDOrSSkmnHOyvuUjiaDXBByWprkEBiYkNv2cg3LPV9+i
         f74NAJayHEZxvX3BI3X7/FUwYIJq02pIX6CJMaIz09V3wA55b0SOtEvIAAngORlQPxtz
         MENm9b1nU20/YpEs62LZOTSU04yzVsgAsRTTHI52t4O24N5663IFtnoCY5LCgGOklLyL
         DEAA==
X-Gm-Message-State: AOAM532HisFHmWIwi2V4hASOmU9/SPP39+R1vPgjNApJg4TRHag1KtUj
        lmIoWbKjEW1OKlw1QJ1Erw==
X-Google-Smtp-Source: ABdhPJzKk3/Vh+gDQnqnHaCv1ti5kC4l//4mgj7L1KZZv077UM+eAYTtuf8pSvTkky0he5Vzemoj4g==
X-Received: by 2002:a92:ba05:: with SMTP id o5mr9236887ili.263.1590779907940;
        Fri, 29 May 2020 12:18:27 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r10sm3330798ile.36.2020.05.29.12.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:18:27 -0700 (PDT)
Received: (nullmailer pid 2785521 invoked by uid 1000);
        Fri, 29 May 2020 19:18:26 -0000
Date:   Fri, 29 May 2020 13:18:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v6 03/11] dt-bindings: i2c: dw: Add Baikal-T1 SoC I2C
 controller
Message-ID: <20200529191826.GA2785443@bogus>
References: <20200528093322.23553-1-Sergey.Semin@baikalelectronics.ru>
 <20200528093322.23553-4-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528093322.23553-4-Sergey.Semin@baikalelectronics.ru>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 28 May 2020 12:33:13 +0300, Serge Semin wrote:
> Add the "baikal,bt1-sys-i2c" compatible string to the DW I2C binding. Even
> though the corresponding node is supposed to be a child of the Baikal-T1
> System Controller, its reg property is left required for compatibility.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Changelog v2:
> - Make the reg property being optional if it's Baikal-T1 System I2C DT
>   node.
> 
> Changelog v3:
> - Get back the reg property being mandatory even if it's Baikal-T1 System
>   I2C DT node. Rob says it has to be in the DT node if there is a
>   dedicated registers range in the System Controller registers space.
> ---
>  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
