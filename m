Return-Path: <linux-i2c+bounces-11144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DAFAC462D
	for <lists+linux-i2c@lfdr.de>; Tue, 27 May 2025 04:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB9513B5505
	for <lists+linux-i2c@lfdr.de>; Tue, 27 May 2025 02:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C1715A864;
	Tue, 27 May 2025 02:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOnODSpy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2CC1E49F;
	Tue, 27 May 2025 02:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748312549; cv=none; b=YMBHVs7JMuBBwnAWvMa3B3BeA/7Feut61qWMGHk4YJSOqmCxw+AkfzTtBGop07BTxX2qRKfLPUSh/5fnsy6m0AiIhz89Tn4souMUTft92rN5thTW0OY4PT2aZbMhnAn8CM2bGiBCWnFvMYV8/UtJBKTMQDzoFbJ3AJnHaqbcd2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748312549; c=relaxed/simple;
	bh=ax8DORt3nl7M7bKwe/Q/K2IsL+RxtQY7M0N+mXFv2nA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mWVLLD3CfFGWuAqunvmDQgcN2+mKViAESv32F3wH3OWSO28pCMB4+FFZPt/Gesq0mowwqd4rpyUpWSMMsMqhpLt3C7Z8ZiCoIxtJBsv/rVvilJHnvuiNcFC3U4wJEz9Wx4hlQcISGRKVLWlekq1ayyGMO6UpShxMUvN+Epxf2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOnODSpy; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so1896257b3a.1;
        Mon, 26 May 2025 19:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748312547; x=1748917347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZFVvRJY1fTqIBxgYmrtUDDZUclFNtpBJuPYEOpKE84=;
        b=ZOnODSpyUiHXkgMTUpJLRpSi+PGrXx3NlAEy0kiK6eXDWzbpFFZeq/TsQg9N8cXq0X
         l4ktnkfhNaIwBLFLVuuSq+yeORcxws0wD0RczSe7+xw9TyffLRlC1brxSma/osj/0uHh
         GTct6gOsnw/dw4ZxlDCNkZMs/CeIKbC8dXQS8+TL+i0jnlSV6EodOlQFyykG3Yvvmx89
         DHiN8rZT1jJokSiyuGdS6nY5N85pFVhOpB46NdoheHqxEJUIXwAueqBRr4McCC6dQxFd
         r/rZVYRTR/qTFGQeNRN5Dx35hjrxp/l/mtOAFRODLLbP+eiVOGQcN2ruOPxe3kwuHQca
         BneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748312547; x=1748917347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZFVvRJY1fTqIBxgYmrtUDDZUclFNtpBJuPYEOpKE84=;
        b=rn3Pzat414aeV+uqimVDwvSFrZo5znjuwZ4Zu+EJ3L/wOt0f7JXapRWb9XnFB3Uedo
         K1YOqrwdmTwcClyAprpgw/Gi/yaW2xLGDYOgdX0xJdOB0RLgH4qBKoQSrPbGHxCjwM0t
         eMQXwI6iBUoJcgLhvo+ozj5Or9yXUV8d1d0sqn12NkFzw6tmABFry2/9k8MplHWvRuaE
         30RDE4C4wr8IcqI7hY92Bdcb/qkP7k9UCOkCb64g/l2M1oGJl/LeY9gBUzMhbvCafe37
         hnOCTUQG9PNE0kWurhGphHyOtcgbFZ2uXcXdC8VBKZKkxZJ1oPjwlKchweQ6Ovvk5et1
         nZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCUVqXiAVT3aoyfjf6KFWoJ5eIT9Kg2HGfffgh8NDvOVAQCr1c/9kvhTWcYecIVoFeazZNwTzLYeZwKsQ8SS@vger.kernel.org, AJvYcCVz4aEBEBG4ADk4/fxT85I9BuRiXvLygRQeQIws95ujKvMb8yorlKKctWgceaXagYUsbQumUA0lavE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD39tIycDkN2xjLL8pQkPuaI+ob5g0fTGkOxKTmy+KctreEFqO
	2pWG/McrV/oqS6ylbmj2nfqqoHc73kHTZyLnu6E3vOWk/W40HKaZzKCU
X-Gm-Gg: ASbGncuuJ0t5whF7DKCRWT8coKntNihAaAUoG7dfx5sYxFLJK+Iu1XbGXe56gQhnPvK
	DOW8zFXzCnuRLFCMqhboI7U9+Xx9306UQ/sbMZCCcNTX012iwfOp0xhKKzQq1KiMrXjwimiawB9
	LQC2tfA6fost0ZnP7T/xRMTw63WcMt69YexhIK5sqGy3koNjesJbl38J54pVtZfN3Qmww2ONisr
	DQ9lYNvZ9/8MperIt5+9DGF0O4T7jPDZ+ATijzj2tN9W39bFRsxlRx0l3PVyMggxTbEjYFPM+eV
	w5C9da6f3BxJ5M4bePIbD0EoMjoPNn8u9kwoHr0Aq2T1XK89sBDqmqQhQEQm2iTrycFbaCEyvws
	mKgDmnpcV+JlTpmD49mu3QxWC9CAB5hOhsqJ0004jKx2YPw==
X-Google-Smtp-Source: AGHT+IFiuntnsnK15d+0mwYVXj7s4P44ohb8smQc2OgNgWwbXnwz5k1zyE7Ux7qber3BmRexfWOpAQ==
X-Received: by 2002:a05:6a00:4646:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-745fdfcc5e9mr16452708b3a.8.1748312547237;
        Mon, 26 May 2025 19:22:27 -0700 (PDT)
Received: from localhost.localdomain (c-98-42-219-30.hsd1.ca.comcast.net. [98.42.219.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a08esm17664706b3a.112.2025.05.26.19.22.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 May 2025 19:22:26 -0700 (PDT)
From: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
To: 
Cc: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v5] i2c: npcm: Add clock toggle recovery
Date: Mon, 26 May 2025 19:22:23 -0700
Message-Id: <20250527022223.78371-1-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
References: <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tali Perry <tali.perry1@gmail.com>

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to recover them first before failing.
Sometimes SDA and SCL are low if improper reset occurs (e.g., reboot).

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Reviewed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index de713b5747fe..0757a23dc1cd 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2178,10 +2178,15 @@ static int npcm_i2c_init_module(struct npcm_i2c *bus, enum i2c_mode mode,
 
 	/* Check HW is OK: SDA and SCL should be high at this point. */
 	if ((npcm_i2c_get_SDA(&bus->adap) == 0) || (npcm_i2c_get_SCL(&bus->adap) == 0)) {
-		dev_err(bus->dev, "I2C%d init fail: lines are low\n", bus->num);
-		dev_err(bus->dev, "SDA=%d SCL=%d\n", npcm_i2c_get_SDA(&bus->adap),
-			npcm_i2c_get_SCL(&bus->adap));
-		return -ENXIO;
+		dev_warn(bus->dev, " I2C%d SDA=%d SCL=%d, attempting to recover\n", bus->num,
+				 npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
+		ret = npcm_i2c_recovery_tgclk(&bus->adap);
+		if (ret) {
+			dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
+				bus->num, npcm_i2c_get_SDA(&bus->adap),
+				npcm_i2c_get_SCL(&bus->adap));
+			return ret;
+		}
 	}
 
 	npcm_i2c_int_enable(bus, true);
-- 
2.39.5 (Apple Git-154)


