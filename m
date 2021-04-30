Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123303702CA
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 23:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236200AbhD3VOz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Apr 2021 17:14:55 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:38521 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbhD3VOy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Apr 2021 17:14:54 -0400
Received: by mail-ot1-f47.google.com with SMTP id v23-20020a9d60570000b02902a53bac99a3so10861671otj.5;
        Fri, 30 Apr 2021 14:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CDPt1lBiiOE0WKtOJruhoq1YuZ11A6rZPPUGDESLxDI=;
        b=PXAbhlNOaokW4mfdte/ZBKvvtLspLQiJ8YgEd59uNloClpOYsaH/c8NQSugh67i3S8
         ji4HRLHsnGIAspW5TpWtJd6Kry7ExONOscdfPpK/TDXdouztkdDKot5ZQnLcD4foqgeb
         gdPCNehYuAINDohayxbwUjIjURxeBTRsSixxVR1+q42BT19RBT43XOycXmgHFBN4191o
         IxyVymsCD6v1kQVa0UnOP6dICZo4BAzN3EpvQxy+8Wzhv1fo/OBuaTmJYOVu1yRpIRww
         7gOjukPKDn1FWSCBMFgQIyM+ugGmiNScAzWGbUKEm+7NXFRkHG0Agcsq9X3O7HaIn3ph
         n6aw==
X-Gm-Message-State: AOAM530r1+Iuv0dJ/ZK/fI7M8NOFB5ZeUSwFbk2V7tEq2zWEwrFVEE4B
        tMaebO+oKg1JsrqiZjBQAw==
X-Google-Smtp-Source: ABdhPJzdx/BWVIpfWhocJCf2pf7MdV4rc7xin+Os1AFkpy5q8NGKxfcVyvjvR9lR+wKITGbETRB26A==
X-Received: by 2002:a9d:5e0a:: with SMTP id d10mr4944801oti.44.1619817245659;
        Fri, 30 Apr 2021 14:14:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e93sm943692otb.62.2021.04.30.14.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 14:14:05 -0700 (PDT)
Received: (nullmailer pid 3905201 invoked by uid 1000);
        Fri, 30 Apr 2021 21:14:03 -0000
Date:   Fri, 30 Apr 2021 16:14:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     cl@rock-chips.com
Cc:     devicetree@vger.kernel.org, wens@csie.org, maz@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux@roeck-us.net,
        ulf.hansson@linaro.org, linux-i2c@vger.kernel.org,
        jagan@amarulasolutions.com, jamie@jamieiles.com,
        shawn.lin@rock-chips.com, mail@david-bauer.net,
        uwe@kleine-koenig.org, linux-serial@vger.kernel.org,
        heiko@sntech.de, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, linux-mmc@vger.kernel.org,
        michael@amarulasolutions.com, jay.xu@rock-chips.com,
        cnsztl@gmail.com, wim@linux-watchdog.org, jbx6244@gmail.com,
        linux-rockchip@lists.infradead.org, zhangqing@rock-chips.com,
        huangtao@rock-chips.com, jensenhuang@friendlyarm.com,
        david.wu@rock-chips.com
Subject: Re: [PATCH v4 04/10] dt-bindings: watchdog: dw-wdt: add description
 for rk3568
Message-ID: <20210430211403.GA3905172@robh.at.kernel.org>
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210429081151.17558-5-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429081151.17558-5-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 29 Apr 2021 16:11:45 +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> add "rockchip,rk3568-wdt", "snps,dw-wdt" for watchdog nodes on
> a rk3568 platform to snps,dw-wdt.yaml.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
