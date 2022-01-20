Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E79D494BEE
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 11:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242784AbiATKkw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 05:40:52 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:50708
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376353AbiATKku (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 05:40:50 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7F85940043
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642675248;
        bh=ICGGHPgMOz29NZPwcai0F42KglfVOVXY27QEZIjk5oU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=s/PgGjK3ol/A4IBD9t5Dv0pB+HSw3CAR/H5kjtPrcevp5+/84Zu1eZG531OT84Ncs
         89azC5R9A39QB+z0XITFAmdSxhvovWL5SMDO9xC+qavidlF6nGUI26JJAoj8EjHVsC
         CUNpa3XPk/y+JOazNbTDufFtvGBxjVMsFKTml/P7J9Gg24zDun7HXESKocRx61xl+u
         qUzgwr60i8IUQMkhvrtrlRXdHPj0TZIYst5S3hkjwQZxm+EBPb6FstEClJZA5y3Ax5
         gmoNbMdam2f1GYr7xdDgu0akn8MPDW4lVKDxPNu1ip2b6n26ux4jp7qJWDHa8keOAq
         UiisvsGoj4tzA==
Received: by mail-ed1-f70.google.com with SMTP id t11-20020aa7d70b000000b004017521782dso5464210edq.19
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 02:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ICGGHPgMOz29NZPwcai0F42KglfVOVXY27QEZIjk5oU=;
        b=4lm16V9+vaXDaIfegO6uennL+F7uwvMo1qFCFOk2UTV5gUN33FbACSGUjtFzsMNkj0
         CYDLcqZQhb5njjkT6H2CTvYhEiU5Pnt3lCKuJkJcvfZxwRbekhzF5OqURPoO4SuzWB2A
         YzK0iWQ96tegw0QNmayMtOGpzSlXVC88TAo1cJkr2yVtm0bQY5p05Wz0osVjmpo/eM4h
         xT/QedHRg9ffGZxDRKGn5TXAJhYf/+fLPxY68eyKBXPF0ywylssAlikDl60XFZ1EDeIv
         Rvu/PsGa8FBQVGvKj0R2v38FcOR+mY6294XAZ8F0AgR0mDEj7kB51o6CdixDo9E+aNjY
         IKJg==
X-Gm-Message-State: AOAM5301C/u4Tmiv4e5vK0IWY+Dm9nZPhr8wdaxENpuWVatPfPVAFgwL
        IFqR1bOgJDOSLWnLURegIN7e5PyuqE9IwsaGJ4CHbw6e+HW/bY2TKZqKzqy4hGvrdLinHMbFemx
        W7IdYxQS/2vb7nCDFN21qbF2bVl+r305Z3foiHA==
X-Received: by 2002:a05:6402:4310:: with SMTP id m16mr19187836edc.344.1642675247485;
        Thu, 20 Jan 2022 02:40:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyPXalZaMMnb38YbeEj30Tzd3scTSAbXmxSV188lCn85OIudmZVuBpWbdWwOJQ8I+iGR8Lag==
X-Received: by 2002:a05:6402:4310:: with SMTP id m16mr19187808edc.344.1642675247236;
        Thu, 20 Jan 2022 02:40:47 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id z8sm836027ejc.151.2022.01.20.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 02:40:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Simon Glass <sjg@chromium.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/2] dt-bindings: google,cros-ec: drop Enric Balletbo i Serra from maintainers
Date:   Thu, 20 Jan 2022 11:40:09 +0100
Message-Id: <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enric Balletbo i Serra emails bounce:

  <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table

so drop him from the maintainers, similarly to commit 3119c28634dd
("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml          | 1 -
 .../devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml       | 1 -
 .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
 Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml | 1 -
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml        | 1 -
 5 files changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
index 20e1ccfc8630..2d82b44268db 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
+++ b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
@@ -8,7 +8,6 @@ title: ChromeOS EC USB Type-C cable and accessories detection
 
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   On ChromeOS systems with USB Type C ports, the ChromeOS Embedded Controller is
diff --git a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
index b386e4128a79..6e1c70e9275e 100644
--- a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
+++ b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
@@ -10,7 +10,6 @@ title: I2C bus that tunnels through the ChromeOS EC (cros-ec)
 maintainers:
   - Doug Anderson <dianders@chromium.org>
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   On some ChromeOS board designs we've got a connection to the EC
diff --git a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
index 099b4be927d4..00e3b59641d2 100644
--- a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
@@ -10,7 +10,6 @@ title: ChromeOS EC MKBP Proximity Sensor
 maintainers:
   - Stephen Boyd <swboyd@chromium.org>
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   Google's ChromeOS EC sometimes has the ability to detect user proximity.
diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index 5377b232fa10..e8f137abb03c 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -10,7 +10,6 @@ title: ChromeOS EC Keyboard
 maintainers:
   - Simon Glass <sjg@chromium.org>
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
 
 description: |
   Google's ChromeOS EC Keyboard is a simple matrix keyboard
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index e9c46430fd8a..66a995bbbbe9 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -8,7 +8,6 @@ title: ChromeOS Embedded Controller
 
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
   - Guenter Roeck <groeck@chromium.org>
 
 description:
-- 
2.32.0

