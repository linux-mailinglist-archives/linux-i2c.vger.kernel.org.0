Return-Path: <linux-i2c+bounces-7949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD669C63DC
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 22:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63CEAB349ED
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 21:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951F4219E3A;
	Tue, 12 Nov 2024 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MHtkKfjl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE9A13FD99;
	Tue, 12 Nov 2024 21:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731445352; cv=none; b=CKd9lO4SA6/sshioZ9xz5VoY/eGnpKh4njuCipZf9sP7kJNT9BKOaJ0cuIm6Fu4Tw40PtuyEQjIM2k6dhkz3rYU90fjYMNDyhLqhXhI6aog66OzzT7fTIo3JbvIjHJzHP73DKBcUl9YSFsu11xXD+AqX+RY/eVZEdpFvj4o5Ekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731445352; c=relaxed/simple;
	bh=zM/yV7Sqqn3L0LKsqpE/sHVlA1LHzAmE6utNVl3Ahvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DZ4IgDOgqbdFxtpvzIVVgTKqNg8aSAPyjsDBrj/RUq5S5gJwNb4lWVexOGVtNdGZbJNEoKwx/K9/8p8cEzNmBbzMzdb6HWvY+cnOLGIQrFObpdrzxtZE93zMWxKvf22FMiSf3O0I8jG0iiOKx16p7M1h/CI3EzEkxTv7mRbtzFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=MHtkKfjl; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id Ay0kt5zlow8U4Ay0kt7lCL; Tue, 12 Nov 2024 22:01:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731445279;
	bh=fsqOGr2Zhrw+aZU6nyolhdzki25Q9IQLpHrgqpUTkwM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=MHtkKfjlLa8z4OTJs3qgB6ABuLU2DcnSq2GNKpXo+KBDw2+lbQHMia4n5jL5ZGVnC
	 L5Hq11I++Lz3M3y5F1kM33VJvawfRfXJfxqNH8i/2Fvt7Z09MX0Au9J1JgK/V8R+so
	 hpCfkK5FuVMtFxBAW3Jcld8a+1qxNDx4qu+boUSMu5Fk1tVAS4wWj7894yUpN2Qekn
	 PGTWM+Sa1TKS9xs+U8KcU9rld2GJm+HrfsOsT+uBdwznVYghSdVPFlrC702OiVMyMd
	 T5osH+H2Tv5ssim/zzMTdmh4ZEwBuMuzBg4/LA09xpwFKS2wmPsX7sUgauxTAICmxu
	 1nuMysk/dzKUA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 12 Nov 2024 22:01:19 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] Documentation: i2c: Constify struct i2c_device_id
Date: Tue, 12 Nov 2024 22:01:00 +0100
Message-ID: <c8e6da4adb7381ee27e8e11854c9d856382cdc93.1731445244.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Constify the i2c_device_id structure in the doc to give a cleaner starting
point.

Also remove an empty line which is usually not added.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 Documentation/i2c/writing-clients.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/writing-clients.rst
index 0b8439ea954c..121e618e72ec 100644
--- a/Documentation/i2c/writing-clients.rst
+++ b/Documentation/i2c/writing-clients.rst
@@ -31,12 +31,11 @@ driver model device node, and its I2C address.
 
 ::
 
-  static struct i2c_device_id foo_idtable[] = {
+  static const struct i2c_device_id foo_idtable[] = {
 	{ "foo", my_id_for_foo },
 	{ "bar", my_id_for_bar },
 	{ }
   };
-
   MODULE_DEVICE_TABLE(i2c, foo_idtable);
 
   static struct i2c_driver foo_driver = {
-- 
2.47.0


