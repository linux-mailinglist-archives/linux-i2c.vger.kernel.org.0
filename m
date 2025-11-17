Return-Path: <linux-i2c+bounces-14110-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 28873C630F9
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8972034C275
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 09:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B135C328B50;
	Mon, 17 Nov 2025 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9NVJQ4b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3017328628
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370345; cv=none; b=bHiqKqXsvJQ8Lr+4oqspAz0a6exBd+G5yMi3nBCL6sQqN/jbT7oRZ+AAlvX6selIxYNXrPk3dA5pKCsUyWbVSYwG+fzlYZ4WpsKcOSumGV+Y4qroCJfDL9Qf9b4q2FU8QyoDxFCuMiNtDI+xaDS0FubjrtSjSl5ITqQCPUc+Tp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370345; c=relaxed/simple;
	bh=PGfDlWvGSscBxbVs8v8ZTNXGs8v6TwzoMOGQNHx4lNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oUbItiJGXFyfYinzmp7mDmGpnyMA1y5OF7G9f575iFg/Tcf5g4Y+tduOBsWmEXuAj++ZKRlqsBcK0LyWWORD0wMGERz/1x5qwo5n+Au85ychVBj0znipPxBkxr5ktIvz5lKqhuCf/P8yOL+in7JOIbd+vfsuJKNxeFVv6cV58hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9NVJQ4b; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5957f617ff0so4477105e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 01:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370342; x=1763975142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adLvNDTeiStKP0eZHWwvkkAFK5IxR7T1lQU7JiLOZOA=;
        b=f9NVJQ4b45zm+MhnS5ngqL/BuEVWcERGp9SXb97XJwBK+cMo8gIfkaQNKTVwdSH0lb
         mm+6ji9KA9/9YfecieQFNJkXZt60SvYTNNmjIyvsXVrRZydXGeG4PTj/6U1lTq6mPhTD
         rN7ZAVz0BhCla2TQy8RMCmZ2oGvCFdwA/6CATvmqPhC44CK+KcFBxdi6MA+ODU2g6sHe
         kbDtSWSbEhfKWJjG1AMqIBuGm0dj+5HKpQH6JiZ+m6Ny2iob5sTYcuKamhTFKXDaQuwQ
         txoV8e+LmkFx7uVCRDDA/xQtEIrWrEt9Z2ueJBZLE5puDrp9/9jYxZquDs5+gVM93FFn
         y11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370342; x=1763975142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adLvNDTeiStKP0eZHWwvkkAFK5IxR7T1lQU7JiLOZOA=;
        b=krX5rXFdeWK/LcISmS5Mg14t3X/vjAJ5yOyCbFnfSJAZnzzl9p/mbKWe+/hW50G3Vv
         FlwJzntYT+Xga9ywLe31a9j6oCuYThUi9S9RbzVSXQe1evlf/Hk1fGRVzuXOV2Ib98Bv
         HRIaR7ULgKerFjvizlOwIG8RQSDgVzzr68NfCC+nf2As7EEJZgEg/L1i3kzfPg+uPx3n
         L/8Sjtnwg1ioaYT/Fvy73zyNE34vM8u33gxrwow7mbQAzrl5STszmouI8s52U7Omlfc7
         n9SXZDFSDc5mx63+Db9E9qhOko8pTBwBGIe04VM6vz35jTQpYtaOyEmm45GJRxqYabhq
         WK7g==
X-Gm-Message-State: AOJu0Ywbh4f8GQLPJo5tZn01OjWXmuTewatUY+hXhxPvr/JvOuh494KM
	IwQvRbOKoCMveWkE4+SlC64IKvl6Mck591iHH6rESqagxFmhOhug0+AX
