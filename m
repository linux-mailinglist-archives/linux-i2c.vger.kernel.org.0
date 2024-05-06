Return-Path: <linux-i2c+bounces-3435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5C68BD1B5
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 17:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 217C22812C8
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 15:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE891553A5;
	Mon,  6 May 2024 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diLewifh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65E155380;
	Mon,  6 May 2024 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715010330; cv=none; b=HXho3ZZ6EBfMDZpkPqFIi/D1BtD+hM8dGVOF9v8J2F3t+9Z2ILYrqO8lfbMg2D++9U5qFXJzfFo5oWjbX6oofTHNd2TsASI5XP8w3e1nr0r6AUxkbTvnLh3xTrPOu11dXgzpvqQdIrr0uXsy9YfP5nNW5goPJw9V9IW1YHITm9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715010330; c=relaxed/simple;
	bh=HPGmG1g0spRhjEW8ciDZ98jGlZGqzMjL73XubFM+0eo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MY+4CDflX3YyrB7tUhW4vZ+hXkcF0jTbNvQ46nF6tVOhbU2Y17lqdgUptBnU0aNIvuVBp79q1Vrh5RLLJziqX+t4GWg6cmGLIn1yl+Qgyi4SkzWb2tPziSSzGZRUuE54cJ62j3YEwQODgp7yvGaR9voqDHjGTLv5QxL3oUj9sSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diLewifh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e8so12810215e9.1;
        Mon, 06 May 2024 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715010327; x=1715615127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjI/Xv3XiaQOPqjj6v/x4n5zCExnJZ+JWbWl24FY9n0=;
        b=diLewifhmxQGBGKI36HMtSAwu+CC5StdXks0Fks4BBU4VC3Yq4PMDIERr3DVy8snbi
         321fBgQcMQuV5BaCdN0m+Qmp11VK5o0rDijLVXO/35hy2YnZAsXSD9PF0cqRY9IwZ+62
         Ys4r59RrSOfVlBT3cwai3TGFnG4M7V89sjZX1QiS6owNEAe5y85429tUNKG+SQUj5gz9
         GXPHJt8NThVKx04hXgo+eTZPIQtvo1+J+qj+Ykc7GmsGz100X+tXLgUw4pP5S/oy1tJw
         KVqGZpYK5Nw06HdjH4eY4B5s/yS8m4/m2cbyaIuWMuVzTNdihNuCOy6AeJjBUfnc/1XE
         W9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715010327; x=1715615127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjI/Xv3XiaQOPqjj6v/x4n5zCExnJZ+JWbWl24FY9n0=;
        b=H05q9dfCPTwAM2qpKk3RjFb28hISVjk3cRd8ePyOH8+HAk6gROsnL60lEw11AcBiI3
         BYqkB0rC0F8gOZ5z87jmP2gOsAL5UbTTctEwhCr11NRG2E4DHKFNRS7wlqXaKQ/4v+ZN
         5/ucQ2fNvczNUblstlpiN6z5V2nFcckyLhCRa5v+Fuv8DuBr/e0X6PQgll5kUfNHZzQD
         ysi/vVWdZblFMcNTjCGaQAoQOO4i8A0+MaxheLtQuvv8sK/uilTWQydKszpy2rfRrxCV
         ldBu39Kz3iRpe+zfyDvvu6Q6GlczBW0l2Zb3PH4TN+eSN61pOVr0rwaY9wEsAV+KUEdF
         LesA==
X-Forwarded-Encrypted: i=1; AJvYcCVNpPgUm590QbB4e1kcE2v1M2f5t4k5oG5k3pblLRfsU4zUTtbAK5H2RHwn00iRPM52yZUdNjyWkpEk55nsoBofZCj3xebIiL7AHr6296tctM33p1VVV6O4Ae/6ZpX9K86B+TzfOmZY
X-Gm-Message-State: AOJu0YxNYVhTropGQr07nYVFVdDak7dW5PsLWaaLUa+R80M7nq6knyb8
	GuWPXTZvtSpCe8JBHhpCa2lW8peuJsxTtFk0tHdP+0b218z1kfKB
X-Google-Smtp-Source: AGHT+IECONYbtaCBzXAkPTz+LRCH/C/3z1JRYbIrJspc52OTuux8byJWAsNbW0K7sWtwu2YrBUcQvw==
X-Received: by 2002:a05:600c:1caa:b0:41a:7065:430a with SMTP id k42-20020a05600c1caa00b0041a7065430amr6226192wms.41.1715010325957;
        Mon, 06 May 2024 08:45:25 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id fc16-20020a05600c525000b00418d68df226sm20241486wmb.0.2024.05.06.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 08:45:25 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: michal.simek@amd.com
Cc: andi.shyti@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH] i2c: xiic: print error code when xiic_start_xfer fails
Date: Mon,  6 May 2024 11:45:20 -0400
Message-Id: <20240506154520.3886867-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marc Ferland <marc.ferland@sonatest.com>

xiic_start_xfer can fail for different reasons:

- EBUSY: bus is busy or i2c messages still in tx_msg or rx_msg
- ETIMEDOUT: timed-out trying to clear the RX fifo
- EINVAL: wrong clock settings

Printing the error code helps identifying the root cause.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 71391b590ada..73729f0180a1 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1165,7 +1165,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 	err = xiic_start_xfer(i2c, msgs, num);
 	if (err < 0) {
-		dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
+		dev_err(adap->dev.parent, "Error xiic_start_xfer: %d\n", err);
 		goto out;
 	}
 
-- 
2.34.1


