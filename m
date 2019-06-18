Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF784A24A
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 15:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729295AbfFRNeH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 09:34:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42476 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbfFRNeG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jun 2019 09:34:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3pt+lvuNJTl0R7q+cDc7mElDC2SrbdpyQw7HovUZcjM=; b=B6VLnbVASmJOveAXuJlXWMBGF
        cSjBXTuJTPybZr5q2iqqH16k8QN3sWX1eMGy5BwQ4lCWRMhZsV13dyWkcfxYVKKtF3G9QcWYi0lVg
        tDoc3QPZ9bMIixzCfhriR7kObOttuGy6QFB1/BYdyYLTEkzGBS1ht7Npm/+6HGwWMl3VsTczEHrPt
        3O4zLgvWja0VUNS6T2Vmovv1T0tbVpA6/cnI7iWw+gqpuBiLe50Xq39mlVx3HauhSewrto+ThH0C6
        V2NLcWvLD6tw7b2Vaoy71tmCLHR00npK04ddP9L2StMkyKDlfYIczIU7Wz2iat3RYJgfttxfBsWVj
        rFRhknlAg==;
Received: from 179.186.105.91.dynamic.adsl.gvt.net.br ([179.186.105.91] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hdEFP-0007CG-72; Tue, 18 Jun 2019 13:34:03 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hdEFM-00008f-4G; Tue, 18 Jun 2019 10:34:00 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Ajay Gupta <ajayg@nvidia.com>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Otto Sabart <ottosabart@seberm.com>,
        Li Yang <leoyang.li@nxp.com>,
        Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH] docs: fix some broken references due to txt->rst renames
Date:   Tue, 18 Jun 2019 10:33:58 -0300
Message-Id: <6f09587b7678f2fb378d736f45a02ffa9412cc99.1560864716.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are three left-overs from the recent file renames,
probably due to some other conflicting patch.

Fix them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---

This patch is against today's next-20190617 branch. Not sure if it
will apply cleanly at -docs tree. If not,  Please let me know for me to
split.

 Documentation/devicetree/bindings/arm/idle-states.txt | 2 +-
 drivers/gpu/drm/i915/intel_runtime_pm.h               | 2 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
index 3bdbe675b9e6..d8d9aa7167e8 100644
--- a/Documentation/devicetree/bindings/arm/idle-states.txt
+++ b/Documentation/devicetree/bindings/arm/idle-states.txt
@@ -703,4 +703,4 @@ cpus {
     https://www.devicetree.org/specifications/
 
 [6] ARM Linux Kernel documentation - Booting AArch64 Linux
-    Documentation/arm64/booting.txt
+    Documentation/arm64/booting.rst
diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.h b/drivers/gpu/drm/i915/intel_runtime_pm.h
index f2d6299a8161..3cb391cd81c1 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.h
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.h
@@ -44,7 +44,7 @@ enum i915_drm_suspend_mode {
  * to be disabled. This shouldn't happen and we'll print some error messages in
  * case it happens.
  *
- * For more, read the Documentation/power/runtime_pm.txt.
+ * For more, read the Documentation/power/runtime_pm.rst.
  */
 struct intel_runtime_pm {
 	atomic_t wakeref_count;
diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index cfc76b5de726..5a1235fd86bb 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -364,7 +364,7 @@ static void gpu_i2c_remove(struct pci_dev *pdev)
 /*
  * We need gpu_i2c_suspend() even if it is stub, for runtime pm to work
  * correctly. Without it, lspci shows runtime pm status as "D0" for the card.
- * Documentation/power/pci.txt also insists for driver to provide this.
+ * Documentation/power/pci.rst also insists for driver to provide this.
  */
 static __maybe_unused int gpu_i2c_suspend(struct device *dev)
 {
-- 
2.21.0


