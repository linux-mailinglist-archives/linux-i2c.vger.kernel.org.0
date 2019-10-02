Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96CB2C4862
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2019 09:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfJBHU5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Oct 2019 03:20:57 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50850 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfJBHU5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Oct 2019 03:20:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so5938736wmg.0
        for <linux-i2c@vger.kernel.org>; Wed, 02 Oct 2019 00:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P8FodZSxtce/9VbKtIxl8y+chzA0F3ci9cGAB2QwiVA=;
        b=XU5TSTRzztZCfDtqzfe7LtjkiX2LxGtZy0/TpyNMpWmwxkl+yCZZMGHT1r+8L19cWp
         Qmxgw/1gpclM/V1M0uJlsVr6BOoBiWe8cva5Pb3wnlPKKTpwrrrdRp2J+U5AtQMWeb9G
         wAGdAuJif6QYDLIUd3q2zaq1L4lFPCRbrRzYlFc8TvMeCpG+4OJFaJvYL4tXp/OvsWBZ
         qinBB0p/YP0ya6k/46fyOUQyKiPuPKNEqBet4e3oCtljlbyXAvZATFdl2jGDnKA2/QcN
         XSQxHJOJIBs067Ac6vJqq8rYgBZmlX3f9yGCO7vuna6h6yDOhF3yWqCwrQ9gi93deCBc
         Ii/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P8FodZSxtce/9VbKtIxl8y+chzA0F3ci9cGAB2QwiVA=;
        b=RRToDP4LnA0mBYesqUqKWr0OCklPHQEpxhG9NkfFr1/J3xu2EgIoSNkvSl+qdpQQB/
         1bCUoG+a3FdPmNGd6zbIR2FvCrQj1St+zEEMU3xBCIkt7yQlBjtf/YjOrMRFTfJA9a+i
         sKQmdCHTeBghYvcWNP0H5pD2PgMhXV/M2aiat093rAt1emJ7vKkQ0aZTSDT27V+PchOZ
         IGq0cDYOSZDbTNz86usWhN464ChhrZuS/V4kxCkTDXzIlQNKSK2yplBHMOdG8OVb6X44
         /mCgqyFgUaEPXAPWGK762O4FiHU2vNXx0LWPyVnf2I3p1youAupOYJdjypFMrAgIg7ui
         kjuQ==
X-Gm-Message-State: APjAAAXOVGg3dGpoIlmcBBuKgV5nbi+zSqbYvCcIKZdw/OLFZBExEYal
        7S829B0kq/9pwAKJzTp25v1agQ==
X-Google-Smtp-Source: APXvYqwpmmYPeIWFm5Mj5G5MRqI9fjHcBbdi1XfHC6f/7VKAtRbHeKSKd+0gQv+rgNHvnNitkiKcrw==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr1607834wmj.121.1570000854142;
        Wed, 02 Oct 2019 00:20:54 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id n18sm3850640wmi.20.2019.10.02.00.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 00:20:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Rosin <peda@axentia.se>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 2/2] dt-bindings: at24: add new compatible
Date:   Wed,  2 Oct 2019 09:20:47 +0200
Message-Id: <20191002072047.20895-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002072047.20895-1-brgl@bgdev.pl>
References: <20191002072047.20895-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

arch/arm/boot/dts/at91-dvk_som60.dt.yaml uses the compatible string
'giantec,gt24c32a' for an at24 EEPROM with a fallback to 'atmel,24c32'.

Add this model as a special case to the binding document.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index c56f27fde3b3..e8778560d966 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -107,6 +107,9 @@ properties:
       - items:
           - const: renesas,r1ex24016
           - const: atmel,24c16
+      - items:
+          - const: giantec,gt24c32a
+          - const: atmel,24c32
       - items:
           - const: renesas,r1ex24128
           - const: atmel,24c128
-- 
2.23.0

