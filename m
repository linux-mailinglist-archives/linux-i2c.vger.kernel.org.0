Return-Path: <linux-i2c+bounces-441-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 151747F711C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 11:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 461121C20E72
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Nov 2023 10:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA37419BA3;
	Fri, 24 Nov 2023 10:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aj/dy6bR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CB010F6;
	Fri, 24 Nov 2023 02:16:30 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a0029289b1bso242900866b.1;
        Fri, 24 Nov 2023 02:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700820989; x=1701425789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+AlUo2GslrTb8lu/H9lXRQ7xNPByNIgHu5m89J0d9M=;
        b=aj/dy6bRKtbXQ0WZd56u9wpDyAwl1F3/rQnqbMB+dQ3V16lgrS503H5tGYlMr3ZWzM
         yTAG+8CLdXlDIzJEbVWrepXnx6U5fYKLgf5HBq79QsQBho2prbosKTuGkapZ6Kk0WvLp
         Wp8lyDjxSkWKm2SyxCQS4K6SXYRYlb/LoG2KqhDfu70Fy9ob4ET2UsckFGq8cgMfuPpR
         jh8c+1WAxGuXRcGQCYHUPd0gJ5HIgnFl3j6bTCk5aNGTkXdnh02pEfhObXuRD/izN664
         3vjOUoI/CSxRKKzwlvd66l33v3eHSo4dJngIX4OMzqqj81waD09eW8OeY+9UVO8OV4h6
         bcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700820989; x=1701425789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+AlUo2GslrTb8lu/H9lXRQ7xNPByNIgHu5m89J0d9M=;
        b=m9mKtT9AVd09gSXnZeuk5UNo79VYk03gtJBNuwL4rVsgsrdnZY7CszInIjNHst0Oop
         ZU25KxTvqf3Sk7ePuXor6ax25Dhn/RLfT237SbkHYHXNZNER/YwrVL81CeR1DChm25A2
         ueZk1roS0v2r55RF9JPXrX8ZQ2+XJZIeZHfTFiBxQKxzrBiWI3s805e3/iqy8Xj28qMM
         hUGrWiem0nHMnhF2a7G7GEhikQ6Xk1Y1HtBzs6m21DCubYN1ymsEdbxW03sNiy5RhZKM
         wEW2DiSe2ES9d+0DwkbOuceR9zG12gXoE9BUc4XTHMoIaGcYZCXLgHejE9nvq6G/vSaF
         VukA==
X-Gm-Message-State: AOJu0Yz3EV2QGL/bLLdLVq+bK1Sx+m9HJ06GYtAx451iVBmkQ6Lo4eAM
	tcgM/pP7MaWf6s3aMXjPF4E=
X-Google-Smtp-Source: AGHT+IGpq1UXF35W8G0+/SS3Ins7rMAYc4wOOqsIKJk9KItjUYj+F5QGLGP6DW54lAVCF0TI+BRvFw==
X-Received: by 2002:a17:906:b796:b0:9fe:57b3:bc08 with SMTP id dt22-20020a170906b79600b009fe57b3bc08mr1480276ejb.41.1700820988942;
        Fri, 24 Nov 2023 02:16:28 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-72cf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:72cf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id oq12-20020a170906cc8c00b009fbf15cee7fsm1887801ejb.69.2023.11.24.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 02:16:28 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] i2c: stub: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Fri, 24 Nov 2023 11:16:14 +0100
Message-ID: <20231124101619.6470-6-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124101619.6470-1-hkallweit1@gmail.com>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
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


