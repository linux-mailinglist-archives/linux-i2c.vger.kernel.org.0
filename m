Return-Path: <linux-i2c+bounces-871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 107D8818B15
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 16:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B922B22298
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 15:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D231C6B3;
	Tue, 19 Dec 2023 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WsR5eIqp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63421C69D;
	Tue, 19 Dec 2023 15:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D439FC433C8;
	Tue, 19 Dec 2023 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702999369;
	bh=vOJ9fKH6Xqs5UvwP9s7vsM9ZkdDZzxdG2BYm96rLvAY=;
	h=From:To:Cc:Subject:Date:From;
	b=WsR5eIqpOuTF0cIbg+QKbJk945zH4aWyXTOIY1x3RQA0jbBvivNWsuj7e6Upmrryd
	 RyL951N7XwvzbPbR4ViNCIRb5JLQqt7ZEr7thVILxZfFjWkwanT8MVZ+xBn2ZcerUg
	 bXjNwD7NXCrngu8Maaslp8kRTGGO1BmBMQOT/Ooc=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: wsa@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-i2c@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] i2c: make i2c_bus_type const
Date: Tue, 19 Dec 2023 16:22:43 +0100
Message-ID: <2023121942-jumble-unethical-3163@gregkh>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 66
X-Developer-Signature: v=1; a=openpgp-sha256; l=2417; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=vOJ9fKH6Xqs5UvwP9s7vsM9ZkdDZzxdG2BYm96rLvAY=; b=owGbwMvMwCRo6H6F97bub03G02pJDKmNW51Sba1dDtXZnllysInD6hGjp6HmpIbM+iDrWF39f x6PXrh0xLIwCDIxyIopsnzZxnN0f8UhRS9D29Mwc1iZQIYwcHEKwEQKIhjm2U4SyLvO9cnsvoJq 3W9WhQ+C58WMGObp7bSdUBOyNC9E6FVt/PQlO9Sz518HAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Now that the driver core can properly handle constant struct bus_type,
move the i2c_bus_type variable to be a constant structure as well, placing
it into read-only memory which can not be modified at runtime.

Note, the sound/soc/rockchip/rk3399_gru_sound.c also needed tweaking as
it decided to save off a pointer to a bus type for internal stuff, and
it was using the i2c_bus_type as well.

Cc: Wolfram Sang <wsa@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/i2c/i2c-core-base.c           | 2 +-
 include/linux/i2c.h                   | 2 +-
 sound/soc/rockchip/rk3399_gru_sound.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index eac90a3cf61a..24c6e1b52668 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -689,7 +689,7 @@ static struct attribute *i2c_dev_attrs[] = {
 };
 ATTRIBUTE_GROUPS(i2c_dev);
 
-struct bus_type i2c_bus_type = {
+const struct bus_type i2c_bus_type = {
 	.name		= "i2c",
 	.match		= i2c_device_match,
 	.probe		= i2c_device_probe,
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 0dae9db27538..180462d1a373 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -23,7 +23,7 @@
 #include <linux/swab.h>		/* for swab16 */
 #include <uapi/linux/i2c.h>
 
-extern struct bus_type i2c_bus_type;
+extern const struct bus_type i2c_bus_type;
 extern struct device_type i2c_adapter_type;
 extern struct device_type i2c_client_type;
 
diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 1a504ebd3a0e..6c89c7331229 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -446,7 +446,7 @@ static const struct rockchip_sound_route rockchip_routes[] = {
 
 struct dailink_match_data {
 	const char *compatible;
-	struct bus_type *bus_type;
+	const struct bus_type *bus_type;
 };
 
 static const struct dailink_match_data dailink_match[] = {
-- 
2.43.0


