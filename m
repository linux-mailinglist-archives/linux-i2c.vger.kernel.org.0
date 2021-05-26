Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECFE391F89
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 20:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbhEZSuO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 14:50:14 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:38739 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbhEZSuO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 14:50:14 -0400
Received: by mail-oi1-f170.google.com with SMTP id z3so2515474oib.5;
        Wed, 26 May 2021 11:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HlrEkNbdErQedeYk72SYd9ajDXD8/yDnUV8sRUHNIcc=;
        b=nFJx7yTuB5pRL0r2/sTbMUfR2Y6HD+GmFiMSf2LxkWa9444prKAeh/tRVr2vjcf6XR
         Ibrjz1zcPlJr68bTljS/O7cqrPCKU6rnjppV/jVCTDWDzYwf4054WsIK29sTwmRh/M+u
         3oVzfvjgLvJCJdJH3aFxa2y9//ScZpQ8XplXLPiJuW81FUrJ1uygGUCfYtdq1NRrzi7V
         M1k0ybwSKRvIcycnRGZtkXMv0JoawlroEzTquWQoJJkhloqlP8e6rj2aVplefI2vpBfj
         sbIHN8jRQrsa5xkV3osv+E5Q2YsZDhNa71R/qFGB2leq7aXlhkY1NMxkAZkP43C3JP94
         M/hw==
X-Gm-Message-State: AOAM533N2bTkUzMypJDWksX1EWiLGLQE4VaOWEVIZ9LvNQu2eEn/7vaY
        CN6W8w+Fc8NpH+VMfwZVMKuO+ty4IQ==
X-Google-Smtp-Source: ABdhPJxUDXUCvfpFu6FAogxwQhpINYbOt8kpbltexGcdyKvHsTRvwHT/oAR3BFHN7TMB98kWkwd7Ag==
X-Received: by 2002:aca:a852:: with SMTP id r79mr2942445oie.21.1622054921636;
        Wed, 26 May 2021 11:48:41 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id x65sm7224otb.59.2021.05.26.11.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 11:48:40 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 0/6] dt-bindings: Convert mux bindings to schema
Date:   Wed, 26 May 2021 13:48:33 -0500
Message-Id: <20210526184839.2937899-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This series converts the mux-controller and some i2c mux bindings to DT
schema. This was a rabbit hole of trying to fix undocumented (by schema)
compatibles (enabled by setting DT_CHECKER_FLAGS=-m). So this is mux
bindings, and then a few others that are used in the mux binding
examples.

I ended up converting the MDIO mux bindings[1], and Jonathan did the
IIO mux[2]. (Thanks!)

Rob

[1] https://lore.kernel.org/r/20210526181411.2888516-1-robh@kernel.org/
[2] https://lore.kernel.org/r/20210522112908.1611389-2-jic23@kernel.org/


Rob Herring (6):
  dt-bindings: mfd: ti,j721e-system-controller: Fix mux node errors
  dt-bindings: rtc: nxp,pcf8563: Convert to DT schema
  dt-bindings: mux: Convert mux controller bindings to schema
  dt-bindings: i2c: Convert i2c-mux bindings to DT schema
  dt-bindings: i2c: i2c-mux-pca954x: Convert to DT schema
  dt-bindings: i2c: maxim,max9286: Use the i2c-mux.yaml schema

 .../bindings/i2c/i2c-demux-pinctrl.txt        |   2 +-
 .../devicetree/bindings/i2c/i2c-mux-gpio.txt  |   4 +-
 .../devicetree/bindings/i2c/i2c-mux-gpmux.txt |  99 ----------
 .../bindings/i2c/i2c-mux-gpmux.yaml           | 124 ++++++++++++
 .../bindings/i2c/i2c-mux-ltc4306.txt          |   4 +-
 .../bindings/i2c/i2c-mux-pca954x.txt          |  74 -------
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 110 +++++++++++
 .../bindings/i2c/i2c-mux-pinctrl.txt          |   4 +-
 .../devicetree/bindings/i2c/i2c-mux-reg.txt   |   4 +-
 .../devicetree/bindings/i2c/i2c-mux.txt       |  73 -------
 .../devicetree/bindings/i2c/i2c-mux.yaml      |  87 +++++++++
 .../iio/multiplexer/io-channel-mux.txt        |   2 +-
 .../bindings/media/i2c/maxim,max9286.yaml     |  23 +--
 .../mfd/ti,j721e-system-controller.yaml       |  19 +-
 .../devicetree/bindings/mtd/ti,am654-hbmc.txt |   2 +-
 .../devicetree/bindings/mux/adi,adg792a.txt   |   2 +-
 .../devicetree/bindings/mux/adi,adgs1408.txt  |   2 +-
 .../devicetree/bindings/mux/gpio-mux.txt      |  69 -------
 .../devicetree/bindings/mux/gpio-mux.yaml     |  92 +++++++++
 .../devicetree/bindings/mux/mux-consumer.yaml |  46 +++++
 .../bindings/mux/mux-controller.txt           | 157 ---------------
 .../bindings/mux/mux-controller.yaml          | 182 ++++++++++++++++++
 .../devicetree/bindings/mux/reg-mux.txt       | 129 -------------
 .../devicetree/bindings/mux/reg-mux.yaml      | 143 ++++++++++++++
 .../bindings/net/mdio-mux-multiplexer.txt     |   2 +-
 .../devicetree/bindings/rtc/nxp,pcf8563.yaml  |  56 ++++++
 .../devicetree/bindings/rtc/pcf8563.txt       |  29 ---
 27 files changed, 870 insertions(+), 670 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux.yaml
 delete mode 100644 Documentation/devicetree/bindings/mux/gpio-mux.txt
 create mode 100644 Documentation/devicetree/bindings/mux/gpio-mux.yaml
 create mode 100644 Documentation/devicetree/bindings/mux/mux-consumer.yaml
 delete mode 100644 Documentation/devicetree/bindings/mux/mux-controller.txt
 create mode 100644 Documentation/devicetree/bindings/mux/mux-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/mux/reg-mux.txt
 create mode 100644 Documentation/devicetree/bindings/mux/reg-mux.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf8563.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/pcf8563.txt

-- 
2.27.0

