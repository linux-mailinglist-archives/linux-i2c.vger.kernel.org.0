Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A5E449D57
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 21:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236871AbhKHVBg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 16:01:36 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:45652 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbhKHVBf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 16:01:35 -0500
Received: by mail-oi1-f178.google.com with SMTP id u2so29672755oiu.12;
        Mon, 08 Nov 2021 12:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YHUlQJEbpQR7/Et+g9CB2ZvQCivHYZl6NXqndHZfd8s=;
        b=6+bDnxsHxzhYGDq8Vt8aZfa9UZhhKej9bJo9+6akYxpwGIdARWwS7b4anQooVfZot6
         OG37r3a7VK1mepdHTSnRIv+GS4QhZiQ+0CbOEQyHQtSmr8EArN4lVfjmhbxFrjlgL5QC
         vqeu48gZAHAYalGpZVKavPF8/bq5u1h9FiNZY3Ot2yW6ajoH/WX8cCDIL47WbBIUyKQT
         enS5IHn7NEzQJorn8QpSHkMB7mJQOwD3qX6fiEpIQpJnZ5byfplvd+yMaIeD8J9Ov9IT
         xDzCMHsMKrL9tEe6XQnPd5SU447zLIQsAuhRb+2vm7WbCFBRhOGX0uGsUU2j4K/Aq3J6
         1hsw==
X-Gm-Message-State: AOAM532s55zjJAdByi53YsESol5BNvjFt/vRICmi55dwdOUGYdjyuQRl
        qEqXItS3fA/E2Eg4YWqNkg==
X-Google-Smtp-Source: ABdhPJzpVbSN7N8yQUVIe8sDz6+F3EA1l3t2ISD19ruRthAjwYLgenwLYRBJ40ulfAACC7UOlVLxfg==
X-Received: by 2002:aca:1815:: with SMTP id h21mr1072267oih.35.1636405130617;
        Mon, 08 Nov 2021 12:58:50 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r184sm6237873oia.38.2021.11.08.12.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 12:58:49 -0800 (PST)
Received: (nullmailer pid 7576 invoked by uid 1000);
        Mon, 08 Nov 2021 20:58:48 -0000
Date:   Mon, 8 Nov 2021 14:58:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Anson Huang <Anson.Huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>, ~okias/devicetree@lists.sr.ht
Subject: Re: [PATCH] dt-bindings: i2c: imx: hardware do not restrict
 clock-frequency to only 100 and 400 kHz
Message-ID: <YYmPiHXXqi1Nj8HY@robh.at.kernel.org>
References: <20211029141134.66170-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029141134.66170-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 29 Oct 2021 16:11:33 +0200, David Heidelberg wrote:
> clock-frequency is only restricted by the upper limit of 400 kHz.
> 
> Found with:
> $ DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-imx.yaml make dtbs_check
> ...
> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dt.yaml: i2c@30a20000: clock-frequency:0:0: 387000 is not one of [100000, 400000]
> 	From schema: linux/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
> ...
> 
> Fixes: 4bdc44347299 ("dt-bindings: i2c: Convert imx i2c to json-schema")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Applied, thanks!
