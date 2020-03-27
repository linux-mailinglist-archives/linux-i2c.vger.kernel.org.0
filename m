Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B50E21954C1
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 11:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgC0KEP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 06:04:15 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40328 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgC0KEO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 06:04:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id 19so9537801ljj.7
        for <linux-i2c@vger.kernel.org>; Fri, 27 Mar 2020 03:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qtl1Eialsdl3z7ZP76hLFrTUnrm/Xwed3O3Is0v5u2s=;
        b=fm1BGbXw3YbyFJAFmqHvsEnrwOu7+/+ujtJ86z5Orejx852KLJeCDtQq+soYhGzfCj
         2rAfF7PxQg2H2Sgjn2JBjFbILfIVHBT7QxDFDZh2R3HOuTeyVGc0fKnVbnrXO43QCj8x
         cXlH+JS+Jobqck2T5KLCJ/QxbIlZUnxiWcd/WFLXFPVgiIHA/VQnYBo2xwwlOuCaoBNf
         PV01d4t1H3eQqxbYRIT2/sc/hXgoikPd8X3chF1TEDLMvJhtp9ZecGoNxVyrMZXDYddu
         VUti7wxKuFzjCVhJlxMkwTw2df/O1qZUfem6Ydt42/5xj5qm4D1YHiUkYri/dNaN3Cn1
         sdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qtl1Eialsdl3z7ZP76hLFrTUnrm/Xwed3O3Is0v5u2s=;
        b=Mrvw+mjrsrsNCLa+yFF/fE8qjSrniF/RNAR7Bp9LlqDzPnUacy36vNjrXcjdjWbn8G
         nCj/EY1wtrr7Vob4Cs87S7/RIphoA0JopeUa+X8yOrscJ0B6pmryef0BHrGS/mFc6GOc
         pr+flyMFbM2BJgQUaI2BttPPAjSKzqV8OgxmzBVEpAtgja9QjlAmee5dGNXw0ZMpGBwD
         v62LjzbFu7/qnAE5cG0EX5rj/sN6gIQ34ed0bjoYV+D9/MM4drFsFKMZsMcz+j9WgI2v
         zI18skkKOp/Gq3pSYJwEvc1dS4h9SuOXFkbpOKj7HGRS09w2QArh4voDSLuhdxfUDNTM
         J6dw==
X-Gm-Message-State: AGi0PuaoHM1ZBWUUbB8EUjkBiMTi1EoNUGi32TZtTBKRCg0GnsWaR1zW
        gV+qg4102go2yaZLWqmK3hsWQfY6lx+daBYUq+P0CA==
X-Google-Smtp-Source: ADFU+vsLFzRSaI0mp4F0YlxEk/ZWtLbeZk2X0x8rIBWVbKHsUZE12xxYtPOS4x7TLee1muHrdP/vfqhKQcCaKg9I0tI=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr7696484ljh.258.1585303451336;
 Fri, 27 Mar 2020 03:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200317093922.20785-1-lkundrak@v3.sk> <20200317093922.20785-22-lkundrak@v3.sk>
In-Reply-To: <20200317093922.20785-22-lkundrak@v3.sk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:04:00 +0100
Message-ID: <CACRpkdaEnODObC7emg2M7Ayn_JkeLuc3HpV4VhJcwaZ+=sDLcg@mail.gmail.com>
Subject: Re: [PATCH 21/28] dt-bindings: gpio: Convert mrvl-gpio to json-schema
To:     Lubomir Rintel <lkundrak@v3.sk>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-media@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
        linux-rtc@vger.kernel.org,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Lubomir!

Excellent work! Just nitpicks:

On Tue, Mar 17, 2020 at 10:40 AM Lubomir Rintel <lkundrak@v3.sk> wrote:

> +++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
> @@ -0,0 +1,173 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/mrvl-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell PXA GPIO controller

This binding is lacking a license. Please use the dual GPL+BSD license
tag.

> +maintainers:
> +  - devicetree@vger.kernel.org

I don't know if Robert Jarzmik is in on maintaining this, would you accept
it Robert?

Yours,
Linus Walleij
