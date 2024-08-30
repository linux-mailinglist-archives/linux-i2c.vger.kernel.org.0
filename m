Return-Path: <linux-i2c+bounces-5943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341049655F2
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 05:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66F351C22ED6
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 03:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3094314F9CD;
	Fri, 30 Aug 2024 03:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khQ8vmoI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978E814EC61;
	Fri, 30 Aug 2024 03:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724989750; cv=none; b=DfLYJuWBmrdeqg4Zrj6O3gIBytmAO06saEGZlyrJU1vmxcZ86qqly7Djgkb//chR4yd+YnIT+cdgiehpkHwL44uewVPu2u07W+WnRaCuh44zCYKKN7tZzz3uSpuqBMrNfe/HNXioxuPVJtCVjWCX5HiD1NflJWRrPVSj7J/54G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724989750; c=relaxed/simple;
	bh=Y8tsQW95Kg/xpWjQGyQgQXGOZf2c0b712HbMcZ6a4Ok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=BaMfH7KQcSALCtl0r0UIdzMHPN579zdRUJfyM3mmc93u/cXaE2kb18DquUISMiaWJDQMhUBMm44HiO/4bvtkil7j2JG0mX7yM234FdyKOazd4bX7WdJtvvkjxGx2kd5NZWQzBgws7ZhNhNqyjv7Qa1DBHNh59hXspZvztMlW1cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khQ8vmoI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2020ac89cabso14997345ad.1;
        Thu, 29 Aug 2024 20:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724989748; x=1725594548; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XqFq8EWoNEfLfpi6AmZzlGu/jzM8vHDtRNwp/7NnlVU=;
        b=khQ8vmoIq3jhb0lx1jc0446uD8Pl8eRcie7adSXNMPgsXgcsTEeVPoPKlZHBNWSDN8
         sWWSVoh4H4RiI039tsBpN3yAtsil9dXWjbGkC4xx3TXnj7HMJMkfVJjnugOOMShI6Vmg
         oY7PKia2U7pUXvmM5bQcDTt5d9Rq8/HvbmZ9laowdXcRcQkKu+5WgIwdHqrz5JVxBtUu
         iSnM/vKTAjWizchcaeuac08YHlNi6IU0utP/oPURUfvzP8CAsIJCJ7LwFljNPzkutQfv
         eiXXuCRH/CGy7/WFUiUd0HWrpXUBcN1rrX/OpXbYbMJ5QCb7prkFWAt+kklFCuQrao5g
         FIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724989748; x=1725594548;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqFq8EWoNEfLfpi6AmZzlGu/jzM8vHDtRNwp/7NnlVU=;
        b=maQ1w5mWE2Eluqjs4AFw/0tzsF74U3EQaGB9kmy35PgeBf4keHdTtCGOp5GSh216hs
         X7XIy4LLP71ZkCrc4xelygM+ZWjuCIvF8F7HGI/9dhQ5gRS0c2Or+j0rLaKmijpNUbXF
         N+uKIlxICZVXMHMjGVBQ2g0KlKCF8k5c2PTwboAsbJHtK984VgaLPIwoygPufdzOfPh8
         hwIe5hKSZgcvy5w5y6uuQD/bMwfhUPzBTK3ce5sybaxSX8HELk+y24U+hORFEvlIDsTn
         nCRzd8jZhbZwpUFMvoQ5Kh/6EXeao7pB4fOvvJWj+VTMLzmjIgtglmm3OtlZKQffA/Mk
         JD7g==
X-Forwarded-Encrypted: i=1; AJvYcCXG6dQZgpAty3hO9UMYSFKu1C3N7qssmsBSAXnfIJfH3J8zBrLuBEQEwlD0z48EHIk08PnekdeqKZmqVvaV@vger.kernel.org, AJvYcCXXRPhR+hff/Z28ImPZYcs4bUB2vn/Q6O8C8NGcBWHxyTynUI2p+EojwnCRm1IFUmurPI7hojo7oeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNPl4K8giNNoN0xbYXVJDLb/280EKqVaaviwkDaJPhyKNyTtj
	fGAysXMgG6QRv72rHlsGiDZoxsGZzy8flgfP+8ulz93pRQlhQ4c=
X-Google-Smtp-Source: AGHT+IHizkeEALsJJzSovFZ2tihJcLdkSMPu2gI6fgOxc/IwZpNGYjr2kbuSimtekmZnUMXCtYDQ6g==
X-Received: by 2002:a17:902:da8c:b0:1fb:8cab:ccc9 with SMTP id d9443c01a7336-2050c423fabmr63064475ad.45.1724989747578;
        Thu, 29 Aug 2024 20:49:07 -0700 (PDT)
Received: from localhost (2001-b400-e338-dab5-746d-1a82-f21e-bb0a.emome-ip6.hinet.net. [2001:b400:e338:dab5:746d:1a82:f21e:bb0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515545329sm18341245ad.215.2024.08.29.20.49.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 20:49:07 -0700 (PDT)
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
Subject: [PATCH v2 5/7] i2c: npcm: Modify the client address assignment
Date: Fri, 30 Aug 2024 11:46:38 +0800
Message-Id: <20240830034640.7049-6-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
References: <20240830034640.7049-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Store the client address earlier since it's used in the i2c_recover_bus
logic flow.

Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 68f3d47323ab..67d156ed29b9 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2155,6 +2155,7 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 	} while (time_is_after_jiffies(time_left) && bus_busy);
 
+	bus->dest_addr = slave_addr << 1;
 	if (bus_busy || bus->ber_state) {
 		iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
 		npcm_i2c_reset(bus);
@@ -2163,7 +2164,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	npcm_i2c_init_params(bus);
-	bus->dest_addr = slave_addr;
 	bus->msgs = msgs;
 	bus->msgs_num = num;
 	bus->cmd_err = 0;
-- 
2.34.1


