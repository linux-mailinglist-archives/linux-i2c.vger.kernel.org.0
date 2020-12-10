Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D463D2D5299
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 05:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731800AbgLJD5p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Dec 2020 22:57:45 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41890 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731790AbgLJD5n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Dec 2020 22:57:43 -0500
Received: by mail-ot1-f68.google.com with SMTP id x13so3655991oto.8;
        Wed, 09 Dec 2020 19:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G2QhB7f/IZOs0m3re+ypQrxGcEo7MBRtBPMfHjJs2JY=;
        b=hBQqGmHsmxDTA+7Ks8Dhn0W1p82f3DIWtyFvM7wDJgxDg47P+QOUvHV7BtOdmX86Xi
         dI/Y3b3507VTrid0k35FIKGhETRHf8F/eLqrV5UvwNOiIZBJ0NWIHYa06CBIXpooqhaP
         9mM5zhgDTt/PcHayqDvay7tbNmpFH55DEXV9vXPhKUEI+gNfSj1mu7gLzNOMbxzmYnL2
         f2qD7orvmBHZDbv1pvOX5E54gXsMQWcijEQNf/UjLvzPE5HinT+/Uf96BZcNIi7DuFEx
         CUsKRj2NHMAYpBl0TyQEoU0nAALFOUs9DVkAbylHRVSTnBqmZ7aPmwe8b2+oKpCVp8Ip
         zt7A==
X-Gm-Message-State: AOAM531EhhMYkKw/GOoyrlJDuZ9rfnhZEKFSM7GG7f+wY7zWyZgzj8J2
        4pycF5fFaXjiIyS0Xe99Mgot5JjLzw==
X-Google-Smtp-Source: ABdhPJyrEEkoAekm6sFmqloN+vJ1XT661Hp+eHwH6Y/W1V4otFUI+Q2hFPtNvXcKQnPU2jb3KbntNA==
X-Received: by 2002:a05:6830:13c8:: with SMTP id e8mr926977otq.139.1607572621748;
        Wed, 09 Dec 2020 19:57:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j126sm756267oib.13.2020.12.09.19.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 19:57:01 -0800 (PST)
Received: (nullmailer pid 1634611 invoked by uid 1000);
        Thu, 10 Dec 2020 03:56:59 -0000
Date:   Wed, 9 Dec 2020 21:56:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Yash Shah <yash.shah@sifive.com>
Cc:     broonie@kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, u.kleine-koenig@pengutronix.de,
        aou@eecs.berkeley.edu, bgolaszewski@baylibre.com,
        gregkh@linuxfoundation.org, peter@korsgaard.com,
        lee.jones@linaro.org, palmer@dabbelt.com,
        linux-pwm@vger.kernel.org, paul.walmsley@sifive.com,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        robh+dt@kernel.org, andrew@lunn.ch, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, thierry.reding@gmail.com
Subject: Re: [PATCH v2 4/9] dt-bindings: serial: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201210035659.GA1634582@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-5-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607403341-57214-5-git-send-email-yash.shah@sifive.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 08 Dec 2020 10:25:36 +0530, Yash Shah wrote:
> Add new compatible strings to the DT binding documents to support SiFive
> FU740-C000.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/serial/sifive-serial.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
