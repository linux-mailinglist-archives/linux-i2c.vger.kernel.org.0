Return-Path: <linux-i2c+bounces-285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCA27F05C2
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 12:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4599CB209A0
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Nov 2023 11:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEBAE56D;
	Sun, 19 Nov 2023 11:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6ESpNBD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA73D54;
	Sun, 19 Nov 2023 03:28:40 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54394328f65so4735711a12.3;
        Sun, 19 Nov 2023 03:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700393318; x=1700998118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
        b=T6ESpNBD+BilFiIBbXODWPBXtiLXQMhZzVuKaBd4gsf7x9fV0hvxf+mG8X5+pv6C+l
         lECeXi/AY/DGrslulZtqbJN6S5AX5sOBdZzFNdFDwykwav8AMNkeyDhOCNmg2+tWdv7b
         0tOXpbT/HVBzFuRveR5+UjN6seaFsJ76Z4MSeiZD4ApDKUwrlNU9yzR0MxYt8hkEAeLP
         6hjqIi3/2mebqxFVxdXGdHORfMxW2ax16vX+jRi4a2IUtnO78tDt2mIXksZxCLmqBfYA
         iyZn1KKpiIykU786No+AVEn3tosgoXJMJlX/nmsXhHBTOOaCss+BHk3HCGb7/8Zps9WQ
         bDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700393318; x=1700998118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj6lXffwhPaiA+tttg2gWfCsavHU7fIAFEm3bWLvYqY=;
        b=rodd8xXFJvy/fZgkLpyk/9DjUGc6XMwWGT33JrFm938KBCqX0wU2+lV/TVe64ueCRw
         MkhigGWTU247fKMr1Hzl3atpybmVMg9wmyZKYHpTo9zTM//sM5ScSW9Ui6KZ4eD0Qedb
         VGz+5msz4sMoYaN1Z88uhaD5KBLgtxsXOZgU/0WrV1dFSfpfo8BZOxreNweI3zYjf4mE
         +A94y3TEUkapFl0f+YCBQ6DEqbVEFBydPV8RY1+CJlhHd7m3hSkDIAt0Z/aqltNkJHLI
         P+jTDgzt0l/HuRbmwuV6ziTsvFYwEXbhKRAGD1/rP3Mn1QUqkeL/LC21FQ1vbIFeKTd7
         hW1Q==
X-Gm-Message-State: AOJu0YyLUB8rvm4EgaH6M2fIkCNz4TjmqH9+yzAOVn2uFjzveCXS/KKh
	X+4aMEXuz1nrauTxX1fFH/E=
X-Google-Smtp-Source: AGHT+IFZggot9AqS3X6Qt+Jt5dcuKalJ7+U5FRGLkcM87LKer+UjD3CjY5GltxnAdA4qRjb5SMpr7Q==
X-Received: by 2002:a17:906:10cc:b0:9fc:1236:beff with SMTP id v12-20020a17090610cc00b009fc1236beffmr1696210ejv.65.1700393318307;
        Sun, 19 Nov 2023 03:28:38 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:28:37 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/20] drivers/video/fbdev/cyber2000fb.c: remove I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:15 +0100
Message-ID: <20231119112826.5115-11-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/video/fbdev/cyber2000fb.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 52105dc1a..79775deda 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1234,7 +1234,6 @@ static int cyber2000fb_setup_ddc_bus(struct cfb_info *cfb)
 	strscpy(cfb->ddc_adapter.name, cfb->fb.fix.id,
 		sizeof(cfb->ddc_adapter.name));
 	cfb->ddc_adapter.owner		= THIS_MODULE;
-	cfb->ddc_adapter.class		= I2C_CLASS_DDC;
 	cfb->ddc_adapter.algo_data	= &cfb->ddc_algo;
 	cfb->ddc_adapter.dev.parent	= cfb->fb.device;
 	cfb->ddc_algo.setsda		= cyber2000fb_ddc_setsda;


