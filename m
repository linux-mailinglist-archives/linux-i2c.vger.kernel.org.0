Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 246082D4B6
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 06:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfE2E1w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 00:27:52 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42947 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbfE2E1w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 May 2019 00:27:52 -0400
Received: by mail-pl1-f194.google.com with SMTP id go2so474199plb.9
        for <linux-i2c@vger.kernel.org>; Tue, 28 May 2019 21:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VetgGylyMhr4faiTsP3IkOZ01cl3HVxVutPYPa26WFw=;
        b=YCI/XvhaGPJ7TmU8ldM2Xiu7Sh5/fXXnNA9bmCOl7ZIuBAdSaQuJ0qTMrVAi6dS8cE
         hgzEQ+7nnc+Ib+oTs/kaB4+p3mIPY/UnCqH3ktfpjpZP6MIW6zJfHsZXSROcfWnemq1S
         n/FqoA91MHsRZmaLfRltVvMQsP3O0oa8SdyZH8sooMhpNBUZCeB3fiGn+1S8KdzPUbAg
         Zj+QCpCxhI25Z5dJlRhGsq/B6xN5MAtuDt6vDbncx6c4BSWKbu7qR8/ya2v7Db6rP2ht
         k5psu3BKr7qFpV4qSM5M1reCj18bPrQ0oGK8TAfPo0mWMcSUZiVT0GWeb+PTcqu/ZCO/
         kCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VetgGylyMhr4faiTsP3IkOZ01cl3HVxVutPYPa26WFw=;
        b=byXwsaq/rqlYktIwfzp83SeiXprw3FEdT5mGCri+fR9550vyzeyGxrnSq5BrvHCYKT
         uLQ2RYblwrCu63WXVeQ71PQMuc9GNQ8mpD1koluo5dxz8UUE6G9wyHyFTdmoISPihxEv
         ZpFL/L6CfOjTkgMPqeuXWDKGF745+BG4akChU3Tywj5w6attpVaW2KX8Dhm6PJfsNKMH
         kA0hTSwsIk428tS/mFWW99H+s4J8dpzBnh6MjnTY6812NO2bvt6FuctgzmTQdCY34dhJ
         1Bwl6WIPnJGJCUruXzSE7LXmZjTjaKNrOo+KxcFW2FKEyJGpAZExR3H4eWfbZ/aD6CSH
         acZQ==
X-Gm-Message-State: APjAAAXPo3r3MBBUzZI+a0CYxhWPtaF2R9c2UFDA31FIQyrlV3vsDhiz
        kNcSqqEKnbCCvNGE4RX5l7Aaeg==
X-Google-Smtp-Source: APXvYqySQTPpfRRsC63EkVn7ZXSsmxs4VnZ/ZeJW0HreR+7K2ltwfEbu7JRhq0dcxVg0Qxrz60uPEw==
X-Received: by 2002:a17:902:aa85:: with SMTP id d5mr138422120plr.245.1559104071820;
        Tue, 28 May 2019 21:27:51 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id c15sm16444591pfi.172.2019.05.28.21.27.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 28 May 2019 21:27:51 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/3] dt-bindings: i2c: extend existing opencore bindings.
Date:   Wed, 29 May 2019 09:57:25 +0530
Message-Id: <1559104047-13920-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559104047-13920-1-git-send-email-sagar.kadam@sifive.com>
References: <1559104047-13920-1-git-send-email-sagar.kadam@sifive.com>
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
index 17bef9a..6b25a80 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
@@ -1,9 +1,13 @@
 Device tree configuration for i2c-ocores
 
 Required properties:
-- compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
+- compatible      : "opencores,i2c-ocores"
+                    "aeroflexgaisler,i2cmst"
+                    "sifive,fu540-c000-i2c", "sifive,i2c0"
+                    For Opencore based I2C IP block reimplemented in
+                    FU540-C000 SoC. Please refer to sifive-blocks-ip-versioning.txt
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

