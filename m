Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA658195E4D
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 20:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgC0TJr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 15:09:47 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:40880 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgC0TJr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 15:09:47 -0400
Received: by mail-il1-f193.google.com with SMTP id j9so9840275ilr.7;
        Fri, 27 Mar 2020 12:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6rX+h+uJgGe8m8xtVJ86+22oKe3RcvHhIbxU08dTCMQ=;
        b=hATQNLtYrtYjohKz7Rt8e0NLaubz2X5PmSPERn3MUP+U3XFM8Gz5nCj5GowqY2AQ9J
         QZpnopxtbgK4vYSDnKOtIf3yNyXmCmBgsOatSa5wU2RMKcCpFE3wYGF7CbSS1XO+vAv7
         lxNtzgRJi9BPapI/EIGzoiv4nlWCYTsj7wUQzuxyXNRnl0fOJZjmFf+kanUO05wjBd3i
         FGlGGDRikYttOW76sTIhcMFUfeEHS+xriNPsNsYFIftvn3XcxK0wgSBGoUQ71i7w8xlg
         1YGBr8yn6H/adl1nk5T38bSwCEbnkbsaSRK96ev3p+DBFQQq2tgiSEJfsqDFJIySt7FA
         Va6w==
X-Gm-Message-State: ANhLgQ3ffqmYYEKJsSupf7r7oyNAuFhEz0nQ70cgCX/RhQCfM8JTk4m8
        To4Chi9FuId4JwjT4Bb0XA==
X-Google-Smtp-Source: ADFU+vscvwuKw7PKMVNwihd///exX3VL5zIeuA4QhBx1b3ZCf7B6dYLbOhdo0QQAD6ziGBGk6UT+EQ==
X-Received: by 2002:a92:9fd0:: with SMTP id z77mr589295ilk.257.1585336185552;
        Fri, 27 Mar 2020 12:09:45 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l6sm2168753ilh.27.2020.03.27.12.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 12:09:44 -0700 (PDT)
Received: (nullmailer pid 6759 invoked by uid 1000);
        Fri, 27 Mar 2020 19:09:42 -0000
Date:   Fri, 27 Mar 2020 13:09:42 -0600
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
Subject: Re: [PATCH 20/28] dt-bindings: phy: Convert phy-mmp3-usb to
 json-schema
Message-ID: <20200327190942.GA6703@bogus>
References: <20200317093922.20785-1-lkundrak@v3.sk>
 <20200317093922.20785-21-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317093922.20785-21-lkundrak@v3.sk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 17 Mar 2020 10:39:14 +0100, Lubomir Rintel wrote:
> A rather straightforward conversion of the phy-mmp3-usb binding to DT
> schema format using json-schema.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  .../bindings/phy/marvell,mmp3-usb-phy.yaml    | 40 +++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mmp3-usb.txt  | 13 ------
>  2 files changed, 40 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/marvell,mmp3-usb-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mmp3-usb.txt
> 

Applied, thanks.

Rob
