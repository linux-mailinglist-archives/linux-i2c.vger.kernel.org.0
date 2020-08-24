Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4CE624F34C
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Aug 2020 09:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgHXHow (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Aug 2020 03:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgHXHow (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Aug 2020 03:44:52 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EA5C061573;
        Mon, 24 Aug 2020 00:44:51 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id j25so1436668ejk.9;
        Mon, 24 Aug 2020 00:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WASiI+LGr+j54QgtHqz/Mb0c0vmWaC6GIOI+FQCQgEU=;
        b=FmOKuFJxRGkxqHGOeaKpU20R1LskNofQqIBJmR8sT/FOg3eUyRjZLBGxKVhFXmyNtC
         JMPjru8Om1g07nuLMeqXyPbbyVsQ6y8V79MA586PN6L+QbfAnPZSzrLz9E8H28a4C24j
         DFYwa+q0+FCYQg30u0hU1Cf6w+0UOidt7K1YRE0Oxkmg6PArZq9phRt0NeSaScdKnz3L
         Gpv+3Sc/clb3l72Mu+FlOK/Egrp3PWaU73eIfnqSJyF4si9e5Dp31PYS7c6x5I+mlBMG
         i7mAEdQpCWOrcQ4YNg7o6mj48l+PT3e6Yf0U71prmYmilIRbfyIEqnTCAEc6Z9MkqfKz
         b/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WASiI+LGr+j54QgtHqz/Mb0c0vmWaC6GIOI+FQCQgEU=;
        b=F/lxFFLOIEldgbZ92hwZcGSLAKxVOvmg5Hhu+S2YlcZ53zPWyGn/lahE7YCf22926X
         cVvxo8wis/eXHX3ifD5r5Hx5y265b0cF9k9pFNepEPc7W41lmjBmEzOJX3Wra0UIyKVx
         wRgFGgGvPNOpzZh/6dGRpyPIEddrOBqA2HoBs+g+8fI8b9b5H88884W/so+DgLWOCz7e
         MViMBiFAMbgRaw0xtuaiuvJI5Taijvhye58Kz+Z92It6D9p3Mu8d11Uv/q5CzQ0ltwp+
         RNqbrYG6cNGLSaNIShJbvTbskoCao+ux0Vvsue9oy6kNPbCfVvwquWPbzVmUAqRz+g+9
         CknQ==
X-Gm-Message-State: AOAM530lsqnGdaZkPJjrNrTqq5VicmB7UJC4+MOGiyqvPUjLXO8JsJLK
        ev8GRF9Fyc2IjDDEnrp0C8xcdYIZOmZr0QA5nFs=
X-Google-Smtp-Source: ABdhPJz3o/rSw7xjX+X7g4OBQlKl6NUWeb3EBCeMkgDFNZbGW7KExWm+ZDQrLuSd5piSgmhenUlhCdM17RM5RyhEMbg=
X-Received: by 2002:a17:906:4dd4:: with SMTP id f20mr4645772ejw.170.1598255090240;
 Mon, 24 Aug 2020 00:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595572867.git.frank@allwinnertech.com> <CAEExFWsvScMgi_Dftfq06HZiF8CFAmym8Z_tgQoHHAfiGxWt0g@mail.gmail.com>
In-Reply-To: <CAEExFWsvScMgi_Dftfq06HZiF8CFAmym8Z_tgQoHHAfiGxWt0g@mail.gmail.com>
From:   Frank Lee <tiny.windzz@gmail.com>
Date:   Mon, 24 Aug 2020 15:44:39 +0800
Message-ID: <CAEExFWuwjmqAh0c3kMLS3Gs6UC2A8TtY-9nJeWxFPRDugtR4pA@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] Allwinner A100 Initial support
To:     Frank Lee <frank@allwinnertech.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, gregory.clement@bootlin.com,
        Thomas Gleixner <tglx@linutronix.de>, jason@lakedaemon.net,
        Marc Zyngier <maz@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Lee Jones <lee.jones@linaro.org>,
        "p.zabel" <p.zabel@pengutronix.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>,
        clabbe@baylibre.com, bage@linutronix.de,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, linux-i2c@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ping......
