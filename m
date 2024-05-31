Return-Path: <linux-i2c+bounces-3730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 559448D6473
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 16:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86A9C1C21370
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C582E859;
	Fri, 31 May 2024 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqcl8k90"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CE91D52B;
	Fri, 31 May 2024 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717165487; cv=none; b=KUwem7q+t3b1R+X1jF2IrJS5Bi+hU1k/fN8lI+dKfOR6z29YZva/P5Vi2N23Gd1fzW+LZCW9C9w5nTLneOxSqqL56uoNd2+eXbJ/VAD+4JXnBUnCBzhOytR41upRwc6J6qgCk6i1KVn+vhrmMC9aG2uxkIrO39s+cS8BfAPaUxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717165487; c=relaxed/simple;
	bh=Kyls1XarLL3j7W8QAWP8PzjJaN3EmNERJNTYyvB59V4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aFLtZ0iw2rj6OmsF8MrKu+9edDQqXVjsrpn+WKrbxJfDhrjXYUawaSnYRUKyv7QnJOots4dNCxKQQABGWWwGozDiLAt15cCbiDqMRj74e/9C4PzlPjUxRsS9T9/bswbhnRxatnk6qlPTGfz1FCBx4DnKeLyyLlE1VlqNEvxyptw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqcl8k90; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4202c1d19d5so19757935e9.2;
        Fri, 31 May 2024 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717165484; x=1717770284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvugHJuLmQUc6cOC5U1VQIb36XNwdMjbA+t0EJil/IA=;
        b=mqcl8k906p68dEl6FuQ8Fk69c3lhfn09lD6nhVrFtxvPmtEFvmoWR3Nawb4pAUnc+e
         QJz19YBB9Kl2NuubAfQiC1cdH84u9VANUMHG/mKPyAkr/5zYpOQuBAqF29PZrjpBHSO/
         Dvsr5o9DdxyIEFOqj7TMNjPrWIJRYbKeVBNwU6DrsXxEWoIZfQBia8FHE2OUpI2Q6Pq9
         UfGZCBOZxjxU9Qch3AiyKPqjdwCY2MQQgUAqX6lSB8/b3w6tKplj1OPngxa5IyxccaiY
         7isr3obduzWi+2vhtGXn1Aze//XVjC71Y60L/9fU43w8z58DmJILveG4RbnSxFcZ3N4A
         4aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717165484; x=1717770284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvugHJuLmQUc6cOC5U1VQIb36XNwdMjbA+t0EJil/IA=;
        b=t269mzO0mXfQ1CpkfUYUqbCuJKVnZTvFAVR+UUAAXtzI/VmKeXIDoFln5xHm/Hjy39
         nT4doX/OAzlX0mamUowmPPrfT1SFF9EvaOienI+KYj8E5ogldCCJuQNEZ717ZgNL5SMj
         pX0mzHtpe6EpqpvxNeWvl8lsL0Qwt8iyAtnlGWwcMArHovHFCHZ9LV06A2ruaZWjo2I5
         FG/vTUigapXorhUJJVv2RtCYbzgwiMgR4brqyY4WjwGUUnz5wSkvBTeiKd7AOL4knrfF
         Vej35zf2d8sG8FWtlakOGKn7E6wYxYE8AUcl5Bo59i8Orjs8yf2w6JQbFxx5vtbCpi2I
         EP9w==
X-Forwarded-Encrypted: i=1; AJvYcCWxXvAaMpnF7j77E3OhJVRBKm/0rw9/T3Wl2GYdpvl4MSwx8PmXK7T51lQ9GmFeIIA5ERu23iD8iJZ058r54XajPsquZWM7hgW0SqU1Zy8Xvw8PNzIhq7g42Ey0Ag/MoAaWHlJRln7i
X-Gm-Message-State: AOJu0YwY65xiP0/971ugod0mlWY51jR5iAwSdO4g8THT4yGW3co+goew
	JwoDy7ANYLiTLLfvUdkAQKq9AUdufJZqKU21m48TX3yHHni2ES5d
X-Google-Smtp-Source: AGHT+IGTYpztiA7U0O7D+ZJjrvnzu789lGae56lcoOL7cIRtDV3rFkXO1yh0FXSOa6ct61AKz8rl5w==
X-Received: by 2002:a05:600c:45cb:b0:41f:fca0:8c04 with SMTP id 5b1f17b1804b1-4212e04998fmr16361265e9.11.1717165484201;
        Fri, 31 May 2024 07:24:44 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:d7a5:3a0c:813f:54e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421292205ccsm48136685e9.4.2024.05.31.07.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 07:24:43 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	jic23@kernel.org,
	lars@metafoo.de,
	nuno.sa@analog.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@pengutronix.de,
	marcelo.schmitt@analog.com,
	gnstark@salutedevices.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	eichest@gmail.com,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus not busy
Date: Fri, 31 May 2024 16:24:37 +0200
Message-Id: <20240531142437.74831-1-eichest@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

On our i.MX8M Mini based module we have an ADS1015 I2C ADC connected to
the I2C bus. The ADS1015 I2C ADC will timeout after 25ms when the I2C
bus is idle. The imx i2c driver will call schedule when waiting for the
bus to become idle after switching to master mode. When the i2c
controller switches to master mode it pulls SCL and SDA low, if the
ADS1015 I2C ADC sees this for more than 25 ms without seeing SCL
clocking, it will timeout and ignore all signals until the next start
condition occurs (SCL and SDA low). This can occur when the system load
is high and schedule returns after more than 25 ms.

This rfc tries to solve the problem by using a udelay for the first 10
ms before calling schedule. This reduces the chance that we will
reschedule. However, it is still theoretically possible for the problem
to occur. To properly solve the problem, we would also need to disable
interrupts during the transfer.

After some internal discussion, we see three possible solutions:
1. Use udelay as shown in this rfc and also disable the interrupts
   during the transfer. This would solve the problem but disable the
   interrupts. Also, we would have to re-enable the interrupts if the
   timeout is longer than 1ms (TBD).
2. We use a retry mechanism in the ti-ads1015 driver. When we see a
   timeout, we try again.
3. We use the suggested solution and accept that there is an edge case
   where the timeout can happen.

There may be a better way to do this, which is why this is an RFC.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3842e527116b7..179f8367490a5 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -503,10 +503,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
 				"<%s> I2C bus is busy\n", __func__);
 			return -ETIMEDOUT;
 		}
-		if (atomic)
+		if (atomic) {
 			udelay(100);
-		else
-			schedule();
+		} else {
+			/*
+			 * Avoid rescheduling in the first 10 ms to avoid
+			 * timeouts for SMBus like devices
+			 */
+			if (time_before(jiffies, orig_jiffies + msecs_to_jiffies(10)))
+				udelay(10);
+			else
+				schedule();
+		}
 	}
 
 	return 0;
-- 
2.40.1


