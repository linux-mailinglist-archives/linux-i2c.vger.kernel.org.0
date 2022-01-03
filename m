Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6FC1482E48
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jan 2022 06:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbiACFtR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jan 2022 00:49:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiACFtQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jan 2022 00:49:16 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DE0C061761;
        Sun,  2 Jan 2022 21:49:16 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id f8so19267308pgf.8;
        Sun, 02 Jan 2022 21:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=a0iiObTYNtgePExORvXCeabu8g7rlap8QathO0XHHKs=;
        b=PTjsk5iijgkn45nJxLLN7yi5jBfZvHZIrUG21RiqBRUbSfAJ51lIYKDPISgkFyQqRe
         V4gqUmomEFQ4dNvqLg5cPwGw+vkoY3owDjlYxXcaFBnEqiHHHn+hjBRFWoax2m6FSgLc
         HAX7sEpInfDsHgTaBjThPm1bIWxpr8BoWPQe4yhXjaVWz/RWC3cdP9/Rt6oRSN9xc0R3
         38blePt5Zp4okPxbQAiV/4zD7W09URALhoxQgJuKlWTzmSQ0dSfMFeDcKX5kLLbnfq+p
         XLSmMgnpgmZpIwCl1I7w8hZB9gnfcmOYQwazyoKFoHzuigZnU+JSdzLoiwvH1XwwM8tN
         7snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=a0iiObTYNtgePExORvXCeabu8g7rlap8QathO0XHHKs=;
        b=jiUcKD9/b3eYHdE6PbuoAAKZbFhDU7YhszS829CE0CRBqg37W72kUnI1bwj7oqto+G
         4MH6PIwLI5zYwNonnd4GcTgZXvRZT5zgBfaP5C+lXhGPnU68C8vIwd5AGcPxbVXI3bsp
         B7vWNMETRBA4kKytZb+aZ+feNNWIjgX2aoP0Lm/Ahrh+vSD7h+aK+a4f2tW1KBoHyrQC
         hZZpft9PbLxyeK0FXIr+jxk//mCgxelUnjdMzopN21FutGaXihdeQM+rNOPS5ihrlGo1
         gUSqfM92YVwNJ7W8nwthvy1ZJltlC1bK9935mf2DOob63upiFvr3noIt01gk99rwkUS3
         g2xA==
X-Gm-Message-State: AOAM533Vp+3z34SmJaprABXFAnG9v4LzY90ZwoPi9MR11LLo3x2z77lq
        IFoANXpSTyJdh2gob/MRLFs=
X-Google-Smtp-Source: ABdhPJy+JjkyTheHl+LUdqBbV9fcTztcCUYpzzzsV1ENkWM+62Ki38nl/9INTABTNcBgJMHNpQxFZw==
X-Received: by 2002:aa7:96c5:0:b0:4ba:55c0:5e12 with SMTP id h5-20020aa796c5000000b004ba55c05e12mr44970857pfq.86.1641188954774;
        Sun, 02 Jan 2022 21:49:14 -0800 (PST)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id m6sm30607229pgb.31.2022.01.02.21.49.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jan 2022 21:49:14 -0800 (PST)
From:   Li-hao Kuo <lhjeff911@gmail.com>
To:     p.zabel@pengutronix.de, daniel.thompson@linaro.org,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lh.kuo@sunplus.com, wells.lu@sunplus.com,
        Li-hao Kuo <lhjeff911@gmail.com>
Subject: [PATCH v3 0/2] Add I2C control driver for Sunplus SP7021 SoC   
Date:   Mon,  3 Jan 2022 13:49:21 +0800
Message-Id: <cover.1641188699.git.lhjeff911@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is a patch series for I2C driver for Sunplus SP7021 SoC.	
	
Sunplus SP7021 is an ARM Cortex A7 (4 cores) based SoC. It integrates	
many peripherals (ex: UART, I2C, SPI, SDIO, eMMC, USB, SD card and	
etc.) into a single chip. It is designed for industrial control.	
	
Refer to:	
https://sunplus-tibbo.atlassian.net/wiki/spaces/doc/overview	
https://tibbo.com/store/plus1.html

Li-hao Kuo (2):
  I2C: Add I2C driver for Sunplus SP7021
  devicetree bindings I2C Add bindings doc for Sunplus SP7021

 .../devicetree/bindings/i2c/i2c-sunplus.yaml       |   72 +
 MAINTAINERS                                        |    7 +
 drivers/i2c/busses/Kconfig                         |   10 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-sunplus.c                   | 1483 ++++++++++++++++++++
 5 files changed, 1573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
 create mode 100644 drivers/i2c/busses/i2c-sunplus.c

-- 
2.7.4

