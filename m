Return-Path: <linux-i2c+bounces-1654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3984BE38
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 20:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97AFAB22ED7
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 19:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D66217BB4;
	Tue,  6 Feb 2024 19:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xrzo3OKO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE417BA0;
	Tue,  6 Feb 2024 19:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707248550; cv=none; b=q0TbRUiTwN8dtMsLWOenGgM9OJeMXrvgqrOEKCqxAgiMl8s14Kw3vVz3YrTqNkf1VoS5rnwhKZCZHgGG6ZX+mKHYSNENS23phIcFMXdUXmmzg3os43ulg4H3MmtU/U964xu/hfh0waVY1ZQlhLQSvwz/Tl8LjBS4u9sJpyxJ5Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707248550; c=relaxed/simple;
	bh=J0UzCl31wEHiXY4sb/ZjBK1ln7klxa08h7c306ggFVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=faKXrin38ZBbKcpSLvruPI7aTnQEFTPcT/fPsWvWofv3SkHduO32LlQfWaFIkJUDKv5OJB2/r43DRINfGwMHuqMSsbgD5Da4IPL1Rqc/kDDtWCAprjH1L5Y07ZA6XmmrVRp/EdqCJ6ArkggGjjHqPlF7+fgkf8dYsHoRxFO8bCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xrzo3OKO; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51117bfd452so10098354e87.3;
        Tue, 06 Feb 2024 11:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707248546; x=1707853346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWGkE/O3QdNQnmc268O5sKVqO5KYwMpumGh7IlwPz/A=;
        b=Xrzo3OKOyto1cefoc3WxuoBgaWNsXKZKi54iClzGh7qNCskF+aOZOr0bJkXvzvJky5
         zqpZ6zKGb6cUfOCZHGXgG4np1Ulgek2i4v86qnPfkJfABwVSBVyMoIMhwPRpHnkdHuCi
         6JS1+nYJQxdaaZofyjqmglJMFpuuuGwWLhQieNahG+2Cug0I2oFQ6AGWcGXW5fJXWMM1
         rKP/3fN/j7XcgHKpRTPoFlNRfsBTT+iGuFHuhq1OUqPBhGHbf6H6eWllN8hufFJCx+yM
         4iSuRhlU1lo8fQjF1/Y5fQvCjWNMmHkzSGE4FbGcN0wxUG53SWP7j9RRU2FsiYh8buqr
         L5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707248546; x=1707853346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWGkE/O3QdNQnmc268O5sKVqO5KYwMpumGh7IlwPz/A=;
        b=b00x4pJHEs0XWQbxIGeoTHdSqYaoPeAy0SFSJNwrz/DRgDKplUc4xmQRTwiLt0XcEJ
         gTFJi4ieo/E11HB5Hgamhvl6gTiP6VTUvV5XgoEdlAzufVVjYFm0BBzJLv0xB90tr6cU
         WFWqUHlPrUV9UbPzi0cBI49Xkq86c0qX13FcmlfST/RmEQ4tavDJ3XyqXRrmddIgkBD6
         IMPwYGbcWu2jIfNViTP6IdpdbS3UEOGbmnzXDA6xYOxZVvlI+CCoc6Sa0OgLWl//Oc7u
         ws0V2MCha3DAijvCmFLLTlTo4n3kwRx7VAnIqPFF1wIvZ+xOASu6GZ1SO0+16g1gOSym
         9HgQ==
X-Gm-Message-State: AOJu0YzW/O4rrWM88qxC8lnNfPNWSV0oTHlFXXbrVZpgcRSpjEhlacWu
	gH9ejGbghD1HtoqbdDsLw7RYC6sEJIX+o/RbVVtBqIdcUdxkb+tn
X-Google-Smtp-Source: AGHT+IE7qevWSjL8dZocgLqsAfOGZXBUdZnhZIDLJrbJ5gp+vAPBcJr9RN8VTY1CGdMesP+xRq4odA==
X-Received: by 2002:ac2:5f8e:0:b0:511:4f00:45b2 with SMTP id r14-20020ac25f8e000000b005114f0045b2mr2029806lfe.25.1707248545910;
        Tue, 06 Feb 2024 11:42:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXUVAWc+6q004yovkdqQYOAJoHZ+Kon+sQNc0F1CW4Y65FY5PoMZqCbf5ehtHMwBb7jV/8xV5gfNxiubKHO9FL/z8DhVg7fQnyPrUFGy/YXvEedjYDCo+R1xM1Df392uLlu/mkXHbw7ylZSGciLWTr/5orAigaXGH9Jezut+c/+HcCJEbeGrdHO6cjc7rED9TBZ+PQ+vE4E3bx9/aAzioi/x3j6oDEmM9N7cDJrLXMmOI4JhwEilWmKr3rzqQq9kydblQBtnoJuoEkH3Ebuk/WY8+ENtn0Ur16IHHV3bfM1OUgZYi9qj493KFhjpw1EGNxgTfmv8Ct0lUOQxPDIgc6DEDZn4ByySzKWioyvMjZINerb/leStX7PdNpgZcDdymgeffyFkcfFLcMuBA6I9T1TsjQkcF+zAEAVg2a+61gZhDD17Qy+
Received: from rand-ubuntu-development.dl.local (mail.confident.ru. [85.114.29.218])
        by smtp.gmail.com with ESMTPSA id v20-20020ac25934000000b005115eec02d0sm234324lfi.234.2024.02.06.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 11:42:25 -0800 (PST)
From: Rand Deeb <rand.sec96@gmail.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: deeb.rand@confident.ru,
	lvc-project@linuxtesting.org,
	voskresenski.stanislav@confident.ru,
	Rand Deeb <rand.sec96@gmail.com>
Subject: [PATCH] i2c: Remove redundant comparison in npcm_i2c_reg_slave
Date: Tue,  6 Feb 2024 22:42:01 +0300
Message-Id: <20240206194201.10054-1-rand.sec96@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the npcm_i2c_reg_slave() function, there was a redundant
comparison that checked if 'bus->slave' was null immediately after
assigning it the 'client' value. There were concerns about a
potential null dereference because of `client->adapter`, but
according to Wolfram Sang, "we trusted ourselves here" Therefore,
this comparison is unnecessary.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c1b679737240..bdf35b86e559 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1247,9 +1247,6 @@ static int npcm_i2c_reg_slave(struct i2c_client *client)
 
 	bus->slave = client;
 
-	if (!bus->slave)
-		return -EINVAL;
-
 	if (client->flags & I2C_CLIENT_TEN)
 		return -EAFNOSUPPORT;
 
-- 
2.34.1


