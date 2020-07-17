Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4788D224023
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 18:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgGQQEM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 12:04:12 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35571 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbgGQQEM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 12:04:12 -0400
Received: by mail-io1-f68.google.com with SMTP id v8so10966652iox.2;
        Fri, 17 Jul 2020 09:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZZMONCL19UYadzPu6uG68r61s8RwI/fmFOE3TtThbcg=;
        b=pEu+gzPAAzWrKN2BSJTuIUXO1McQqvZl6VZETKQsNqA/91Rl9p5yA21p/xff9OILzE
         1OjnaX9NmTzJvXUCA0/Uxr2rE9celR+6tWh/UDOU7UJFcnig9yynNwBwVgYlJV7WpJ7N
         I2LVlP5TikP0aJ3JWREU0jPxO4vDACVQr/VRcFLkMyzcMsf2jVoEZDui6tHg79Ke4oaU
         bf+6oNA7qVsoN3H5/Vfn5zwnoxOiS28BNS1xCK3LqqZc1/KvG0Q/1AP8KUu6kmk1EwLu
         EoGtzv9fg5phfq+ogCD3UkewC8uz4lKWi4xUgol5EJYvnb3f7T6uD5VP3fnBhK3PGoFk
         vSnQ==
X-Gm-Message-State: AOAM533Y+GIx0ZQVx0UnxkRBL9N+g2JHMvWq+7Gk5B6vr7YLxv5WUCUI
        mdbfBNvIsFOVlSYPe2InSg8fEDcE8g==
X-Google-Smtp-Source: ABdhPJzGbW4bYcU9wLZQ3cvTOdjIX6H0PPdVQMlHCWfeqAt+eh60L5Fdbpj72QS1+tYlVJ7SYFFexQ==
X-Received: by 2002:a05:6638:69d:: with SMTP id i29mr11734802jab.47.1595001850880;
        Fri, 17 Jul 2020 09:04:10 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
        by smtp.googlemail.com with ESMTPSA id e21sm4623586ioe.11.2020.07.17.09.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 09:04:10 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Wolfram Sang <wolfram@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: [PATCH] dt-bindings: i2c-gpio: Use 'deprecated' keyword on deprecated properties
Date:   Fri, 17 Jul 2020 10:04:07 -0600
Message-Id: <20200717160407.378140-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i2c-gpio binding is the only case of 'not: true' being used for a
deprecated property. Update it to use the json-schema 2019.09
'deprecated' keyword instead. Define the type too in order to keep the
meta-schema happy.

This will disable warnings for these properties until the dtschema tools
are updated to handle 'deprecated', but they are only used in a few at91
dts files.

Cc: Wolfram Sang <wolfram@the-dreams.de>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-gpio.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
index da6129090a8e..78ffcab2428c 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
@@ -52,15 +52,15 @@ properties:
     description: sda and scl gpio, alternative for {sda,scl}-gpios
 
   i2c-gpio,sda-open-drain:
-    # Generate a warning if present
-    not: true
+    type: boolean
+    deprecated: true
     description: this means that something outside of our control has put
       the GPIO line used for SDA into open drain mode, and that something is
       not the GPIO chip. It is essentially an inconsistency flag.
 
   i2c-gpio,scl-open-drain:
-    # Generate a warning if present
-    not: true
+    type: boolean
+    deprecated: true
     description: this means that something outside of our control has put the
       GPIO line used for SCL into open drain mode, and that something is not
       the GPIO chip. It is essentially an inconsistency flag.
-- 
2.25.1

