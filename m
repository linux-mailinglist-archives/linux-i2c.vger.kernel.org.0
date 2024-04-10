Return-Path: <linux-i2c+bounces-2865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAAA89F0B7
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D02C3288C10
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A79415EFDB;
	Wed, 10 Apr 2024 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q/EeJLh5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06F15ECF3
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748322; cv=none; b=Rq3Swzc2lhwQprxS0iH8e9HJ1Dt6YF6Gpik+U2A2dTwUGhpyA7GXREIfnqJzYnJfz7CrRIHWXZNGCSU8VDwb0QUiqqxCYzJVbFTXOZgIpt/1Qc6wPNNx0T5WMzqA+HkY7Asm7HaOk638zkQ6fIWK5KAwuWXQSFgMnAmF8pmM73k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748322; c=relaxed/simple;
	bh=6ti3SWFJMR5Y6I9U8oFT41WoQzKqT/mu6zUNKBYaZts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmWyUdv4tToQfFKtr7lb3KyIAEnOr4BFARyHGT2+36OfvbdMB/GJsLbcjmTpDgMpfaZkg+SUjxWBB7iT9IBoB/5UFWw+PuAnWQ86m4Dyv/MYQTCZzEdFYA9lyF9FZYAUjxv8rfAYtlVABWNthlGFwx/JQC+F0VYno4+6UlfCWUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q/EeJLh5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=H2M3c/E2psp04OEJP71/aPZMCtP301eRKvl7HlHS1tQ=; b=Q/EeJL
	h5gXXNW4pUqGnbnQ8DJzpOIdRhGR15jG60kJnBCywek14NFPfubVSM3Phs3wOjOt
	zH1tx6A7LEQaTEWm8XmRQAEsaSpGsM65lg2uzpTu5aUDVrmnnqbsOqi2PFPcCyRr
	CJqcpsWUEgXaj2lGVzRMHwGf56VpZ3BgesjG7E1T4pvnFS8574Utor5wVkku4w4c
	yqXky4wgUovKTBg+yWst/CjjeBxgMi24/vBKIURoMvHLznG/UERYksUmyTYszjh6
	YAGXWJ0Yp8Jo2X6SBguJHB0GbF9M05Cq+HAyjcf4yr9OGH+rPaJPHvdTPaS3QGPi
	ueHlHkTxV+BV9Z4w==
Received: (qmail 521837 invoked from network); 10 Apr 2024 13:25:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:15 +0200
X-UD-Smtp-Session: l3s3148p1@5KbjSrwV6yBtKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/18] i2c: sh_mobile: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:28 +0200
Message-ID: <20240410112418.6400-34-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-sh_mobile.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index c65ac3d7eadc..f86c29737df1 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -688,7 +688,6 @@ static int sh_mobile_xfer(struct sh_mobile_i2c_data *pd,
 		}
 
 		if (!time_left) {
-			dev_err(pd->dev, "Transfer request timed out\n");
 			if (pd->dma_direction != DMA_NONE)
 				sh_mobile_i2c_cleanup_dma(pd, true);
 
-- 
2.43.0


