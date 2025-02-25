Return-Path: <linux-i2c+bounces-9584-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED7BA44683
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 17:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D596866760
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 16:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05E0194091;
	Tue, 25 Feb 2025 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTZvDpbA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBD215383D;
	Tue, 25 Feb 2025 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501425; cv=none; b=s9ui1/cRQslz+qt91WPK2CyhSprQ2ssxEs1qAy9jqgt8jnWL7AX+pKT5bNsmdH+bpc4NUL2yAz4ArEP5d+ZbIw5T0wWWpmcbSzEnL64p7nCnN15XjRcxPneAkBMCMER658xVZNs5dIoQ5+DhweZrdPIhOy+4TXtJqyp8TVDCgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501425; c=relaxed/simple;
	bh=aC/23YxeTCyQXvmDzSr6z1XLN3YgVV67TAFzI+GpqKs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mL7HsCKPBFUmA8Y86QnAF37GQsDa9kLLIw3VSrLC13DexCpdTnEoQuR8b5uDZq88T6PC08FtGSLGGAY+JEH15uQRAHvUakiEnwEdWJb8yAMG3+9eL1njnBn++8gktT6B/AUrp7WsrfRGeem1EL/rJAz3V8QiAbThcMAnvtg6vfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTZvDpbA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58460C4CEE8;
	Tue, 25 Feb 2025 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740501425;
	bh=aC/23YxeTCyQXvmDzSr6z1XLN3YgVV67TAFzI+GpqKs=;
	h=From:To:Cc:Subject:Date:From;
	b=LTZvDpbAnS3gHdi7ElquBgxnofF2Iz3xKbkjBrudPzR60ABrrhmJPhscLArDEPoj6
	 K9JxK/Nu+Ux71SHO4nzs/x+BegbWlTVJKzD5pT1oadrj0MmpHm9xqPPMAmHIjA0LrT
	 2XPlp0JhuiR5xQ/zPM92izz1HK64yBavl93sDTduwAwUZpYsMuBS0eA9I+70YDY+0+
	 tsDKIiUK/7rJAv+VQETJvUPv4vVVnEsrnhZ8H/eB2n1SlEWcUuJ4dtceyOelSiA1rV
	 g7sNOYgxcz6NSK7bizbl+5/YhnsWG8qVqiYFzXZj79zO8/KXaTMA8E1yU2CTZle+V5
	 /J6kEkTsXSuMw==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Hennerich <michael.hennerich@analog.com>,
	Peter Rosin <peda@axentia.se>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: mux: remove incorrect of_match_ptr annotations
Date: Tue, 25 Feb 2025 17:36:56 +0100
Message-Id: <20250225163700.4169480-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building with W=1 shows a warning about ltc4306_of_match and
i2c_mux_reg_of_match being unused when CONFIG_OF is disabled:

    drivers/i2c/muxes/i2c-mux-ltc4306.c:200:34: error: unused variable 'ltc4306_of_match' [-Werror,-Wunused-const-variable]
    drivers/i2c/muxes/i2c-mux-reg.c:242:34: error: unused variable 'i2c_mux_reg_of_match' [-Werror,-Wunused-const-variable]

Acked-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 2 +-
 drivers/i2c/muxes/i2c-mux-reg.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 19a7c370946d..8a87f19bf5d5 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -303,7 +303,7 @@ static void ltc4306_remove(struct i2c_client *client)
 static struct i2c_driver ltc4306_driver = {
 	.driver		= {
 		.name	= "ltc4306",
-		.of_match_table = of_match_ptr(ltc4306_of_match),
+		.of_match_table = ltc4306_of_match,
 	},
 	.probe		= ltc4306_probe,
 	.remove		= ltc4306_remove,
diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
index dfa472d514cc..1e566ea92bc9 100644
--- a/drivers/i2c/muxes/i2c-mux-reg.c
+++ b/drivers/i2c/muxes/i2c-mux-reg.c
@@ -250,7 +250,7 @@ static struct platform_driver i2c_mux_reg_driver = {
 	.remove = i2c_mux_reg_remove,
 	.driver	= {
 		.name	= "i2c-mux-reg",
-		.of_match_table = of_match_ptr(i2c_mux_reg_of_match),
+		.of_match_table = i2c_mux_reg_of_match,
 	},
 };
 
-- 
2.39.5


