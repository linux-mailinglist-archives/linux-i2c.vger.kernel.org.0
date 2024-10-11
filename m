Return-Path: <linux-i2c+bounces-7330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B850999C4C
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 07:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D64C1C225B8
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 05:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1795820822A;
	Fri, 11 Oct 2024 05:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Khcs+jcF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408D1EABA2;
	Fri, 11 Oct 2024 05:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728625970; cv=none; b=hdvI9gzuawO1ijKOIGoOMo7IeTMulV5FusesN2EgK5QlJD2E/jRhObl19KYZIerWaoFNRp5pxdu32TeeYoAX6Naibn75Hbpe/O7qBANNfs8ih7pu0twoEHTjuRcAJZxhWLKeimYg3w9RpirSHkqMRDe+hWMfS+Yb0NGmy60ioWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728625970; c=relaxed/simple;
	bh=+Zy2b8GIOJelJNHOlnTeXcJBLrhjFz0c7jN0NoS7G+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=opjnHigB4SSQ2NLLtXQqgJF3gp84isgzcs5jBFlEkkwSTfvbLHdN/Mc8L90X9HbkZLZG25kMnmwfdq2ypYNUrxuDVE/lLOU2+qLwvAET4oPodo0y0Xz48yiMyF1RtF8sKkeKAdQSCuKAVbMeIbiyNAqzAuXHR04ODmPc9VleJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Khcs+jcF; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-716a3e50a81so1009113a34.3;
        Thu, 10 Oct 2024 22:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728625968; x=1729230768; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xuEkmyRTVFltpV0RlR/fXEwLbNM+hNheAUnuQYiB238=;
        b=Khcs+jcFxRYUcQiBMzm3apOcov5or2s7FYGX10OkZW07X1EesTDBNBe0Z3vUT7r7Gd
         UN7B9YVPwCpAmO2moSQIlyjHUeZV5i6emDeY4CphWEKpbyGJGMRe+oNjQFQBpqtVgKHh
         absZi+ELv7zcyzltCh4octJizUjsUeA15HC2Km+6pIJ/bysKshKfI8s8CEsy+5/io0I+
         9EkuGdXaQuntUBQP4irGMhxPWFtigX/KMyhi7iytdTK0P4hisAYrlgY4kIki6c2mnblW
         a8YmkA0I7dMw6AgBdWvTKuxAOoxeVmnRgy/LaThPo3jHMb5RLE0a/uTeDYn29+fkZNJp
         AWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728625968; x=1729230768;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xuEkmyRTVFltpV0RlR/fXEwLbNM+hNheAUnuQYiB238=;
        b=iTGuB5Xr/gkeQt6JX+/pEXfIBN9ZQkJr0i6H+GIDxaOEr4/f5g5dub6h+SmOE0MhQh
         lAK5msb4Yg7/FKC+6DCmVBQeeMBk0u5fw68+a3HsoW76JHQxXs2/JDh3l8pHS/EscOGp
         pmoUQ/CjHSDcf7fvteY7dk7iPq/ak/y2aE05Njw3w2+VZyShA2gd/Utm2RnKyh+zWHHT
         ZnSWKfShe6xqmkt2pv7WaEmZ6jQ8Sq8gdFNbwWLOFGcWKLW35CTm0yeMvl9fNGM5jU6S
         GNOQ3eSm7WGnoSZGufbwyRObGtJPD9f6OqSCByBAWFEf6IruKT8BTGc8UnRiMb4BDe7b
         fV+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgcM4LZbHsmzLull2MBNkmJxz/3GPgWKS13p5Acr2Xm/7PrF+VtGgLhvzUkNmN0hCb6Wwy4Y/RKp8=@vger.kernel.org, AJvYcCXhkFJ7xUxB2zgOBbaqW2xHiQ1kc6eMZiKzkmwkLEsNAOBa+xTPULPjUIiwqiYyt+uknhjyJIqR7dXKG5d1@vger.kernel.org
X-Gm-Message-State: AOJu0YxRtmPu2F6WHTSavLE9OfXK11w711F8iIQj1EiJX2cGnrAsmlXx
	bHk5wvabW0dKqwVp2NJw5OF3f+ecDI/V8iDAkrlo5rOXbBvfKdO4tKsmvmU=
X-Google-Smtp-Source: AGHT+IFI+YEgKjTOGlTjgbwnkQl3Sg69mjhkL5/43+Y++zB1j0ROyjoHxWdrtmO/E8N04+bukogyeg==
X-Received: by 2002:a05:6830:2587:b0:710:f7b8:c4ed with SMTP id 46e09a7af769-717d64972d1mr1211821a34.28.1728625968193;
        Thu, 10 Oct 2024 22:52:48 -0700 (PDT)
Received: from localhost (2001-b400-e38a-6880-f424-8486-7476-9f9d.emome-ip6.hinet.net. [2001:b400:e38a:6880:f424:8486:7476:9f9d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea449663e7sm1910843a12.76.2024.10.10.22.52.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 22:52:47 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
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
Subject: [PATCH v6 2/4] i2c: npcm: Modify the client address assignment
Date: Fri, 11 Oct 2024 13:52:29 +0800
Message-Id: <20241011055231.9826-3-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241011055231.9826-1-kfting@nuvoton.com>
References: <20241011055231.9826-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

Store the client address earlier since it might get called in
the i2c_recover_bus() logic flow at the early stage of
npcm_i2c_master_xfer().

Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index c96a25d37c14..349492f114e7 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,19 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	/*
+	 * Previously, the address was stored w/o left-shift by one bit and
+	 * with that shift in the following call to npcm_i2c_master_start_xmit().
+	 *
+	 * Since there are cases that the i2c_recover_bus() gets called at the
+	 * early stage of npcm_i2c_master_xfer(), the address is stored with
+	 * the shift and used in the i2c_recover_bus().
+	 *
+	 * The address is stored from bit 1 to bit 7 in the register for
+	 * sending the i2c address later so it's left-shifted by 1 bit.
+	 */
+	bus->dest_addr = i2c_8bit_addr_from_msg(msg0);
+
 	/*
 	 * Check the BER (bus error) state, when ber_state is true, it means that the module
 	 * detects the bus error which is caused by some factor like that the electricity
@@ -2165,6 +2178,16 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	 * bus is busy.
 	 */
 	if (bus_busy || bus->ber_state) {
+		/*
+		 * Since the transfer might be a read operation, remove the I2C_M_RD flag
+		 * from the bus->dest_addr for the i2c_recover_bus() call later.
+		 *
+		 * The i2c_recover_bus() uses the address in a write direction to recover
+		 * the i2c bus if some error condition occurs.
+		 */
+		if (bus->dest_addr & I2C_M_RD)
+			bus->dest_addr &= ~I2C_M_RD;
+
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
 		i2c_recover_bus(adap);
@@ -2172,7 +2195,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1


