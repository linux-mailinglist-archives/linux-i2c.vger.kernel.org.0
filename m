Return-Path: <linux-i2c+bounces-7059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4E988653
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 15:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1122F1C22E44
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 13:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C0018BC36;
	Fri, 27 Sep 2024 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hRldsn+y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBB9282FA;
	Fri, 27 Sep 2024 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727444115; cv=none; b=B19SjdZ3f9wtbQ/2dxN8T0maIYZloXDIe/7SPSn+x4Czi9yVRCuWpOJXItheOaxlRomkQsQ/prxOMzGMbV3vaBBSiLdWhzZG5GJVEelkI262d07iNh/UMe+w6RxjEKX+IwHmhXJgQ5onEmkYvEiW1QGHBU2Ke8yKJoe0+DS3UsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727444115; c=relaxed/simple;
	bh=M98aC3Vt47AfY7jwZd9jT+21wUxJ441VFSQAno7rbpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvoPKjJJrKQ/vCAXMJ2lqEGfxMt2qFYleLlWPh6cLfii62hKtN0SqIouY1ALQDzPGmI+JGspBacAXMbjGgDRdW+LW1VHNaL2BbrUehCOPbRoDPiE6voUXF8hg3J1A6R4XJMvoHi1WZiHhOMgnWx9WylKyGjK0Q7mhjpMkH4Ra1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hRldsn+y; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=m80VoOaqUmL/nePtQcoKeORM7DgYXRyb9y7o7CpzM78=;
	b=hRldsn+yFsMxB+YuvCMzhW/0Krx4FLrpaMtcZwzvXRsrtWfbG95KCRbEltqRPa
	7oWFAp/kEZrWawa9Mkv0QiO0r0BCe8I+CvUBkKaYNSuS+RZKoN0cgYhy4aqR5p17
	M32ovYgLDnjRr4Q6A06iIJe9RwXGQAKPzl9IArp7wOQGY=
Received: from localhost (unknown [120.26.85.94])
	by gzga-smtp-mta-g2-1 (Coremail) with SMTP id _____wD3X_l0tPZmMxRHAw--.18019S2;
	Fri, 27 Sep 2024 21:34:45 +0800 (CST)
Date: Fri, 27 Sep 2024 21:34:44 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: andi.shyti@kernel.org, shyam-sundar.s-k@amd.com,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: amd-asf: Fix uninitialized variables issue in
 amd_asf_process_target
Message-ID: <Zva0dBAZWpd1e4as@iZbp1asjb3cy8ks0srf007Z>
References: <20240926151348.71206-1-qianqiang.liu@163.com>
 <cc527d62-7d0b-42f8-b14c-6448d3665989@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc527d62-7d0b-42f8-b14c-6448d3665989@stanley.mountain>
X-CM-TRANSID:_____wD3X_l0tPZmMxRHAw--.18019S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF1ktw1fAw1kurW7WF48WFg_yoWfWFcEk3
	Z5Wa12gr4vkrn5XF1YqFs8XrW0gr1qgF1xu3WFkFs0krya9w13WFyqv3s3JrsrWrZrKF1a
	9w1UWF47CFsxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUe_pnPUUUUU==
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLwJnamb2pbX66gAAsw

The len variable is not initialized, which may cause the for loop to
behave unexpectedly.

Fixes: 20c3cc299218 ("i2c: amd-asf: Add routine to handle the ASF slave process")
Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 47e0c90341aed..ba47df5370c72 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -61,7 +61,7 @@ static void amd_asf_process_target(struct work_struct *work)
 	unsigned short piix4_smba = dev->port_addr->start;
 	u8 data[ASF_BLOCK_MAX_BYTES];
 	u8 bank, reg, cmd;
-	u8 len, idx, val;
+	u8 len = 0, idx, val;
 
 	/* Read target status register */
 	reg = inb_p(ASFSLVSTA);
-- 
2.39.5


