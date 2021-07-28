Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 220C93D92AB
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Jul 2021 18:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237366AbhG1QAp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Jul 2021 12:00:45 -0400
Received: from m34-101.88.com ([104.250.34.101]:37865 "HELO 88.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
        id S237241AbhG1QAp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 28 Jul 2021 12:00:45 -0400
X-Greylist: delayed 355 seconds by postgrey-1.27 at vger.kernel.org; Wed, 28 Jul 2021 12:00:44 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=From:To:Date; bh=Gv7KUucopsmsqIQxT+x1MtsOiHITozTqojHrK
        PHgZ7c=; b=FYRYN70tEgYKctiU8TZiGJjBqyx1V9Z+jdT2CI5bjVlpYZzY0wRyS
        pLyAUj7E86QqZh495ODeiqZYEFhFG701bM0JyGQf9hYTwhU7emzJG/PVMyLwdnHh
        sJ7rR3XXEG7QpuE8gk+R4S8ffzD3WKFkl13gd3AOkPpwwqZTAju5QU=
Received: from localhost.localdomain (unknown [113.251.14.68])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCnJqeLfQFhVvsMAA--.44841S2;
        Wed, 28 Jul 2021 23:53:48 +0800 (CST)
From:   Hu Haowen <src.res@email.cn>
To:     wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: i2c: add i2c-sysfs into index
Date:   Wed, 28 Jul 2021 23:53:46 +0800
Message-Id: <20210728155346.8941-1-src.res@email.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GiKnCgCnJqeLfQFhVvsMAA--.44841S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5-7k0a2IF6w4kM7kC6x804xWl1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWU
        JVW8JwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IUnLSdPUUUUU==
X-Originating-IP: [113.251.14.68]
X-CM-SenderInfo: hvufh21hv6vzxdlohubq/
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Append i2c-sysfs to toctree in order to get rid of building warnings.

Signed-off-by: Hu Haowen <src.res@email.cn>
---
 Documentation/i2c/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index 8b76217e370a..6270f1fd7d4e 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -17,6 +17,7 @@ Introduction
    busses/index
    i2c-topology
    muxes/i2c-mux-gpio
+   i2c-sysfs
 
 Writing device drivers
 ======================
-- 
2.25.1

