Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E067D4AA366
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 23:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352377AbiBDWpJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 17:45:09 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:33370 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234792AbiBDWpJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 17:45:09 -0500
Received: by mail-oi1-f169.google.com with SMTP id x193so10344472oix.0;
        Fri, 04 Feb 2022 14:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WTbKoINrrZSrW+wbotNxY+1xcFSgxHlSIEBZgkY7L2c=;
        b=jj4p5MuhdtsRcSR6YEmHwznW8IBvySCD3xqNtImiFq6iudtSI712lNQxC2nqpQNvQ7
         cxFwjvyLTlbJSUINK3F3hoWfGZuD3ORI4sxigTtS+/lPzU8B0/SLwOUphCIJ9JmFWUYi
         I9lYyWW+/vzJk4uSnQ6h5v4PnIPDZhnj9nk5W/kgJMy/BS00RWh8uojZJqdnwOiweFqJ
         TzLHcv/kMPAD9yAMxzLI8kDT+y2/Ly3a/sCUji39BUJCqpuSYwojU8QAS+reytZhzpmj
         h+BtjEHb7TKU7WeB1Spk99iSh9euoFziwlQNvtZo52A80hSErBFrOsyQi1d7SnQQw8iS
         3uPw==
X-Gm-Message-State: AOAM532WeQGr3RaDGdYVsb+5TsC0KkLUvimAEBQKUaVbl+GqBHDlTa6+
        ItRgDssF+u6nmBDk7B56CA==
X-Google-Smtp-Source: ABdhPJw3TK/QO+UjLoDVWc5SsGv0teSPAjocM1bNUMCwJWW4qvEEP1P3eKqSQkQ8AK5Sbp2Baot7hw==
X-Received: by 2002:aca:dac2:: with SMTP id r185mr2389606oig.152.1644014708321;
        Fri, 04 Feb 2022 14:45:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s64sm1248611oos.0.2022.02.04.14.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 14:45:07 -0800 (PST)
Received: (nullmailer pid 3322192 invoked by uid 1000);
        Fri, 04 Feb 2022 22:45:06 -0000
Date:   Fri, 4 Feb 2022 16:45:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Conor.Dooley@microchip.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, jassisinghbrar@gmail.com,
        thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
        lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-riscv@lists.infradead.org, krzysztof.kozlowski@canonical.com,
        bin.meng@windriver.com, heiko@sntech.de, Lewis.Hanly@microchip.com,
        Daire.McNamara@microchip.com, Ivan.Griffin@microchip.com,
        atishp@rivosinc.com
Subject: Re: [PATCH v5 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Message-ID: <Yf2scqKFRFwWBIlC@robh.at.kernel.org>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
 <20220131114726.973690-4-conor.dooley@microchip.com>
 <CAL_JsqJkFaGmpAi3eEUROWyOr_PQEZ209TneLhsOkpf3w8jQdw@mail.gmail.com>
 <84e1d43f-4d3d-1501-5bc1-c982272e1ce3@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84e1d43f-4d3d-1501-5bc1-c982272e1ce3@microchip.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 31, 2022 at 03:55:32PM +0000, Conor.Dooley@microchip.com wrote:
> On 31/01/2022 15:39, Rob Herring wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On Mon, Jan 31, 2022 at 5:45 AM <conor.dooley@microchip.com> wrote:
> >>
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add device tree bindings for the i2c controller on
> >> the Microchip PolarFire SoC.
> >>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >>
> > 
> > There should not be a blank line here.
> > 
> > Also, tags should be in chronological order typically. If Daire sent
> > this patch out with my tag, then the order is correct. If I gave it on
> > a version you sent, then it goes between Daire's and your S-o-b which
> > is the case here.
> Oh, thanks. Probably been messing this up right/left/centre.
> 
> On another note, I know I'm still missing a RB still on some of the 
> bindings, but what is the acceptance path for this series?
> Any left over bindings not taken by subsystems via yourself and the dts 
> changes via Palmer's tree?

They should go via subsystems. I can take if you want, but not with 
missing dependencies. I need my tree working.

Rob
