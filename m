Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E344049328D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 02:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348099AbiASBwt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 20:52:49 -0500
Received: from mail-ot1-f48.google.com ([209.85.210.48]:45993 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346039AbiASBwt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 20:52:49 -0500
Received: by mail-ot1-f48.google.com with SMTP id v8-20020a9d6048000000b005960952c694so978103otj.12;
        Tue, 18 Jan 2022 17:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t1vLox/ruFfFMawK3JOh7h5PPx+4tfd3BsT5t3nMI3g=;
        b=UeaOJvBF30NnOrSgvPfBfVmTws/W3pvhOwQ3ZtWPowWdOobge5XY4zIghkWAJ8E2AF
         y+9c/SFezBaimA3bGAwjm3T7AplwqsWbGxjO081qtmt6ErysvLA4Bigt9tVVjhSz/ZZm
         cmYY1vsf2R+RVyKAbCwCsZLIq2ROy31bLOgISAseYPYpmt+Xu7N0GjkuVu4bj9uiTpMC
         2qWfJuZTeDyZY/gE7zkNl4/RaqkFSJW7x/zMGp6/ZWOBVEk5Zhn5/34swNENRwqVhyK+
         74ZS6/3cxoCCF8fVDsf6iKRORRNrALG2Ggcxk0c1aeP+3SX6E2BOAWaEZoFWlcjldmFe
         yg9Q==
X-Gm-Message-State: AOAM531XirUhDzV4r7nmMb0c2Mwv5UpPWthVFaNgWnKSvbGLTMdZiJAV
        jkePQxXVJSqJCabRdanYnY6LghF4aA==
X-Google-Smtp-Source: ABdhPJwI8Qkwl038QGdbMQcYwXuhsJuTZQ6YrMPcKl9/r6OTff4joKWZEuls8ynS639R9Pih1uzfWQ==
X-Received: by 2002:a9d:4d1a:: with SMTP id n26mr18731427otf.168.1642557168438;
        Tue, 18 Jan 2022 17:52:48 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id x26sm8027866ote.78.2022.01.18.17.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 17:52:47 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c: mpc: Make each example a separate entry
Date:   Tue, 18 Jan 2022 19:52:34 -0600
Message-Id: <20220119015234.2436754-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Each independent example should be a separate entry. This allows for
'interrupts' to have different cell sizes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
index 98c6fcf7bf26..018e1b944424 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mpc.yaml
@@ -73,6 +73,7 @@ examples:
         clock-frequency = <100000>;
     };
 
+  - |
     /* MPC5200B based board */
     i2c@3d00 {
         #address-cells = <1>;
@@ -84,6 +85,7 @@ examples:
         fsl,preserve-clocking;
     };
 
+  - |
     /* MPC8544 base board */
     i2c@3100 {
         #address-cells = <1>;
-- 
2.32.0

