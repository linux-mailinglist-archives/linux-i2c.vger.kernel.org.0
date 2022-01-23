Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89524497279
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jan 2022 16:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiAWP2d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Jan 2022 10:28:33 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:36648 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237544AbiAWP2d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 23 Jan 2022 10:28:33 -0500
Received: by mail-ot1-f51.google.com with SMTP id l64-20020a9d1b46000000b005983a0a8aaaso18810002otl.3;
        Sun, 23 Jan 2022 07:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PiZdet6zIIqTH+59tTEclgspidVLpS3d/nyjEKsa+24=;
        b=qFt3gtl2OWz8lGcMyvC58DHL0/3eYG2vUJTLuoMp7SoK4A36Bo427ER1FoxzAOvYoT
         khJOqrtqmzs2kpqvzW5YhVqE/02VTu8PjMpV0A89ZGrduhFCj5VX/1TbUOrJNFuxrc4B
         HcrabqG1C3YiieMAemhFiE2sQMIC7fdl4tw1Wlr33/ggPB99NdsQXchqcCNWdLChnZAn
         lOvdWmQNjaGarOLy+21+cilrtSNQQKg7tSTw2A+1pwaDTGsUTWbJZc9+jBH5uoaHxFg3
         wgaMUMEug3f/heK+qZ8f3CUk48BA8CwV2jXrmp6Hetcltod/061++BlQaJM9+hjyeqb+
         FNEA==
X-Gm-Message-State: AOAM532f89i4XskCkiDHLhlC3kO3ZFdLI2GAIIL3fWWm1A9KphkjUvum
        aWQoL1U1voUQ/cjGdGDDdw==
X-Google-Smtp-Source: ABdhPJzqKdKAzqpoCUenK65sKHbDT/W+x/nyu4mybdf9k6yk1cKXUIZGcYh5Ohk7Ar2G6iTPy5Ge/Q==
X-Received: by 2002:a05:6830:1f2e:: with SMTP id e14mr8170838oth.369.1642951712634;
        Sun, 23 Jan 2022 07:28:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 44sm3874713otl.15.2022.01.23.07.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 07:28:32 -0800 (PST)
Received: (nullmailer pid 1427418 invoked by uid 1000);
        Sun, 23 Jan 2022 15:28:31 -0000
Date:   Sun, 23 Jan 2022 09:28:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: i2c: imx: Make each example a separate entry
Message-ID: <Ye10H8MmF4dobZ0d@robh.at.kernel.org>
References: <20220119015253.2437352-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119015253.2437352-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 18 Jan 2022 19:52:53 -0600, Rob Herring wrote:
> Each independent example should be a separate entry. This allows for
> 'interrupts' to have different cell sizes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Applied, thanks!
