Return-Path: <linux-i2c+bounces-10654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D932A9EDDC
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 12:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17F103ABBAA
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Apr 2025 10:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F0D264A72;
	Mon, 28 Apr 2025 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOCw92Ph"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE8C26388C;
	Mon, 28 Apr 2025 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835933; cv=none; b=fPUO4MTluXMgukpODZCtJ03p322Oj2kVvqq1P3B7Q2r+tZc7HLXj0r8z5pSINXWxFi+uiPMArbPNFR2pbMvc94oBqSisODFBS0eTUkaOy408J2B6e2AFdRcJdud1/yBZuVs3/6x39C36OF7siSlOtVbHMPtZ4gPonyJab9mphhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835933; c=relaxed/simple;
	bh=0kcbAxwd8E1vqD0enMwHz5quvSlqwAaIoFmQEO7bxhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFZkqEsWam0DF70Wle2kP1FPtJkRKiAsnNU9k80Zoz3j0dVh5o/LwagPi5iYF15MkjjJlBYBtqIb4DunVwJupZpr8c5C9PHlt78xVzAmGOJttzB8LfmsCCOyvZCa1mKQI9sQMwjFvn0etwC9RTr4L1nsaiSTTsH2B5dvEnmfykM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jOCw92Ph; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso32300525e9.1;
        Mon, 28 Apr 2025 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745835930; x=1746440730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzQhB6yv6bflyojSC8ndRi8NdMdA/83LHNB2aBviQgU=;
        b=jOCw92PhRasXvZkWW77tbcQWJh6UbGO5k8HqqDxvEEN0r90WNv5DmPjhKrIVFFdqm2
         dE2MsxFH4LUuwO+tH2m26ij+GSm63gCmrw/rOowiyociGHu84oMNlE0kkYP5UvPpqJUq
         KupEuwSPbXKjS4lGuOeIssO7/MoUYK938Qj3B2r6TULbRP+lvhdwD+YpG4/jBsiK6bfH
         bEH6KhPQL/E3phZix/8mmeBKn51303ngDZeQwFPkMH0wlkDEfSX1IPKcLOcbOM7FEETe
         taIFosXOZlDp8rIRZC1nSRCx86OKopJR8eAihysaxpoRWKNDVGk8thAyfXbwSJOTRmwi
         YfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835930; x=1746440730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzQhB6yv6bflyojSC8ndRi8NdMdA/83LHNB2aBviQgU=;
        b=SFrGfE9BXweYcMZoP6OLWJh4wSLVvMSLA4DqXXAefAdkBTynu8lNdRafVztGNTfmcV
         Rqr0iJJStLp4ClYV54sx4cI4AluI0+dl2m2JAyeJQSK1R0jGTPNc+qr5oN2MCvh8KFFQ
         uC7/6dGdOKPmKpGvc2QkrstArziBkTvYBne4yLOYXnaaJk+xB8Y0T8Eo0tDlhEq/sAH2
         0KgiMlCnYu1sdbEGTfZn8RUsTX0O/1zGPO8rnkfPox6uM3tqRDHxkGx2+2S2QW8PWFhx
         I3dTOmncbjHlz7jigW2fD6QQFHoe921lC4M8n+IVVjIkjurdNN7GXrGzyJYzTBx9VQLN
         EDzw==
X-Forwarded-Encrypted: i=1; AJvYcCU1WmmoeQMy5EbznNB7YEtpbU5iAMhJuxxoBBIw3AZ/Fel57SNereudTcwL0d9LjRAHGEBpiyZKyQn3NIs=@vger.kernel.org, AJvYcCVTF+lAI096CXOKvQYdU4vgzEYHsC3Y+c/QKDpJ8Si3rXildTkDpPf7ypuZJaceemO/n5iVXFAXZGfeJ2SM@vger.kernel.org, AJvYcCWP7JqFC+FaA8NrNT9NpaB53bzgWFKMkiSqG+w0/HELiUcr96O+TkVALpXVNn4Vpbxx40veANcLHnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPvkryRGvlukBmjBwcF48Ma+6oTdITRgkYIg+UMRChkolmyjgB
	0Mh7SumRn6oppKrBiMWsbFXWxS58Hm2i4/zmKyRxdXbZ8wvWZw2dbEns7g==
X-Gm-Gg: ASbGnctcy+0wwp6wPoEM6aTerulDNREUZjEIFx7wA7+zjbTWJYqDLLFf7GGKI1Lru7U
	60Dle/I6N39hLTixVQpzJOKMck4mNk4LXia3PyWbDSUmOewqNSR8nnPZqqytXGDIFFCyon9l+Is
	aDbX+2GBtSSPRdl+w929X0cwM6FHEpnuBJ/vSPg3BHChZ/VCREgi/Q0LyB1jhJYjqbx2e18Ic6d
	ZAzpOhw4ycehcWsxCBeqD/hgG9ZY97k/+c4+cmYUirn5OPJh/YzVEGb9bBzHfxfwDCDTdUDm5rF
	+vx87SlbstW3E8Vta17iU5ueBvxj9OaO3mx5WJ83u/ykprqcFsZ9
X-Google-Smtp-Source: AGHT+IFdb8kKclIXB9d1ll1/iIMloEUIy56Z99b90c4Kas/qik58m139GAAOK9qNBmOST//eRVq8AA==
X-Received: by 2002:a05:600c:1e04:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-440ab846cecmr64922305e9.22.1745835930203;
        Mon, 28 Apr 2025 03:25:30 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm118825295e9.21.2025.04.28.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:25:29 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 4/9] i2c: atr: do not create mapping in detach_addr()
Date: Mon, 28 Apr 2025 13:25:09 +0300
Message-ID: <20250428102516.933571-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428102516.933571-1-demonsingur@gmail.com>
References: <20250428102516.933571-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is useless to create a new mapping just to detach it immediately.

Use the newly added i2c_atr_find_mapping_by_addr() function to avoid it,
and exit without logging an error if not found.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/i2c/i2c-atr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 184c57c31e60..42f433846f63 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -586,10 +586,8 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
 	mutex_lock(&chan->alias_pairs_lock);
 
-	c2a = i2c_atr_get_mapping_by_addr(chan, addr);
+	c2a = i2c_atr_find_mapping_by_addr(chan, addr);
 	if (!c2a) {
-		 /* This should never happen */
-		dev_warn(atr->dev, "Unable to find address mapping\n");
 		mutex_unlock(&chan->alias_pairs_lock);
 		return;
 	}
-- 
2.49.0


