Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21AE64D5551
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 00:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344697AbiCJX1m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Mar 2022 18:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344696AbiCJX1m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Mar 2022 18:27:42 -0500
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024F019BE48;
        Thu, 10 Mar 2022 15:26:41 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id b188so7569564oia.13;
        Thu, 10 Mar 2022 15:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=56YATS+ZoKDmjv4EeV78/ikNfS2OX1DbVq8A91TJRGA=;
        b=3xX5EM0QT+qtQSZQzG5JP4SPZazgQkzKpB2hNGOciM8a71o1tleIu03codQAeGO/2w
         vavoypjePyX9O7DLVjmU5/mITVl1Dh7gCNrAi9G99qdwnpWbznH+RqrDyT1+SBKk3uc8
         iOpEgzy1RwXPLLwMo8sK+oofA3x9Ym6Z80L5O3oy7ZLmxjSHnFMXOywGbnyfWFu+EWsG
         uMEhaWiGOgFIcKnm3irf4qh3wIydslCuhA3E7MvLt8ztnsm7MRdQYHVifjs2quBw57Qr
         sdkQFxaGL4vDgp6NJDOjqQyRrFqdCzNcsB/hiEDhM0MCOtkaEqk01rre68nLJmCtr/sv
         yhFw==
X-Gm-Message-State: AOAM530yoFGiONLv/myT1UFV51E4ciaHC++CTvpc2vKW6QJ+p8JUhFR9
        qltolXicci61ZLuPwDNispQrsbJzuw==
X-Google-Smtp-Source: ABdhPJy+aNNNtskpMbM3mrbmH+0QGoBIJ3yhGGkdeKLdCClVIF0peUQqqNkXNwF6dM7cN54j1edtFg==
X-Received: by 2002:a05:6808:d49:b0:2d7:2725:90f with SMTP id w9-20020a0568080d4900b002d72725090fmr4882339oik.162.1646954800060;
        Thu, 10 Mar 2022 15:26:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 67-20020aca0546000000b002d46e151b9bsm3011912oif.18.2022.03.10.15.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 15:26:39 -0800 (PST)
Received: (nullmailer pid 2294588 invoked by uid 1000);
        Thu, 10 Mar 2022 23:26:38 -0000
Date:   Thu, 10 Mar 2022 17:26:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergiu Moga <sergiu.moga@microchip.com>
Cc:     linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, claudiu.beznea@microchip.com,
        alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com,
        krzysztof.kozlowski@canonical.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] dt-bindings: i2c: at91: Add SAMA7G5 compatible
 strings list
Message-ID: <YiqJLqHGj0Sgen3G@robh.at.kernel.org>
References: <20220310114553.184763-1-sergiu.moga@microchip.com>
 <20220310114553.184763-4-sergiu.moga@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310114553.184763-4-sergiu.moga@microchip.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 10 Mar 2022 13:45:53 +0200, Sergiu Moga wrote:
> Add compatible strings list for SAMA7G5.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> ---
>  .../bindings/i2c/atmel,at91sam-i2c.yaml       | 26 ++++++++++++-------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 

Applied, thanks!
