Return-Path: <linux-i2c+bounces-7787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B098C9BD226
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 17:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E20DA1C22D98
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 16:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E976617BB3D;
	Tue,  5 Nov 2024 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXZ7PTD6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBA61877;
	Tue,  5 Nov 2024 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823506; cv=none; b=EXb74kaue+wyT+u4bAa56esBWT966f3ka50BPngM9SOpG63xk2Mun3TmBLLo9wVbFdlTZ+mydEY135mY7wjynBs4ypQsbUTzbg8MT5NZNSpZ2wrWCXM348YPW3VcP1gj47UoQgwirsQNU6rxm56yZNXkO0RvG6S8J3Jh7heSWNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823506; c=relaxed/simple;
	bh=z9s+hsUVJLqCYkFiFYgtd29iDUGXpufvXpuuTVOhtfM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dWkFjMddHWljr24bc9n1IEwc3XMOCPRrHO7JwFMAROWnwDgdDqGMqFH9/1Ki/UEWzKPohUmaibOzgR2MsgdJWV60ZTSREG6qx0Owsxt1h2xagK62IRCG1R7qj1sadoAkjzZ7ZGTPhH5aoqybXs4BTe08NTDT6pLdCywd3NGWn1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXZ7PTD6; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b15467f383so397314585a.3;
        Tue, 05 Nov 2024 08:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730823504; x=1731428304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KmtWlz91TJSK4h5e5cNQt2Ayuv3I7VTg5EZ5rZ7D4Fs=;
        b=eXZ7PTD6V2fWt4xwCKfZ9aTAe301oBm5dCJkmA41na8e7u5EkjxKn5U96IcSTmt9KM
         mA8opAwf5K/28wEdLR0Rwgyh8JE9JNegtWTS78aPOtSsf9pM8BdTBvLCjLuQ+l28rWvj
         AOWkg+JR2tVGoApL9QNLMZaq93mcEz15KckqACDdvm7oZUIuH/F/9OhLbZ2jX7UwU21r
         vch0WAbYFlPxL0JUxm26KoV4rWqBjfQYLJz5LjdIL1iqWTKHfCH/a0DB3F2odaWzAlbt
         z2uchjHm/8+ysjxIyykjktj3ThRZ/024LH49wb5G0vzUusaU/aC36bwf/PSM3TG7tsUj
         FQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823504; x=1731428304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmtWlz91TJSK4h5e5cNQt2Ayuv3I7VTg5EZ5rZ7D4Fs=;
        b=UDzeWMqKzMQWYQl9AhdzS+uayUCL7TfsgivWBa+kgSlEuXKUd8TUFlmYLNcr2a7YqQ
         Ckpk+M01efbBolVN8jSiQWae+X+c7iPboRgVi7wRlwNl8Hbl5sblH7ahGxIGM+qpgDlY
         US8HwBapZHmottCjuIt2hlxaG0kfYmvNiCn3eWlL0U9xX7pI2i+el6zemRduK6mVDA0P
         Z6QhoYvSYyXAbb//tpyUpGjOhsflOHLNNH3SOo0L2eFYOS7ohSO9VkkwmDJ0Bnt56i01
         TGvdbjkAlalToVAR7Eq1ZkL9B+dy6/ScWhfTZLgscIYN0wOuxAHDlBbk+0AC5qHP9Ue3
         OXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoV7qrnua9E+WOEeGVWI18yK1F0psokkv2YWlcdPDDkdWuPiEuiHCdPOk72JG1Ze0KOuYBYAGs9Mc=@vger.kernel.org, AJvYcCXlfYT1YC0tdXcUiWK4RR2KmJntao63/zJy8egILXfdz0u8cqDd2FGvxLM2pWjxzJV9h8w5a+6W7z8iNbWM@vger.kernel.org
X-Gm-Message-State: AOJu0YyJjazJw7hcNc7E4XNrJ1u10Gzp8hjeBZPB4fV5cl0MoPr7Wnum
	4S0BTb2EFOKi4WHRVfFsHFk4kof1vHIHQ4MEskPA5cH6vMXXY148
X-Google-Smtp-Source: AGHT+IFeexANrtepr8tFxuvgULw0OpAvbMZOzidMyaWEF29zaJWbq8+xGIA3j9ZNrjvW8hCKk2crvg==
X-Received: by 2002:a05:620a:4608:b0:7b1:4d3b:d618 with SMTP id af79cd13be357-7b2f25529e5mr2568975885a.57.1730823504072;
        Tue, 05 Nov 2024 08:18:24 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39eb14fsm538010885a.7.2024.11.05.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:18:23 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: andi.shyti@kernel.org
Cc: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	wsa@kernel.org,
	manabian@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2 1/3] i2c: lpc2k: Add check for clk_enable()
Date: Tue,  5 Nov 2024 16:18:18 +0000
Message-Id: <20241105161820.32512-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() in order to catch the
potential exception.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Remove the Fixes tag.
2. Use dev_err_probe to simplify error handling.
---
 drivers/i2c/busses/i2c-lpc2k.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 9fb33cbf7419..0fe7d4421a31 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -442,8 +442,12 @@ static int i2c_lpc2k_suspend(struct device *dev)
 static int i2c_lpc2k_resume(struct device *dev)
 {
 	struct lpc2k_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock: %d\n", ret);
 
-	clk_enable(i2c->clk);
 	i2c_lpc2k_reset(i2c);
 
 	return 0;
-- 
2.25.1


