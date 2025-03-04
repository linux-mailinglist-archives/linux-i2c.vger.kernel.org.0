Return-Path: <linux-i2c+bounces-9704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16029A4D43C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 08:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93EE47A6486
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 07:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690F41F5825;
	Tue,  4 Mar 2025 07:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyunXA6m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEEB156C40;
	Tue,  4 Mar 2025 07:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741071779; cv=none; b=ZcLdM74O048t130jlz5XHoTnyRC/wHXnecXUYbMdNWXAJQWlbFcN3buR1XPyQWISvpNClJi7hZQHzRWjJsGCkPIu94kG7jrovHgD6LgEf01uUSLGVM4TWg1blxDzLeFImUX0hQQzhsCCl/z/8tVEVS1sB/HeVW6Ipv0DpPE6/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741071779; c=relaxed/simple;
	bh=nFd9OsfUVs4uNJMskz7RO4bSAjfJBMlC4GzgylNgBf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CqeNaP4kkNHWQitmKpx1QGq33PLZf3CTC8caBdUzTm1BznFpLQh25TeTl6uohhfaelWjEZeJUVMGa2HbeYXqST80CPf3vOl21eZzn0kosMvm/yOo4KeFDhRnckBJ9EvX0Gyx4CfSRdRvAwDImRtzx+LXbHKzKuNpwhCoJCqFSKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyunXA6m; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e89959f631so41879136d6.3;
        Mon, 03 Mar 2025 23:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741071775; x=1741676575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gxfGP3MY457r+xYt+ZuAK4iDt/zdeBwGUoLJRUgCnY4=;
        b=KyunXA6mfmMsGmu5Ld2UpBCCjOsthvK55nDwkNK7we+c69+0PKrM1+2luxSjRqXKc8
         FbC0imBS12KE8r2QMjmRYC4BeYGsHNE7lCBR8XFwb+K+noNjmxW8BjnzYgtAAqHybyta
         Ik58cAlWCGN1+Pr2XVcLcGXbjveH1pRpckRZWGrL0/Xj9O21dQZLKgWYiRYOIcwkjqP6
         cpXnG6WjMuyontAdWdvRgMwKaZFIbIBlyOwqp6GOwhNmyQnTSuggeXFEO7q4w5o3afRa
         MALU9qXN5NlZ/mjUw7JDHMiSqD/R0mcpf1UZz4dNZiOLetx+KIhG41sU/71Nz4G6aNRR
         KbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741071775; x=1741676575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxfGP3MY457r+xYt+ZuAK4iDt/zdeBwGUoLJRUgCnY4=;
        b=ZZ57Yk7svSGGWw2WazKGeflzXSioyQaJhJzAvgj7aUZ4g08uVMVMJQcPrww7Pi+9LC
         71k/OzIMev+4EQ/W1aZcDuFh0e9ol/X7x4BBFv6sneJhdXI7sgztGiiDIMWcAPjNrYhY
         tRqG9i32pnKKb/iAenByI363dN3czKtLLN9OrjCq1zbzMjGnxCvQNDNE6Kw06latf3Ks
         nTNx1e+0IUL/mu1fb22JkjtqNiKkmxTNE+taypondcNH4JTRON2twC3wb8YFco9An2tQ
         IqByYMkqXE+lxYDhQznP+MHCFVl2CBPjWa3uFF1AHFNuqaZ/rVo4b52d9WB/SLejrM/Z
         28Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVKe6qo9AGOo/AkorO8BOJfvpGzyWlA8KfAPHm7KO25FK06zlemuVvH11SmjnsXbMlkluJKT6scDps=@vger.kernel.org, AJvYcCX6xsn0zkmjy7ARhX2e8XfCycndM+21/KR7oKyPO2wqAHd7dc3wjab8oUcqlTOQqOD2eSV/YiNTwpQCigV1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6T91bkGuxumWR5jNjKII4Jen5aSA+DJKZepFb8dFyDx5CgOYg
	Pk9wNCoAwfvPPw5rP0dsnZppSBw/dgpxDgqK0K741TYUGvKrceTT5kn8lw==
X-Gm-Gg: ASbGnctMQ0mq2pC9QYk5bL1idAHdc8CCA3GyJwF+gvigxnVia9vuEXZh6ai3W+CFX8a
	IeZgzftatBmJX7sNjslkIsFC2HkNxHGianOQ/o/4+fhFHu+PYhn4NPjZ2TMQssSwk74M2DjZRK0
	2vAiqv2Q38ontt4suhWhCMTvGTuUcLhQpwKU7z4O6PJBcdZjDC4PJ1SxGN/jbkCON8TyfRMLqVi
	SMSYe06mQ4gzAvQkwMJvMnGoXx4N/tHJzAFKmk7oEgnHVDfw8m3HohaNfkWSe3Vqk6Eckmdb4T1
	cqUmvviQkCiwcLqvakbW
X-Google-Smtp-Source: AGHT+IHQhyAzMcK6VfzjpnP3Rhdrb/rXBWi6v7Iv599/aHMFEq94/AV732T+QTq5pgSBsLp1iN+ZHA==
X-Received: by 2002:a05:6214:da8:b0:6e6:6252:ad1a with SMTP id 6a1803df08f44-6e8a0d6de8emr286475046d6.28.1741071775582;
        Mon, 03 Mar 2025 23:02:55 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3c4615f20sm165951185a.27.2025.03.03.23.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 23:02:55 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] i2c: designware: Add ACPI HID for DWAPB I2C controller on Sophgo SG2044
Date: Tue,  4 Mar 2025 15:02:11 +0800
Message-ID: <20250304070212.350155-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ACPI ID for DWAPB I2C controller on Sophgo SG2044 so
the SoC can enumerated the device via ACPI.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index d6e1ee935399..46b2b972f679 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -360,6 +360,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "INT3432", 0 },
 	{ "INT3433", 0 },
 	{ "INTC10EF", 0 },
+	{ "SOPHO003", 0 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
-- 
2.48.1


