Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5EBD25AEC4
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 17:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgIBPZr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 11:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728220AbgIBPZC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 11:25:02 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85431C061245;
        Wed,  2 Sep 2020 08:25:02 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id h12so2707574pgm.7;
        Wed, 02 Sep 2020 08:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=9egEgwHbell+Vp+FzaRF5HQxPX8jduHhbTufKmGyrCM=;
        b=mxVwxBdbeCaRpCy8dMALx19AWZCNbqDvFiqlOKHGsaWAFlLLVNCLuBJyoOt/Pq4a4B
         kPrBcUCY1S3D1P1/0v9mtR63ullGPIoZ7ui2JsClIAmwOpZXebJuwzoKld7esZVgwIHd
         Tz3vUTXvsoSQDGGXLj9VV1hm11tx7pCxRJn+c15Cm0gP4WaLBKJ7OjWyZPxejLY6ti2a
         qFwsx6f1R2QO0s7IYqexyjIbbxhUjjEoY71vM8HcLVxAF8/hgfW4bOut19EgDQKd54zf
         a/y++XOFDSFm037j4fqvFuNUP1yPvs7wPsuszb+JYI7vpqaxeTWrQSOMCxrM8eILYHno
         SWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9egEgwHbell+Vp+FzaRF5HQxPX8jduHhbTufKmGyrCM=;
        b=q5SKhLB3iW8D7UosvtRn65UK8csTDZQ9/6jv5m97DQ/N/IK+oYDljTEmjKTOMuMXf2
         B6yDRj1Ktaei5Cxhxm6pRaiG0kYC4k8xawOqih/vQMEczQwi2TM6Kc3M5iG2JA+noGpE
         r5rfnbHQ4QjJ1ZDOmZpp10419FWy7kMjtGM89UQCWU4QFRG6Q80TzPr5NS0/uHJBL3TB
         Udva2s51xxFcdNMACv3gauWctVqdOUxscVE6QlAuHmFPEb8RpD62iY6+GKE/JVCYz+uu
         N/0IpO4XRJhbpYJuGS9HD2o+hFWzdvGyfmcSMibYOz4TDM4Hvof954IUMrIVTELx9fp/
         V0Jg==
X-Gm-Message-State: AOAM5324fkb3UTHaGZ1uny7yxhuYusKmlO+JA5To1lrKZeCkFsCTxCst
        7kP4n8qaocC+pmM/FoUJ06A=
X-Google-Smtp-Source: ABdhPJwpzMqqhegc92irnbmZ7DqXPb2X+KXRPw2ICETQlHugEduxoNrNbfoVAN6znE19G8LcmHVMag==
X-Received: by 2002:aa7:9427:: with SMTP id y7mr3705007pfo.12.1599060301995;
        Wed, 02 Sep 2020 08:25:01 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id p68sm6147744pfb.40.2020.09.02.08.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 08:25:00 -0700 (PDT)
Subject: Re: [PATCH 3/9] i2c: bcm2835: Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Michal Simek <michal.simek@xilinx.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-3-krzk@kernel.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7867b520-950d-aa8e-a7a1-f3590abb98c6@gmail.com>
Date:   Wed, 2 Sep 2020 08:24:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200902150643.14839-3-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 9/2/2020 8:06 AM, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
