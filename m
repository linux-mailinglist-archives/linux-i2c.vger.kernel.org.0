Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B7335F9E1
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 19:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350393AbhDNRaK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 13:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350807AbhDNRaG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 13:30:06 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE64C061348
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 10:29:40 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id t23so10618863pjy.3
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=70dSAhdvNf9rW7naVyB8FacZo/tKpmgYTIzZpzN71Cs=;
        b=LsiMLszNVSqTMFSOmT7Vt7BL2HWjYpQnn9/Ah8Ahmt14VXi38iwnxuRRnAMd7nV+F4
         L8OiYKIW4vYpw8N0fUeTwgUCiDMq5+HbPF+3sOym2H36ZFwtvq4PnCKSeplaTzdczwh+
         M1/M+ijlrnFtXNjeEsgG7aN63y8Ce7LLt8uSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=70dSAhdvNf9rW7naVyB8FacZo/tKpmgYTIzZpzN71Cs=;
        b=QnJ5RwriPtPvLOSrxPPTG11V37HjeQw1NqVEDYcMmDCRXWLdyiwWAY36UtaCGUWFQ7
         mrYE1a2Pdrvf8vrEDSq/MUmM8div4P1WPCraIQ4sz0hfPB3WTzToRGy8RTLhFyWFY3hW
         rKVuo+OA6903MJ7N4shgB25JfPgftlieJWP1BhHYfTi9m8EKSNxbZWKvNNs60f3WzCjc
         tEuq0TyMLiu99SvWrDhJEHVggqHViT1zSVrcsbWLKVU6kqv3hA7qnvZe8IcqhaDHFdlp
         qgNi8ffAA7boFADwr2GZgulVry6yC2syxf0GRYCCwIMkYXgAH3EDSNZusWkHJVsU1wyG
         MiBw==
X-Gm-Message-State: AOAM532jMK1EJkCQ5gu1SmQt/+ZPyXsAFBxtnK/pxCpzf1f8Awb947Du
        fQK2Ej7lrQZ6ecNFJTqr/AfnIg==
X-Google-Smtp-Source: ABdhPJwqy6xfsxSkXZwh4yhPlR+yx5Kxrr/lleQqawAAaqaYA9AZc2k7rgE80MSaJDQAOD1ejSDS8w==
X-Received: by 2002:a17:90a:ca83:: with SMTP id y3mr4896192pjt.191.1618421380273;
        Wed, 14 Apr 2021 10:29:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:bae3:4af0:9792:1539])
        by smtp.gmail.com with ESMTPSA id e31sm63460pjk.4.2021.04.14.10.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 10:29:39 -0700 (PDT)
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
Subject: [PATCH v19 6/6] drm/i915/selftests: Rename functions names
Date:   Thu, 15 Apr 2021 01:29:16 +0800
Message-Id: <20210414172916.2689361-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210414172916.2689361-1-hsinyi@chromium.org>
References: <20210414172916.2689361-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pm_resume and pm_suspend might be conflict with the ones defined in
include/linux/suspend.h. Rename pm_resume{suspend} to
i915_pm_resume{suspend} since they are only used here.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index dc394fb7ccfa..525afda9d31f 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -94,7 +94,7 @@ static int pm_prepare(struct drm_i915_private *i915)
 	return 0;
 }
 
-static void pm_suspend(struct drm_i915_private *i915)
+static void i915_pm_suspend(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref;
 
@@ -116,7 +116,7 @@ static void pm_hibernate(struct drm_i915_private *i915)
 	}
 }
 
-static void pm_resume(struct drm_i915_private *i915)
+static void i915_pm_resume(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref;
 
@@ -152,12 +152,12 @@ static int igt_gem_suspend(void *arg)
 	if (err)
 		goto out;
 
-	pm_suspend(i915);
+	i915_pm_suspend(i915);
 
 	/* Here be dragons! Note that with S3RST any S3 may become S4! */
 	simulate_hibernate(i915);
 
-	pm_resume(i915);
+	i915_pm_resume(i915);
 
 	err = switch_to_context(ctx);
 out:
@@ -192,7 +192,7 @@ static int igt_gem_hibernate(void *arg)
 	/* Here be dragons! */
 	simulate_hibernate(i915);
 
-	pm_resume(i915);
+	i915_pm_resume(i915);
 
 	err = switch_to_context(ctx);
 out:
-- 
2.31.1.295.g9ea45b61b8-goog

