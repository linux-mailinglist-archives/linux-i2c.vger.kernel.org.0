Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCB13702D0
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 23:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhD3VPP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Apr 2021 17:15:15 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:43617 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbhD3VPN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Apr 2021 17:15:13 -0400
Received: by mail-ot1-f51.google.com with SMTP id g7-20020a9d5f870000b02902a5831ad705so2437477oti.10;
        Fri, 30 Apr 2021 14:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EMqKtknFqehmn7rN033x+tvY3ntthgIPwO2iOKZYoag=;
        b=ZyVtit8uut08tDoHPTXEcArlFK7soLppMknLQB967OHk3zt899e46XYC17okjRyPPT
         5oGirbSfvptyhawntxWTpBEXICnoHIuqAYkExY35AYYEQL7Xlki/fK9r5TxeF1M2Rw2P
         fGo17Z8/fIeyINw29c4M2JRgpqlHDfN21nMvNc3ePq+HeZfEeSMm2bzAV3kY06crnwe3
         +uEtwVaXxzKxJZeeg2h9aiJhA0XXe7Deerb38Q4i4CnSlChyHE/eoS4Hdm0jtgcRhoCm
         LiSr41spU07Uu/hepnurLwNm42KDLkORVQIscMBxUUikFyLExHMQvDpebyvEHuaMVo9M
         36AA==
X-Gm-Message-State: AOAM531YdStuCT3MasIl4bnmLHYCppLvGb8bCU/gQKW4kZp0BCPx1Y14
        z0ZgyMLOddtVzQzm6Zr9jQ==
X-Google-Smtp-Source: ABdhPJyYa/c/d1x4QUaZh1rrRfInSBi7VljCcrNXjhzEZhKhhNGuLhnNgn0Ti2aCh0igIifuoLMBjA==
X-Received: by 2002:a05:6830:12c6:: with SMTP id a6mr4940474otq.239.1619817263859;
        Fri, 30 Apr 2021 14:14:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 88sm958638otx.2.2021.04.30.14.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 14:14:23 -0700 (PDT)
Received: (nullmailer pid 3905795 invoked by uid 1000);
        Fri, 30 Apr 2021 21:14:21 -0000
Date:   Fri, 30 Apr 2021 16:14:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     cl@rock-chips.com
Cc:     heiko@sntech.de, cnsztl@gmail.com, maz@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org, jbx6244@gmail.com,
        mail@david-bauer.net, jagan@amarulasolutions.com,
        zhangqing@rock-chips.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jay.xu@rock-chips.com,
        huangtao@rock-chips.com, linux@roeck-us.net, jamie@jamieiles.com,
        uwe@kleine-koenig.org, linux-serial@vger.kernel.org,
        jensenhuang@friendlyarm.com, linux-watchdog@vger.kernel.org,
        gregkh@linuxfoundation.org, shawn.lin@rock-chips.com,
        david.wu@rock-chips.com, linux-mmc@vger.kernel.org,
        wim@linux-watchdog.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, wens@csie.org,
        ulf.hansson@linaro.org, michael@amarulasolutions.com
Subject: Re: [PATCH v4 05/10] dt-bindings: pwm: rockchip: add description for
 rk3568
Message-ID: <20210430211421.GA3905741@robh.at.kernel.org>
References: <20210429081151.17558-1-cl@rock-chips.com>
 <20210429081252.17711-1-cl@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429081252.17711-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 29 Apr 2021 16:12:52 +0800, cl@rock-chips.com wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> add "rockchip,rk3568-pwm", "rockchip,rk3328-pwm" for pwm nodes on
> a rk3568 platform to pwm-rockchip.yaml.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
