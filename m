Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6876821E01F
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jul 2020 20:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgGMSuJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jul 2020 14:50:09 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:33963 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGMSuI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Jul 2020 14:50:08 -0400
Received: by mail-io1-f65.google.com with SMTP id q74so14666192iod.1;
        Mon, 13 Jul 2020 11:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xmy+10bkAUzplh5z+naSAXciqgu3DwKbZRMbbuqfApI=;
        b=dB1l64aV2B/9snK6l4ai08u7a3zGyoH0Br2rwrAqchY4yc1ME+hrrjB97j+dnM/Z6t
         wBtKccNtuDpXMjFU3CubTh3VKhgKY/rCIr794pgiLTs/LSxQXMcmDZ4Yvv6h3g77H7sw
         TJgLAY25pf47cuKt5heRc+neek0MRpfBPbVKOnPvm7eSqHTf8Bl075TXTLaXhhjYbY6n
         aGqfWrNUuzdGowdOJlETAkhfsFAfhfRj9v484ZYtWQE/mlo3ptuv6TDOnUiAfhRi0FVo
         PpE0aK7uo725OgOilZR/BHjCqP9MuuEF8Y3k0BiNCbS1H3Uz0x8sGciJczz30rch21+g
         UXTw==
X-Gm-Message-State: AOAM531s2A93ZwEJ/nKfdVg3aBWN3U66ckB+ziXzdyV1l744lRdQNlg5
        hBDYwVDup+EnmZWxFmUFpQ==
X-Google-Smtp-Source: ABdhPJzzEYf4Sgi8m3Za6DzOBFTogKjjcVv7B4FkRBuc4xnN+Y7GUXEtlNF5YcGy5/T2CnI0KTilZg==
X-Received: by 2002:a02:3c08:: with SMTP id m8mr1605797jaa.107.1594666207313;
        Mon, 13 Jul 2020 11:50:07 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id q2sm8766251ilp.82.2020.07.13.11.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 11:50:06 -0700 (PDT)
Received: (nullmailer pid 529751 invoked by uid 1000);
        Mon, 13 Jul 2020 18:50:05 -0000
Date:   Mon, 13 Jul 2020 12:50:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Jason Cooper <jason@lakedaemon.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 4/5] dt-bindings: rtc: Convert sa1100-rtc to
 json-schema
Message-ID: <20200713185005.GA529639@bogus>
References: <20200616223353.993567-1-lkundrak@v3.sk>
 <20200616223353.993567-5-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616223353.993567-5-lkundrak@v3.sk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 17 Jun 2020 00:33:52 +0200, Lubomir Rintel wrote:
> Convert the sa1100-rtc binding to DT schema format using json-schema.
> While add that, add clocks and resets that are actually used.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v1:
> - Remove interrupts/maxItems
> - Mention clocks and resets in the patch description
> - Add default GPL-2.0-only license tag
> - Fill in maintainers from MAINTAINERS file
> 
>  .../devicetree/bindings/rtc/sa1100-rtc.txt    | 17 ------
>  .../devicetree/bindings/rtc/sa1100-rtc.yaml   | 57 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
> 

Applied, thanks!
