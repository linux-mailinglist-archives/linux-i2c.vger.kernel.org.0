Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A09FE3D1C44
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 05:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhGVC3q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jul 2021 22:29:46 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:35737 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbhGVC3p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jul 2021 22:29:45 -0400
Received: by mail-io1-f50.google.com with SMTP id d9so4742498ioo.2;
        Wed, 21 Jul 2021 20:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/Bv4rf7YQ1serjiyqS/1FiWsb2l7aSamYEyxdIo2VN0=;
        b=XNTEE9rwV3iNjXsEtWmgqVtLaz5JxCOrpHFIFrXlzvRSlc1zovq3BR0TTsZLKi4q4t
         eT6ZIEWQMQ2VWE4ga8Mqg69VsDFcfR/72La1RWr+0fR+R2UgvWoIoPkyA5kEya8GWqte
         ujTrWYv3ogsUXZsUlDs/DS35TODB3+sPzRdQzxSnTpTXoNqjOUM69wqjmyvN7ArEcJBA
         +fh54Cz+ufoFZYfBAbEHJWoV9QkuRTV3IWFxs6rkMT32AoZk0h0kT2VEEYVK6bwROjeF
         mZzWuZWAHyB/ooC+GQoCf5A7Za10nC9WCWlfnIe+wBXWMb1DalngiuTYxnyJQHOxU3C2
         bSoQ==
X-Gm-Message-State: AOAM533RFTHhBMxg7WBTGUWfwF0p85S4ty9GlJVqq2hZ83t0GYhzj4cS
        v6dPoq5tX+deu65bxLj7Xw==
X-Google-Smtp-Source: ABdhPJzS0tj6zwZdfwCKsNKfxecVmPvK7aFqbnUATzc8tgJajkisHIneWNe1jj3UawV14SFSjg6GHA==
X-Received: by 2002:a5d:8747:: with SMTP id k7mr29857539iol.83.1626923420369;
        Wed, 21 Jul 2021 20:10:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k19sm14259960ilh.60.2021.07.21.20.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 20:10:19 -0700 (PDT)
Received: (nullmailer pid 3229546 invoked by uid 1000);
        Thu, 22 Jul 2021 03:10:16 -0000
Date:   Wed, 21 Jul 2021 21:10:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     wsa@the-dreams.de, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com, qii.wang@mediatek.com,
        yuhan.wei@mediatek.com, ot_daolong.zhu@mediatek.com,
        liguo.zhang@mediatek.com
Subject: Re: [PATCH v4 5/8] dt-bindings: i2c: add attribute
 default-timing-adjust
Message-ID: <20210722031016.GA3228241@robh.at.kernel.org>
References: <1626517079-9057-1-git-send-email-kewei.xu@mediatek.com>
 <1626517079-9057-6-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626517079-9057-6-git-send-email-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Jul 17, 2021 at 06:17:56PM +0800, Kewei Xu wrote:
> Add attribute default-timing-adjust for DT-binding document.
> 
> Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 7c4915bc4439..7b80a11d4d4c 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -33,6 +33,8 @@ Optional properties:
>    - mediatek,have-pmic: platform can control i2c form special pmic side.
>      Only mt6589 and mt8135 support this feature.
>    - mediatek,use-push-pull: IO config use push-pull mode.
> +  - mediatek,default-timing-adjust: use default timing calculation, no timing
> +    adjustment.

'mediatek,use-default-timing' perhaps as it means don't adjust anything.

>  
>  Example:
>  
> -- 
> 2.18.0
> 
> 
