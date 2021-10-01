Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E36A41EE5C
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Oct 2021 15:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhJANTY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Oct 2021 09:19:24 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:41581 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbhJANSr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Oct 2021 09:18:47 -0400
Received: by mail-ot1-f45.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso11420513ota.8;
        Fri, 01 Oct 2021 06:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=JmNm4fwvOprJyv3kxO/2sZUF4SyR5k28U6t0hU5FgjQ=;
        b=gOqXPhp0bX1UmCzKYyZIPlS2vBZ8zogGLTdUQEz/A7yQj0W0S0MUOljylVZWCPvhqw
         ymAYX7TKRG3RHAbTuYWmUa/zoR7bxpe4HmM9PsUmPLnG/pnBhQizHwAg7sVH+bjhaazz
         h6x0YxRsdmOK8D1UjoPkwYQF4DE+sRVBmDHUUUXHm3I8iyosjWMjJc4/Zy8qrfAbNzsV
         htfLx7BnXxDYr349MjcuFJ00oAb92jEpQcOQALUhcHFaNewagN3AELTEeIFj7q3rFEdo
         zYgURFm/uH3qeDi0L4Lnw0N5oVztjP6HLn68TIV2XFgKEfE8HkxuHJeadQzUsMVCJgJD
         tv7A==
X-Gm-Message-State: AOAM531Fy0gleSN/d/tZpLXYMuKSy1c8jny1ZzKTe5XQGXgXy8cBrYYp
        PDPNISFLyQCYKhyVtjGkAu8yfoLeQg==
X-Google-Smtp-Source: ABdhPJxxq3oW0g94TnmTeT15Po6GQnjHvadMyLD7HUcKeLZdpO/hq3UAbkMJjbq+EeONotgH/xEmGA==
X-Received: by 2002:a9d:8cc:: with SMTP id 70mr7650397otf.328.1633094222591;
        Fri, 01 Oct 2021 06:17:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t17sm1200813otl.56.2021.10.01.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 06:17:02 -0700 (PDT)
Received: (nullmailer pid 3666448 invoked by uid 1000);
        Fri, 01 Oct 2021 13:16:57 -0000
From:   Rob Herring <robh@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <1633075894-10214-10-git-send-email-abel.vesa@nxp.com>
References: <1633075894-10214-1-git-send-email-abel.vesa@nxp.com> <1633075894-10214-10-git-send-email-abel.vesa@nxp.com>
Subject: Re: [RESEND v2 09/10] dt-bindings: i2c: imx-lpi2c: Add i.MX8DXL compatible match
Date:   Fri, 01 Oct 2021 08:16:57 -0500
Message-Id: <1633094217.918569.3666447.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 01 Oct 2021 11:11:34 +0300, Abel Vesa wrote:
> Add i.MX8DXL lpi2c compatible to the bindings documentation.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1535241


i2c@5a800000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml

i2c@5a810000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml

i2c@5a820000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml

i2c@5a830000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/freescale/imx8qm-mek.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml
	arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml

