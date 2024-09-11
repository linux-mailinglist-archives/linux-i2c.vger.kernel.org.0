Return-Path: <linux-i2c+bounces-6525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED9974B54
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 09:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1E021F225B0
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 07:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F221F14D6EE;
	Wed, 11 Sep 2024 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AWqja8Do"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E719F13C9D4
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039718; cv=none; b=iwy/07SuXJRz+o9PTGvUsxuM+5NNIJ9DhUKixVZ+C/U01LhDsVIjygUGehUIkAmZ78Dk4yjmMTn5XngwpjMlPq4JrdcC1Gaos9vtOkLpx8LL/+B2gujY4AiA8fdJiJlOBzFNqGzw/jKVcd8eZlPfB9gENkI/IquJchIbFk3W0g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039718; c=relaxed/simple;
	bh=XxiTjlQcSLEHrjz0okO6v8gsp7M/kr47QP0mR5JSK08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBrEhaUOUBkRUeaFslnaObjX7H/JMA4q1MpRzEu1sOiXiUM3Rke874NIh8cAAaKbwZgqL7KFjlZQj4GPh69ptZKCXMjxZNg5tTMC/YMAjDHl3FuJ5+e0Juj7R5CVsLqjJF4U1MRP0ivO4nXY5u57Upl8dIoyQDaTmJY1wLTYNic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AWqja8Do; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-656d8b346d2so4118507a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039716; x=1726644516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZj+Rwt2K/givoXdUXg/sARHG7LMQ+JDTIquBzN2oCY=;
        b=AWqja8Do11n2xY2bO0h7B7OseZ4raQjQ86+PRPLDN7Bb7g3d2kQX/PGqZFi+cRCacC
         Dam7Wx8/GIrN5M/VGsQxOuDdphRIAMhEKn43gFOVxIRq9GbVjXOGb+/GWJPlvRpqOQw2
         81uvN2vw7OIRfE9fzi/SjQuYwdjgin7HOoja4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039716; x=1726644516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZj+Rwt2K/givoXdUXg/sARHG7LMQ+JDTIquBzN2oCY=;
        b=gCs3kzSqvuDFelDd52/+1icTEjSA20rXKNbLTUF3EncnxjCnKTx6hDEk4L2Klwy4qn
         On+1IhseOjcsuCklfVXMIEosSExH3jUlVPG6ueXByO6JguoxabFwE1Xwk2yHrPWxr1vG
         9bvfWTPiElpiewuRzRSzuSxwpvpOvIk1JXHhodoaaYoxYq9bh+2FWHzLNFGM5/1Ae/Em
         e4W0S2ueBul4mh7PYtkhxaQguRvrr60nj5t+V/I1p3C8he7pdBWeYhKVw6fU7HWvjGvJ
         Fkmbf851syWHOJTL1PwbpYiNM66flIDykGY7xK8UPqQK/BnnaTSHvkf5wLo6C9manHdj
         UNCw==
X-Forwarded-Encrypted: i=1; AJvYcCXWVHGQYPe/oZrfChhQjOIWPqRPlI4BrAPXGxjrVZB31kU0PGSLO/e+reQhox7iK6slAaZ6X/PUzcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqiN7GQcUJPjwmGOMX88s2YZlNl+mNpbfkHtVA8maV1loxMQYc
	2XP1WuU5Lak31YzuC3TIgMb0ghSQ3gfXCt8KI2Cky7YKAFdSFVROTwhAkjje6A==
X-Google-Smtp-Source: AGHT+IHedUO15STr+MI+20JywnkGwOWN1412qS2q6DZSwhZSeZ7SKRwPtcyUrKy5SFYgpsHfqp5wRg==
X-Received: by 2002:a05:6a20:cd0e:b0:1c0:eba5:e192 with SMTP id adf61e73a8af0-1cf5e0f52bcmr4279897637.27.1726039716399;
        Wed, 11 Sep 2024 00:28:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v7 05/10] i2c: core: Remove extra space in Makefile
Date: Wed, 11 Sep 2024 15:27:43 +0800
Message-ID: <20240911072751.365361-6-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some lines in the Makefile have a space before tabs. Remove those.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/all/ZsdE0PxKnGRjzChl@smile.fi.intel.com/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes since v6:
- Collected Andy's Reviewed-by
Changes since v5:
- new patch
---
 drivers/i2c/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index 3f71ce4711e3..f12d6b10a85e 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -5,10 +5,10 @@
 
 obj-$(CONFIG_I2C_BOARDINFO)	+= i2c-boardinfo.o
 obj-$(CONFIG_I2C)		+= i2c-core.o
-i2c-core-objs 			:= i2c-core-base.o i2c-core-smbus.o
+i2c-core-objs			:= i2c-core-base.o i2c-core-smbus.o
 i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
-i2c-core-$(CONFIG_I2C_SLAVE) 	+= i2c-core-slave.o
-i2c-core-$(CONFIG_OF) 		+= i2c-core-of.o
+i2c-core-$(CONFIG_I2C_SLAVE)	+= i2c-core-slave.o
+i2c-core-$(CONFIG_OF)		+= i2c-core-of.o
 
 obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
 obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
-- 
2.46.0.598.g6f2099f65c-goog


