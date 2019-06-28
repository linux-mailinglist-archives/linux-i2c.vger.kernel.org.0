Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F60C59A2B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2019 14:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfF1MMz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jun 2019 08:12:55 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58260 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfF1MMh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jun 2019 08:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DA5BRTxHzFjkBauyNUPvpbdDgMAgRoAJatIYSdac51Y=; b=GzGXMBGMhZgxGjDLabVorg221y
        bS7w5BY+Q1miuA/PUaqiffFgVEdiXTBIA7gka+FIRi+WCuK1EGAVR7tjNUGkYGHjFnMhzxX/MF7Et
        06RmQJzWB8ZmPHRtwyu/zlSNFLiGPse2XIfiDUqVENYO4A4p9ubbL7dkubhn23WsiXnv7xAuc/wkF
        CrHTBlb8RV3D9GZeYL8M3wjFiLPA6zDZVVbAy1/B3M4EvHjsTEl4+uP3K6ltoNY9VLt+YC1hFEDU4
        7LJjK9Sicr7VNXHsYd938oyo7GQu0JQ1XGeTU2+ztXDgnr2Vmzyhngv63eGAA79lkILCddXwr15PV
        +g8LFQrw==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hgpk3-0005Bb-B8; Fri, 28 Jun 2019 12:12:35 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hgpk0-0004zb-AD; Fri, 28 Jun 2019 09:12:32 -0300
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
        devicetree@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 5/9] docs: fix some broken references due to txt->rst renames
Date:   Fri, 28 Jun 2019 09:12:27 -0300
Message-Id: <5ebb42791ebe353c346b44d6bd8f2c03d61d1115.1561723736.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561723736.git.mchehab+samsung@kernel.org>
References: <cover.1561723736.git.mchehab+samsung@kernel.org>
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
Acked-by: Wolfram Sang <wsa@the-dreams.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
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
index 473c4850c01d..2ee8f9522e05 100644
--- a/drivers/gpu/drm/i915/intel_runtime_pm.h
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.h
@@ -45,7 +45,7 @@ enum i915_drm_suspend_mode {
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

