Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C957428DD
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 16:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409282AbfFLO1A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 10:27:00 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52032 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407783AbfFLO1A (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 10:27:00 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so6817983wma.1
        for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2019 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=9RG/fmGuMFz1uOaOz5ph/6qVFWhsvvm2ZWfHtq97fow=;
        b=U3aIc/V9L3ZOTcT3ZWJ5NsF/6YJWWwbbm7Swu0+HXiDryJ0hzaoC0d599o5c02/wfB
         txsPmg5vnRsDnpHii3K7CcH9tVtBuEIkdV9yk511gxV2IUu/hByTGdjLnEToK/XiJHE7
         bYZcR54RCc6PrTpqyWwk7GJrQbSS5LtM+vafuV6wypMDmfZcQoFrz6K6R8I+ykp0Rt4y
         8lM3cxTB+ITbOMGxQ5pXG+QdGDoe6vDIeH6USCgqcUPtBUcR0QdM8FBxohykFAa8lpM/
         MY6HXggENdNPtU2hgdyGDNiA19XvUd6/l3/AKJjHZikq1HOfB80J0UWPwDChonFerPvx
         eX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9RG/fmGuMFz1uOaOz5ph/6qVFWhsvvm2ZWfHtq97fow=;
        b=PvOTbqnqECvjOc/7TiGNCRubJvaELugN8PDzcjru/fX3xOuMk4Pi5OIU2NV1oeZ6qt
         yk7KV3xHmllrufRpuDcwFomci5c7RAdDAa7HFXSIxuK5w1P44HewJJSUKh+srLAdMuoL
         P6TphC31nmLjbqcW6imXHynhbY33Yvi4byeL1xCLysS+SRb1sSMGfzBPtqhakCXfk6Gq
         CLQYr0WrlKP7Bg/iZeKcl4H9I7Dip38Qp04RjAG22DKTi6/HaMdf4IiMv5kTMXAE/Rfj
         6NTtmrXvJG/NgC/D4sCHLxn1/1yq34JiJ9niG34MesUeS9uVuo6uejL/z8vSd82pxc0R
         cGYQ==
X-Gm-Message-State: APjAAAXBBOrMrwGKS2/RLs1o/oS6yd8Cwcstka69iqnQTDUw531uszkc
        ju9b9XdUP+CCBpAzLLyoHc1/wQ==
X-Google-Smtp-Source: APXvYqy1cLtAIc09aYE/pTZ4C8baAoSIE+X5aqrXpGYtR24fXNVBaYjQ4r2OFfrIZUCykHgpUQaBCA==
X-Received: by 2002:a7b:cb84:: with SMTP id m4mr23894630wmi.50.1560349618344;
        Wed, 12 Jun 2019 07:26:58 -0700 (PDT)
Received: from dell.watershed.co.uk ([185.80.132.160])
        by smtp.gmail.com with ESMTPSA id y18sm203959wmd.29.2019.06.12.07.26.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:26:57 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.or,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v4 0/6] I2C: DWC3 USB: Add support for ACPI based AArch64 Laptops
Date:   Wed, 12 Jun 2019 15:26:48 +0100
Message-Id: <20190612142654.9639-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch-set ensures the kernel is bootable on the newly released
AArch64 based Laptops using ACPI configuration tables.  The Pinctrl
changes have been accepted, leaving only I2C (keyboard, touchpad,
touchscreen, fingerprint, etc, HID device) and USB (root filesystem,
camera, networking, etc) enablement.

v4:
 * Collecting Acks
 * Adding Andy Gross' new email
 * Removing applied Pinctrl patches
 
Lee Jones (6):
  i2c: i2c-qcom-geni: Provide support for ACPI
  i2c: i2c-qcom-geni: Signify successful driver probe
  soc: qcom: geni: Add support for ACPI
  usb: dwc3: qcom: Add support for booting with ACPI
  usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
  usb: dwc3: qcom: Improve error handling

 drivers/i2c/busses/i2c-qcom-geni.c |  17 ++-
 drivers/soc/qcom/qcom-geni-se.c    |  21 ++-
 drivers/usb/dwc3/Kconfig           |   2 +-
 drivers/usb/dwc3/dwc3-qcom.c       | 221 +++++++++++++++++++++++++----
 4 files changed, 225 insertions(+), 36 deletions(-)

-- 
2.17.1

