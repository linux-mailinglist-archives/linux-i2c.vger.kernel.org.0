Return-Path: <linux-i2c+bounces-11075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A4ABE3EB
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 21:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED20A7A561A
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 19:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE00280CFB;
	Tue, 20 May 2025 19:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8gDBVty"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C52A27815B
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 19:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770253; cv=none; b=UNjMAGVwBJuFAFdAHVhO9cV5rCZj9JfTyC8B5shItRld0oWMldG5c4glie0/sfLU8+nWa3DPFjPJCIGB62aFasj9VUwQo/vjJpxw379Lnj3A+qKstZnd5SYfCZzbThqAlrPR7FkZRZ56T9HOmZUuz+nJLtogLMuJYFIGsLKCj9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770253; c=relaxed/simple;
	bh=lXkzN3vTUtCsuMNaU7AQ+PKOsH9wKasVCRD3PK1/E2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P20DyJp244Rg+z2pWHmNaf6DQgL83m10N0yhRnSKvH60nyCBZMY14OhRYrzVGsS62uF4p6wiVCf881ZrQUEk4Pbm3EC1lSixVw5Xzn4H7sxAVvTNjF7POlY5rLktfoGRadEvib0A/7f4IL7ZknBXD5UwabgLMwjUwWgbnQTAcZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8gDBVty; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-601f278369bso4784260a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 12:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770250; x=1748375050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RynZ2VZgsWEHv1jM7imrJocPwmlfDRE09WSP5dxmvgA=;
        b=k8gDBVtyB6/fMW+Uc1zfZdk1IqfIUBbtj/hrwHPcAR3baa1bSyDyTJEmYHe15X68gr
         FaYJmvfLda+AEqeDiDh4H0S+zW9ISY9QNXFWjH0RTygWOl4h0ChL7B5wISnJBZ3ZxAwR
         74H/sRw9RFT5ErlUkMVqdp5zii5cRZ7LRYZ1iixDnx6XupsSFARPo5YjlDQECvViSWo1
         oXcJLnEYCIe+iL9KiwjluCIc4LiP/owpg8wnJmsmPDPINUOumkstm25uVOjAHi6g8RRl
         I/5pMdMIEuOjy4rdsmSW2vDHY4/Czgau+x6e1Ix44UdR6ZorfJL2ytJGufKVIHK61ERo
         S7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770250; x=1748375050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RynZ2VZgsWEHv1jM7imrJocPwmlfDRE09WSP5dxmvgA=;
        b=KrODe6hQIapV4J8IDqScH5/6/TD3jlJWd11LUMYsPMy7TI6/boxRmCslWcjM031KaD
         AX+aRjRq5zpjRzMkbDlHuOezeRmpkYVdRm5zf3tp9Wo0mHHcyuqP8bUzxKPpkVvgBbGK
         LZtcgK0soiuAPIb4jQXVWe/hGNwjD3XvFfbViFQXqLSSRmpTD6O4McKLgbUUdIZvjNTQ
         qwfrV3GCg2ROgcddQRgMuQxsUORsJx9wUXg8YYDL4F2GVN1Fkj21ytcziak1SO0+qPyS
         Aaau65EDV2H9DDI+d1s3L9GdsSeraJIHMFtw0ekKOlAwmcNjH5T5U3OxHMvkDsHxSGR6
         i6eg==
X-Gm-Message-State: AOJu0Yw4iWRyw7tXEB8EBiSOrZx8glxnevA4dbiTloMmdPwLpMIa1FXB
	f5gMg5Z2emW1/AEKQlfsabB5/PeloNmzmj1hXnUD4QnxsW1lWrNg46TzYglH6B3eFyY=
X-Gm-Gg: ASbGncs/1Ii9Qe5wEiihCi68YK9h1y2uUYVDBMX4Ti4fEmuQYr13kHiLxDL+rCyD72u
	4/ZwaQ6ZWVdOdQ/KXemtxvUOghBTm0ghLfI1PvdwECV1nu2nXfm2ZSAu+eCwOwCzoNLuK+vgFv4
	WZjQLujY+SGb9L9rKPf/nCnlWQkGufSS5Ge3wZkjUNHcSZoPyzySLBaRMPlau7JnJQuTyGBb0uf
	xLST1EmwucTxfRzSBE7xqD9Yx6H+AFIWkVGvNRKSS13KEqtt6gCuwdN9EvTYUEtL4Ur4s9sJCnk
	w2SJtiglFOBpWVan8W5YBqOldO60fMmJZHVpjsDy7V9OfKHw12C+WQaWPYmsHZmZ4PjzVvdNsfz
	DzvjwEg==
X-Google-Smtp-Source: AGHT+IFXBkjMXPqq2YMsGnleGuZgnvR22tXLvwdieF2jQVX6poShdbRUmJuVWwp8pn4PP/PjxJ5Tog==
X-Received: by 2002:a05:6402:3546:b0:601:a35e:6dd1 with SMTP id 4fb4d7f45d1cf-601a35e7008mr11375498a12.21.1747770249609;
        Tue, 20 May 2025 12:44:09 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-11.cgn.sunrise.net. [194.230.145.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac33a98sm7736122a12.49.2025.05.20.12.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:44:09 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 01/10] i2c: tiny-usb: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 20 May 2025 21:43:51 +0200
Message-ID: <20250520194400.341079-2-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520194400.341079-1-e.zanda1@gmail.com>
References: <20250520194400.341079-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
---
 drivers/i2c/busses/i2c-tiny-usb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 0f2ed181b266..68d1441f5f3d 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -253,9 +253,8 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
 		 dev->usb_dev->bus->busnum, dev->usb_dev->devnum);
 
 	if (usb_write(&dev->adapter, CMD_SET_DELAY, delay, 0, NULL, 0) != 0) {
-		dev_err(&dev->adapter.dev,
-			"failure setting delay to %dus\n", delay);
-		retval = -EIO;
+		retval = dev_err_probe(&dev->adapter.dev, -EIO,
+				       "failure setting delay to %dus\n", delay);
 		goto error;
 	}
 
-- 
2.43.0


