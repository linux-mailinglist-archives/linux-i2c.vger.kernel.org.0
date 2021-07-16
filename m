Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A713CBC56
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jul 2021 21:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbhGPTWs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jul 2021 15:22:48 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:45632 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhGPTWr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jul 2021 15:22:47 -0400
Received: by mail-io1-f46.google.com with SMTP id z17so5238134iog.12;
        Fri, 16 Jul 2021 12:19:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HEmezqmwN/qYqRTBb5MCeuxbNNR+uw5b3+aSvniHA9U=;
        b=dxX/WmIYXFsAsHmNks8ZsQ8Yk6PHqIQYaBznFaaKIaB66/BmJNpAK0uojFYpfehcpT
         yQ1sjwRJdWyLNBvhYylxJC7ZGh5X1Gq8dhWZLRLETe3XhlSaJKpp3bI+xvZ+JX72da4F
         1Jf/6o3XL4VkgfLfSHrKD36NZhveFZDjNVHzoL9BfbGBTMeW/mrkSoHkU9OIeYTf1i11
         qQUwVmbN92l0vcqAJBaPKEPNHF4/IWFdyH3PW8BlUcMXlmlLskv8kT+toww8tgPk+wWj
         3EqU/C0Joq/XD609+cI3/XqPlcjtKtcPXR4Lc6dw06caPz4qm5xrBMze+6sARLnx391N
         7Fzg==
X-Gm-Message-State: AOAM533bGNJTf/Wp7RVy6SykCkcWzYUSiZ1tc0aoEuaCXv04pWcpCSqv
        3xWRCSSmcYKuegbu4qjuYQ==
X-Google-Smtp-Source: ABdhPJzWXzcBnNvTP1Yu8Nnu/JstoAOygCPEI4yskEPkKl+KJt62HyF+EL14jD9NefooUQOhc2wEFA==
X-Received: by 2002:a5d:88c6:: with SMTP id i6mr8734361iol.75.1626463191499;
        Fri, 16 Jul 2021 12:19:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h6sm5417244ilo.0.2021.07.16.12.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 12:19:50 -0700 (PDT)
Received: (nullmailer pid 3830675 invoked by uid 1000);
        Fri, 16 Jul 2021 19:19:48 -0000
Date:   Fri, 16 Jul 2021 13:19:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH/RFC 1/4] dt-bindings: i2c: renesas,riic: Add
 interrupt-names
Message-ID: <20210716191948.GA3830641@robh.at.kernel.org>
References: <cover.1626267422.git.geert+renesas@glider.be>
 <a81d0e14e395f297666e8c3a8ce3e292d2606a65.1626267422.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a81d0e14e395f297666e8c3a8ce3e292d2606a65.1626267422.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 14 Jul 2021 15:20:00 +0200, Geert Uytterhoeven wrote:
> The Renesas RZ/A and RZ/G2L I2C Bus Interface has no less than 8
> interrupts.  Hence document the "interrupt-names" property, to make it
> easier to review the interrupt mappings in DTS files.
> 
> Note that this property cannot be made required yet, as the RIIC nodes
> in all DTS files lack the property.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/i2c/renesas,riic.yaml | 29 ++++++++++++++-----
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
