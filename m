Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447B7388E70
	for <lists+linux-i2c@lfdr.de>; Wed, 19 May 2021 14:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346567AbhESM7F (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 08:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbhESM7E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 08:59:04 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F22C06175F;
        Wed, 19 May 2021 05:57:45 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id 124so243083qkh.10;
        Wed, 19 May 2021 05:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aipg9oIDAuCQSbPEUtZjOrYb0WaeP7Y8nbKSRmG50Bc=;
        b=Pa4ogUhOF7OBZJ6ZHNl0MgR59SkKIlnoGrDNn/lcOBGbuPpPz34+2AOEpjE6KcRep0
         3rhPml2WgX1tHOgnE1NyFZrFzIlt51EJmUSsfjrkf10trdA60D+Zcz73YlqdI0rdL3D0
         KrGwfkNaKB0U/YzFPmg3WUmOjWMfEjOBenyI3ohJ8Lx3B0u5X/nxD0NtpdaB9371Y0md
         dCOkLqkLT/f7QItk5bUjTi6/SI7VFvvOngKItIaipenTMH6IuuHpoeOaIaVv7YRKCb5q
         /YNW293ujFUdLxhJ07r8jesWtFVEBcPP9Nu7eWr+ikxPxIpnIJhQQ8mwpXU3mKa6ib6s
         AOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=aipg9oIDAuCQSbPEUtZjOrYb0WaeP7Y8nbKSRmG50Bc=;
        b=aitEj7gaMK7SlQFHyL4ZJqICAwNKQ8/sAH8Lajw2UpHAEgDNDm2hvNEGfuZgUfSXZL
         HF1NM1kZiMEB/drVjZMKQPhtzjqojO97eKKQIPJunGa7Q5rAQa4T26kAxV9j+ihMuYnu
         rtmhDLYJzbjg9FbQms9XTW/oJgVmNFGucR7LFXvV72Kvsn8/N3RzDKMbQCdlBYRiP1XI
         zz5W5anZx81TjtZfM3JIZ0EE1bwd7IyAxauDTCiAQc1wiKtuWBbS6kwFcz8H7b3BneO1
         ZW9XJP8HMu5joxpXGamBK0jbnAXRl7kmLU4lfgt2RVhWmNx23M8p2LuenJ+vMyxUM9X2
         eGrw==
X-Gm-Message-State: AOAM531KaiNXRANXgkNXuWTshkUt3O6hLowmUpJIOR2SnLM1OUcBhIzh
        Uq/3tjjYpriObzEYbYfcPDI=
X-Google-Smtp-Source: ABdhPJzaymXiwmNRUJ76y5xNhS+pauWT0YHJrip4/vT9Q++zTymq3niN2b7yOKjYqwJx982fyC8aoA==
X-Received: by 2002:ae9:c016:: with SMTP id u22mr11911036qkk.114.1621429063845;
        Wed, 19 May 2021 05:57:43 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d11sm15252598qke.61.2021.05.19.05.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 05:57:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 19 May 2021 05:57:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     cl@rock-chips.com
Cc:     heiko@sntech.de, robh+dt@kernel.org, jagan@amarulasolutions.com,
        wens@csie.org, uwe@kleine-koenig.org, mail@david-bauer.net,
        jbx6244@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        wim@linux-watchdog.org, jamie@jamieiles.com,
        linux-watchdog@vger.kernel.org, maz@kernel.org
Subject: Re: [PATCH v4 04/10] dt-bindings: watchdog: dw-wdt: add description
 for rk3568
Message-ID: <20210519125741.GA2241939@roeck-us.net>
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210429081151.17558-5-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429081151.17558-5-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Apr 29, 2021 at 04:11:45PM +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> add "rockchip,rk3568-wdt", "snps,dw-wdt" for watchdog nodes on
> a rk3568 platform to snps,dw-wdt.yaml.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index b58596b1831d..6461eb4f4a27 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -27,6 +27,7 @@ properties:
>                - rockchip,rk3328-wdt
>                - rockchip,rk3368-wdt
>                - rockchip,rk3399-wdt
> +              - rockchip,rk3568-wdt
>                - rockchip,rv1108-wdt
>            - const: snps,dw-wdt
>  
