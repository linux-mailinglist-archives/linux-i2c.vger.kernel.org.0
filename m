Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1012731A890
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Feb 2021 01:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbhBMAEH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Feb 2021 19:04:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231977AbhBMAEB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Feb 2021 19:04:01 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C430C061756;
        Fri, 12 Feb 2021 16:03:20 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id l12so1811293edt.3;
        Fri, 12 Feb 2021 16:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jq2Xmh4pkVtak+Gm3s4V3U7P6sDJYHZgeNfNcYHeOyc=;
        b=AlP+yW1OiHRgoGJBLvQMCisbKMf67PEmBEp4emzb+qYmlAV40f6jFfNtqpEPvfl3b8
         DXxWVSN+5K8/2MSoJG9pSbGo1r5IESKvkd7s63+RKttYfW3bZgVJsdb3Q61eJ7SdSuk5
         ygNk38CyHhDVUP6YOmGGJAwb+omkXnOZazKOjUkP9QWwnzoNYQk7T6veS+9/++MGIwyJ
         aZQsoGlDwTor0yiYF7mvYYSWDre5F61xrnMSV8RRpHAkFwwGHVO/hGi+ZVdcn2V94C7O
         8c5wgY9mHHNaDorbSt6ahC0sV06T4N6vX+Tu/aT9hVKejvnHt0M4S02qA6Q7haybB1xq
         GSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jq2Xmh4pkVtak+Gm3s4V3U7P6sDJYHZgeNfNcYHeOyc=;
        b=L1HTAn8V1RFCER0kt2uFcdX5Fzz7wVSEfMDYOU94ht2qwdzxUgfQmi8rayUhBWGGyl
         z/ncbubJOMaMBIJaXlLAsdEXHQvPyMPr/uPOOyqpuMxFp9YA1VJekRn3WFhe9q2HBHAm
         Yjh6hUd0d9719Kx5SBN89vIPhXZZRK2o6ZoWOd+qY7Fi4fxFLmHD+W46Q6drxNrDLZir
         zjgaGmykbrU/fCp8+CpE4Thrr3m/Nc6gZ7zLi8FvrUqila/PoTmT7oD0mwua3IeLwoGu
         6RAiROhdUX1YDnx/D8r4+j0jI9zLv3JAa3mpz0zT+ELpycmS4y59kTKyLUZH0cF+z9xN
         xDDA==
X-Gm-Message-State: AOAM5338+urptWpQUJduDpev9HR8f9gxHYJNExIOOqA6HrGroOTta4YC
        fM7Ko/vk2kUxpFVUGnBFueQ=
X-Google-Smtp-Source: ABdhPJzU2mKAEa3jHaukRTI/pZwoEeDb8+WA2tmcoJ2Ay5QSrhEdoH1rXdQbrQLhBTUqJajR/5SmWQ==
X-Received: by 2002:a50:9e01:: with SMTP id z1mr5809641ede.44.1613174599256;
        Fri, 12 Feb 2021 16:03:19 -0800 (PST)
Received: from localhost.localdomain (89-139-118-26.bb.netvision.net.il. [89.139.118.26])
        by smtp.googlemail.com with ESMTPSA id hb38sm6602567ejc.75.2021.02.12.16.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 16:03:18 -0800 (PST)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH 0/1] HID: ft260: add usb hid to i2c host bridge driver
Date:   Sat, 13 Feb 2021 02:02:33 +0200
Message-Id: <20210213000234.14948-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The FT260 is a USB device that implements USB to I2C/UART bridges
through two USB HID class interfaces. The first - for I2C, and the
second for UART. Each interface is independent, and the kernel
detects it as a separate hidraw device.

This commit adds I2C host adapter support, enabling a wide range of
standard userspace tools and applications that do not implement HID
protocol, to access the I2C client devices via FT260 I2C controller.     

The driver was tested with different I2C client devices, Linux
kernels, and Linux userspace tools.

For data transfer, the FT260 implements one Interrupt IN and one
Interrupt OUT pipes per interface. For configuration and control,
the FT260 exposes the HID class commands through the Control pipe.

Commands and responses are FT260 specific and documented in the
AN_394_User_Guide_for_FT260.pdf on the https://www.ftdichip.com.

Michael Zaidman (1):
  HID: ft260: add usb hid to i2c host bridge driver

 MAINTAINERS             |    7 +
 drivers/hid/Kconfig     |   11 +
 drivers/hid/Makefile    |    2 +
 drivers/hid/hid-ft260.c | 1097 +++++++++++++++++++++++++++++++++++++++
 drivers/hid/hid-ids.h   |    1 +
 5 files changed, 1118 insertions(+)
 create mode 100644 drivers/hid/hid-ft260.c


base-commit: 07f7e57c63aaa2afb4ea31edef05e08699a63a00
-- 
2.25.1

