Return-Path: <linux-i2c+bounces-9651-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D93A49D18
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FF44175C0C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9C527424E;
	Fri, 28 Feb 2025 15:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IH1lo25b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD135271269;
	Fri, 28 Feb 2025 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755866; cv=none; b=oRhvUVAJJXuIMowUiAOT2wdZWxNrhuZoN3jmhoVIQAHXkJRxxIz8SjTJHceS4MTNRDIw9Q/oQ0C0q94Mf0c4FsoHgSj9moYHAuGdOQKDV5LQFf0WSaR5vrNOrNKHVSNaqz5LzFqKlpbNB6/lGQBvm1t0+5HcE7fk4L0zxj4TAqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755866; c=relaxed/simple;
	bh=xaw+9NRhj93i8+l2AzjUn7HMcyjC5D4eiOuWNB1OLiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ih96G/av1DS1aFdvbJsLe6cnwmyJ6HmVDAyLel5xG+yDqAWNxd2dnr+M7BOL5ETz1iReuXtB+uUJFdqo+2pF/2woZGkp34o3SXA9WISKKqt/qzYgFLYJjXl58AghHeAXAFaudD3A4jVC1gQDreIZEtU4gwwi5h70kwbzHrk48So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IH1lo25b; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-439a4dec9d5so24112035e9.0;
        Fri, 28 Feb 2025 07:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755863; x=1741360663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6M+HRPCEe7YtMaRAGBz1VKfF9YRyuQoo35/cd6V73U=;
        b=IH1lo25bk/LwGKhNSVHsgMJtbcpXfW9PUVYNxa60V2EiuhD8f+xI4AQRQVNOaKdUeF
         YXdpwlmM8mVcW04F9cVRk7CfuIE/Qec9iLtbr3qWQejnWdTcZr+IrtJLDa7abhtiWjYx
         hHy2mpvn149EYTDxD46Ll1y6+G8RV113V6BXX6ImjGUVoumgVG5OgB3eKXwYu74ySj9j
         BbN7DLZ9nuPCJiZwP24f9IBjoIBV6LKDqZj/AJcWjui/3gXxmBOndclTu2ZqMmzMYYIo
         5Sybl/hz21f+r9AHBVU5LwIuqWlylzhbxpXNo+4shXdUABGqOgAkEQHmcapQAyVnwiEA
         kWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755863; x=1741360663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6M+HRPCEe7YtMaRAGBz1VKfF9YRyuQoo35/cd6V73U=;
        b=TjOc59f67NVFXwcvqc2POJfyZfILo3y/IwIvFpHHeeWWeNgdBvoGsDHkDS0np3Rzqi
         5auBvIfPFKfENJY6Xp0cGk+H+s+7kfFwWhURvVuVWENAt/bgoduyyXuNADGr8eIDcD2E
         WGeFU5/YSZZE3Dig8yLgziw0+MLdl6WlemnD0EQRyA9uEoaDHLvoam0wxNMpwd4aohO0
         JJwMD3A4wKVLg40+Q4CaXOGV8WSHBV6v3P15aRuGJr/lgHE2q1RoQiBkZ9gdYc2RLq46
         bUiYLvutAuPgmey+ofFl0i8sjCwAZf4oopFZLkNMQ881OEnoEtds4DLT51kQX6ogaf3M
         +dzA==
X-Forwarded-Encrypted: i=1; AJvYcCUNfDGbVY67xSHt99omAfbJlY7AxQE3TSpjSYDQtfbnihw6LB8E3KcHSyhAyslCPfRNSgGL9FX286ThcGTn@vger.kernel.org, AJvYcCVVgD1MRRj+FbNspPRvxNbeYbu5j08opVBe/MioXjp0RCkiWAjspwua4b293y0G4Ox9HvFkKDzHMyDMcPs=@vger.kernel.org, AJvYcCXdiWmgPWzOihQfsKzSXOj5B3KMwC8aBqEZN5K7M0ITlE4R39k3sI9I2JArghTtOv15zO9tPbOkxv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBqYFkhwPS5S4XBy6mF3aVO1+BSYNZlSzLRzcDHWpeh70nQ43A
	OIzMjfpvtGtjZniKov7l3X6gOBtNO9uXlvOUOILU2dRwR27diYRm
X-Gm-Gg: ASbGncuby/LY9LNrhvqu0mRN/sERMeJ1jbmXlSErkfCQQgs4si6qwId37HUBRBzIHsO
	rgG1qDQzYQqIcRgcdZxmtFp+sauoATcExoG6C2jaYR2ZMNJuwR4SB171v/J17XffWt027Kb30kn
	dRkuv5Lt86xW9YEd4DpYt77LrJrsgIVk1vlrBiFXYTfFJ2XLC7zAcqqJYbffTPh4ZX4Nc0RDoCS
	kcpU/d0oBYhb4G9OpbvCDMi+Hg0Mhmr0npvVcRCEKqp7pHtc88gs1WnNDcZIVeisNnjLEpR0RSc
	XvVL3K0ugM7wtBo+6UiUizR9HYKdqMPnlUpsCEU=
X-Google-Smtp-Source: AGHT+IGjX1N9FuSMpvL6z7k6QiNoEMimLTVA9WqjWwuygtEnQasl6sngyDK/8LhugrBpn/WJmEWu7g==
X-Received: by 2002:a05:600c:524f:b0:439:9106:c09 with SMTP id 5b1f17b1804b1-43ba675bafcmr30114585e9.26.1740755862623;
        Fri, 28 Feb 2025 07:17:42 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm63096825e9.0.2025.02.28.07.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:17:42 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 4/9] i2c: atr: do not create mapping in detach_addr()
Date: Fri, 28 Feb 2025 17:17:21 +0200
Message-ID: <20250228151730.1874916-5-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228151730.1874916-1-demonsingur@gmail.com>
References: <20250228151730.1874916-1-demonsingur@gmail.com>
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
index fc92ed930877..148a7bb0508e 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -582,10 +582,8 @@ static void i2c_atr_detach_addr(struct i2c_adapter *adapter,
 
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
2.48.1


