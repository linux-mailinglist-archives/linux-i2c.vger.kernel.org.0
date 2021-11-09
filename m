Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE62C44A71E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 07:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243329AbhKIHCP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 02:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243332AbhKIHCO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 02:02:14 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85D5C061766;
        Mon,  8 Nov 2021 22:59:28 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id o14so19228871plg.5;
        Mon, 08 Nov 2021 22:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=406K+ivMcMW+jETknQGB5NJu1cV6OpudZZ5rUg2MBsc=;
        b=mctdieHtm0NCuyU9NmOPo8fRCtCESxeu+IwW9MG3dskhj4EzJKi4Je2UoGc8/PMKSZ
         tZYSIDtdWAH5LIswVieIZdPO/TaSrb53egu+JAurDOFKIxzpSauYD0GKiJ5iXL5EFnIs
         KwpUTwKjwhVHnPTazjlnCw2J3K85373i0eScAvbkehrHok7E7+FEtRCVjfeiFH+Mgx/t
         2fhdHDWwOFBrw2v/n87kzyLfEKMWlNthdqWZpjFA+Uf5sNdz5uakjrl4WPJHBdUtREPA
         XCbwSWKYUzjQqKYcvTA+1QZRMQULo41Y/sjS05I+QT39ouuVuduEOQyftqMwXpaEAzf5
         yftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=406K+ivMcMW+jETknQGB5NJu1cV6OpudZZ5rUg2MBsc=;
        b=gTQxLgD6WVpwpr5eaxijm1+SsLbLQn7W73mAHwaO/tAV67+7/uTCG3QqsZjXNqydlo
         QyRtOnp1i4QT5SGU067GPYJFLDLeTAELcR2hCU70OLb06l9iKc/Gp3Z/8yMCndQ59Ioh
         dtnWe5Cqbe1D3zQXHYI0W1aYnfx4TVYGxcBl2e9slzleNDtcvhb4UQZH+YhWVEds3xyS
         gonWKJs5QHSTN/Ws4oiZ7z93392lz8JZ37/x5LKIJgfZXxz260d4ejaKjPd5L3Z+Bxdq
         +FzGKxYJ7Ijmmbl/T1nCN+yNIJ0+q62CyYpijVAkoFK17ZSamNKva51Hi10IimzqkMAp
         golQ==
X-Gm-Message-State: AOAM5333dVLdh6EeZFaBxiXXRh/hSqAefU7CGr5VOj4T+SVEduHsvInr
        SsdXM8lq0umeLcvCO5yhxWc=
X-Google-Smtp-Source: ABdhPJzRDAtEo5VtkM2rBjlDtzFON05YgRpGbAxzGww9a00TRcQvTjTQXmWHih7EQSeICiljrvofyQ==
X-Received: by 2002:a17:902:d50e:b0:142:1b2a:144 with SMTP id b14-20020a170902d50e00b001421b2a0144mr5028622plg.51.1636441168248;
        Mon, 08 Nov 2021 22:59:28 -0800 (PST)
Received: from scdiu3.sunplus.com ([113.196.136.192])
        by smtp.googlemail.com with ESMTPSA id ep15sm1929586pjb.3.2021.11.08.22.59.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 22:59:27 -0800 (PST)
From:   "LH.Kuo" <lhjeff911@gmail.com>
X-Google-Original-From: "LH.Kuo" <lh.kuo@sunplus.com>
To:     p.zabel@pengutronix.de, daniel.thompson@linaro.org,
        lee.jones@linaro.org, u.kleine-koenig@pengutronix.de,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc:     qinjian@cqplus1.com, wells.lu@sunplus.com,
        "LH.Kuo" <lh.kuo@sunplus.com>
Subject: [PATCH v2 0/2] Add I2C control driver for Sunplus SP7021 SoC
Date:   Tue,  9 Nov 2021 14:59:24 +0800
Message-Id: <1636441166-8127-1-git-send-email-lh.kuo@sunplus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635496955-13985-1-git-send-email-lh.kuo@sunplus.com>
References: <1635496955-13985-1-git-send-email-lh.kuo@sunplus.com>
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

LH.Kuo (2):
  I2C: Add I2C driver for Sunplus SP7021
  devicetree bindings I2C Add bindings doc for Sunplus SP7021

 .../devicetree/bindings/i2c/i2c-sunplus.yaml       |   82 +
 MAINTAINERS                                        |    7 +
 drivers/i2c/busses/Kconfig                         |   10 +
 drivers/i2c/busses/Makefile                        |    1 +
 drivers/i2c/busses/i2c-sunplus.c                   | 1700 ++++++++++++++++++++
 5 files changed, 1800 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunplus.yaml
 create mode 100644 drivers/i2c/busses/i2c-sunplus.c

-- 
2.7.4

