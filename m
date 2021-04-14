Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433E435F9D5
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 19:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350762AbhDNRaE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 13:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350358AbhDNR3u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 13:29:50 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3EDC06138D
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 10:29:28 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u11so6968277pjr.0
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 10:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7XXmpI6HkWp3If8HQFwzyKKNYzDH+WeOIEtuebDT2y0=;
        b=I+HzJNsWwPu+FB2uLUNEccOp0IOpNLd7gjigdfWKoW+DkwAVBGxH6GGl4TCfcMoszJ
         xRSSk+Z6mg9TI3va5vffbfIW6+DPVXdqsbzrAfZU4eQkN+wxC7jtCncWq/8r0rTElKO4
         o8YvKWheqTGhnCuUklNdzVElOTiQliz9cKSx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7XXmpI6HkWp3If8HQFwzyKKNYzDH+WeOIEtuebDT2y0=;
        b=mW0j27+A6hJBNETbHwxotfkt+m7c7Q3Ic7vgiW25enQxf4w7JuINa83NRiSaEJVPN1
         iXnaQXzeaF/EahE7E2ddR0/6F+1+bHTidmC41ej42FGc0mkw73twY1/MF+ryjCsGdqNi
         Qmm8/t1UWxsCxyIXJfRkOZOrUdHSLRFRlX/B8onaX/vya77ikflI83854UssAEvo07eI
         GMej9kSqW34g1K3ZvK9FDyJgnaYoenI6SasnjxtaTky4goz8bNV2ZVeuFV3Zc6uhw7FW
         Pn+YtVQugiKkIM3xjiY9WKsUjs3rzNvllQcdQ20e9Tzo/SCWPa+da+15c1jBtgGolkFr
         6sUg==
X-Gm-Message-State: AOAM533we/c+UZWI95E4Ww6TInQ677ddrcHJYtl4J7qDkC38jIcKjhKv
        OVrAV+xUM6N477VzEtom+UDEUQ==
X-Google-Smtp-Source: ABdhPJyKkMkvbglTteDlYjGwaiEf42P1VA/e4pB2K1gUgp1BeKp2w9jFz51WnfyldOcx2B7bgOvJYg==
X-Received: by 2002:a17:902:ea89:b029:ea:c781:daad with SMTP id x9-20020a170902ea89b02900eac781daadmr23289889plb.62.1618421368025;
        Wed, 14 Apr 2021 10:29:28 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:bae3:4af0:9792:1539])
        by smtp.gmail.com with ESMTPSA id e31sm63460pjk.4.2021.04.14.10.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 10:29:27 -0700 (PDT)
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
        Arnd Bergmann <arnd@arndb.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        intel-gfx@lists.freedesktop.org
Subject: [PATCH v19 2/6] dt-binding: i2c: mt65xx: add vbus-supply property
Date:   Thu, 15 Apr 2021 01:29:12 +0800
Message-Id: <20210414172916.2689361-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414172916.2689361-1-hsinyi@chromium.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
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

