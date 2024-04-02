Return-Path: <linux-i2c+bounces-2720-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA0D8952A9
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 14:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 753B7286045
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 12:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB90E76F17;
	Tue,  2 Apr 2024 12:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RbDENW0l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64B76C61;
	Tue,  2 Apr 2024 12:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712060071; cv=none; b=PC0lLoxJ2Rh9i86y34W+E6OEPKeepFTl2reJquU1Gwsu5l6GYzSkuUlyR8tDMQllfVYvqrKmJUpDsgd6aIHmlzImF9yiCoN+WM3i7B8Ef2psImRH4NgKmml/uCFuo9waSDacaQPa0k+JDer61s1tOa4GY6UTmhcg1rl5b9PTzkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712060071; c=relaxed/simple;
	bh=e7f9ClCzIprx8T/6sYnbbRpgI85tID2BPT+5Vs7gAwM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pVDK4+NaPZUB6R4BHxOOG+Jf6RiQIflrV9b3VSmV16fEeLnHMq6fkhzQVEST0tcFXze7VrPlgO2dkE6GqSVZrBYBF+Genj0TktjbCEAXtz282OoAL7BFzL+hC53S80Tv3hgKo8l8kjBP1FXUFYjGvUWhCSMa+Pg/ENc+tunSezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RbDENW0l; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a466e53f8c0so666530366b.1;
        Tue, 02 Apr 2024 05:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712060067; x=1712664867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lTHANYFS7U6nUICR+q0D94lhFAasgzjgVW1g2kkoD+8=;
        b=RbDENW0l/EAUfsKfmkh1XTgPlOCh6LpozMPSfBFx7gyT6rBjYWfZ89Qv/H2sVtQjvI
         l/6D8TL5DcmDdSnDjbwDiI+JtIB3V1n85mJwcuRfo/CiCPXOQ1eUFCXQt0n/dBBDTxR/
         KmCuOC3AYtWVMMr2y98yVlGq81TT9/Nfw6RhcLg+AdTEw6xxCN1e7WjTE5QTr/02TVpq
         l4ZSEtlKrb9MP0YVJTfJuERFPntJaJ8r2dXJYhc8odLY3mvbYntzc/nk/P/ZqaQ8onZj
         P0gRTdvuWuiNHZd6dvKuvRdbAbr105FXoVnlqjI6uQwYBahkCT3VA99XjqB5L0zQF3I/
         0eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712060067; x=1712664867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTHANYFS7U6nUICR+q0D94lhFAasgzjgVW1g2kkoD+8=;
        b=i3RwkQ66JWzkS4kJ3OBvs1/6KDZjBPAx4gtrnigBy/Gisz0rQWmc21DHoPbwcnI0so
         Zb56tPs4HuAKC4zuw9EsxFyVcpdH5Cxq8QTr9FMgguhOsTISjDqMSNp9ZbNAaNxCoh8Q
         HZvKcbwcMey/NvGy+7jOryRpvxrwjqOoo28lxkzJd+ov7kXge9Tl9D0fLJi8/hIRKA4x
         oGc1KVI9aP+OEOhG20LmGxKbUSHJLIh2F8XIw4OkC1yE+YnaV5d5j5cUtjfG2q9mE6Wm
         WwWtUhrmm1MjJgD42u7Vo6PJFoS6kYnn944mYxMvWiAhQucIUiwqQTJXZIP59NFaz+17
         0JbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFUSObaNLlgu78LUDxRJb3QapjXgZmLA4EGlfSS1uX6DqhFbeHtnd2XKtMb83+ZS9dveGJGfElELmcxVmakD5nI1s7R13m2ZUiCFKl
X-Gm-Message-State: AOJu0Yy5BFvMcyVqzctRexGg3oC+DOeygDfcd5o7j9YZ8V/CNvMXm8+G
	MjtuacllIxEJZfIxXubRJIqeKpqKnpNh+I/yTsBNxZlHu0sGqCWHC1v4YSHiAEE=
X-Google-Smtp-Source: AGHT+IF04rWtU/s4ho0E40kFwkrILba273Bs094Jazm8h8eORDs9pC83NwZXAjAnJKmcsVgEzUt1VQ==
X-Received: by 2002:a17:906:7f07:b0:a4e:14e5:5737 with SMTP id d7-20020a1709067f0700b00a4e14e55737mr9618569ejr.45.1712060067397;
        Tue, 02 Apr 2024 05:14:27 -0700 (PDT)
Received: from LMI-NB77.. ([2a02:908:1d8:8f00:cda9:e760:34d7:4af1])
        by smtp.googlemail.com with ESMTPSA id js19-20020a170906ca9300b00a4e8353be19sm992638ejb.224.2024.04.02.05.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:14:27 -0700 (PDT)
From: Abdelrahman Morsy <abdelrahmanhesham94@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gupt21@gmail.com,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	Abdelrahman Morsy <abdelrahmanhesham94@gmail.com>
Subject: [PATCH] HID: mcp-2221: cancel delayed_work only when CONFIG_IIO is enabled
Date: Tue,  2 Apr 2024 14:14:06 +0200
Message-Id: <20240402121406.1703500-1-abdelrahmanhesham94@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the device is unplugged and CONFIG_IIO is not supported, this will
result in a warning message at kernel/workqueue.

Only cancel delayed work in mcp2221_remove(), when CONFIG_IIO is enabled.

Signed-off-by: Abdelrahman Morsy <abdelrahmanhesham94@gmail.com>
---
 drivers/hid/hid-mcp2221.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index f9cceaeffd08..da5ea5a23b08 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -944,9 +944,11 @@ static void mcp2221_hid_unregister(void *ptr)
 /* This is needed to be sure hid_hw_stop() isn't called twice by the subsystem */
 static void mcp2221_remove(struct hid_device *hdev)
 {
+#if IS_REACHABLE(CONFIG_IIO)
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
 	cancel_delayed_work_sync(&mcp->init_work);
+#endif
 }
 
 #if IS_REACHABLE(CONFIG_IIO)
-- 
2.34.1


