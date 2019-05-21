Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2873425057
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 15:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfEUNdS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 09:33:18 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32928 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbfEUNdS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 May 2019 09:33:18 -0400
Received: by mail-pf1-f196.google.com with SMTP id z28so9121714pfk.0
        for <linux-i2c@vger.kernel.org>; Tue, 21 May 2019 06:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1nncQI8i+UzrmjnlsMRQHRUYfFHMZeTgvwjX0KHzdBA=;
        b=f26zEdbOr6/dfMG4dZ18wDImXn+s/c9tAyneJjTEQ8q4wwuCQOoRV0s9WNWLE5TY/+
         6FPXNnznDxFmhxUkuG206BsU1sCn29p1+zIGX1OiapFO5QTKyhVUB7T9pxTo1gsoMxF2
         snSehzN5j/TwJbSUF0HFLSHe70+I34quFmDL9NC7ctWrpgKRM5kX9le0izOaUO0GdYXR
         mMkX6faXXaiQrFZAn4GgylFDFlhz239Tc/xJouGdAs3uTuibqre29yXkcDaro6ZLYGHQ
         xpC2SE/ixcmNRq47e4XR/hQxVwhh5a5TW2CE8szYNM5qHM1UgCbBRXhYawPXuRhmT061
         AogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1nncQI8i+UzrmjnlsMRQHRUYfFHMZeTgvwjX0KHzdBA=;
        b=DZz6awQWkh7jwE7YodRgBu1CwtKkwxKLlySSUwd8zbNH7fRkTxVGvDA1No/i8iCZN7
         6DZobJJ0yUqtn7UG0Al/pNP8M16fs2AWyRdhlDc5uBcEUglcb1TtQzhQj+yYQH3GznP4
         0vP87BI1srrkNwjk5xJj26Uh7FKsprLrwFLQUgbzco4RZCtNKr/QgBSn09/+RgsSwFu3
         9nSwZLl0rBYvdbDns3bd/2aBvnheuGcfalGHfFDgDFaDeY9Tlzhs7bqyj3weLZl7+Pca
         R9I8MLzL2BI82ZrF0mDrjbDU3vssRxvpOqVu7Q6I57Q0vXtByzgd0D5xh7Zu9B98ujcW
         ijvw==
X-Gm-Message-State: APjAAAUXtkXIkR3I3gjRGRAsoqhUA/hchXB00MvWcEOSn9tliKNjuc0m
        m0JCnJFiHdwqLPHamiSQLctHip1TDdiQWw==
X-Google-Smtp-Source: APXvYqz+cNDOns4a+HlYUkMCadstIOBWgdjWKopWeJjmo4sMLBkDSX21RNmLsVKKcrIEMBu95K3+Og==
X-Received: by 2002:a65:628b:: with SMTP id f11mr78696250pgv.95.1558445597973;
        Tue, 21 May 2019 06:33:17 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id d15sm65368906pfm.186.2019.05.21.06.33.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 21 May 2019 06:33:17 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: i2c: extend existing opencore bindings.
Date:   Tue, 21 May 2019 19:02:52 +0530
Message-Id: <1558445574-16471-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
References: <1558445574-16471-1-git-send-email-sagar.kadam@sifive.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reformatted compatibility strings to one valid combination on
each line.
Add FU540-C000 specific device tree bindings to already available
i2-ocores file. This device is available on
HiFive Unleashed Rev A00 board. Move interrupt under optional
property list as this can be optional.

The FU540-C000 SoC from sifive, has an Opencore's I2C block
reimplementation.

The DT compatibility string for this IP is present in HDL and available at.
https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
index 17bef9a..6ac062c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
@@ -1,9 +1,13 @@
 Device tree configuration for i2c-ocores
 
 Required properties:
-- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
+- compatible      : "opencores,i2c-ocores",
+		    "aeroflexgaisler,i2cmst",
+                    "sifive,fu540-c000-i2c","sifive,i2c0".
+		    For Opencore based I2C IP block reimplemented in
+		    FU540-C000 SoC.Please refer sifive-blocks-ip-versioning.txt
+		    for additional details.
 - reg             : bus address start and address range size of device
-- interrupts      : interrupt number
 - clocks          : handle to the controller clock; see the note below.
                     Mutually exclusive with opencores,ip-clock-frequency
 - opencores,ip-clock-frequency: frequency of the controller clock in Hz;
@@ -12,6 +16,7 @@ Required properties:
 - #size-cells     : should be <0>
 
 Optional properties:
+- interrupts      : interrupt number.
 - clock-frequency : frequency of bus clock in Hz; see the note below.
                     Defaults to 100 KHz when the property is not specified
 - reg-shift       : device register offsets are shifted by this value
-- 
1.9.1

