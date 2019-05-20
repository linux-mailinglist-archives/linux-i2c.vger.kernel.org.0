Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC36B233EA
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2019 14:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733095AbfETMVT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 08:21:19 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39434 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388134AbfETMVS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 08:21:18 -0400
Received: by mail-pg1-f194.google.com with SMTP id w22so6728651pgi.6
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bw14u18P9i//6PFBBpNeMD35DBcnBuJpaE6hMWzLBZ0=;
        b=DEW9DDW/wDzXrs3KiwiET14pKxALowECFZwPPv5wWj+6ZDqkA2+QErtIdqmxXurA7x
         8nR8MzsJHo17x2Nn79nFOrSPNYMZN8MfSnoiJJz7TBRQjlvqsrsKGtAfWaF/Sh6oURg3
         SN1lGIPJY69X8/HNa3mT7VZTyzNnA2gT2UFjmL7Iz4iIHqkUJbaOYpYNMguMOPyicZKL
         7x7Y68GYN4KPeBv3vRaC6o2I5RYmSqVeCIg8Lby57s/2piyKWvwTaXItSsOib9WHcoWs
         4mJjBytXKSFnmY72ltqNJUGwGE+fqUBGqVVY9lRturZUiTBxQSkOVLGb7VLXR7n20zFD
         JAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bw14u18P9i//6PFBBpNeMD35DBcnBuJpaE6hMWzLBZ0=;
        b=Ycmf+L3AHLwUQDO7WRk2nAYMCu7XhCJCBuv7Zzo8gvrro8ZuPsoPMACVHQPknrSUwu
         Y0AaOwbMqmP+Ono+pchCTHLv8Dm22wMyDrzMf44MIKWFHqlm5m76nABKdp+32Li9OH7O
         n8vyaRHM8tfzzMmTsOlrwVSF1ouYRn/c46eqry2qPjWckaTiyjGrlZ2HkLasPm9MPEPj
         Va6s8kRYp9jczVcGB7OCfOwQo4zYJ92uD2VlI768+ZTd5ibxuD07ouDMVtn+eQjKgUnx
         KRZKy0e5SHlLuVL7HwyP8peiEcCvLaZ0uy7NFMnExVLrg5X8dQX6YGxkfquIa3D0ksFb
         itGA==
X-Gm-Message-State: APjAAAUUE1s/qx09AbLpAhsuhVAjdkSIzv6C9YEsmiJ0JWulaCAHTlHi
        +zFKXN13Y8Vy2WQfAkPXdFB/ju8aHQlEAg==
X-Google-Smtp-Source: APXvYqzKDB1HQoyZ8U0WjJ0MSo/CQPwAF839cuWrudmxHBCb6F2wVORX+7KlKaCqim0PhCgM8AAUKQ==
X-Received: by 2002:a65:5c41:: with SMTP id v1mr211402pgr.20.1558354878332;
        Mon, 20 May 2019 05:21:18 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id n27sm38137077pfb.129.2019.05.20.05.21.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 05:21:17 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: i2c: extend existing opencore bindings.
Date:   Mon, 20 May 2019 17:50:15 +0530
Message-Id: <1558354817-12034-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
References: <1558354817-12034-1-git-send-email-sagar.kadam@sifive.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add FU540-C000 specific device tree bindings to already
available i2-ocores file. This device is available on
HiFive Unleashed Rev A00 board. Move interrupt and interrupt
parents under optional property list as these can be optional.

The FU540-C000 SoC from sifive, has an Opencore's I2C block
reimplementation.

The DT compatibility string for this IP is present in HDL and available at.
https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/i2c/I2C.scala#L73

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
index 17bef9a..b73960e 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-ocores.txt
@@ -2,8 +2,11 @@ Device tree configuration for i2c-ocores
 
 Required properties:
 - compatible      : "opencores,i2c-ocores" or "aeroflexgaisler,i2cmst"
+                    "sifive,fu540-c000-i2c" or "sifive,i2c0".
+		    for Opencore based I2C IP block reimplemented in
+		    FU540-C000 SoC.Please refer sifive-blocks-ip-versioning.txt
+		    for additional details.
 - reg             : bus address start and address range size of device
-- interrupts      : interrupt number
 - clocks          : handle to the controller clock; see the note below.
                     Mutually exclusive with opencores,ip-clock-frequency
 - opencores,ip-clock-frequency: frequency of the controller clock in Hz;
@@ -12,6 +15,8 @@ Required properties:
 - #size-cells     : should be <0>
 
 Optional properties:
+- interrupt-parent: handle to interrupt controller.
+- interrupts      : interrupt number.
 - clock-frequency : frequency of bus clock in Hz; see the note below.
                     Defaults to 100 KHz when the property is not specified
 - reg-shift       : device register offsets are shifted by this value
-- 
1.9.1

