Return-Path: <linux-i2c+bounces-13423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21990BC8115
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 10:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CEAB188A39F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 08:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EE3285419;
	Thu,  9 Oct 2025 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5wDJZTS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61634BA38
	for <linux-i2c@vger.kernel.org>; Thu,  9 Oct 2025 08:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759999057; cv=none; b=FDbvLC+4ZtNtnZe0Bue7Fh55IRtfhKIzlJJIhuDbvyj6VsgK9fie4aJ+XN/mZj6rauKSy3tYQBaZKsZzBeQda5wjL20y1u9bI4iRosXmNTJVaqFpNu/jlb+v66Qqu9Loow0LPGaAmkgBJyfD3tBsdd31siqrvkVvZmdIEmwkwF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759999057; c=relaxed/simple;
	bh=64cS0iEb6fG/98KLH6NyIi1RARZBBpfO7zVcMsRtMJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGGIgDWOrfONKK57A1XkSdTPxEL5mY7PBWkZEDjDHrwdNevpVA27ye2KVyuFj13OvtpMjg5ar81AUOCTJcD+75XA7ScWhuD4eNFB5aQ9wNb0FRtAHDff4s4g8oWX8fqtbO6Qmf2oLPYv64VgU+J0aoSSvyxzZ5D3OZKZYP0WfwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5wDJZTS; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-375eff817a3so7236091fa.1
        for <linux-i2c@vger.kernel.org>; Thu, 09 Oct 2025 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999053; x=1760603853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4dMFnnL6gCSV/BGkdGLVDVI82ewLVkorW1rAtn7Qrg=;
        b=E5wDJZTSf7kNq8k2FBbJc0CUMUY+3re+o1wad5lcHV/+k5ht0uj4UHRbEyJ3SSIOQR
         S5j5HUu0LFQUvBxSaOdWMrfHQ5bO5uBy5MV2SlB1c/zT92kjKHlPBHVzAu4Wb8VPsF6h
         7TqMI/b3J6Rq3zKkRcW+1A03xGMjwbTnMS4vwbCB4yBqYOjYymnWSx7JmFCBjpGQwnC/
         iIqJHWJcnW8XD+HEPsEUayO98NAxEjCau4ym4K8Tciaish6D6TCOynr9t7aLQ6QSl2Aq
         8xL6k3NMk0ZwIXkXJsYnO64sokfsDzBUdcVE7q5V8KDAnmDPNI8Kr69Se72S2nmSR+tO
         QIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999053; x=1760603853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4dMFnnL6gCSV/BGkdGLVDVI82ewLVkorW1rAtn7Qrg=;
        b=u8ilyzucHLeDBPk8FgS61JYWHNZ/XB9S+0i265DkJA+fy076SLjwwsy+IDyaCYbR/u
         Y+vaXGimP5+ZhO6WlDd0j1dUswT5o1fi86YD/vOs4Qns9a1ur7ofA21lWi2oDN3YUJfN
         FzF6zj9zz/QihWzhiMZmd5ufONXbnyhZh7EETwVNVf+AaxTj6vFhxfF482Df/TyX/0u5
         sinwoUzM6tMG6Qnh6Jn7GC6gzLBcLVAbYHZhUPYVXR/X7nUBuLYvPsuw+QoB/YFrh4o+
         QmyPOkbv/YMbiRbwFDEnBYIlxziH81Fe18SlBVP+WnPuG9Qezauui1QK3GJepUxIc5mY
         NQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCWjbm6H0s6qRht4cp/mFE69jeXmxOhaPq/kEvXdcQZH3OkZcByY0RA4KzbYCIFtvbmuCF4fUq4ofmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLfWPn/hWYqr3yPWwi9oId6TKd98wTTP3usL5/At+qrqCHFmVL
	ZW1VjwaQBqpiYj7uNtih+hryNn4WCNchh/tuHDCdDUaOYpCOq3qH/WKS
X-Gm-Gg: ASbGncvmqpwkTaDmLBMc0Na0VNJY1/ZIywHTnH8SmWNm13D1mD1KS/CUfOJwp+FLBH2
	n/DoZVnkMkHVf86FXBagCmVmYwpAZMojpN5Qrji6FViibvy//RUs/KdptCZzQ2mMmwQ+jehwOQB
	RrqiiIRU9fgu52iI3yrERPZmC9Dx8cHMMoFq7KYQd/orRyDdJdKg5Hx+4d1MJ2kcNXwyUtKbpt5
	IEfmDDWTJK71mbewzspunzXq0Z/dVwE8ICq1ZYvcR9HN4OlWF29g66B+PeZ3E0rAfR6Zf2GEidP
	S6nJMUmnUGXdhQjaaOAhAb50yIDJZErdzeEwN/lrQPR7AKxWsa1oqHhj4tTR+J7fgkvykCBDexe
	YKsqkETxAhlB4qFrE9n4Zn670JOJpc2R7JYwG3VCS4l0zT33QPB+K3ZmlXCNFZlRJ
X-Google-Smtp-Source: AGHT+IF+KdeAZswgYlb7SDSnp1ZQxCQL2XQMEHKQQ7rRfzS4AETD16SRvGkKtRNvth3UTFIlZ4EmBw==
X-Received: by 2002:a05:651c:b2a:b0:373:a465:294d with SMTP id 38308e7fff4ca-37609cc36d4mr17547791fa.8.1759999053179;
        Thu, 09 Oct 2025 01:37:33 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81eb5sm26482701fa.50.2025.10.09.01.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:37:32 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: p.zabel@pengutronix.de
Cc: a.shimko.dev@gmail.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	jarkko.nikula@linux.intel.com,
	jsd@semihalf.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com
Subject: [PATCH] i2c: designware-platdrv: handle reset control deassert error
Date: Thu,  9 Oct 2025 11:37:03 +0300
Message-ID: <20251009083703.2038187-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <206e36398db6075bfb0bb0b98295ee7328c5f64f.camel@pengutronix.de>
References: <206e36398db6075bfb0bb0b98295ee7328c5f64f.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle the error returned by reset_control_deassert() in the probe
function to prevent continuing probe when reset deassertion fails.

Previously, reset_control_deassert() was called without checking its
return value, which could lead to probe continuing even when the
device reset wasn't properly deasserted.

The fix checks the return value and returns an error with dev_err_probe()
if reset deassertion fails, providing better error handling and
diagnostics.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
Hi Philipp,

Oh, sorry, sure.

Could you please have a look at the v2.

Thank you

Best regards,
Artem Shimko

ChangeLog:
  v1:
    * https://lore.kernel.org/all/20251009074443.2010699-1-a.shimko.dev@gmail.com/
  v2:
    * change pdev->dev to local device dev

 drivers/i2c/busses/i2c-designware-platdrv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index a35e4c64a1d4..c89af7cbdfac 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -240,7 +240,9 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (IS_ERR(dev->rst))
 		return PTR_ERR(dev->rst);
 
-	reset_control_deassert(dev->rst);
+	ret = reset_control_deassert(dev->rst);
+	if (ret)
+		return dev_err_probe(device, ret, "Failed to deassert reset\n");
 
 	ret = i2c_dw_fw_parse_and_configure(dev);
 	if (ret)
-- 
2.43.0


