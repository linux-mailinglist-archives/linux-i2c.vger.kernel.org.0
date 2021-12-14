Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0441473FD1
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Dec 2021 10:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhLNJvB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Dec 2021 04:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbhLNJvA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Dec 2021 04:51:00 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1072DC061574
        for <linux-i2c@vger.kernel.org>; Tue, 14 Dec 2021 01:51:00 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id q3so31369258wru.5
        for <linux-i2c@vger.kernel.org>; Tue, 14 Dec 2021 01:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UoqofvZsTLn3SZWgvUrY2g8UHV9XmLPJnkQk172OXk4=;
        b=hB68tQoQD6wtqjDpVCKgTzURxRcRL4C9GdnxcUZvBu6+I4BxO6ifeDBvAuZgmGzzhh
         gbjn1KsaxSiHFhAkN/I1uJXEM11WgNkO7jr+tNlJ4e12NdNigaTM04CqZSFr+K95iRrL
         xmlwuEjCqD7y7A5BKn9sagG5I3qsehYHDBUQGFSsiN8tTsmuT7UkJspiEsk4OFLojuvl
         FXNNHtwLVoUSbIk5s7S2rX3NU/fl2BPgtDYhI3rzAw57UJTH9VueKbpEqKgOD3FZRkDK
         94f5+6DX8H0ktrPEh0lBgU3kfXbK9dzMaClQHYrMv3FCoHkc6EWsu3tPffBKy73Qg4CF
         cTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UoqofvZsTLn3SZWgvUrY2g8UHV9XmLPJnkQk172OXk4=;
        b=vi9YGISFay5NsNFgij5Lj0GLK2G6bWq3OJyF+WEa5UFVs68+ivgoWxYEsPYNYocA/9
         pD4BlliL/3LGXL3Q8WzvW/mvGOgcJPsaP3V4f6praFvAl4WuZRH3AGLHgFrJFRmR0SqI
         1f8hFVkQIjgSYPU7uY5KDeAZDS1VZqsn1HKWP6uV/f5gYkhD9v9r/3aCTd/65OBBxYtc
         p9zeOVQdko+u7mQd5ChL+RdOxCycxl+EzSHCjKlDa8bnKlj6pLZqEgbIH6QeZkWoi2De
         5jm9FQbyUaX+i/8iacR/XGRWV9kQrT0ALfDskKIa8iKNV3it9WHTKGWTVrxcQrUvevpR
         mazA==
X-Gm-Message-State: AOAM530gGThqVRRJdYRmxib3X9J8PiKK/YNzajzPexVP0nmqpMU2WzP6
        L4fpggxdFL5oCRx6L3YUyC3BpQ==
X-Google-Smtp-Source: ABdhPJynnWm78M3TOb/T++5wTbkaJyEvCtnZXR+VoAoezYTUy8+XaDPydAauILAsPLk+jz38YwylZg==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr4578324wrr.223.1639475458598;
        Tue, 14 Dec 2021 01:50:58 -0800 (PST)
Received: from fedora.sec.9e.network (ip-88-153-139-166.hsi04.unitymediagroup.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id s24sm1522757wmj.26.2021.12.14.01.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 01:50:58 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: i2c Add regulator to pca954x
Date:   Tue, 14 Dec 2021 10:50:20 +0100
Message-Id: <20211214095021.572799-3-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214095021.572799-1-patrick.rudolph@9elements.com>
References: <20211214095021.572799-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a regulator called vcc and update the example.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index bd794cb80c11..5add7db02c0c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -64,6 +64,9 @@ properties:
     description: if present, overrides i2c-mux-idle-disconnect
     $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
 
+  vcc-supply:
+    description: An optional voltage regulator supplying power to the chip.
+
 required:
   - compatible
   - reg
@@ -84,6 +87,8 @@ examples:
             #size-cells = <0>;
             reg = <0x74>;
 
+            vcc-supply = <&p3v3>;
+
             interrupt-parent = <&ipic>;
             interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
             interrupt-controller;
-- 
2.33.1

