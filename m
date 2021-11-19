Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AE245671A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 01:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbhKSA7l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 19:59:41 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:45731 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhKSA7k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 19:59:40 -0500
Received: by mail-oi1-f172.google.com with SMTP id 7so18235374oip.12;
        Thu, 18 Nov 2021 16:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FblWdZzTmtm3bIbXZfzQ6UnCfRPnd8fWW2DruBGboXE=;
        b=o5j1tqEAXyMGFj0IuLYzY7yazp8zEeamjrBhneH/xBQRZdQoWZB1YNtai69TpAgpFQ
         O36QoLNWt814tJPtM7rvcbDcc62XxzDXrnVo2bt8O2RpbMhJzBQBN+xuTlE8VK/njJTz
         kYdKzFS4tMEsfl7dCYBxVIN7DVvP/WS6ce3YC8uOc+K2llh2oQW/W0EqApm7JV/f47p7
         4fdCrIsVCFSXwhzTglgKQA+z1xKOoyRiZvOpxTYcLiUR8MY5ZvBj4dCl+JvehFqnoSpq
         lS6kSbWPjkoIrqkg+k5olmzxg+lR3VqnyP2ZgnaTVt65Z7g11/1Qkc2Eb+FxvZ0jUkGh
         UVVQ==
X-Gm-Message-State: AOAM531Vsm24847sWjcYFOP8FhwIqebbTvgqxwTnpghI5MXVSwAMOVIx
        aBXqu/9zy9KWvgm5MBtEwA==
X-Google-Smtp-Source: ABdhPJy2qMX6FHzZOE4p8oJzzDfxNPdO5Zi0i1YQmh8/YIlFVsIj1A27GQO4kTOohuJFQaktpRa6Kg==
X-Received: by 2002:a05:6808:1058:: with SMTP id c24mr1278442oih.58.1637283399487;
        Thu, 18 Nov 2021 16:56:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r22sm328480oij.36.2021.11.18.16.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 16:56:38 -0800 (PST)
Received: (nullmailer pid 2130222 invoked by uid 1000);
        Fri, 19 Nov 2021 00:56:38 -0000
Date:   Thu, 18 Nov 2021 18:56:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, linux-i2c@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v4 01/12] dt-bindings: i2c: imx-lpi2c: Fix i.MX 8QM
 compatible matching
Message-ID: <YZb2Rqx6OXTPNhgD@robh.at.kernel.org>
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
 <1636566415-22750-2-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636566415-22750-2-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 10 Nov 2021 19:46:44 +0200, Abel Vesa wrote:
> The i.MX 8QM DTS files use two compatibles, so update the binding to fix
> dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml: i2c@5a800000:
>     compatible: ['fsl,imx8qm-lpi2c', 'fsl,imx7ulp-lpi2c'] is too long
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
