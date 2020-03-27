Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B294C195E33
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgC0TGm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:06:42 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35069 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgC0TGm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:06:42 -0400
Received: by mail-io1-f65.google.com with SMTP id o3so5401603ioh.2;
        Fri, 27 Mar 2020 12:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qMUC5QPBri55R5OBdNy2ZcqODXD5YdXa5XZI/KHtL80=;
        b=oxNyGBy6/Og4nBFsz0Nr1Ia4A+AtheGkq0nIA5qfKI3qyDVwdY5gYgcfOx7ueYpXcP
         OX6OanLIJjOzypxEeeAcykWDtz75bdNshrWDDJqxra74+Ikf80CZG7DN7Bf+/LU7WQmK
         7MpdjtiYBz/NDJaWeyZiKqp3UyPofS0Mxrq1pi5O09kmPvfXnmt2WoHBuT2S9NLDkbZJ
         tYWFqhRC81975CQqcEG3zfM7VqI3ma9q6yHdQCw8GuSbkhR2SxqXAq8RKvRg6doJ1Qq5
         0GVSmB5p6saamKVR/r4IhfAH4q58Nf3YZrYAUSgfEIS1qXmZcd+V73fBoqgCytAz0oo9
         385g==
X-Gm-Message-State: ANhLgQ0dh48fYDnDuYo20oTZUiVYzON7tKoy1qiPaPBovhWCEeQBoLYM
        pJeVHjTPb85amkBOWSQ5Tw==
X-Google-Smtp-Source: ADFU+vt0KcF/tCMhJKtFLGO/bfB3+X++eW/6kj5Gw8j7tmV621AcBL+rTxqySPmGTDQQghf7sYUxKg==
X-Received: by 2002:a02:290f:: with SMTP id p15mr333974jap.73.1585336001057;
        Fri, 27 Mar 2020 12:06:41 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id s25sm2134383ilb.37.2020.03.27.12.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:06:40 -0700 (PDT)
Received: (nullmailer pid 1938 invoked by uid 1000);
        Fri, 27 Mar 2020 19:06:38 -0000
Date:   Fri, 27 Mar 2020 13:06:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 16/28] dt-bindings: Add "mrvl", a legacy vendor prefix
 for Marvell
Message-ID: <20200327190638.GA1762@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-17-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-17-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 17 Mar 2020 10:39:10 +0100, Lubomir Rintel wrote:
> While the preferred vendor prefix is "marvell", "mrvl" is used by many
> older bindings already. Add it, while also marking it deprecated.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks.

Rob
