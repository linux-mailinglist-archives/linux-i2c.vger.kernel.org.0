Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 587033F6366
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Aug 2021 18:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbhHXQw7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Aug 2021 12:52:59 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:40958 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbhHXQw4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Aug 2021 12:52:56 -0400
Received: by mail-ot1-f53.google.com with SMTP id x9-20020a056830278900b0051b8be1192fso27104706otu.7;
        Tue, 24 Aug 2021 09:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XjC4STvYn5W673hggvPcu+zT6dRzkoKFblKiVNLm9w0=;
        b=kn9J5cTXF6r1utyo+MBSYFnhhxcDf/xly7Y3Yzs6LwBi2/Ucj+BICIOvMl90Pvp32y
         qVG53MAV58Su9CrOPljxvfgDrNA/e9te66A2oi++C01tl/O4lqInvmhoSefmqQJDHJ91
         9G/z/MJs4vYRHjIXGzIQCcFFgqlpwY0zy9SNl2DSjrsQ8cV48W8IMWD9B6w2PFJKtCX6
         Im+iD3BBWGUZ/CDYq4yZRUFc5DtuRL1mlB/dyUaMM0fxl5W/QeBhV3+aHXw2gZ0PFqYd
         SgIjp3Q3OUfkMbisNPRQt2JiX7kgFi+pYsNDLrpndqmYADoxw99Bdu0lkvdtBDD+eeOT
         e7Xw==
X-Gm-Message-State: AOAM530OUhisy9NMZ7C08HjscLhkeQQZhYckzOk+ipbvl52v9fpiC4ED
        jsD8kE8zDO8vXQNCdKjqzQ==
X-Google-Smtp-Source: ABdhPJyfRa/4/UxZyZYdKKDtCptKTyJfMBe9SKVFGHC+BeiS3FEVP6mX3eUI16zgpdl2Uv7NcHU3Dw==
X-Received: by 2002:a9d:de1:: with SMTP id 88mr34277576ots.60.1629823931550;
        Tue, 24 Aug 2021 09:52:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 31sm4644150oti.63.2021.08.24.09.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 09:52:10 -0700 (PDT)
Received: (nullmailer pid 615362 invoked by uid 1000);
        Tue, 24 Aug 2021 16:52:09 -0000
Date:   Tue, 24 Aug 2021 11:52:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Kewei Xu <kewei.xu@mediatek.com>
Cc:     yuhan.wei@mediatek.com, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
        linux-arm-kernel@lists.infradead.org, wsa@the-dreams.de,
        liguo.zhang@mediatek.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, qii.wang@mediatek.com,
        linux-i2c@vger.kernel.org, caiyu.chen@mediatek.com,
        matthias.bgg@gmail.com, ot_daolong.zhu@mediatek.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v5 4/7] dt-bindings: i2c: add attribute
 use-default-timing
Message-ID: <YSUjuZIm4C2B0sDs@robh.at.kernel.org>
References: <1629775828-19993-1-git-send-email-kewei.xu@mediatek.com>
 <1629775828-19993-5-git-send-email-kewei.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629775828-19993-5-git-send-email-kewei.xu@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 24 Aug 2021 11:30:25 +0800, Kewei Xu wrote:
> Add attribute use-default-timing for DT-binding document.
> 
> Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
