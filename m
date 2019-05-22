Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621FD25FF5
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 11:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728584AbfEVJAW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 05:00:22 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37371 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728542AbfEVJAW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 05:00:22 -0400
Received: by mail-pg1-f196.google.com with SMTP id n27so990665pgm.4
        for <linux-i2c@vger.kernel.org>; Wed, 22 May 2019 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=M/dXEAziti11+FvXEXzwN3m+bojHGjlx1XnERvN29LU=;
        b=co4p2RLqrxuL8lSUuID/P22fcyaxeRRgB3URvx4DJ20nD6KJz9f+2uZy+xsa++EQFh
         ywIqthdr1stLYsdfRIFZU6Ne3OTXKtQQ0v2Z7hg9aoMZErhvoYokU6LsOLkm2itAiANY
         PHUxSEUrI0hpBIWQn+QK0Y2/jnqO6s25sg1sNmUCzsrFAt3E/21dSjYfunx/m8Vimajk
         ThS3nNY5+nkcs29TYnN2I/1ac2SeZ1UmoXJFmrghMmNJrIi8McJgAOxQ78sC4NA8eD72
         nWs+H/lQTasqBOocE+IUBJoY0HSBQ3vrYKz5ml5DgOvpV9NcGCZeQXIeVE460IzJErbi
         HjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=M/dXEAziti11+FvXEXzwN3m+bojHGjlx1XnERvN29LU=;
        b=mzLOaEOBeg/L6ea8CyFw+WMzSYhVww3BO3xNwy7TDaWzcHGAp2taNcKJ3v6nW/IXlz
         NLqNKm8Jc0PZ4Zz+yJdR3KQf7dTd31JDh+9dvduTYk9VNeMaH1xYEWr0p1v/+Up5ZcXb
         VmOuplGHEYTMLKZuAwrRHLykoa+i8ToPQ4vaKbYZ6mn4aMytjnT0BWqOync6KqJ4rCLY
         q7ct/J7Guir+dQEL66XOJ4J2XBC4zQXIzm6iKJLQ4+64LpcDqyFXoyRF+h6Nf7Y8HCgj
         axWvcQYuQstypp3+gpt92AvrxG+WVrqmLh3s1omWO4gdLIza2thK8B+XjAnBU/nOu9t4
         vuow==
X-Gm-Message-State: APjAAAWnZOwdZx/cmZ1KmPNF64tJktR4cinfvSLP3Y28j29YPq+ueniY
        KEK5O89Y2ljwKk6p4VeKNN5lRQ==
X-Google-Smtp-Source: APXvYqycp6Q2qsp5lrcfut8xaYp5vitvUL2aApTymSt6rk/UtSFVxOYK6EKnpNc3Q0KGbC8bq2zvcQ==
X-Received: by 2002:a65:6450:: with SMTP id s16mr1908023pgv.414.1558515621798;
        Wed, 22 May 2019 02:00:21 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id z6sm42465905pfr.135.2019.05.22.02.00.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 22 May 2019 02:00:21 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/3] dt-bindings: i2c: extend existing opencore bindings.
Date:   Wed, 22 May 2019 14:29:32 +0530
Message-Id: <1558515574-11155-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
References: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
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
index 17bef9a..db96951 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
@@ -1,9 +1,13 @@
 Device tree configuration for i2c-ocores
 
 Required properties:
-- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
+- compatible      : "opencores,i2c-ocores",
+                    "aeroflexgaisler,i2cmst",
+                    "sifive,fu540-c000-i2c","sifive,i2c0".
+                    For Opencore based I2C IP block reimplemented in
+                    FU540-C000 SoC.Please refer sifive-blocks-ip-versioning.txt
+                    for additional details.
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

