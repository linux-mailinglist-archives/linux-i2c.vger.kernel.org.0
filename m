Return-Path: <linux-i2c+bounces-2867-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8043F89F0BC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B3EA28951C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DC415F402;
	Wed, 10 Apr 2024 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Yyi/KdM7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B115A4BB
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748324; cv=none; b=kW2NMl0WaOC3RWb8bMztZ4crk8wR8PRkJbEyID9x8Ctt934U9Ty7ICbsSFDIXUgzbtms/M0peb1z/ZrO9M3121cFszIii7wqRmFsKxz5mPI4IfZ18XM73xAyy4FksBZoV5qq97Na29ejw+6jyVt2asWjVq7huckatCHop7v76Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748324; c=relaxed/simple;
	bh=ThHy9SIXt6aBrf/B2/hW2hu4s6jDQ8sFpoOCGbGodJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R8HXWUdEJ+cRRlm7xLrU3FhyTydq7+/UouD6PE2DDcq1pYem2ovQotqCQJ4oyUZfllS9NoJKbgd1xQG5cDLXaPUsLFsCw7EMFG80JSUCuQmvWXoEB/7NTXve1MRPfDmAjuDBu4KBZGCbeEqlylq9n0sOincsyMsdLQc51R35Wzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Yyi/KdM7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=qnoZs139XKAMxVPkE0adXp3TqolMOAUOXJsY19exsqc=; b=Yyi/Kd
	M7R6vZohSpRBgAtEIafDn6GLbwBAroivxmArDdI/4FaDqogZ3WhZByxC+Tt71Kg9
	RZukTV6NUMJ5oYhaM1Y7D2F8P4dajrU/IGlNwLAY2QPGpWEfnbA1VE0jCyCu4WtO
	He/TolKpX+kmvgrmaQuSXRic5gVCjpbybcvjePeLXzLUiDST2jH8f6fcnk33vucN
	j5SWaeq31MmfELL+Mb3uu1fGbv5XSen84y6O5+YdlWafPsWgZaUZFzjJUyxQeWc2
	nxbFzGes9JCeUDtdHT/iyffBrqAnSDp18t3K9BBb8MakJFVMoJd6Hbf971FWA5nC
	LCHVGS+QNrVxW2sQ==
Received: (qmail 521961 invoked from network); 10 Apr 2024 13:25:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:17 +0200
X-UD-Smtp-Session: l3s3148p1@PmEHS7wVv3JtKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/18] i2c: tegra: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:30 +0200
Message-ID: <20240410112418.6400-36-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C and SMBus timeouts are not something the user needs to be informed
about on controller level. The client driver may know if that really is
a problem and give more detailed information to the user. The controller
should just pass this information upwards. Remove the printout.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 920d5a8cbf4c..85b31edc558d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1331,7 +1331,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		dmaengine_terminate_sync(i2c_dev->dma_chan);
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
-			dev_err(i2c_dev->dev, "DMA transfer timed out\n");
 			tegra_i2c_init(i2c_dev);
 			return -ETIMEDOUT;
 		}
@@ -1351,7 +1350,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
-		dev_err(i2c_dev->dev, "I2C transfer timed out\n");
 		tegra_i2c_init(i2c_dev);
 		return -ETIMEDOUT;
 	}
-- 
2.43.0


