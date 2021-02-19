Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2889F31FD39
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Feb 2021 17:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhBSQiW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Feb 2021 11:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhBSQiV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Feb 2021 11:38:21 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4AACC061574;
        Fri, 19 Feb 2021 08:37:40 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id u20so13866355ejb.7;
        Fri, 19 Feb 2021 08:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AxDOoX1+HSXKB9ie2you/BA5LCaVgw1Kvap9mhTEFWk=;
        b=cgbsrO82FSlY96OtyaZZAZiWkp0liGj/e3NbzhvM/TnKM5wP4GSLjyt6oO4UsmsKJ/
         fsmJUrSGHYt5+RPdOUNJddvvqfqCLTQkPCCDV/uJLPaM02o+LD37HtgaquLgjGQXDztv
         PToYhaFA2OKxfX0n2HkH+GxnPAJDr6PNAfyO4RvNHyWUPnRZU2jK9xl11x7yMHwKmvse
         D8a9syhhjoYZElzislxNGN13lKfyANwzgR3EwWEo4hWu14Pj5A6mOGr3wP7+RiHmCj0B
         1LyQmC73r5VOQnpfl0XR9JFf5TMfdEigQrhgskpFwhyPP12x+IhI6+sJLtCO28NwLgNo
         VFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AxDOoX1+HSXKB9ie2you/BA5LCaVgw1Kvap9mhTEFWk=;
        b=DzwubniSOJTRRTmcS1+9O95G0sHiL+eMs1GGHubw4JS/Y8VJ9jRSdLvSRJrxZMe4lP
         eBGjqSNOOZGoQu8VzUHnF0bcDqGLJ8o+hP/42lLaEOFiMFFMIKaMFxpCLqMMZJtbY/rZ
         QiVEihZkdlplVfbWNIVGBC+ZnSWRWfHRATrZBM2zsuKzXSkohGnOQYEzQlkN6iDodFBD
         ie9qbr7RGYk3klELN4Xi2363u/AGJHxTwI934910+jDuJncZX7FHgr4jN1B2IF0kD+Y3
         5uqMW0CKa7zZ+X72hCenE/LHEgSB0ZOWbrpIbpIi1u3eIWQz+/No7OlfzYm/GBbL8aeq
         ri3g==
X-Gm-Message-State: AOAM530WZ1LYns2Su0kQSElA+XXY1c8eTpkAuK60UoayEImyEaDBXFRD
        Gb0JVw2x2FzhrhODDbC67cI=
X-Google-Smtp-Source: ABdhPJwwSlfREo4CE8mIoJeHiW3OKuzBEaWeeos8ANfJJghfJQ0ZG4eb9luwHSoLKBi1xXJw6UGYDg==
X-Received: by 2002:a17:906:2892:: with SMTP id o18mr9343854ejd.220.1613752659560;
        Fri, 19 Feb 2021 08:37:39 -0800 (PST)
Received: from localhost.localdomain (89-139-118-26.bb.netvision.net.il. [89.139.118.26])
        by smtp.googlemail.com with ESMTPSA id t9sm4668649ejc.51.2021.02.19.08.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 08:37:39 -0800 (PST)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2 0/1] HID: ft260: add usb hid to i2c host bridge driver
Date:   Fri, 19 Feb 2021 18:36:43 +0200
Message-Id: <20210219163644.2811-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The FTDI FT260 chip implements USB to I2C/UART bridges through two
USB HID class interfaces [1]. The first - for I2C, and the second
for UART. Each interface is independent, and the kernel detects it
as a separate USB hidraw device.

There is no I2C master/host driver for this chip to date, and FTDI
suggests using hidraw and libusb userspace libraries to operate the
FT260 I2C host controller via hidraw Linux kernel driver. But this
approach makes the standard Linux I2C tools useless, and it does not
allow the I2C sysfs tree instantiation required by I2C multiplexers
and switches.

This commit adds the I2C host adapter support, enabling a wide range
of the standard userspace I2C tools and applications that do not
implement HID protocol, accessing the I2C client devices via FT260
USB to I2C controller.

The driver was tested with various I2C client devices like PCA9548,
PCAL6524, 24C0x, different QSFP-DD and OSFP transceivers, and Linux
userspace I2C tools (i2cdetect, i2cdump, i2cget and i2cset).

HID commands and responses are FT260 specific and documented in the
AN_394_User_Guide_for_FT260.pdf [2].

[1] - https://ftdichip.com/wp-content/uploads/2020/07/DS_FT260.pdf
[2] - https://www.ftdichip.com/Support/Documents/AppNotes/AN_394_User_Guide_for_FT260.pdf

Changes since v1:
- Refined the cover letter content.
- Reduced number of debugging messages.
- Removed unused ft260_request_report structure.
- Relocated module build rule in the Makefile according to
  alphabetic order.
  
Michael Zaidman (1):
  HID: ft260: add usb hid to i2c host bridge driver

 MAINTAINERS             |    7 +
 drivers/hid/Kconfig     |   11 +
 drivers/hid/Makefile    |    1 +
 drivers/hid/hid-ft260.c | 1053 +++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-ids.h   |    1 +
 5 files changed, 1073 insertions(+)
 create mode 100644 drivers/hid/hid-ft260.c


base-commit: abaf6f60176f1ae9d946d63e4db63164600b7b1a
-- 
2.25.1

