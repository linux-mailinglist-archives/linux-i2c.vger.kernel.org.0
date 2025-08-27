Return-Path: <linux-i2c+bounces-12446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD6B3885E
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 19:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2B0B1B621BE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Aug 2025 17:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D61301030;
	Wed, 27 Aug 2025 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqVvXkDk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B641494D9;
	Wed, 27 Aug 2025 17:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756314864; cv=none; b=otVZ6Z5/4qtM0XB5chYnS0DJoABzoqWzPQupOb8T8HHI6S89AdkjNdbtVRnKR0sDRv2nKRHpj9VSSA/Db94qJmfIC5Q8Aj670B0WeaYWGy3pV4/pLjk7gACnRxtZeHufMlzI9/Wff2eUdyfrVJEdUKGJrIVTUmJDyangXrJoY2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756314864; c=relaxed/simple;
	bh=vmhM1axZcbMDQQRdbX1XROyyy+ppYZsADnhf5UWlfBY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iIvfs9gVhxbQfrA+Gkd8CFMVB9aBnqBngbbGnk0eXMmPxGNuetTb0i28GULWbqfxvoRKvSiJHzgBfKqBUSrDUSqCVUYxSnO3e//0w9824o+0f/sWzq4K5NdAeYgfxkMRjXRt7HZ0fW+4Pnpgq+fwFY66KcMzNWa8ibDj6+TZbKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqVvXkDk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so146685e9.2;
        Wed, 27 Aug 2025 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756314861; x=1756919661; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=scSioPZgaBWmEVFJ4bgMUeN7W+hZwLguTW+C4ze8WMo=;
        b=mqVvXkDk0ocalfOblQOQ5G8TwyHKwis2fBCoMMd1V/vy2u+qUAQpbXclb30Gg1du3h
         1dpPuJ6zF75DR5S/YXhsPyLclTw/ciKtPSENbq7iSEPYumWiiP9BHrkNhkIR3YvlBnRs
         /6+YS+VUaPOc+yy6BKCBpvVxdXMfm4hoERXXVzLNnQM8XwOCXoV33XdNscceI096vIiP
         V/JV4PIgX2UludeBMgBSOPDy650oss3qkbip7XF5+fc4mkP8qAbFi6mIzUIzhrijixvn
         jj/J2vphdkwSlRowFhODDB3TcQsKrQiTFxG1HaYQWhs4tyBlxVZbT8hrXmsuDEGYujM1
         ZRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756314861; x=1756919661;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scSioPZgaBWmEVFJ4bgMUeN7W+hZwLguTW+C4ze8WMo=;
        b=n2SsrDN3EfZodalPMdVOvyzR7HzSeAu0DmfUd15TSJ+p5YQ8hnQIRoK9DzWJTSLlz/
         0JHyu9W5wHv8u9m8u1PoARfLK/g2CLH195GXPmRE2nwumj6KWIYlOLSg4gI8TDck5zVM
         NS4Yhjg8OkQpk8hBXbm4T+eCknlpk4HtVbiCzcSwMeIchnw9Ifqg9FbBFdu4FTY3cEs7
         i4XgaKazj6yjQnRp4h1jLRmMAUcgFD78N4+yvHB8Wo5hR/r5vdM9r/N5xpz1FI8Y7EnL
         pf999OFcUAz2FydbRF9cY4AsC4mh8wOEsgR3m/w2sRKBA6tx9dmF+pH8A9clnEU7CO6u
         Sxhw==
X-Forwarded-Encrypted: i=1; AJvYcCV2bzueEfNDCtUIBD7c5HM5h4Uvuxlz9nwRdul40CUdeg6/xM61aqh1gCxIlp0D/imglfwbIdZR8kE=@vger.kernel.org, AJvYcCWTi9Hx2Fpbb5eOwBE5EZVGcqil6LTMjSw+V8oHE3nEmjVcpynqt1e8jCe4g/cOz+m5J+ztsxgt@vger.kernel.org, AJvYcCXlO+0yu+E2AH6zwpcIP8RDup3PsXsTzYiWjjOUNiqZ6uoAdgQMePhwnYktfZXTuhz6VykXeGKM2lwo39wV@vger.kernel.org
X-Gm-Message-State: AOJu0YxVep6RckkYcj1aIFdyQsMO3go9rleYr9Xz014vKb4iDDQLsuTj
	LwY17yuGdWzK1QDgM4wPXQNLYO2vKCMnZzRmTmXJ79HWz34GMo+6nA3b
