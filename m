Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7E06495B27
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 08:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379159AbiAUHuw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 02:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbiAUHur (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Jan 2022 02:50:47 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C5EC061574;
        Thu, 20 Jan 2022 23:50:47 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id h20-20020a17090adb9400b001b518bf99ffso5385566pjv.1;
        Thu, 20 Jan 2022 23:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=FpJyz+XUZ1Dl+m0JA81xZXJcxYu/bYyKhAsEoQnNP+A=;
        b=VR1FxGtJOhc5MIxJyPpqTIzBSGpc9RdoFOP+3UWttplkg5TSCo/KQKi3g6+fezKxTF
         Jw0X1pIxCsVMUsvUlVbISRZSrw5SDqY5IRnLAlBFnY6BfOr3cj2aRbYb4y84IwtNR6XL
         nGvP+vafAG1Rj2mf3otAT88JxVWk1+wvMKT5Uy5W0WDIPe1cR+FD6HPwZp9q8KTtUgtc
         RfJCnco/r3rUiPuP0+SJhUXpSlGmxBFlDCM3IiZk9iyIUyUS53LkxUZRQDLH4ZEANujw
         7hDw5pd63pUsXs+WTg/MZ7c55XJMrKRWDSBPn8edd9gJfrT27Md/6L2Ghoa4XwlAk/op
         VuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FpJyz+XUZ1Dl+m0JA81xZXJcxYu/bYyKhAsEoQnNP+A=;
        b=XptquleKoEVT3zUbdmcuhyvxGVgXDvSPmogcCCSQhdfWzlAWaQrLDei0XyAqm0V/RA
         Wi7hgYmKUVbF1uDIdYgiUKLrmW0psf266Q0nW50W8NhH6HGuGQzPgfudIcLXJCjQDR2r
         9q8qh50wuUeqMrvGQPrJ2yewX10ZN46dVWlpsJbslQULR9Ngqgfzk0i6TJubBy5q4j4G
         zJZ4zb7OFZhdtHhMp3pAfMnDdFZcQeChtxOnG/RoEpE/cGMuNJg6paV5uT5jHJlzWEfA
         WOaNRNTN+I0H9ZquTnUTzgyopZ0eqaQ7KPic5iazplta+bstvXXG8SGj0CrDeYpRzweI
         eLQw==
X-Gm-Message-State: AOAM533zTlgyEtkcYla+fbmoldznZy5a8MsAyNCyw6P/Fs7LLBEuKjEg
        /I6+gni3zoJv67qu3HSODbE=
X-Google-Smtp-Source: ABdhPJxlIsoCRXr6F/913JXoTIqHdgrf7BICygpxTs7f863u5Xva94hH9eEykPiwmrqRYiUjV5TOXg==
X-Received: by 2002:a17:90a:1196:: with SMTP id e22mr3385668pja.241.1642751446315;
        Thu, 20 Jan 2022 23:50:46 -0800 (PST)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id n35sm3353873pgb.25.2022.01.20.23.50.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jan 2022 23:50:45 -0800 (PST)
From:   Li-hao Kuo <lhjeff911@gmail.com>
To:     p.zabel@pengutronix.de, daniel.thompson@linaro.org,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lh.kuo@sunplus.com, wells.lu@sunplus.com,
        Li-hao Kuo <lhjeff911@gmail.com>
Subject: [PATCH v4 0/2] Add I2C control driver for Sunplus SP7021 SoC   
Date:   Fri, 21 Jan 2022 15:50:54 +0800
Message-Id: <cover.1642751147.git.lhjeff911@gmail.com>
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
  i2c: Add i2c driver for Sunplus SP7021
  dt-bindings:i2c: Add Sunplus SP7021 schema

 .../devicetree/bindings/i2c/i2c-sunplus.yaml       |   73 +
 MAINTAINERS                                        |    7 +
 drivers/i2c/busses/Kconfig                         |   10 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-sunplus.c                   | 1447 ++++++++++++++++++++
 5 files changed, 1538 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
 create mode 100644 drivers/i2c/busses/i2c-sunplus.c

-- 
2.7.4

