Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6B4195E2E
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgC0TGZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:06:25 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:43356 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgC0TGY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:06:24 -0400
Received: by mail-il1-f194.google.com with SMTP id g15so9779479ilj.10;
        Fri, 27 Mar 2020 12:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kdF4ZiwPh3ooAa8voxCTzP8vcydX2CdOMK5yY/NrPeA=;
        b=LNDDIpq9YiJKVSfAfiAUXagb4/XlGA/dsTjy7UQkpkKos4AYUyJ+Nz10RQikoLx2Lj
         Uh7jARwJQbXrWcTImOXXKZXEMbTsXoP7NZv7ZjrHHTHukNuI6hFFApNYatqHoIHOcENH
         b5LwjkdLtTWNH4JIoe1qSbKAhMvzmFPGxqx8bRNlOVxN/E2bbVdRACEmAW2RK3Or1cyb
         ICy2U+j3YwNdXJkKk3H4tj2E+wRTte4eSaaswdVMd5iP7D6Ds6gXI8CxVF9RI4Lw0x9L
         Ts10GgExR3EjZOMYrgOLB24f40c4lq9bPWb46hJpf/6QGZ0nIF/Z59RCx41E1Z80i/dH
         N6/A==
X-Gm-Message-State: ANhLgQ0wBJ/DzJYhEFYnwOQ+18RVv/TrO8LWR4askrOqOr5rN0qReRH+
        fzyx0fZMluH3I68kmESUKg==
X-Google-Smtp-Source: ADFU+vtPpgpO7lqH9sVLAHPNBv0T6K690s642alZiT3fYvzXaGNqvF9b56IJbU/q+PgjCy2l+KwcEQ==
X-Received: by 2002:a92:358b:: with SMTP id c11mr590279ilf.64.1585335983844;
        Fri, 27 Mar 2020 12:06:23 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id s7sm1704375iob.53.2020.03.27.12.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:06:23 -0700 (PDT)
Received: (nullmailer pid 1298 invoked by uid 1000);
        Fri, 27 Mar 2020 19:06:20 -0000
Date:   Fri, 27 Mar 2020 13:06:20 -0600
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
Subject: Re: [PATCH 15/28] dt-bindings: arm: mrvl: Add missing compatible
 strings
Message-ID: <20200327190620.GA1225@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-16-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-16-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 17 Mar 2020 10:39:09 +0100, Lubomir Rintel wrote:
> Add compatible strings for the boards we have in tree. At the same time,
> fix the MMP3 compatible string: the preferred vendor name for Marvell is
> "marvell", not "mrvl", and indeed "marvell,mmp3" has been actively used,
> not "mrvl,mmp3".
> 
> Fixes: 95aecb71b84e ("dt-bindings: arm: mrvl: Document MMP3 compatible string")
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Applied, thanks.

Rob
