Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C296B392913
	for <lists+linux-i2c@lfdr.de>; Thu, 27 May 2021 09:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235305AbhE0H6S (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 May 2021 03:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235226AbhE0H5l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 May 2021 03:57:41 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12C9C06134A
        for <linux-i2c@vger.kernel.org>; Thu, 27 May 2021 00:56:07 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 6so3089289pgk.5
        for <linux-i2c@vger.kernel.org>; Thu, 27 May 2021 00:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MM8kzddH0ZuV0BgZsD6j/UZqR+lPZQliP2/mR7NqPNQ=;
        b=FnkqpDhRWtVgo98ZZzaFBu0d9tAx5+WqDrox/kScBtBSg+ZPgbBqYUf9050eZhoYqC
         UxGHrsorZlaYjWFhpa9O9UVUWJR+/gKBTBev+95L8cN9hHHLRsrhh4Si8ZNLnxiB2Swc
         HqOS4zXE1l3gZveClF6Zwx6TCcY7Aaf5ExlkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MM8kzddH0ZuV0BgZsD6j/UZqR+lPZQliP2/mR7NqPNQ=;
        b=ONJxUZXAg1N/2IfbCp0U62Z/uqS/IhT95EYjnsI+m3yRDZaoqPY4wdruO4/us2AAAK
         ht/f3ZIzEz5J40kdIjpzKe320bPi4FCm4PU1owh+e+8cpjB2hx8Z0K7xI2cpItMeOSUa
         wH3E4Ns9POkNAGsKElbsVgDuZVnA+F/P4NWOwJEUP0uWv1UOiVwv+kjJI5HufR2PacPs
         FeBI3dj8IxbHszyAUVJDZPtOEGioiSPnhF2XhMNLn1N6onyFVJKxlaJTfgXIKfltdmIb
         AMgW66+9Z9Nqki8u7T42ZYzaC3SsSvCqw+do+ju6CoTgpnm+LmtuySJCD1QWFPI8SR9/
         GRzQ==
X-Gm-Message-State: AOAM531bWsM4dnjIGQNUZt4HVMaOV0DNYHiBsuyC/eT0ObY8bj7d9Kuj
        1rpjQwRgCCf3/FgHSzICdH19Ig==
X-Google-Smtp-Source: ABdhPJyOChGktKvovO4oemHNBggRkAwTN52ULnjVngUsAWsrKKPIL7V1slxR+WXS+Ib+L6oEWikEHA==
X-Received: by 2002:a63:1260:: with SMTP id 32mr2593858pgs.232.1622102167325;
        Thu, 27 May 2021 00:56:07 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
        by smtp.gmail.com with ESMTPSA id 69sm1217790pfx.115.2021.05.27.00.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 00:56:07 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jean Delvare <khali@linux-fr.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v21 RESEND 2/4] dt-binding: i2c: mt65xx: add vbus-supply property
Date:   Thu, 27 May 2021 15:55:54 +0800
Message-Id: <20210527075556.1709140-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527075556.1709140-1-hsinyi@chromium.org>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add vbus-supply property for mt65xx. The regulator can be passed into
core and turned off during suspend/sleep to reduce power consumption.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 7f0194fdd0cc..2c45647e9f0b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -32,6 +32,7 @@ Optional properties:
   - mediatek,have-pmic: platform can control i2c form special pmic side.
     Only mt6589 and mt8135 support this feature.
   - mediatek,use-push-pull: IO config use push-pull mode.
+  - vbus-supply: phandle to the regulator that provides power to SCL/SDA.
 
 Example:
 
-- 
2.31.1.818.g46aad6cb9e-goog

