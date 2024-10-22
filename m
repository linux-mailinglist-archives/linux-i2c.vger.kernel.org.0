Return-Path: <linux-i2c+bounces-7508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8439AB675
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 21:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0E4F1C215C2
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 19:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0E31C9ED4;
	Tue, 22 Oct 2024 19:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnsnYa7s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547941C9ECC;
	Tue, 22 Oct 2024 19:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729624191; cv=none; b=rXv/wTZElBUf457NOZ+RwanCc7DwmE4tQxF0ynEympHL08MW/rqGyEBOg1qxaWRaH0BVOTG7i6zL0JBxsXnFvJ18tK2wFeS14awV91CX4X+cKC7BrzKLLRERo5GETbWG0OasQ5R51oV5u3V2vdvW41ai2w41m6lxAsKPaNQ+NKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729624191; c=relaxed/simple;
	bh=9zctTZ6P1xbSfCpd3RZa8VzNmlfswd76EAkAS+SpkxA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EHK+XO4rpH5TjD9Q4OBFhAL0fK43yhTZy2/OoYhwhR/6+sI6UvBPrHjIIDo5VwOcnrVLcXfQT2GsyTBL7dysz+rQKU7g5UkM9a4vYH8Yz2BbZ0gObf/91M6JiHNs89P+9atlT3bkMCBaEnXp3q/MQxm4GhbtIkH+R9qnIVBoOgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnsnYa7s; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20ce65c8e13so51514795ad.1;
        Tue, 22 Oct 2024 12:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729624190; x=1730228990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6PiELke4NP4639bcqP6jdKFk2y5EnGjLKhntCyBZQV0=;
        b=FnsnYa7sOOn26ymCFpF8g3Zc53zblCc62Fv2PobZnldoz/m2su2UzFtavcm41eblb3
         RSr2aUmw7dvUMMsz14EP4uPb4D08SOdeOGwo6DYbLwMCeRgspSZbaml5AYpSngeYQ2L1
         UtMV5XBckbw91rbNaXebuUtjEDPjGaqmL1uJTk+1QUkdMjyQLKmdSyzeVJgVMO/0qoh8
         Fy4cgCydWktbRP+VaGnXvmijN4ODWBvMgo4kLsJ5v7adHvYlC/SF1xxzRV/RfWU21E0P
         UmVOvLdEoRqO1Uzj3MIXh6OpGBq7ZcHabxbb+uoeZvl0xq1xevNvK4V0N0WTW6ZCrR2G
         KMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729624190; x=1730228990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6PiELke4NP4639bcqP6jdKFk2y5EnGjLKhntCyBZQV0=;
        b=GudNXrabb1CTuYVjZpSQLS5vyep3Ky96OfDGIgFli/wZPbGwk/7NqGFrPP2alLdSpM
         XdNx+Q+ih4YfNqpAu4pGNU4UbN6L01JxDsFoVF9cEQO1XY0It7Ed7CMVcgAMiIr75tBT
         JMbMAR0s5qYs60rnh9yuhuhnRJq/yqyxIhTyWxzSliQXDk6NyW6ufM8r5laVYzJ7elOO
         wbUE1PiFPb03PotTp3/x8tmFdi60xse9KJJY69DGz4MVp556CWTLLnpnxerEdh2KsMzx
         p6qmHXMGJGcs99tajRASchBHG+U/UaFPyowENpoNug+UlwUxZbvGNm+IENyUyMzHwYuS
         QuaA==
X-Forwarded-Encrypted: i=1; AJvYcCVX5xSzaLT+LocVMlBwSN2BEQXAmeCZtLCnmEkThsKISB/cnqmdX5qRmZOLnH/IYopjIOBPCgFiqSo=@vger.kernel.org, AJvYcCXp4/qDy600oOV1Mz60w/szqFgJTcg6KGxyhjh0R2TpjWwNyWN02O58ZQtzpqLNAnFozF+ObhzoSeUuO1b+@vger.kernel.org
X-Gm-Message-State: AOJu0YwqfCm1tUEdh9oz2SXud3osK2LCwD9w8d8usU/dz2RXaaWK2qEN
	vgd215ByPhLRrTK1LWudeaQ1Uwm1HD5Hn+Gg8aIbfjRiTHqsvy/g
X-Google-Smtp-Source: AGHT+IHzefAKr3YmXodU0Tw/AMU21AhRkwq33vN9l2SvR4Ry6fh6LPhGDPlRLZOMnwSyAwD+nR8KUw==
X-Received: by 2002:a17:902:f68a:b0:20c:80d9:9982 with SMTP id d9443c01a7336-20fa9eb9761mr1885675ad.47.1729624189699;
        Tue, 22 Oct 2024 12:09:49 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:229:10e9:fbeb:f79a:19dc:62a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee6538sm45996275ad.47.2024.10.22.12.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 12:09:48 -0700 (PDT)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: tharunkumar.pasumarthi@microchip.com,
	kumaravel.thiagarajan@microchip.com
Cc: UNGLinuxDriver@microchip.com,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH] i2c: busses: fix uninit-value in pci1xxxx_i2c_xfer
Date: Wed, 23 Oct 2024 00:38:45 +0530
Message-Id: <20241022190845.23536-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an issue reported by the smatch static analysis tool:
drivers/i2c/busses/i2c-mchp-pci1xxxx.c:1030 pci1xxxx_i2c_xfer() error:
uninitialized symbol 'retval'.

The error occurs because retval may be used without being set if the
transfer loop does not execute (e.g., when num is 0). This could cause
the function to return an undefined value, leading to unpredictable
behavior.

Initialize retval to 0 before the transfer loop to ensure that the
function returns a valid value even if no transfers are processed. This
change also preserves proper error handling within the loop.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index 5ef136c3e..4dfa11650 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -994,7 +994,7 @@ static int pci1xxxx_i2c_xfer(struct i2c_adapter *adap,
 {
 	struct pci1xxxx_i2c *i2c = i2c_get_adapdata(adap);
 	u8 slaveaddr;
-	int retval;
+	int retval = 0;
 	u32 i;
 
 	i2c->i2c_xfer_in_progress = true;
-- 
2.34.1


