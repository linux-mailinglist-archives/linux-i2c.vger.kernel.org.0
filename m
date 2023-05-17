Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 474047067C5
	for <lists+linux-i2c@lfdr.de>; Wed, 17 May 2023 14:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbjEQMMg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 May 2023 08:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbjEQMMe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 May 2023 08:12:34 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9213C3B;
        Wed, 17 May 2023 05:12:16 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so12707041b3a.0;
        Wed, 17 May 2023 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684325536; x=1686917536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jR9QVy06+8kCR0o/MKpVdWGpHv1t5cW3AKmbdvo1Kjc=;
        b=mMxLZJ5ClWCNLFgj9hpEZpfDu1kAtMtUeeBNuLdH81tH6WbPdHzHkUF+T/nOslsRY9
         RBh27yg9XsCmkG1aM0eVWFTBrsRzDOMf0T4WOYWA5PbyNP47/T80qU3HpdMfxuQmY0Yz
         0ndK627AmJ0xWoyY8SKIeEpm8VPtbvwjnufBI7oWWD7xqtOd1d53896dqyjFwWoAUugU
         HQMY8ok7AMqYSsDFhArRhT2nYB0as1luSohqkYvs5CNqyYaVKsBbPspT20mFYt6If5e3
         UHxcagAgqk9ClsAVp4OxsJ70b6ifBOONkstfI/LtT3979vHc8VLBsQispsv/S///i2DP
         7ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684325536; x=1686917536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jR9QVy06+8kCR0o/MKpVdWGpHv1t5cW3AKmbdvo1Kjc=;
        b=MnCBUFBWXyjqIBXOA7128NGSEnDm1iDcwP/USfnzBLuB0kL1Q86ZlI6l4p7FAKy3lc
         3efdNagze1VB0iPDtQFxt9pYgeecc2oYquUUb8Yd5ovo5ewYBYqkh4IwytFXIiXUU3un
         3phHuDPlaI9a5kT39F9ah0sv2muxBlYJcQg9H+0vYenGn9PrwanSPvYDLW5kBW02zFAa
         9TjGAfw7BoN1mQJz5CNfx5NE/9GLPmObuRO2fftC92OpDaKzS+YmxFrAaXtGBTZ8yiut
         EP7EeOUjW3RfNmVoE1aeykpybXYyrbuGecoMb2Uji7WUCgN0E1o0xm5ssQTonxfAZOfI
         fgew==
X-Gm-Message-State: AC+VfDxDdL1p8nzdaKDe4AsDkhjLOVqBP9oC/wpZGERPl/d4ygKljHvz
        SCM2Vp2FpqlRAIR94v+4cg4=
X-Google-Smtp-Source: ACHHUZ4ZyE/7M5xz4RF4owSSi09+sIdG3gisbl9+Vhh4syqW9Ou10ZCQBp3hmVhBuaWjYlpwSabJgA==
X-Received: by 2002:a17:90b:120c:b0:253:25c3:7a95 with SMTP id gl12-20020a17090b120c00b0025325c37a95mr2402736pjb.14.1684325535612;
        Wed, 17 May 2023 05:12:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j19-20020a17090ae61300b002500df72713sm1445765pjy.7.2023.05.17.05.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 05:12:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 17 May 2023 05:12:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Michal Simek <michal.simek@amd.com>
Cc:     piyush.mehta@amd.com, nava.kishore.manne@amd.com,
        sai.krishna.potthuri@amd.com, shubhrajyoti.datta@amd.com,
        vishal.sagar@amd.com, kalyani.akula@amd.com,
        bharat.kumar.gogada@amd.com, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jolly Shah <jolly.shah@xilinx.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
Subject: Re: [PATCH] dt-bindings: xilinx: Switch xilinx.com emails to amd.com
Message-ID: <155bdc43-7606-4279-a6f4-fe6e29a61722@roeck-us.net>
References: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5b2bd1e78407e4128fc8f0b5874ba723e710a88.1684245058.git.michal.simek@amd.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 16, 2023 at 03:51:08PM +0200, Michal Simek wrote:
> @xilinx.com is still working but better to switch to new amd.com after
> AMD/Xilinx acquisition.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/arm/xilinx.yaml             | 2 +-
>  Documentation/devicetree/bindings/ata/ceva,ahci-1v84.yaml     | 2 +-
>  .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml       | 2 +-
>  Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml  | 2 +-
>  Documentation/devicetree/bindings/crypto/xlnx,zynqmp-aes.yaml | 4 ++--
>  .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml        | 2 +-
>  .../devicetree/bindings/fpga/xilinx-zynq-fpga-mgr.yaml        | 2 +-
>  Documentation/devicetree/bindings/fpga/xlnx,versal-fpga.yaml  | 2 +-
>  .../devicetree/bindings/fpga/xlnx,zynqmp-pcap-fpga.yaml       | 2 +-
>  Documentation/devicetree/bindings/gpio/gpio-zynq.yaml         | 2 +-
>  Documentation/devicetree/bindings/gpio/xlnx,gpio-xilinx.yaml  | 2 +-
>  .../devicetree/bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml    | 2 +-
>  Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml     | 2 +-
>  .../devicetree/bindings/mailbox/xlnx,zynqmp-ipi-mailbox.yaml  | 2 +-
>  .../devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml       | 2 +-
>  .../bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml      | 2 +-
>  .../bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml       | 2 +-
>  Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml  | 2 +-
>  .../devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml        | 2 +-
>  .../devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml      | 2 +-
>  .../devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml    | 2 +-
>  Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml    | 2 +-
>  Documentation/devicetree/bindings/serial/cdns,uart.yaml       | 2 +-
>  Documentation/devicetree/bindings/spi/spi-cadence.yaml        | 2 +-
>  Documentation/devicetree/bindings/spi/spi-xilinx.yaml         | 2 +-
>  Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml    | 2 +-
>  Documentation/devicetree/bindings/spi/xlnx,zynq-qspi.yaml     | 2 +-
>  Documentation/devicetree/bindings/timer/cdns,ttc.yaml         | 2 +-
>  .../devicetree/bindings/watchdog/xlnx,xps-timebase-wdt.yaml   | 4 ++--

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter
