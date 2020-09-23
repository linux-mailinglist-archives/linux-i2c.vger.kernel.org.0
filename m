Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9783A276202
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 22:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgIWUZX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 16:25:23 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:36720 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbgIWUZS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 16:25:18 -0400
Received: by mail-il1-f193.google.com with SMTP id t12so914492ilh.3;
        Wed, 23 Sep 2020 13:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8OMF+fpIQ46J6UORWbz0WXo5qnSGYY8Cg9Val+BF7gA=;
        b=WXdT3Y3/i9+p4+gnwqd2cmlGBTBk/DHrgLTxD/nYY+MPhqCXge73Pzu35uPdoSznFb
         iH0SdyQRvplj/rdWgJGxaNY5jlJpflZZiMh2/lhRNdTRwxdMnNj1oZpFKQTIMARYjRrZ
         n5xZZpG++qmXJq/+fM/jpP4VlE+eA6HbRTOEjct0Io3KvULSO+z7oGTzW7tKrBlNsUKf
         imNpsJmOJNQ6XM40Hnz4taleiXP/dAI0257TBzCCMYbD60mGMawrro7Lej5EA2BwgP1A
         riiLSMLSMCgLjfasf7EQZaDnotWQS6R2sOawKg/sC0Vy7fngegMVGN/zgTkIaza7HoGi
         jUqg==
X-Gm-Message-State: AOAM533xTyFQvdnXirJh18ia01I/ndb30DvtQcE2zfH+Dcx+PPQ96/TA
        phYZiLSUu8tYdRpUA5E7Xw==
X-Google-Smtp-Source: ABdhPJyyvJA0G4cMNgBLTqY9koZBNN4gNzaGAIQOBaihKkejUY6NQFap64a6zyWIu/7rRs1DaL977w==
X-Received: by 2002:a92:8955:: with SMTP id n82mr1388184ild.25.1600892717171;
        Wed, 23 Sep 2020 13:25:17 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c5sm403246ill.1.2020.09.23.13.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 13:25:16 -0700 (PDT)
Received: (nullmailer pid 1243107 invoked by uid 1000);
        Wed, 23 Sep 2020 20:25:15 -0000
Date:   Wed, 23 Sep 2020 14:25:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wolfram@the-dreams.de>,
        linux-arm-kernel@lists.infradead.org,
        Shawn Guo <shawnguo@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: i2c: imx-lpi2c: Fix i.MX 8QXP
 compatible matching
Message-ID: <20200923202515.GA1243022@bogus>
References: <20200917191321.28741-1-krzk@kernel.org>
 <20200917191321.28741-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917191321.28741-2-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 17 Sep 2020 21:13:19 +0200, Krzysztof Kozlowski wrote:
> The i.MX 8QXP DTSes use two compatibles so update the binding to fix
> dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: i2c@5a820000:
>     compatible: ['fsl,imx8qxp-lpi2c', 'fsl,imx7ulp-lpi2c'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml        | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
