Return-Path: <linux-i2c+bounces-6690-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE4977D19
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7E011C24B52
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60D51D7E36;
	Fri, 13 Sep 2024 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHR59Bu+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EF819F401;
	Fri, 13 Sep 2024 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726222512; cv=none; b=G0aJTd2OeGr9MlAiLEH+eWRH9IYZwahg/dbjCl3RPTQGFkgi4wetjJb3Lqm4GuVlgWfX0GndA+wqCtHglwwtjh9K+vtTjAzXWwJl/vvig8Z/LDyeMDvK//wkx4b3oRNbA0SOYfiMXc+ZoIg+DtIt22mfTab2sYwcopfhbZLDP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726222512; c=relaxed/simple;
	bh=eYqdFGeeI6JMSXzz1AebDd2mo26GrYd8KbFl6H6hD3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=JnUOyWfyw10lvXA1z5DusJ9rAPi4VaRJf3WoY40BtLY/OVqrspwlJHv2POfGRr3/0Woz3kh71kqzVCgU18R2eEsIUFCq6ZDECtTOioIWBGAFOaRqli31CSLUfR4SunWFpIOQBJJKvcIhamh0OZeeYu/EZkCNIZl924Bll6bbh7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHR59Bu+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so2232875b3a.1;
        Fri, 13 Sep 2024 03:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726222510; x=1726827310; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ld5dlQNPUQTUFF/Ssx2WQipHo3yFKCbKn/t6dhaVrDQ=;
        b=FHR59Bu+2UFB4IA24EELVZXmPkxb6QQho6gCgnROVAImtSN6HvA59GHI1/9IH4Jq9o
         C/eKojzMKmGJMZKUhnC14yLD04orRJqvIi0ji3Eg1fdFnZhRhGhiqC5WmYXw0DVb73Rv
         ss7yh5bXdPukLh9mJIHt9cXD7/sIu8LZ+aosej469zeFChm05zdMHgunXI00lDh06ORh
         DrKd4hw3nDGb+VTpjyu1MQHbr3Gym6yFFpiA37Hia5l/8r4kw6Uwv4WdPT03KhI6eIpl
         Fe3w0kSWwiFKfhTC6rhqeEIiBw7aSOdetDYKD5CdElwr3ZFjGS6alTb7kkH/KmjsGbce
         sFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726222510; x=1726827310;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld5dlQNPUQTUFF/Ssx2WQipHo3yFKCbKn/t6dhaVrDQ=;
        b=MqCHIzR7KqDVQYyF5cThBajnSvIk5JGdIgvkZMd7AepsboZRwF7/tj0/ynYiRYQFdU
         0CQ+WVLxwBovCSbw8/2hEH70RJo7gC7Gdu+90lNXd5WIUtP/hoHaqT463NkQQx1hrwR5
         t4b1we71PNEkd92sVIDK/7RVeS8JvHNj9Ft5i3YeuiIW4dVB3BJC0lDgddmtQ+a4a0Aj
         IvqFp4ZywFU+NpnbqA/9GVNAwLPTyDzN70z3YtzgMjLcOsWdk1p0z8JbYicnOqM75sE4
         mWUNN0pqHu6ACqDLFSDVnXi1hIqQdAK4dYPKzBH59ANgZNoVMRcrbe4Qmyb7+o0C47b3
         aqFw==
X-Forwarded-Encrypted: i=1; AJvYcCUqye8BB+RBqZap6hxMOcW5DjRhdPUw1T8FKhCx3Z5n10o6TTJ5GXaoT3u2uDDqPR5U2Q+O9R/Xt4BXOmqv@vger.kernel.org, AJvYcCVUsayIK+MwpDozGvLodcMwViQncTVuOvr7sJ4+V9gHMzW5k0qf9N+lqP/+KIgTpjNqeeYLvsaGG2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5GOG8Gya/u/Y84EvcXzYyB/RoUBZLhQmh7hu8/aW6ujAF1f8a
	k1+sk0FFMjdH6qwufmv4hoL1b4MITf4bbg0iwpgjZO2UQkuOgbI=
X-Google-Smtp-Source: AGHT+IGt26oOAshFJlW/po5/WtDlvLOL1IGJhw4CdzWN+MaBv+2N3YYu0lqY/H1NjONEpq76mTw+/w==
X-Received: by 2002:a05:6a00:6f18:b0:717:98e7:3d0 with SMTP id d2e1a72fcca58-71907ba053fmr23661051b3a.0.1726222510134;
        Fri, 13 Sep 2024 03:15:10 -0700 (PDT)
Received: from localhost (2001-b400-e334-c33a-b4cd-4a8f-209a-cf54.emome-ip6.hinet.net. [2001:b400:e334:c33a:b4cd:4a8f:209a:cf54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003c57sm5813143b3a.89.2024.09.13.03.15.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 03:15:09 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] i2c: npcm: Modify the client address assignment
Date: Fri, 13 Sep 2024 18:14:44 +0800
Message-Id: <20240913101445.16513-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240913101445.16513-1-kfting@nuvoton.com>
References: <20240913101445.16513-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Store the client address earlier since it might get called in
the i2c_recover_bus logic flow at the early stage of the function
npcm_i2c_master_xfer.

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 68f3d47323ab..e52e65e63600 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,18 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Previously, the address was stored w/o left-shift by one bit and
+	 * with that shift in the following call to npcm_i2c_master_start_xmit.
+	 *
+	 * Since there are cases that the i2c_recover_bus gets called at the
+	 * early stage of the function npcm_i2c_master_xfer, the address is
+	 * stored with the shift and used in the i2c_recover_bus call.
+	 *
+	 * The address is stored from bit 1 to bit 7 in the register for
+	 * sending the i2c address later so it's left-shifted by 1 bit.
+	 */
+	bus->dest_addr = slave_addr << 1;
 	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
@@ -2163,7 +2175,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1