X-Gm-Gg: ASbGncuE1iChN11pFGzvJwtzGJCucIGD9nykBlbXckMgZoplreUjj70BGzlmvbPgas+
	6WI0EwyYIq9rIVS0hOPXBHzQTzzugSnSl0VvM6vnf6m+8cTtOuyDAEK6MkUA1Cd+ZBpkIOUuSLr
	7zRW7pOsH7+6FIUeKZ1jmxiiVB2KE3KNkUj15pzpCePVXt5kgmvZhNfF0pUuFxvLm8D164HVYn4
	KjI87O+VR8jYY2zq9QmuLKgsbpSdbXLuBU5yF3Coq6IkHL0mAcOYjRhel0BNjc+lAWGNX7G0C3+
	eWKZkKH7djn9TnUNyZGcBlfHdFN80F7CP6ylSqacoL6pxJXgcfiS8K9CnZ/u+s283DAdpN6Qjne
	f7omz8G9ZLsdO0ypiOemDCnTWaYTcD4DXWrsdSS6N7DZKmWl2Wo0=
X-Google-Smtp-Source: AGHT+IGgJZpfwG160OMwKEQBo65DWFs20A2jVte44M8RtyboFyzwUBOR1kqkVxkJxvfq6Bn3mVaojQ==
X-Received: by 2002:a05:600c:5247:b0:45b:7580:6f46 with SMTP id 5b1f17b1804b1-45b75807d2fmr9107245e9.20.1756314860766;
        Wed, 27 Aug 2025 10:14:20 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c7113fdacfsm21272365f8f.35.2025.08.27.10.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 10:14:20 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Date: Wed, 27 Aug 2025 19:13:57 +0200
Message-Id: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANU8r2gC/4XNzw6CMAwG8FchOzvTDUHmyfcwHpatQhP5kw0XD
 OHdLSRGb9z6NV9/nUXEQBjFJZtFwESR+o5DfsiEa2xXoyTPWWjQBRQKJGknh8nKB03b7Pq2fXX
 k7MiXMsfSo8LcgysFG0NALm7+7c65oTj24b29S2rdfmW1IyclQaIBc/ZgLKjiWreWnkduiVVO+
 qdV+5pmzdmTRlupyjvzry3L8gHumdmkGAEAAA==
X-Change-ID: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6
To: Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, stable@vger.kernel.org, 
 Imre Kaloz <kaloz@openwrt.org>
X-Mailer: b4 0.14.2

There is a long standing bug which causes I2C communication not to
work on the Armada 3700 based boards. The first patch in the series
fixes that regression. The second patch improves recovery to make it
more robust which helps to avoid communication problems with certain
SFP modules.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v3:
  - rebase on tip of i2c/for-current
  - remove Imre's tag from the cover letter, and replace his SoB tag to
    Reviewed-by in the individual patches
  - rework the second patch so it does not need changes in the I2C core code,
    and drop the first one as it is not needed now
  - Link to v2: https://lore.kernel.org/r/20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com

Changes in v2:
  - collect offered tags
  - rebase and retest on tip of i2c/for-current
  - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-communication-v1-0-e9097d09a015@gmail.com

---
Gabor Juhos (2):
      i2c: pxa: defer reset on Armada 3700 when recovery is used
      i2c: pxa: handle 'Early Bus Busy' condition on Armada 3700

 drivers/i2c/busses/i2c-pxa.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)
---
base-commit: 3dd22078026c7cad4d4a3f32c5dc5452c7180de8
change-id: 20250510-i2c-pxa-fix-i2c-communication-3e6de1e3d0c6

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


