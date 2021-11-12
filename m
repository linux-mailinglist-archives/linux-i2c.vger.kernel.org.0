Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612A244E27B
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 08:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbhKLHpd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 02:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbhKLHpd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Nov 2021 02:45:33 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C147AC0613F5
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 23:42:42 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so6126645wme.4
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 23:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=d4YpBbYWP9wG3LFBKWknnju7IW21BdQrAXLAFoUfJjk=;
        b=L0G7vqzIu4OmVtWPcfcfA5NzLtPk2i0H7s2BzObNlHQTFEkm03sqk/2QHQ4kjpk9BH
         XMXouE5QpmwrxFfo6B5ZLvuccwWWhT/w9Ko9Yi7L+7BfDDnicqyRLnT+TM8ck5H5bQEY
         cyD6P6qfh9iWldNqTQR7o5UJ+sXkSMXyDzLNU6kkBq7ka/+ZuUqEk/qcSbQ3GxXC7kiU
         cm9dyledHK9n0gr3crraQGaAfhd3vfTQwfXVu/kwmwojjE1dRCSgNEVgeiJJB70r7ke9
         OYePQHHEPa/usZJXytv516/nCeAGVXFsmZBOHnIcNaOTOhsULeXowN7ikvsxKqOo/gxw
         3O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=d4YpBbYWP9wG3LFBKWknnju7IW21BdQrAXLAFoUfJjk=;
        b=zR6DrystZus4vVGaQ5GseK7Oe/cqTF/shiGnZgbwMi6sC6cPZvpNdONJErT5ToqUor
         9W9T8OjcHzSQWV/lcwP1T3rG/Wf/RkQ5PCJYS0SG4ex8yZsgotuXhtI9rR1RoTk3q2br
         EXHXOlv1y06Q/cArMYsC4Q8SCWNHUC4S08vRo7XQoyx4Rvz0APM/nIEjJpcx9jLgl1MW
         b7epPaLHer+8wDfmEk03LVmjoecrtCMgF8c8RNp6eHgrvy0W+KqKI8Duj0EM62wUW8Ps
         uMrKS6rEMwKQ35iI5wvBtvnCp0gSj2W44K9a2L3qqxUjJU+Gu9Kss8fzrniNHaToZNX3
         OUYg==
X-Gm-Message-State: AOAM532BiVXvOJpn4gZtT84feCOvMTSlyduUoeR6jh2qDQCxiCpcAUw+
        Gn06qUJc/NO0caSC8Zu8Zx2tzA==
X-Google-Smtp-Source: ABdhPJyYtg+MHn61GMl0MRFqSO/sm1wnHgrm7yORmq7WT7ihtvN7d0mp317CBhRDaom5mAlXGDszmg==
X-Received: by 2002:a05:600c:2107:: with SMTP id u7mr32377342wml.82.1636702961238;
        Thu, 11 Nov 2021 23:42:41 -0800 (PST)
Received: from google.com ([95.148.6.174])
        by smtp.gmail.com with ESMTPSA id q8sm4978469wrx.71.2021.11.11.23.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 23:42:40 -0800 (PST)
Date:   Fri, 12 Nov 2021 07:42:37 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     patrice.chotard@foss.st.com, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alexandre torgue <alexandre.torgue@foss.st.com>,
        jonathan cameron <jic23@kernel.org>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        olivier moysan <olivier.moysan@foss.st.com>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        maxime coquelin <mcoquelin.stm32@gmail.com>,
        Matt Mackall <mpm@selenic.com>, vinod koul <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        baolin wang <baolin.wang7@gmail.com>,
        linux-spi@vger.kernel.org, david airlie <airlied@linux.ie>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        netdev@vger.kernel.org,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        ohad ben-cohen <ohad@wizery.com>, linux-gpio@vger.kernel.org,
        Jose Abreu <joabreu@synopsys.com>,
        Le Ray <erwan.leray@foss.st.com>,
        herbert xu <herbert@gondor.apana.org.au>,
        michael turquette <mturquette@baylibre.com>,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        linux-serial@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Ludovic Barre <ludovic.barre@foss.st.com>,
        "david s . miller" <davem@davemloft.net>,
        Lionel Debieve <lionel.debieve@foss.st.com>,
        linux-i2c@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        thierry reding <thierry.reding@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        philippe cornu <philippe.cornu@foss.st.com>,
        linux-rtc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        alsa-devel@alsa-project.org, Zhang Rui <rui.zhang@intel.com>,
        linux-crypto@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-iio@vger.kernel.org, pascal Paillet <p.paillet@foss.st.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        linux-pm@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        stephen boyd <sboyd@kernel.org>,
        dillon min <dillon.minfei@gmail.com>,
        devicetree@vger.kernel.org,
        yannick fertre <yannick.fertre@foss.st.com>,
        linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        linux-phy@lists.infradead.org,
        benjamin gaignard <benjamin.gaignard@linaro.org>,
        sam ravnborg <sam@ravnborg.org>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Richard Weinberger <richard@nod.at>,
        Rob Herring <robh+dt@kernel.org>, Marek Vasut <marex@denx.de>,
        arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jagan Teki <jagan@amarulasolutions.com>,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        daniel vetter <daniel@ffwll.ch>, Marc Zyngier <maz@kernel.org>,
        bjorn andersson <bjorn.andersson@linaro.org>,
        lars-peter clausen <lars@metafoo.de>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: timers: Update maintainers for
 st,stm32-timers
Message-ID: <YY4a7ZxzhNq6Or+t@google.com>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-3-patrice.chotard@foss.st.com>
 <YYwjPAoCtuM6iycz@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YYwjPAoCtuM6iycz@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 10 Nov 2021, Rob Herring wrote:

> On Wed, 10 Nov 2021 16:01:41 +0100, patrice.chotard@foss.st.com wrote:
> > From: Patrice Chotard <patrice.chotard@foss.st.com>
> > 
> > Benjamin has left the company, remove his name from maintainers.
> > 
> > Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> 
> Lee indicated he was going to pick this one up, so:
> 
> Acked-by: Rob Herring <robh@kernel.org>

Since you already merged the treewide patch, you may as well take
this too.  We'll work through any conflicts that may occur as a
result.

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
