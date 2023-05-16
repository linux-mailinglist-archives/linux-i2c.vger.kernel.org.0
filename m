Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69F2C705227
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 17:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbjEPPcx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 11:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbjEPPcp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 11:32:45 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E71367296
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 08:32:42 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-510b6a24946so40334a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 16 May 2023 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684251161; x=1686843161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WfDmrqy+QvMst4XEpE/xoK4sak7nQ3C4hjNO9HTTG0=;
        b=xDEJo0SLmGVlDXhX/NOriVq2mlAqG47xuhR/5aeirsLGvc7tkTl9nINt7oJZhqwU6o
         koJhGF/IIzflE+YEoTP50NrniSiBi0YiQRxPW6iLxHejXOiDzRaDMgTVxhbW3e3EL5Dh
         nuUQkhfOcADYBv3spwgyGfSZLOlDBU5J9PVGl3aATwbkjucWdrAxzPZuYLZBn9iDJm3S
         A4/nurYAYt32tYoLTewVmH9oXggLmJ74/ynZ9y3ksrgZnbZQn4MOm6osU8cZ8D/XK7VR
         hAvXQejna4ki7fOPorsJxh03h+xg2xP5CaH1XM+RGR4AjYLWCKw6LgH0+fhVeMYnrItR
         LOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684251161; x=1686843161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WfDmrqy+QvMst4XEpE/xoK4sak7nQ3C4hjNO9HTTG0=;
        b=MHJN5kpbZAbm8QekNXs4P6PSdguv56eHsD1NhR3/syeD0f+3UUVjRthw5qrFfTF+mb
         9wMzPLMp9mb1yQTFfftZ9lIDB25BC9MVOoo0sIDVrNYsrhwa+Px6zhqxUVLJuHdcxghp
         do2EM2h2H3gIW0CSCZfSAFdU5EGpmAdpFjcQI7oShmIU5+BJAvU+OUZ1o1g2Nqwx3z9G
         ahUHZ6kpC5UBIQhzv0ST8ihFOGYASzlll9BHhrXI84nRHRcyS2YHbmVt9s8wk/Q5m1F8
         ap5TIBabloShYOYC9GbpmxaOuUyqvSc40m0mCQrM+q7jlVVIOTGIuEZsuh1mO39vKbFD
         6HVw==
X-Gm-Message-State: AC+VfDwf+IYCysP/s2FGCvyffI9WimKQhEA/PPm5VgNllzrYq/pKXeym
        oXF0P/ej74hXous/BpKx49IASA==
X-Google-Smtp-Source: ACHHUZ7x0LFHxkX8C01IljtyBknQMJkvvH2qc+W3wIiGMrH81XlGSgasoeiOPj4uhkFFeOaCs2aTJg==
X-Received: by 2002:a50:ed99:0:b0:50b:c41b:25d with SMTP id h25-20020a50ed99000000b0050bc41b025dmr27405434edr.7.1684251161319;
        Tue, 16 May 2023 08:32:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id w15-20020a50fa8f000000b0050d89daaa70sm8389780edr.2.2023.05.16.08.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 08:32:40 -0700 (PDT)
Message-ID: <5b818f32-33c4-3f89-ce02-eb803d34ea48@linaro.org>
Date:   Tue, 16 May 2023 17:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dt-bindings: xilinx: Switch xilinx.com emails to amd.com
Content-Language: en-US
To:     Michal Simek <michal.simek@amd.com>, piyush.mehta@amd.com,
        nava.kishore.manne@amd.com, sai.krishna.potthuri@amd.com,
        shubhrajyoti.datta@amd.com, vishal.sagar@amd.com,
        kalyani.akula@amd.com, bharat.kumar.gogada@amd.com,
        linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Manish Narani <manish.narani@xilinx.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Moritz Fischer <mdf@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tom Rix <trix@redhat.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/05/2023 15:51, Michal Simek wrote:
> @xilinx.com is still working but better to switch to new amd.com after
> AMD/Xilinx acquisition.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

