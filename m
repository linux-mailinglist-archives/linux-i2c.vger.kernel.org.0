Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E42111FEB2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2019 07:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbfEPFJc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 May 2019 01:09:32 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36196 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfEPFJc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 May 2019 01:09:32 -0400
Received: by mail-pf1-f196.google.com with SMTP id v80so1187792pfa.3
        for <linux-i2c@vger.kernel.org>; Wed, 15 May 2019 22:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bw14u18P9i//6PFBBpNeMD35DBcnBuJpaE6hMWzLBZ0=;
        b=JMBjAjqj9Bt/mtPeNVVFnwrG6sxggttpsGf3yrrSUASc87Irj9E9jhvOrZ6OxSc4pm
         3oweA6sqM0iqogIExq9o+Er5Wtj62ppqTiDzoyWk95Ebb4+W5do0a66GqvVBiL6cNBFL
         2OkBNVSw3s+rYw7I92PJ9orjWwAsPwsq0GPBRAqP1uhxgPUIIqbi+wqRsSxiBhrnkEax
         b2gLSylHqEuhL3gzcj5Jt5t1XEE7luk6bwfSx9J6nOtyU6y0TMiBtG5r1R8FzkL0b6D3
         qj4K7GsCIs9w3K+ZDiz3Tv3At8nVqFuTHKCo0hltnNFFBDX/F+BP0LISx4mPRlEtLmC7
         /sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bw14u18P9i//6PFBBpNeMD35DBcnBuJpaE6hMWzLBZ0=;
        b=Tt5LuTOIc1yJvRF1j9TREBP+wt1S7U0tvHxJUxGnqzFyecXNMaAVTgYmRW8agPTyH+
         wNQQtDyNfYieqsVd5yZM2FtKcE2zS1KzNQaBV5OAQLtTEksqlykSgiEfldoc4Eah2G0S
         EUJsQPFCkHqG+iHK5RL3i/nDF2EgyaxqZYZFD5g4lwpDIZq2mfoSjCuKUHw3nWea0yWr
         PyHCtoopeLYclm/GDcpn2uRxG39TfEAkx521tPQaqY767kSApynGua9zDyWFFGM8gqt3
         zWogIN85CmPLlM070h5OzESPDxk1buJwGEypSUF5oYtqy890lif+iM89VKczCNbWY4hO
         VeIw==
X-Gm-Message-State: APjAAAVsaaMZCaQrFzEToHdUL/VF3xMSTsWiU7IvzrYN4eBP+CKxZTrp
        +6iE4vwQ57yqyr+Y5A+SlG0EnA==
X-Google-Smtp-Source: APXvYqyY6RdF/VL9iKR+Dn640qMh2T+dCAVMBAhbWxEWLJANF3ujtebGYHqiEGcZX5ca2hsGtxbCWg==
X-Received: by 2002:a62:e718:: with SMTP id s24mr51969126pfh.247.1557983371371;
        Wed, 15 May 2019 22:09:31 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id u6sm5929531pfa.1.2019.05.15.22.09.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 15 May 2019 22:09:30 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: i2c: extend existing opencore bindings.
Date:   Thu, 16 May 2019 10:38:38 +0530
Message-Id: <1557983320-14461-2-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557983320-14461-1-git-send-email-sagar.kadam@sifive.com>
References: <1557983320-14461-1-git-send-email-sagar.kadam@sifive.com>
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

