Return-Path: <linux-i2c+bounces-11153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0527AC7DA3
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 14:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F59B16FE9D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 May 2025 12:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B84224890;
	Thu, 29 May 2025 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1G76UBbK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3851222573
	for <linux-i2c@vger.kernel.org>; Thu, 29 May 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521355; cv=none; b=OvzM7CuIJJADekdTPVYdn3Q9Q/AjBedJ9Ec2IwL7oMJgCX9ulTo0sYRHTAMx2bA4pWF52VBFF5tl7y64c5KiJxM9M0ub5o9q8fsHfx7p390qdaZ/X99bhjt4QcXJG3QH7Z/9J+SweQQdPOwG8I5f9POChmmQw5r4AS/+2JMuve0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521355; c=relaxed/simple;
	bh=8Q54xoWFm5dD4JeLp5GkvQ1SCkN6YSxoGPXQB+KAnIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j3hxQ8HcjLKlje5atvGGpxZqIpUQf7F+IfXlRbFtoqsHHdzqdEigEPOZ+Txpr2/dud+JWyDkOLDd3ODIEPUN/pvUQ7dMWanUpSjXc4EX5+k42z59676wWow1JRuTFdIiKcX3uVPlMo55JJLHyFNaFfC5BcQr0m/fvl7W4EkRsNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1G76UBbK; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6faa9e72827so13921976d6.2
        for <linux-i2c@vger.kernel.org>; Thu, 29 May 2025 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748521351; x=1749126151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfZYXxSa6TDC4D9WbSYlB6mVhhaETHCcZWNW+QLW+Ek=;
        b=1G76UBbKw7eyH+bEqjcpfKOgmSmq93O+PfvgfBfnBMpLSuoLpbZolW6tyxj4Nx4M25
         NDGe542pOTum9L4gCkSzFGsN3uMSdJxRXED3QFxCmnTq/HuP0XPBq7hQIr3AOZD/tzdl
         Dz14Z20cuyJeM3y7ujYoQJQBPdDTfBm7SnletJIaEpXk0njDA74J+ePA2YMu/qJas7eT
         3t2Js0Jx3E+MYtOt69hJraulrF1RyYgBXtSCDYBRTw9VjRrSXw7sqqT5/LHU9FInofzJ
         eE/iIIlAjmnHwTiT+uajRqT6sxxVG2nimthHaGscmjzXKGxuTD0G5JGw2KSUaOfiVuCv
         AdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748521351; x=1749126151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfZYXxSa6TDC4D9WbSYlB6mVhhaETHCcZWNW+QLW+Ek=;
        b=vW89yiXpmmyjyzf9TBN3ILH18bHKvawEolmo+NPeixSVtQWvKgFjyjJWelX22rxplQ
         ofvdnTpDwS3F/8pn1BraMlfo0L2Fz2eDTyKY9ubDmrT4VIgIf/whhrcg08KT4UTFuQTE
         +OjrsDuctsCC2mo2oWvTK04LWYH6f0cjjVWwP/q5Gu3Q7OSTtii25kkS6oWIp/dfj5hu
         0mUNJ9ZwQ4HAqfKYtGOLXBa4gulS4fGTg4urkL6iV45BxtssGCJol2rvzGS8cZMRYpMb
         o4s+EKXWIpKbmvgzrtmrkHaVE3dzTVoF3oehy2h4KjOyYFq4Cfl9pNUSeybwpVFl0DAz
         aNVA==
X-Forwarded-Encrypted: i=1; AJvYcCVXJ0x+MQKdx0PbKAadRprxfaLJuDz5X0iYrCDaw5b4Kj3kWyNv3tm52zzjl5hpeY8ZTfeKcwHYMEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIoczYAWcwaO5VlAKHSNyoBlSBvmXUTEEZ1KTUBepVB+IjoEE
	vNitXeBAzYSN4SE1YbRjccJIOrZFaCdoiYzW6coQ9RpP0KSfdYmt8LpImtu9wE/t3RE=
X-Gm-Gg: ASbGncuQMVd5LW2bmTJOTkAfdmsClaBIkpZYypcjxcyNbFwpmP9Zpql3BaMUujVI/bQ
	u3kDinWq+OIEtmldJwvSbvR3WT0ey5u1MjfyT4RJ5QSBBEtIorBoW/LXgXrtTf5ScID8R4cY/rj
	SpZ2oh8UzH7t6lCQioWxPQRp1GiS/GREz14L6qarqzqgF2nyzJxcZAwtAimZ8Xy/ksEmJb6zZya
	2txmJCXcKgF7LZVv0YKI6n/VRUzT7GuYZjA2f+eoX4ggPGi668pds6T9/bP9PUiHPpWceEGGQSN
	fGWRKuaxAj/uxO0B0F+BuB/NAjYHkX2jIk5SHT3wc+9xin3UbVHnblYL7vVCnl0XTXGYIaw8tve
	/qvdVAEWTVXynf1wEJOiC7WdX
X-Google-Smtp-Source: AGHT+IGKJiOHPciyv3QtiOSyy/RZt9nsdwc7fAQpB3gb8J6aM4q7mvFoREGf65Wv1z/Aaq14437gYA==
X-Received: by 2002:a05:6214:212e:b0:6fa:c44f:2ae6 with SMTP id 6a1803df08f44-6fac44f2d96mr79427466d6.38.1748521351418;
        Thu, 29 May 2025 05:22:31 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d5bd30sm8814346d6.67.2025.05.29.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:22:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: k1: check for transfer error
Date: Thu, 29 May 2025 07:22:26 -0500
Message-ID: <20250529122227.1921611-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else

base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
2.45.2


