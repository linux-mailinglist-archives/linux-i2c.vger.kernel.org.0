Return-Path: <linux-i2c+bounces-4273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF67B91377F
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 05:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F9EC1F226AD
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 03:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5A3DF78;
	Sun, 23 Jun 2024 03:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="NNjB4JII"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27926D518
	for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 03:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719112719; cv=none; b=Fiy13nbR5sGAQvtOiKt6DuS6nlMa0zkVtwTDChx7t0sI6Lldfznaqv5Ksw3aaFouWdf+KQnrLi7ntXtkLlg8K/Fn7o4PYIofX3zl0mp/uDyyTuEVOaoQZ4NxPmmhPw3lT9ZNIj1ecAMvQ3WaIkeGS5lpGRf/yTuO4bmvvQDzbhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719112719; c=relaxed/simple;
	bh=tSlD8kIR9c+Gypj5k24Lz8NnNyHGq7biHSldyLbJ9bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qbjkv+e2vkTOy9si6ozYZrtwE97jD7YWXeBaGqIx/rosriWT/GO0cWLbBhPvOSe31oCeJJ2XU7F+K6P+70RRr5JLVL/PLOsrdgk87hz7ory/H/PP3O7r3ileUJDbmCcctE0Bn7N1zWcgT0uu0tbJb+pnOOpNFaO8E2Q9Hrc9M4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=NNjB4JII; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9C56188231;
	Sun, 23 Jun 2024 05:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719112709;
	bh=Z/1i1s1v006Ysash4YexMENshfCgULNMSzbzpHn3xpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NNjB4JIIS+HJww4FAzXElmVghBsTYhRaMY8bd4I/J48xelbRQ9GrSmjIcJeuErePi
	 kuvdgpwPD8qRyKoRhgko/9Yv+ThNJ6DbU5RqmGc29vqdxpOzAt7FL+SgcbQY4IkJgb
	 XGFzFGEB7JLPRKL9zCLXjBtMtaoM4LwWnudzwT4KTS7LXB6g3G5+W7qvqppZhoeUrQ
	 F4DxVv8VdNe045sy+PCmDW2Wmc1+Zz6/QhG54wFTLZfeK+/gotKw/Gyg8GVPYqRQoo
	 Y9h128fgwz83e5ge8OKuFcyI9jhwtE9nt4k8hUcEbXxNBlN3HbH8AOS5/0WZkGylnH
	 PrvoJB8ClSsow==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 3/4] nvmem: Use sysfs_emit() for type attribute
Date: Sun, 23 Jun 2024 05:15:46 +0200
Message-ID: <20240623031752.353818-3-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623031752.353818-1-marex@denx.de>
References: <20240623031752.353818-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Use sysfs_emit() instead of sprintf() to follow best practice per
Documentation/filesystems/sysfs.rst
"
show() should only use sysfs_emit()...
"

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-i2c@vger.kernel.org
---
V2: - New patch
---
 drivers/nvmem/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index e1ec3b7200d7b..b31abffcdfc00 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -179,7 +179,7 @@ static ssize_t type_show(struct device *dev,
 {
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
 
-	return sprintf(buf, "%s\n", nvmem_type_str[nvmem->type]);
+	return sysfs_emit(buf, "%s\n", nvmem_type_str[nvmem->type]);
 }
 
 static DEVICE_ATTR_RO(type);
-- 
2.43.0


