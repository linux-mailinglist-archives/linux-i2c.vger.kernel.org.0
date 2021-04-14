Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE4835EFED
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350193AbhDNIko (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350206AbhDNIjK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 04:39:10 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A31C061342
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:38:20 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g35so13862986pgg.9
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7XXmpI6HkWp3If8HQFwzyKKNYzDH+WeOIEtuebDT2y0=;
        b=R0Oru1OcUZBxs5N76VWsx4+y0qphIgDd3Khgl47MGvgDk1J0mcJujNHWcDbSHMw4vk
         retbPZHixrp0BJSeAXCiluZ9waJuMYWYhRNeOqx8VSPLeJ6oKNsH7jwVtxn3z+2Gi1LW
         ZAN+yoYP+K8ioD/XXhw+T0FlrkDDEFPdnwg88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7XXmpI6HkWp3If8HQFwzyKKNYzDH+WeOIEtuebDT2y0=;
        b=Agd5JTg/7h6DokynM8sjbljDoDEMAskw8T3UcjGMp8dlUKE+n4w7aYTsiKXE8PtzkW
         KYCwGJ4QrBO4tJmTd7o49eqLBoLVxV7NQvzIjC59oyCpBXYJYMgGD39r2HqznnRpTDhd
         mAPjUiJspU1bd9GodUzTIGg9FjROhjTzUqmy/5Mb/LxMObzbzJpyqv3327pdXqSw/l0w
         dYAjwpeUXpgs3JHMBsodCheRKp7Mwns5H+TIOgom6QI6Jj1n2OtLfP/69EACsSna1rZi
         gTjfG3aRoMuqAX/bWRmQNF/7RmRYL+Hph0UoVokp0fCyMjtXQruJcBo2bZTcX4SzlW/M
         9wgw==
X-Gm-Message-State: AOAM530gig7JynD6nUB7u2ZnTArUH0wPOSZUfs3pzjfm2HYPhOJkl6cH
        TB/J+oRRubWJAlimkMpO5efKGw==
X-Google-Smtp-Source: ABdhPJz8ts/rFcx+fO1sCnhZkR6UKWNkO2GMDiHGUXl3hfNTchm75W/OIyecWwcg+qif9NTMmXCj7g==
X-Received: by 2002:a63:4644:: with SMTP id v4mr4335415pgk.316.1618389499788;
        Wed, 14 Apr 2021 01:38:19 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:bae3:4af0:9792:1539])
        by smtp.gmail.com with ESMTPSA id g24sm8901582pfh.164.2021.04.14.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:38:19 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: [PATCH v18 2/5] dt-binding: i2c: mt65xx: add vbus-supply property
Date:   Wed, 14 Apr 2021 16:38:06 +0800
Message-Id: <20210414083809.1932133-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414083809.1932133-1-hsinyi@chromium.org>
References: <20210414083809.1932133-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add vbus-supply property for mt65xx. The regulator can be passed into
core and turned off during suspend/sleep to reduce power consumption.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
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
2.31.1.295.g9ea45b61b8-goog