X-Gm-Gg: ASbGnctx2/PC7F6DayXY9aJEp9L897zJyiu6f6NAQTcP3N5UFXjdkClnyke3IWyokaH
	E9Vd2Rvj4O13sB1eMSU5gdGDICwrpIGN2Rn1Eet+Izf4ZKsx+AEXDia/DQgPhbicQ4hcKhmO7BM
	MT3tGraH7qxu25T+EUFkw5S0OBgXlhVLLycnlxdzatic3lCkBJKqW5d6f8UPdzqWrq84IJEYfTf
	jjLcYZDbjveGcsshqA6WfKaCzhNfO0i9pA7AbdfmDunBwfFmCb35FYeNoCHvxZb4cl+Ej0FlWuA
	k56dbjy23IVfErJ6kewcaS5ZscxATRZCOUE2jLX1hnoX9iQNBapSwBQ00+VLDW6phqBj8L0KKHi
	c+z6w1eBSIenNiZXvWghLr6rje8tN57Crhp3/TgGqsrRHz844qp74CyrfdjRLZkqOxw/VrJWLb5
	L8umAblrD8t34m8ZlPIyxR1qBLQvDliSPM1gGslzzigTTQ0FCNDGBwiTca
X-Google-Smtp-Source: AGHT+IEOFfa+B0kbKk74AoMNyN2v7HrCUuX9sI7uI2roR28NGM8p+kdspmLaO1sVzSXl6FETBuE3Sw==
X-Received: by 2002:a05:6512:2311:b0:583:903e:b5a4 with SMTP id 2adb3069b0e04-59584214f80mr3460710e87.46.1763370341593;
        Mon, 17 Nov 2025 01:05:41 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:40 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:05:01 +0100
Subject: [PATCH RESEND v3 4/5] i2c: davinci: add support for setting bus
 frequency
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-i2c-mux-v3-4-696c83e3505a@gmail.com>
References: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
In-Reply-To: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=PGfDlWvGSscBxbVs8v8ZTNXGs8v6TwzoMOGQNHx4lNY=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVTmbEPDBw0DGf55nTkqQfPY0aSmJczmJdzL
 udfzpVwpD6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlUwAKCRCIgE5vWV1S
 MsrDD/99RIw+4GMeSZBAZdqbftN+a6QrefWaPyYXbQfwN0gTMDTGL2lUdqnPRz5XYrpBrI+8zJX
 16Kg3VPRKo/si9YBXKjljakdIpkViF/LhRm6VE/s5f6KjUEZa5K82ZILREWEVEcUJBeblUPSpb3
 c9btZcefJ8AmMyAWmiAAXdeUrNJV0ecpmZJn8yROfFp6BF5h8J/v1NYWGgbizI2a/6njFui/lKM
 Yh1Yv1MQgPXx9xpZLNCDiV1ATrxcIT83Cz1FOwC6/5ev7oTd82cmNhbhf28dWeY6Hs7185mmUGm
 B+9ZhV7/bGSzLiu5u43DI2npMiIa3+wkxxfVtr/ovLZhdNXUcf5mIUHmdaTZsZvEeEk/5JEj/UB
 FyDEfFK+63Z/0RbkCMdMAFvnclG9bUZbYBctMKgtQCFnabtupVPifRKka2oeS6jXa7TPdXyIblq
 ORizRSo+drE39m76lmL4SDmjh1wGj2mGsz5QdqN/qD9H9YmSxC5xDb+9KJ2ccIc2lMNw+CeaQxt
 1GR8DgS6yTBGfnS4JmsvtE+lwT48Rgl4k5hT3U7lmGoDqn7zjMdSwNPga0JsoxWbK7yJ2qT2SbE
 DUVQjvExQizKAWxq/AhLfgZDdTtzA5BpMxxoxgzaZzxqtcP01uB55BH/O8WxuVhFfRx9uu+I/Q6
 I+bVBUkrzPsFGMg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Populate adapter with clock_hz and set_clk_freq to enable support for
dynamic bus frequency.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 82f295619c4d..fdde573eb59d 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	if (dev->bus_freq_hz == clock_hz)
+		return 0;
+
+	dev->bus_freq_hz = clock_hz;
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return 0;
+}
+
 /*
  * This routine does i2c bus recovery by using i2c_generic_scl_recovery
  * which is provided by I2C Bus recovery infrastructure.
@@ -810,6 +831,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->clock_hz = dev->bus_freq_hz;
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.51.2


