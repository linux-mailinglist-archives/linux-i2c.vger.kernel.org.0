Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44A0564C389
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 06:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiLNFgt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 00:36:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiLNFgs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 00:36:48 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6AB15A2A;
        Tue, 13 Dec 2022 21:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670996207; x=1702532207;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pMAN2skTgm3pv4t9bp9i7xoIv6IlYAxA6BqR2zB9vBw=;
  b=bBE/w+ErG5Y8TaytpRTwZ0xi9qq0qx2KDmMgJFfVXoXBNrtDdPFADo/f
   2kFPpnL8cmBgnL1i8NGgGWS12l2IJ0CaSpWeuDeyqFJZBV+bHkpBS6hdI
   Wk1PEGrrB0gvZjvYi/FAAzPBTCJK45t9Fpvjzd1F2d4gb8riJ8/opeTUr
   lF/OAAKEPZOBjTVm7ket6bN29kfBaEanrrh/0bl70JaNeyfxb87oSBjE0
   JlHsPZ3foIZYcD+5Ym6CfSofokLVXhZQDC9u5GOsp1v44rT9Ft0XgUXtt
   82SYzWv+gN/KvA/n0poJPGbc0TljyOQ8FKSsmh2+C99cBSq8H2zCJ0HxL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="315955570"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; 
   d="scan'208";a="315955570"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 21:36:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="648865042"
X-IronPort-AV: E=Sophos;i="5.96,243,1665471600"; 
   d="scan'208";a="648865042"
Received: from conghui.sh.intel.com (HELO localhost) ([10.239.146.182])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2022 21:36:42 -0800
From:   Conghui <conghui.chen@intel.com>
To:     wsa@kernel.org, mst@redhat.com, asowang@redhat.com,
        viresh.kumar@linaro.org
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, Conghui <conghui.chen@intel.com>,
        Jian Jun Chen <jian.jun.chen@intel.com>
Subject: [PATCH] MAINTAINERS: Update maintainer list for virtio i2c
Date:   Wed, 14 Dec 2022 13:36:31 +0800
Message-Id: <20221214053631.3225164-1-conghui.chen@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This updates the maintainer for virtio i2c drvier

Signed-off-by: Conghui <conghui.chen@intel.com>
Acked-by: Jian Jun Chen <jian.jun.chen@intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a8c8f6b42436..44747f4641a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21920,7 +21920,7 @@ F:	include/uapi/linux/virtio_snd.h
 F:	sound/virtio/*
 
 VIRTIO I2C DRIVER
-M:	Conghui Chen <conghui.chen@intel.com>
+M:	Jian Jun Chen <jian.jun.chen@intel.com>
 M:	Viresh Kumar <viresh.kumar@linaro.org>
 L:	linux-i2c@vger.kernel.org
 L:	virtualization@lists.linux-foundation.org
-- 
2.25.1

