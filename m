Return-Path: <linux-i2c+bounces-2868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AEE89F0BF
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71D5F289D16
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFAC15AACF;
	Wed, 10 Apr 2024 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mDWAnLgN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13D915F3EB
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748326; cv=none; b=XwcFerFRGctxbTlT3ida6IWArXHttGKwt9WlkQplQSDggtBTCxN3JPPTdWp/Q/KDiLTCDXvlOTSwwRM7JLfznqC6/cIrx2qG/GtWsFv5qxkh4uscJg6n3jpcDYpGKgYH6W87M5/71KEwVXJoXN5ZNroiA89RQP899/Cacw7dcRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748326; c=relaxed/simple;
	bh=Ghz9+8PwzOj+sFeiknrnmVHidJRUARy2afaqvsOCeIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QihC5X3LacEQiStDmKNwaj3X3UYlaJ653EEE2mv6ZVzy5SkJ4An+/eRHAiHXVKGdD4AXVviHeJOo3/lDjLIXAxWMu1TPel7UAmgPM8XKYgp5F31GEJT7bgY/RRPsvIO1qkoEmCnf31KsnpQoMiSEMRZ5XmHLX5Gn0acQ4GmlDFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mDWAnLgN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=gKURZrg2dPN47J/dR48oUq5R0Q8Z55DZunehHrLXhjY=; b=mDWAnL
	gNfGa3lR6+tkelsSUPEL/OPRCw/MYUCnsojYR12yqanKWlWbcLUtepEPKg4D7ixn
	Yih1ykxaPomgjuJVvSkKSmalYM8qukeKuawv+zNpbX/LkYHu2Ztz0SN3QTsEC3PJ
	aAjVWhjvNGxOWpb0lcSu9nA42kTRmlSxpYV4IVTtxSDDljvdNrM1up2MX23RnP4p
	IvFaDILeaTM03sbi5nMkBD2WFrupmGEKvXuPGFSqSYnGJVtTv61pwIdUDqRHgnsP
	GeTLaQmA77GN9fJ6754G4myNWE6Q9SO7fD7GdkqCbgrRRv82b0Cc7woJtkD+ZuSU
	zYBkqnLk3LQrCVxQ==
Received: (qmail 521989 invoked from network); 10 Apr 2024 13:25:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:18 +0200
X-UD-Smtp-Session: l3s3148p1@YP8ZS7wVeW5tKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/18] i2c: uniphier-f: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:31 +0200
Message-ID: <20240410112418.6400-37-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-uniphier-f.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index dbc91c7c3788..6c3dac2cf568 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -358,7 +358,6 @@ static int uniphier_fi2c_master_xfer_one(struct i2c_adapter *adap,
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	if (!time_left) {
-		dev_err(&adap->dev, "transaction timeout.\n");
 		uniphier_fi2c_recover(priv);
 		return -ETIMEDOUT;
 	}
-- 
2.43.0


