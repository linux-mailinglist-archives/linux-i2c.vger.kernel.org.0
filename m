Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 137D9441336
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 06:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhKAFaB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 01:30:01 -0400
Received: from mga11.intel.com ([192.55.52.93]:21543 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229502AbhKAFaB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Nov 2021 01:30:01 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="228403472"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="228403472"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2021 22:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; 
   d="scan'208";a="666605822"
Received: from jiedeng-optiplex-7050.sh.intel.com ([10.239.154.104])
  by orsmga005.jf.intel.com with ESMTP; 31 Oct 2021 22:27:25 -0700
From:   Jie Deng <jie.deng@intel.com>
To:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     wsa@kernel.org, viresh.kumar@linaro.org, conghui.chen@intel.com,
        mst@redhat.com, jiedeng@alumni.sjtu.edu.cn,
        vincent.whitchurch@axis.com, Jie Deng <jie.deng@intel.com>
Subject: [PATCH] i2c: virtio: update the maintainer to Conghui
Date:   Mon,  1 Nov 2021 13:24:50 +0800
Message-Id: <00fadb64713aebd752dca3156e37c8f01c5ac184.1635736816.git.jie.deng@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Due to changes in my work, I'm passing the virtio-i2c driver
maintenance to Conghui.

Signed-off-by: Jie Deng <jie.deng@intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b79fd4..8c9a677 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19944,7 +19944,7 @@ F:	include/uapi/linux/virtio_snd.h
 F:	sound/virtio/*
 
 VIRTIO I2C DRIVER
-M:	Jie Deng <jie.deng@intel.com>
+M:	Conghui Chen <conghui.chen@intel.com>
 M:	Viresh Kumar <viresh.kumar@linaro.org>
 L:	linux-i2c@vger.kernel.org
 L:	virtualization@lists.linux-foundation.org
-- 
2.7.4

