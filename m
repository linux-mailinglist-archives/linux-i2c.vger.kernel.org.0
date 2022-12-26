Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23A2A656575
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Dec 2022 23:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbiLZWhZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Dec 2022 17:37:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbiLZWgV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Dec 2022 17:36:21 -0500
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8985F54;
        Mon, 26 Dec 2022 14:36:14 -0800 (PST)
Received: by mail-oi1-f180.google.com with SMTP id o66so11150390oia.6;
        Mon, 26 Dec 2022 14:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGjdttmcgkKOVEh+yLpPFWCyfTxrmdMALVwDhA4tbxk=;
        b=q5YWFPJBfhAQiVNLSyXpu/t+RYP99z/WDuUvLrW0ONbEnFyQ4oxYONr6fXQsxonr35
         ZlR9om3xxCVYQuDLTeqeWUNADtfLXsYabe6yg+0vMfc6GxGqRoxgP6qR3Ohl5wbP6yp0
         EpjEIZrbKFL0xQitX4OM8ayOV/ClWDSy0V6tvANslNfEUgiN7uI0p6xGyu700z+QN4iR
         8Fi1tWZ/O5PvImDXeZykJja2bnXwFLp5gnMirOZY5V1UVd3si59k0IWQAP5dhQn9jhUL
         3KrM8/NBNxQDDxxwiVnyHSaaEk5k6nPj7xF+9ejW5kwSKvIB0eCkmH4m/YSZqCRPN6nl
         FY6w==
X-Gm-Message-State: AFqh2koGYfyJZP1YO4PX+peAJSI1T4Cs5P2yZNQcR6Ygd5X8F7Vks9Jo
        SY8rGd0V35Zb2GJ6sEC5eQ==
X-Google-Smtp-Source: AMrXdXsMw29uTavPyGsPxjWjy3/8ibqE9mMs5+r+xOX45/xNrSglsye61N2mME7UKlhGFVpLdDQUfA==
X-Received: by 2002:aca:1b0a:0:b0:35e:6f1d:eda9 with SMTP id b10-20020aca1b0a000000b0035e6f1deda9mr13253583oib.53.1672094174044;
        Mon, 26 Dec 2022 14:36:14 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80e8:2792:eb0e:539f:f657:547b])
        by smtp.gmail.com with ESMTPSA id bk10-20020a0568081a0a00b0035c422bb303sm5264522oib.19.2022.12.26.14.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 14:36:13 -0800 (PST)
Received: (nullmailer pid 42527 invoked by uid 1000);
        Mon, 26 Dec 2022 18:53:03 -0000
Date:   Mon, 26 Dec 2022 12:53:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     aisheng.dong@nxp.com, ping.bai@nxp.com, linus.walleij@linaro.org,
        linux-imx@nxp.com, s.hauer@pengutronix.de,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        shawnguo@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-i2c@vger.kernel.org, festevam@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: imx8m: Integrate duplicated i.MX
 8M schemas
Message-ID: <167208078314.42480.9171070887547759021.robh@kernel.org>
References: <20221223030708.91459-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223030708.91459-1-peng.fan@oss.nxp.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri, 23 Dec 2022 11:07:08 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The i.MX8MM/N/P/Q IOMUXC schemas are basically the same, it does not to
> have four schemas for almost the same binding.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  ...mm-pinctrl.yaml => fsl,imx8m-pinctrl.yaml} | 16 ++--
>  .../bindings/pinctrl/fsl,imx8mn-pinctrl.yaml  | 84 -------------------
>  .../bindings/pinctrl/fsl,imx8mp-pinctrl.yaml  | 84 -------------------
>  .../bindings/pinctrl/fsl,imx8mq-pinctrl.yaml  | 84 -------------------
>  4 files changed, 10 insertions(+), 258 deletions(-)
>  rename Documentation/devicetree/bindings/pinctrl/{fsl,imx8mm-pinctrl.yaml => fsl,imx8m-pinctrl.yaml} (82%)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mn-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mp-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx8mq-pinctrl.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>
