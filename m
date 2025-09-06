Return-Path: <linux-i2c+bounces-12696-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA86B4676A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 02:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C33803B27EE
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 00:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894E78462;
	Sat,  6 Sep 2025 00:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktgG1gFt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D168747F;
	Sat,  6 Sep 2025 00:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757117544; cv=none; b=SsZsia5/QsX/dGGpwPZKGZmwW/8aTtYKP7tTA5uVKyhOmAE1gywY+PbrVbFNX4zxHXuOEj9eqGcXzElm8aM439J8EXXK0OrF6cd2ZpekhtIwSlIEJAXbW8Ryj3Oa/JjRMwAriPc66AJ6hNOs1kZoYUymoYKFT2QCjJti4dxn3kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757117544; c=relaxed/simple;
	bh=AFSDmgyRCMgif3cCKHdHPQq1WRLZ7cvhYkBKPGoQZII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ds9j/SkAFM6yJGI1VUJV+UqK6f5ZYSSSjhCAob6azBFLmpLS7YYzIrKch88iM6flvQNZFwUpg8yzduXVqmKJl57amcPihnRMV/qD7NOVdq9pf+Odb7oThduTRHEWuX+Ta2pL38u8nyGE+siTcozBLMsp164IzpqTQz6W+wycREg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktgG1gFt; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso3442966e87.2;
        Fri, 05 Sep 2025 17:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757117540; x=1757722340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBeF4QRURRds6ri2MTG6TWWH1ciD0HDW01AQn3fRgRc=;
        b=ktgG1gFtWweRag8dH15+SUY6VFLs07/U/a9iJMmTt4pgRre3GTF06RGsycQgg3pHUj
         WViSojGpCkui+DPQB0JYMGbqUjSU24f0w3tKpuX3giWzFfg2IzFHC5VnYl/8e4UXAVx0
         W1IzDxHidS4lsKfhuCEwX6GWetXFedwy6NecBc4R/7aiWWeiBH2QBGBgo8QeX6Jvurty
         MqYT0u/ey6jpRkPPMu6RrJa99MCiHJE6atK3DHKEx1JLnvqme2ynXynpe8Cx+eR19tuu
         n5x5Yy+yjtYMchnrM/yU0Ji56MLTvVjvjEZIgS6mrXmdppk9HPZl0rVA9rz6asruhKqJ
         +0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757117540; x=1757722340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBeF4QRURRds6ri2MTG6TWWH1ciD0HDW01AQn3fRgRc=;
        b=Q54D5A913gRgv8b6r44l+XDxvE+LPjUeD0FaVbefz47RBFd9A7ObOW/Ljmh1E5+I9c
         T19Yfjk1sDB9i5UiUzQebITT1A8lX31keBwULgOMv0lLdAskguV18kppHQIj8RDVzIk3
         PfHWJjXy8qFIEPF8f6st+6GMB6hl3ktYtW90U3umCK5X28JVkSRvm7u5o+E8JYxlgOZa
         qQbXUP3GZMa84ggrYwJeH9DzqjgJQKWSX51APxIvsUfqLgAnx2AirSb2VBxyA0mrbg6y
         py9b7/S5o/jWdDJEGVdBSg6Q4w4XJJmL2rY4CgUE19128TBtIe/5vGH+riG8zcNt3kFZ
         wN7g==
X-Forwarded-Encrypted: i=1; AJvYcCUUULpYCQ7oOWCeu6F5CVTilc5u1BXJ2F08oe2LH6G14nOnDikU658uVaddJj5O3/JP2PcySOiO9pY=@vger.kernel.org, AJvYcCWZRbtTvwFXsQ8GtRa3trYDlatgpDuYKHlfdl9cXraaMIc7l7V0cvEqdwIA5k7O6q9ybrtGhYmjVT7WsOUE@vger.kernel.org
X-Gm-Message-State: AOJu0YwxlMx2WXPT4MEFM/FBrcXk4gcORNr0ZqxnUoufYdl1vEk+XIEk
	dg4ghDO9kF9kl3dL4vAfhthIOIbcoSOTxTu9SrzZLskwVYbjy1G68N0wVSLYFnP3THM=
X-Gm-Gg: ASbGncuuMk0JtCHYlIc4iu5QT6EQrjl75WBzmhkXIWQoUN0Ddxbyx/OqMr9MQnvWQVA
	6FRWPnOFYZLNKyY+WqE8UHml7LMbbjGLS+FFF3jGx2SpajiAeRtpnEG2JMhs49CCnB9G0VLuWmk
	efzbsq6GHmPU6p/wz+N8b7s0Al11HAu83923zYy7nV1UlHfq3Gn0Rnmnc4BXXfYArjZ8Ltr2WUv
	At7NfPx8JX9H+M9rU2i7rkyaI+M1OiMO1n3Rvg0GxcnwXKLzbOxjF0TImvBcR7Rs4s4vMPnYK4t
	WwHma59vyFaWoyX4wAk2QsEpB2HReKmQNT0kYYE3lVlnx2KygpNeMqhYzyvSafQGMHdH5jpe/T4
	frMtfQwMID8fu0X6CKmVX09JonT1cmbgFyC1c/nc05FeuHcQA/oE=
X-Google-Smtp-Source: AGHT+IEWKaLVpaQspENCbERkgcADaunfG7HcDOCyUZ9qoigjTBjNQVzMakv4kdnAixwEGJiAVOJvkg==
X-Received: by 2002:a05:6512:3d23:b0:55f:44d5:e517 with SMTP id 2adb3069b0e04-562618e16f2mr154264e87.43.1757117539569;
        Fri, 05 Sep 2025 17:12:19 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2033530e87.85.2025.09.05.17.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 17:12:19 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: 
Cc: Artem Shimko <artyom.shimko@gmail.com>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] i2c: amd-mp2-pci: Simplify PM code using DEFINE_RUNTIME_DEV_PM_OPS
Date: Sat,  6 Sep 2025 03:12:07 +0300
Message-ID: <20250906001217.3792723-1-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <y>
References: <y>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello maintainers and reviewers,

This patch series cleans up the power management code in the AMD MP2 PCI
I2C driver by modernizing the PM infrastructure.

The main changes include:
- Replacing UNIVERSAL_DEV_PM_OPS with DEFINE_RUNTIME_DEV_PM_OPS()
- Removing redundant CONFIG_PM preprocessor guards
- Using pm_sleep_ptr() for better code elimination

These changes simplify the codebase while maintaining full functionality.
The DEFINE_RUNTIME_DEV_PM_OPS macro automatically handles the necessary
config dependencies, making the manual #ifdef guards unnecessary.

The patch maintains backward compatibility.

Thank you for your consideration.

Best regards,
Artem Shimko

Artem Shimko (1):
  i2c: amd-mp2-pci: Simplify PM code using DEFINE_RUNTIME_DEV_PM_OPS

 drivers/i2c/busses/i2c-amd-mp2-pci.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.43.0


