Return-Path: <linux-i2c+bounces-1702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A03E68532FB
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 15:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170931F22046
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 14:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A87A5822B;
	Tue, 13 Feb 2024 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="IfMLbuos"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647AF5813F
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707834156; cv=none; b=rdCSnh6ZcZhwNRbRNWXlM05nq4roL+Gv27FVO2in3tLIe6l3U1Mk0skYeCnUY2NVS9HZI0BEtTiK3MXK89wFRIUYRUmFIn4nzo6T2oXE1r/6Hj80OHEMzP0RDfGv/mYCjHHus9wv4iafi6grGkapxCGlKwnYSaBRCdSKFVe+E1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707834156; c=relaxed/simple;
	bh=ZVoWPkWDGGWjLhBURKBmzMi+6xun3d9llfJxTCKJHGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lO2i+/Y3yAX4f6kZHSHwuGAPT+Ye+ay1pxaK/wrg4j+dtgHVA9nYjsyaPLDxBN2Z+a3INQoVRj2756kHTltIJN/JrpMW+XRTr0hVKjZEWhERXMhZlvsZpRrdmJuC/Sh5Cdg4uve+UMc5hw3bdzrkl/467j/dgrcBTyiYt6RwEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=IfMLbuos; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-562131bb958so151252a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 06:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1707834153; x=1708438953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pe27R5El4Dv++yOPITXX9+jKm5cvh9lf2r0jCzdmu/0=;
        b=IfMLbuosVUu9hLdyXKGteoM6WQFCQjI1NY2y1X7gf/TrEDibHaLN/fthxu8J1zjnAI
         KqKh3Cbju9joKL01o8UrrC+L2QoNPtTnkPF2JhIu50XHQ/scpDU8Y+WX9ef2kEWZcTsK
         Q1NcIwCujzDhY+Bpfeovg8cbgYz5Mlm5i9g0GQD2yQTfVbSnN9SVCtXb0fMoIQ17U9st
         ZIc1c8BnW75MdTqn0UbahHvKJsyhKmZXG1iPQ8wjsKHS4zYMSfl7k+Vn88emSBCxaONJ
         jjkpydH53NEOfLBLdzVY/uGmZR6iNxQG4ETi4IRR6o1xxhdd5aEZ2zjIv9AX0KN1PN5H
         NpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834153; x=1708438953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pe27R5El4Dv++yOPITXX9+jKm5cvh9lf2r0jCzdmu/0=;
        b=YtuYUeCKWq/z7ujsvgrUNOwtxJyGEpnJc++6ZCtWW9VcD2gu4c/zI6F8rlt8T9B8ZH
         MXfW94BSZRlh7UueXTFOfVIAtvLgIXKO4zON68acA2ZVHu1LDiQ+FYS3AD2TWOfNaX5k
         Aw+EL9GXpO+/yntDjZGk7jHxEf70WTXjoXVwb595HqRW5NywsdbfpjAqP9DbGMz3joqi
         YUAZoO4XJn+SsP6HTfIfuu8/nJvZfSMwPs7RycV34Ymo+lfj3Emr9CkxXnu2gcnwzDbP
         vTgxGajaz7lzGrhMRznxq257ZBFt56JWR7LASy8qMekooR+IJVbSKSQ+YsjXpJhA9mDG
         N3fQ==
X-Gm-Message-State: AOJu0Yw0wNO+FX/stMuulSdzoXFHfGVcBDaDtzEKfnRGuVhu5smvdhlS
	cK9o7+cErMQYzPf4kdwLy7ebLif9hgmG//K8dxz7t42lCUfVwlSq7Fl8XGhu3oLlq+sODbM8Dp5
	D
X-Google-Smtp-Source: AGHT+IEjdJlI+v2B9qEuDNoYryH+pfyZufoSFK6R/DxHy1D5Wnu9OAm2rP/1KTC+/s9cofb5iWWA9g==
X-Received: by 2002:a17:906:a419:b0:a3d:fb7:84a3 with SMTP id l25-20020a170906a41900b00a3d0fb784a3mr864127ejz.77.1707834152688;
        Tue, 13 Feb 2024 06:22:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXImBO3mmi4JY0TRPPzH+4244VODD/T2hLnxKqUoEVlKwe0g7ic8MIyyAPFjyIGcgh4iWydYEZvYuNSWCg1t2ZMB3LcqXeSPn8B+CrmOaJTTqf/ghzMTQ0DTic2JE3rUNGRPxfQhHU2yWKJIG6eDRySV4mP5csLxky1SKuAAjPoiAVZNIH1jf2NaM8RKe2jrhzryIPQmMKE9ip43fQvQFbySLzCdma6gFXZqpMM/4ZOrtPVWN4EdOldaQSQRA30VGeYFcddDRUyEV92wrOY/rWxQcq0d690exWGMb8XZjI+KQjKQ61iap2Y88tEUgdjPoIGI9n2L47tLdk9pAVEP3AsuzRKY7xZn4sOuEr9hZZWOSHNlQCFn5zwf+T/nHxQTZwP/h+0sq3ebW74WzPqAqiuDsbEiJMebIkTQvwN/4zsvGpkTG6Pp3hdMs8YB2iKONeo5oQ/Fg0c
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id lu1-20020a170906fac100b00a3c97e49bc9sm1322671ejb.218.2024.02.13.06.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:22:32 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Peter Rosin <peda@axentia.se>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mazziesaccount@gmail.com,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: i2c: pca954x: Add custom properties for MAX7357
Date: Tue, 13 Feb 2024 19:52:26 +0530
Message-ID: <20240213142228.2146218-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Maxim Max7357 has a configuration register to enable additional
features. These features aren't enabled by default & its up to
board designer to enable the same as it may have unexpected side effects.

These should be validated for proper functioning & detection of devices
in secondary bus as sometimes it can cause secondary bus being disabled.

Add booleans for:
 - maxim,isolate-stuck-channel
 - maxim,send-flush-out-sequence
 - maxim,preconnection-wiggle-test-enable

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in V5:
- Append Reviewer-by
Changes in V4:
- Drop max7358.
Changes in V3:
- Update commit message
Changes in V2:
- Update properties.
---
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
index 2d7bb998b0e9..9aa0585200c9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -71,6 +71,23 @@ properties:
     description: A voltage regulator supplying power to the chip. On PCA9846
       the regulator supplies power to VDD2 (core logic) and optionally to VDD1.
 
+  maxim,isolate-stuck-channel:
+    type: boolean
+    description: Allows to use non faulty channels while a stuck channel is
+      isolated from the upstream bus. If not set all channels are isolated from
+      the upstream bus until the fault is cleared.
+
+  maxim,send-flush-out-sequence:
+    type: boolean
+    description: Send a flush-out sequence to stuck auxiliary buses
+      automatically after a stuck channel is being detected.
+
+  maxim,preconnection-wiggle-test-enable:
+    type: boolean
+    description: Send a STOP condition to the auxiliary buses when the switch
+      register activates a channel to detect a stuck high fault. On fault the
+      channel is isolated from the upstream bus.
+
 required:
   - compatible
   - reg
@@ -95,6 +112,19 @@ allOf:
         "#interrupt-cells": false
         interrupt-controller: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - maxim,max7357
+    then:
+      properties:
+        maxim,isolate-stuck-channel: false
+        maxim,send-flush-out-sequence: false
+        maxim,preconnection-wiggle-test-enable: false
+
 unevaluatedProperties: false
 
 examples:

base-commit: 957bd221ac7b2b56cbdf56739e3a94d4f479209e
-- 
2.42.0


