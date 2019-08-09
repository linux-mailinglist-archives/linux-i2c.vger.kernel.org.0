Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 122CC88018
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 18:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407458AbfHIQeE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 12:34:04 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:45279 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437156AbfHIQeB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Aug 2019 12:34:01 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MiaLn-1iYmm935N9-00fn4k; Fri, 09 Aug 2019 18:33:50 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 5/7] ARM: xscale: fix multi-cpu compilation
Date:   Fri,  9 Aug 2019 18:33:19 +0200
Message-Id: <20190809163334.489360-5-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809163334.489360-1-arnd@arndb.de>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wZlcz48ar72OTI0b4lRDVG5g8z7FKcBbmmlRwz5OyJHN+RZnSIu
 rPO+wv2A51N4cneEGdq5++c3p7S8W9hvSc0/+MJlbGu9ejYfTujT8svnratVAcjpJEGGv/T
 NXHhTUGyJQX/PS6OeT3qB34XlnqG4OMumh+VLw3NibgQKnG6LEXRUilqHtuedJI6D+RIZly
 Fm2LpeYj60KlsDF4evXVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:p9OV/IkT9gI=:vQKEMVaVwwOvgHQ9k8wqNy
 frRgQ5iPSYZBBsJ8Qrbd1D1A1CH34rn2cdmC6UGHpIGXrTyp8CD2Aa78I5ZU4E9jyTv9WvdIl
 fbt/7UygAPSI8fo0/ttAzm1GSPsmpTVHt3DJLPiVMpWX4qAT63RJizHPB9OYD7IdxM5UQnwH9
 LzDyHR8lG2qAV0gMRg6a8kksSkiEBhFFT1+JSKXdOVMSh/Wfm3ZYWTt1yUaYvD4fajrm1oM4X
 oHx1+k/fMd6xnGJZC1jvy9yy5ntt/RVfiy74k9RPx8cZ4JFLKxxQDwwlKvCbYnU4qWm+kEyfI
 Cnb6f+To5gLTzFOrAeaVq9rjR+CjsKD2hYMZ7n9pLVUWu1FsAPHu+eIbVkyTsPgzHivVNF3Fl
 T9Xl35tHU6a+7gMm/0epFHhknfyINhgxBBCVl4Y7YnTQrZ97ZYpZwYMTqdn9ZzvaEgO0hzKRd
 ofGcyc0AcO+aDSnWMN6PyWvOn2yuQWBxKjnmRNnx4uNKdkf2A5WKZaue0MYO59x7xX7PcCC3f
 d4+w9fPOaCT+U6hD4KHvhRJhkQ1ibQjgCOLS5NQuEsRO4yJkVR1RIxLB9PepRwK4SO4idjf7D
 HIM1rsTJ5V+xnSVw4JzkGeCHJC1dfPLXxhw4A9DvbGxKYVFF39vhTqy5t23p/4RsNyNZZJqp0
 RHEMej39ZLyU/RccOCDWLGm4+2AWUCIv6b2hfUEJnCqEKAF1Aoz6hehAgXjaDaPThbJt/2iDa
 I6d+QTwbVTuZmWqY4lyKpeiDTl0FNdnCXrKRBQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Building a combined ARMv4+XScale kernel produces these
and other build failures:

/tmp/copypage-xscale-3aa821.s: Assembler messages:
/tmp/copypage-xscale-3aa821.s:167: Error: selected processor does not support `pld [r7,#0]' in ARM mode
/tmp/copypage-xscale-3aa821.s:168: Error: selected processor does not support `pld [r7,#32]' in ARM mode
/tmp/copypage-xscale-3aa821.s:169: Error: selected processor does not support `pld [r1,#0]' in ARM mode
/tmp/copypage-xscale-3aa821.s:170: Error: selected processor does not support `pld [r1,#32]' in ARM mode
/tmp/copypage-xscale-3aa821.s:171: Error: selected processor does not support `pld [r7,#64]' in ARM mode
/tmp/copypage-xscale-3aa821.s:176: Error: selected processor does not support `ldrd r4,r5,[r7],#8' in ARM mode
/tmp/copypage-xscale-3aa821.s:180: Error: selected processor does not support `strd r4,r5,[r1],#8' in ARM mode

Add an explict .arch armv5 in the inline assembly to allow the ARMv5
specific instructions regardless of the compiler -march= target.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/copypage-xscale.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/copypage-xscale.c b/arch/arm/mm/copypage-xscale.c
index 61d834157bc0..382e1c2855e8 100644
--- a/arch/arm/mm/copypage-xscale.c
+++ b/arch/arm/mm/copypage-xscale.c
@@ -42,6 +42,7 @@ static void mc_copy_user_page(void *from, void *to)
 	 * when prefetching destination as well.  (NP)
 	 */
 	asm volatile ("\
+.arch xscale					\n\
 	pld	[%0, #0]			\n\
 	pld	[%0, #32]			\n\
 	pld	[%1, #0]			\n\
@@ -106,8 +107,9 @@ void
 xscale_mc_clear_user_highpage(struct page *page, unsigned long vaddr)
 {
 	void *ptr, *kaddr = kmap_atomic(page);
-	asm volatile(
-	"mov	r1, %2				\n\
+	asm volatile("\
+.arch xscale					\n\
+	mov	r1, %2				\n\
 	mov	r2, #0				\n\
 	mov	r3, #0				\n\
 1:	mov	ip, %0				\n\
-- 
2.20.0

