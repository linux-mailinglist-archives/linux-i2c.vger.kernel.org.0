Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15C9C319D9
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jun 2019 08:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfFAGLo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jun 2019 02:11:44 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42886 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbfFAGLn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Jun 2019 02:11:43 -0400
Received: by mail-pf1-f193.google.com with SMTP id r22so7470963pfh.9
        for <linux-i2c@vger.kernel.org>; Fri, 31 May 2019 23:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VetgGylyMhr4faiTsP3IkOZ01cl3HVxVutPYPa26WFw=;
        b=L+8y5kH6etF8yWqZIfrxPcn7SDSUmFvtroYhlOS75cnuezAp0sSlbUpeXkKAuNm1Ou
         wFCPL1ZfLHMkWp1VacPzEOrPkmrtnZuF3FYhqLvcX6TKw8TzOaiyjni5+E+j3Frwv3Fu
         D5iWxaiY92NEkpn97ZS5iARxvYS+odyy1HAZVG6KKAZiIw1e3sXQEVu0A8ER+C9sgUBF
         HjkOHgX5qAZCf2P/D5Aj9sv08mG+/lpFpQdDjbY8O/1bInXAufnz56NQzzfe9H9pmt+E
         ++63EZjeoQg5JaASocYveM+Oy1Iqgp0HuIAziuSua6dandhnhr5Bs/gvxiC7PTh4b7lg
         FRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VetgGylyMhr4faiTsP3IkOZ01cl3HVxVutPYPa26WFw=;
        b=SePC9+sDdF7SXC7qBf5GlnSC/xw53D8CW/s5x4P1JcC/0t1tZlKTDSvhpHFlFnw/iB
         qSM5BZsboeaSfKlGbN604qCGo1GiyHFn5rrGfPcGqbFUvk8p2kmNsx+O4c+QO25DKugG
         ibAK61jg25tcugZN+n1SMtq/Ey+2sEdZUlsxLrLRO+JufQFJHLUunj51W9L+KsCmF2Xu
         UjO5EF6xNzmXfbzBfOBPMF2aPO6Ioa1G4/qjR2zqU0DYReA9as9vdo9j1oqS7WOVForE
         Uu1WP571e7P9rk6a7MIa+3QMbLl42EzmYfD+TjlOsT5M6oMIYxIe3DxNYS5lwgzrPG3J
         6lew==
X-Gm-Message-State: APjAAAW2+GoW9LRVABjudsMh9NVOngkoJmiwTYPBLjG7k3ZATh388LVu
        2YQuuJDkhR36YbE9JqsBcWc/sg==
X-Google-Smtp-Source: APXvYqxI0camTekHszKzfIocQ6nPJPXPzToe6YYixiwv9Y2EBb8cNTvjszkHyNqWOoQmKBBLTOtM0A==
X-Received: by 2002:a62:6585:: with SMTP id z127mr14667253pfb.179.1559369503106;
        Fri, 31 May 2019 23:11:43 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id 2sm8935850pgl.40.2019.05.31.23.11.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 31 May 2019 23:11:42 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH REPOST v8 1/3] dt-bindings: i2c: extend existing opencore bindings.
Date:   Sat,  1 Jun 2019 11:41:13 +0530
Message-Id: <1559369475-15374-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
References: <1559369475-15374-1-git-send-email-sagar.kadam@sifive.com>
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

