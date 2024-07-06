Return-Path: <linux-i2c+bounces-4717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C57929335
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 926381F22554
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FEA176AB3;
	Sat,  6 Jul 2024 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mGTNW4DV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD8316EB47
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264938; cv=none; b=KpMH4BHpxXiw8/2ghqDzuGr24go3E3YfVizProbzGJhzjpO6iL/hyT62vs1uVkvuTSyUqrG+4x56WI66lzC/wGjAAIuwRq2m2O6lSUcAc0qv/iLj/xhSb2FdCsae+yPRk5T1kr0jXCHy1Arl9HR+GbA1K07YJEc3kSd1gUWxsXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264938; c=relaxed/simple;
	bh=sMBjjjQoRzu/y6oDuR1pOkVv5xeFLjAXjqL3/H01n3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FFWoszPhIhGI//SQfT6mlcJvXoHb+shaC4+OhKW5G/tMjosccFiwUbK+ikP9SCdTc6ybAPM1DS/RRvLfEhM5ls4iHQw0W2hkOH9jUYOE/G3lswcbKv+S9ILNICniXPMQ5hvN33bZ85i84QEDiedeKI1NutJc4M842VB/eDX8KpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mGTNW4DV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=RKPno80B5b7lMNmuILEfR5vn3B5nA82KHZrBqcTfrZE=; b=mGTNW4
	DVedLtKjZp1Vr888EnmryAFZ9XwyXRbyYwt/V3u1KOYBOC+IsHrT2MkW7YlCCdkS
	azco/mwoUoXbgOS6M1U7SuYHD6CQeKFHAcYuhgJFrv9WnuO+Fzzv3jNKgNdZmDZj
	Peu93Rb7I21FUH9EBmoLlB5AjT78783hh66Hkx1qv3aRdxLJnQIES/NFAg1EhUtu
	weMBT37yUHeVuC203oga7Q5TbMrYBRbqrQJEBwcrtKcpztaSpPX2Hg7J8UBEPMkp
	almAeWaZ6/RoZjRAJhmtjyQzJ6XhkTdGLggGqx0pRbgs1MDmJLe+6sMF4zDJCvAf
	ZwKMnrsYBJqYXI4Q==
Received: (qmail 3810984 invoked from network); 6 Jul 2024 13:21:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:57 +0200
X-UD-Smtp-Session: l3s3148p1@FMhQY5IcZuFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 50/60] i2c: tegra-bpmp: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:50 +0200
Message-ID: <20240706112116.24543-51-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-tegra-bpmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra-bpmp.c b/drivers/i2c/busses/i2c-tegra-bpmp.c
index b0840fa0f53e..dabadbcc6d6a 100644
--- a/drivers/i2c/busses/i2c-tegra-bpmp.c
+++ b/drivers/i2c/busses/i2c-tegra-bpmp.c
@@ -275,8 +275,8 @@ static u32 tegra_bpmp_i2c_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm tegra_bpmp_i2c_algo = {
-	.master_xfer = tegra_bpmp_i2c_xfer,
-	.master_xfer_atomic = tegra_bpmp_i2c_xfer_atomic,
+	.xfer = tegra_bpmp_i2c_xfer,
+	.xfer_atomic = tegra_bpmp_i2c_xfer_atomic,
 	.functionality = tegra_bpmp_i2c_func,
 };
 
-- 
2.43.0


