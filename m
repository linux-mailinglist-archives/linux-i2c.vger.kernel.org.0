Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D6045672A
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 02:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbhKSBFF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 20:05:05 -0500
Received: from mail-oo1-f41.google.com ([209.85.161.41]:46857 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhKSBFF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 20:05:05 -0500
Received: by mail-oo1-f41.google.com with SMTP id p2-20020a4adfc2000000b002c2676904fdso3114632ood.13;
        Thu, 18 Nov 2021 17:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0Zdr5lOJ5EHxHxPTeyMvYuCFceKl7lquEILB5jWYRZk=;
        b=oKq6NUAo8kcFGoPL0OkVLZPauDEfzVacTSg6mrxYDs3qMmRfQm04cE7FuAGzpLiRAI
         mCaY4QpHT5kdPZXP/xGiXrx/uEsLcoAdEk/wmzn0mmGEV1g7n13rgwSbb8P2HQWL7Pu7
         cMoNTHEAeSpTrJouEmYgxgzEInU6b+YCz+gzErmznGC4hRVJvqImsBvgbLrzZgwz2Tjp
         o3dJ62BuR1ZPMscCfzeT4N6qVA/DQ0OKaKgxFl3JyKzpbXhhldt65H1MkJ/azLtwtu+v
         f1zmIdPfDTrTZ0yrRN7ZVgkociVxILkoPLXoSVDewRbcf1jMHOqlb8wl1G+p2oXIYlRe
         YQKQ==
X-Gm-Message-State: AOAM532SVFbaMedDN35d8WsvTDT2rUQeeEfhe6sf+lRlT6NzC7a+y6wR
        zKciHZIiXjyEG6RRUuxOZ6uz5N0uTg==
X-Google-Smtp-Source: ABdhPJxuNSzxlG7dPqghcwrRMi7L77DKTS4k8gHcaYKKacZmQE+sHGvxmC6IFZeb8warOFOjdISmqQ==
X-Received: by 2002:a4a:d184:: with SMTP id j4mr7258845oor.72.1637283723893;
        Thu, 18 Nov 2021 17:02:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z14sm265864otk.36.2021.11.18.17.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 17:02:02 -0800 (PST)
Received: (nullmailer pid 2139557 invoked by uid 1000);
        Fri, 19 Nov 2021 01:02:01 -0000
Date:   Thu, 18 Nov 2021 19:02:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH v4 02/12] dt-bindings: serial: fsl-lpuart: Fix i.MX 8QM
 compatible matching
Message-ID: <YZb3iav2icIUA4rv@robh.at.kernel.org>
References: <1636566415-22750-1-git-send-email-abel.vesa@nxp.com>
 <1636566415-22750-3-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636566415-22750-3-git-send-email-abel.vesa@nxp.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 10 Nov 2021 19:46:45 +0200, Abel Vesa wrote:
> The i.MX 8QM DTS files use two compatibles, so update the binding to fix
> dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml: serial@5a060000:
>     compatible: ['fsl,imx8qm-lpuart', 'fsl,imx8qxp-lpuart'] is too long
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
