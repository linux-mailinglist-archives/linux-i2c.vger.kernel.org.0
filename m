Return-Path: <linux-i2c+bounces-10806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F5AAB7CC
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 08:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 075A8188E17C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 06:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE9049F056;
	Tue,  6 May 2025 00:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8MWo3gH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F303ABCFD;
	Mon,  5 May 2025 23:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487136; cv=none; b=I3Pqe8NkOZ6RgG1hNSzrAvhaEUquFqA64XO0Yh78ppjuC5jfMPGu4WRIXJhtIix1kyjV5ltoBjYPEIQsSYrjIcNn38ueDebUlNy2atHMFqqId1cdsliHk4NknPY9xUiPVQfbo7z24cT6EpMWPCYoHxPGrSi+0rORyMHd0VRpxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487136; c=relaxed/simple;
	bh=2pjdD08KhMw6FeRr9Qku1Tz+bsPUVl0cVg+Ep97vitY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iejWh3j6cUASAHwdumWQz9er79KE8OscQDIcjcL1S1CQaQy4yoYVbIQ0jEUrELxYyqfLdTpWtL8ZCu9UJu447RCcu6D4iyUt8Sz9icOwsvIKwwDsIy0VTPn3gzcM7nUEtwrLaM0Lx3kcaJzlzWCBllp29AiAKL1k/bEncNdzPJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8MWo3gH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF5BC4CEED;
	Mon,  5 May 2025 23:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487136;
	bh=2pjdD08KhMw6FeRr9Qku1Tz+bsPUVl0cVg+Ep97vitY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i8MWo3gHGCzq+SaZQztvyEIeLk8RWPYGZpGpnTe8SD6lp/qVs24QzWF57LZhBnVf3
	 nx7q2AjFdvfUP+C+7kfNkxXFhkTAcUTcI/15QRGtXHyDVXlTmPiWDNsfgxolMCteL5
	 pjavyjGL0Qs+Tj0isUq+TJrfS1I3eh0hX5lKkZWckgt2es3h4AEQGA7WLsTcRy8W+Y
	 U+gF/FmynT+zSjlzJdOBvVhPZ8CXbyRcLual4FtHZwvnpM6l2wUewH8INnrqENRjZx
	 9gliYpYXR2/1as0kwuz3h1Q2CqZk2OtOlC5VxgNfb2VuDkBi/OoTv0oYQZ9AqM57Db
	 GGZEmQDpcXr0w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 018/114] i2c: pxa: fix call balance of i2c->clk handling routines
Date: Mon,  5 May 2025 19:16:41 -0400
Message-Id: <20250505231817.2697367-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231817.2697367-1-sashal@kernel.org>
References: <20250505231817.2697367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Transfer-Encoding: 8bit

From: Vitalii Mordan <mordan@ispras.ru>

[ Upstream commit be7113d2e2a6f20cbee99c98d261a1fd6fd7b549 ]

If the clock i2c->clk was not enabled in i2c_pxa_probe(), it should not be
disabled in any path.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Link: https://lore.kernel.org/r/20250212172803.1422136-1-mordan@ispras.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-pxa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 35ca2c02c9b9b..7fdc7f213b114 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1508,7 +1508,10 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(&dev->dev, ret,
+				     "failed to enable clock\n");
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
-- 
2.39.5


