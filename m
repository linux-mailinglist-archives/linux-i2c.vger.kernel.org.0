Return-Path: <linux-i2c+bounces-10800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16DAAB047
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 05:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B2A31A85937
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 03:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5584830C1D8;
	Mon,  5 May 2025 23:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLehSAdq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0552857E0;
	Mon,  5 May 2025 23:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487336; cv=none; b=BZtsClj4opKM0owVpdoYlSl9PLFjCdlHpaE+osMgk0ci0Ed0jhBy+SgVRSZ08BXYO2Rr329aN/T1TXdvSqPYGD3HTVWOjG1dYU5ZvLV7ItmzfB3QR1K0aVqSCICafRkXV+5AAFd8ew1KVMoDSVMqrOpb2R+Kkt+fBn2/6XnEqXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487336; c=relaxed/simple;
	bh=2+joGTOuELpfJHei7VE7uNXX5PJBBzKmn6u5+mhbDzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uzpy1J+sp18uR1xgvhTiSHPbmjPQ2yYN7ZRS5IUAEO49VizFD/IgAircVskDFK2U9EwrSBUjHHh1Ouv9/K9X7FZp5lBWlD0vAYGuuibrJfcltsfSBtD1S/sprh2ca5LBmCBVCd9iNPnPSmHOSJ3HGKZSyALO8Q5gmLB1gKdDFUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLehSAdq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B743C4CEEE;
	Mon,  5 May 2025 23:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487335;
	bh=2+joGTOuELpfJHei7VE7uNXX5PJBBzKmn6u5+mhbDzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qLehSAdqONx6rXh5OlvYEabYus+ehz2DB07a2ftUGHJwhAHZj31KQDkHP2fwsNgkE
	 +Hcwm9gag3MKe2/XrvlaICntGBKxMNxO0mwbG3zzA5FIzf0weldcUfXvbzkWvzrUcS
	 mkKyIawDopKPUVatJVec0UM5l/gERwaZYfNtk/Qh23vd3HB8zHZQR5iOyqQlyeksYr
	 2Ib2ecceUhuN7x0SCqEYmh2ngoyrglkzFL9KO3Kk9y6bjlrgvVa3yQQ66gajjLruNU
	 XDwucdrWhYkdGoetoPcVkVyFFUVLzBlANPg53+dl52pzQr15NfoZq+vyLnLnuCod7r
	 8lV7pTgFv7YzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 13/79] i2c: pxa: fix call balance of i2c->clk handling routines
Date: Mon,  5 May 2025 19:20:45 -0400
Message-Id: <20250505232151.2698893-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505232151.2698893-1-sashal@kernel.org>
References: <20250505232151.2698893-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.293
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
index d0c557c8d80f5..c5a6e7527baf7 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1284,7 +1284,10 @@ static int i2c_pxa_probe(struct platform_device *dev)
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


