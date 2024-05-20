Return-Path: <linux-i2c+bounces-3601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC58C9FD7
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 17:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9121E285B2E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 15:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2F213774A;
	Mon, 20 May 2024 15:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdB08FAO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43AAFC01;
	Mon, 20 May 2024 15:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716219615; cv=none; b=KprWtHnuRwVDARsU/LkvCJqRbdq35l0Yok3MFnuSCFz0fkt5loAitl7iL/p4W84gh4anSC2sFk9Ga8xWhQkXP5MOv+HOu8S90mMoQSKMkya03rXiywrJ6CjUrIUXJ9VcS9txXHyfS1tz1JjRwB3Sj/vEEFwmG1u/qk16hn1lG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716219615; c=relaxed/simple;
	bh=bxz7jyZF4t7F6adRiq0DRQVZau32bwbgme1aKJMz9gM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUJxmq+JODJ9sNe6nVxdun/xbFxitH3R3R1tpVyUNlNW5acCYoSWW+0M1Qelvk5UFAmkLfSUr3m8Kzmk+H/BcQc3c1X+Vu09hBFBNxWeyE6Mox7hSof8bdQhJx4ZwQF1Ph3ZBy3w5AZUp8biPWzDAmxuv0ERTq1fhbJiwrxj6hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdB08FAO; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-571ba432477so8419258a12.1;
        Mon, 20 May 2024 08:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716219612; x=1716824412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lnr1potWpuTZcvydit76tGvDXKhaYKHwXt27AplNE/o=;
        b=cdB08FAOTHJcCvcB99obQF9x21JlPWxZVV0Lvi2Nd/Dju91NWERRLfoL6D14LXlYYt
         WNCrC1PtVxiEY/2WECDjhPZyW5KkX4nrGjaS1Zh2lwjvz2KyOwImw2YfMs71/YcIP9bs
         6xxBuNtk3AizrtFiKXEdN6urgJNmXwdRMHOXndLFlit1F7mJAUcDVVtFFHr1POm8HdLJ
         lYcf5i2hMX6f7C+NKrtua8Mt/9fxUyzIcZ3jfX0lk3y61PgeiLoihKJFVnHyCAaHkxt3
         vxX1ZCYu94niDFk+Fx0Nqu+2q5Bl88ezL4r3Cf3BeGxdZU5kKtsHUxpTfRHtxlaaGnNi
         ctZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716219612; x=1716824412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lnr1potWpuTZcvydit76tGvDXKhaYKHwXt27AplNE/o=;
        b=aQbnUYp7Oz/NVQODOVy8YPe9MOusPYuWFEhW3Z1CkTQrp8/qto0zcg9LkzbA1KMijY
         Epx61tDLHV45Lz6O3zJitof7/BlEFvs1uBXNnF52JGIIzsEEwycBz0+fkSj13OPj10Hp
         c2BbzOegAr6nOxDG69rFDPu1MJFrKZcpqSiNkxaxVCuKCisBya8A5nWvV0BZJa4pO5Bw
         Zcw86vHNbI5Jk83kB33cSY9T35XkjfqsPd9hFcfUnvMMeBHI2hciO9CYdHdhtJrkjPFS
         ugWl8MT5bq/e4FqwI6x2+WAOkob3ATVlme0RSgxO0maDhp6apA+3sdN+sbQHTthYYHjV
         QLbw==
X-Forwarded-Encrypted: i=1; AJvYcCVL7pnbUIhApZ2IvKWKJWXGPrXIscZsIr4XFDBpXvEG0FgPl9bL89lRGD4lpG1WPGvB00+z7uf/weYw+v5RvSL9Pqt1ZN2uWOT6XxU0g0xdtt+TZwt6FOukaLBj0xMSfLMrvHvIwDVqB9alo6Vvs0Y7ToPx+c9FMnqV6OBrOU8h
X-Gm-Message-State: AOJu0Yy2vas8lPS37k70RUFs5Qot6biC1zNfiVFAkmWPn+TVZp+DBqdl
	tqn/X1qF+EETcE5ZnczwA5t+dKs6yYMzulN8I5PpP5M5VKva1YxU
X-Google-Smtp-Source: AGHT+IEMExvEaNZcfHPPaX/8k+WlPHRrW1ag/azymJJNxRfVzHV/Z79udHSmjR4oX2TvioCo2Y/O+w==
X-Received: by 2002:a50:9ec5:0:b0:568:8e22:4eff with SMTP id 4fb4d7f45d1cf-5734d6df0d5mr18784232a12.37.1716219612034;
        Mon, 20 May 2024 08:40:12 -0700 (PDT)
Received: from think.fritz.box (2001-8e0-3c0d-4001-4e1d-96ff-fe13-2153.bbcs.ip6.as8758.net. [2001:8e0:3c0d:4001:4e1d:96ff:fe13:2153])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-574bcad0362sm11760902a12.20.2024.05.20.08.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 08:40:11 -0700 (PDT)
From: Grygorii Tertychnyi <grembeter@gmail.com>
X-Google-Original-From: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
To: Markus Elfring <Markus.Elfring@web.de>,
	Peter Korsgaard <peter@korsgaard.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>,
	bsp-development.geo@leica-geosystems.com,
	stable@vger.kernel.org
Subject: [PATCH v2] i2c: ocores: set IACK bit after core is enabled
Date: Mon, 20 May 2024 17:39:32 +0200
Message-ID: <20240520153932.116731-1-grygorii.tertychnyi@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting IACK bit when core is disabled does not clear the "Interrupt Flag"
bit in the status register, and the interrupt remains pending.

Sometimes it causes failure for the very first message transfer, that is
usually a device probe.

Hence, set IACK bit after core is enabled to clear pending interrupt.

Fixes: 18f98b1e3147 ("[PATCH] i2c: New bus driver for the OpenCores I2C controller")
Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
Acked-by: Peter Korsgaard <peter@korsgaard.com>
Cc: stable@vger.kernel.org
---
V1 -> V2: Added "Acked-by:", "Fixes:" and "Cc:" tags

 drivers/i2c/busses/i2c-ocores.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index e106af83cef4..350ccfbe8634 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -442,8 +442,8 @@ static int ocores_init(struct device *dev, struct ocores_i2c *i2c)
 	oc_setreg(i2c, OCI2C_PREHIGH, prescale >> 8);
 
 	/* Init the device */
-	oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_IACK);
 	oc_setreg(i2c, OCI2C_CONTROL, ctrl | OCI2C_CTRL_EN);
+	oc_setreg(i2c, OCI2C_CMD, OCI2C_CMD_IACK);
 
 	return 0;
 }
-- 
2.43.0


