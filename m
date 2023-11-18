Return-Path: <linux-i2c+bounces-244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B1D7F01D9
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 19:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2765B20944
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Nov 2023 18:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73731B284;
	Sat, 18 Nov 2023 18:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPn6fCnB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C56AA;
	Sat, 18 Nov 2023 10:05:14 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9f282203d06so427491166b.0;
        Sat, 18 Nov 2023 10:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330713; x=1700935513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+AlUo2GslrTb8lu/H9lXRQ7xNPByNIgHu5m89J0d9M=;
        b=JPn6fCnBUJ5srzH4r0av8zTkBovLoRtgsFTr4Vrf3Uom3q1f8S20MCxYXUs7i9ynwQ
         p3pMzp7Qyyzxb2yjm9cdSwVMp0+rbvnE+oy03j5bFYkJe+pJKXuxI7lywfC7dCa1R3mo
         48nLF3i847nDh2kAHVF2PO3Xzqk0oaKoXK5jZcl/OEG+JUlnq1SaqqgEyx0bXgDOFYeo
         pQ6M12w78yldfZQjnMSIKlRIUaTOdzf9Q32VpwD5+0EISlWS4LzYPqtFQOmIGEPLBq5S
         Ors4ip25g/36p+ajo3Kj3RAjiFfiYESMG51fRjMuFFuWElagtl9Ns9WTqLR9aDcFt4oC
         GKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330713; x=1700935513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+AlUo2GslrTb8lu/H9lXRQ7xNPByNIgHu5m89J0d9M=;
        b=fJ0KlU2JJliLfzb8maAKxjCWd3jbIlMmdQFEldZShSRN2Jbv+Wz4MZw7KQ7+2DbMvD
         kv4g5bqtkVtGCwvfAfOV6HfvNFp81QCJPNv7QvuStZ1Gmkm/eU3/bXUp3K4Nz+Mew3N0
         VE1EbbcEvtjof74u3abe7k9j8PbB2MDLX8WWQ00uPWk+GWWJsIwhPCJ9M70Elmxt4FoG
         gL7WlUdF1ug2cPlcgbFsgiNUTDTCaHXvBYCtltOhrGFSc+PcTVwdlvYf/1BTQLDCwuhn
         s6Kxy1Ubm7HhMtJuEMe/sGh3mPWzjy9NCglkLZ4H50Q8ToFRxAwaqq78Y9G1xA3t6e5r
         VZyA==
X-Gm-Message-State: AOJu0YwLKESQ/bbM5QCaH9+SVXZ1UmiPwRh1Okw8xM7REK81VKrB8R7H
	2692GdOXTILowN8gwTcrs3EoGNjYGm04uA==
X-Google-Smtp-Source: AGHT+IHIv6I4Gwsd3S6HojvrFo4x61NnzUZVGhsKNL5m5fRKpWQLcETOBzno2YDAq+fnVQHmvTpy/g==
X-Received: by 2002:a17:906:104d:b0:9be:705:d7d0 with SMTP id j13-20020a170906104d00b009be0705d7d0mr2012795ejj.0.1700330713123;
        Sat, 18 Nov 2023 10:05:13 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:12 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] drivers/i2c/i2c-stub.c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:04:58 +0100
Message-ID: <20231118180504.1785-5-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118180504.1785-1-hkallweit1@gmail.com>
References: <20231118180504.1785-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/i2c/i2c-stub.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-stub.c b/drivers/i2c/i2c-stub.c
index d642cad21..09e7b7bf4 100644
--- a/drivers/i2c/i2c-stub.c
+++ b/drivers/i2c/i2c-stub.c
@@ -308,7 +308,7 @@ static const struct i2c_algorithm smbus_algorithm = {
 
 static struct i2c_adapter stub_adapter = {
 	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_HWMON | I2C_CLASS_SPD,
+	.class		= I2C_CLASS_HWMON,
 	.algo		= &smbus_algorithm,
 	.name		= "SMBus stub driver",
 };


