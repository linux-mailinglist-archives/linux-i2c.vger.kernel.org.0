Return-Path: <linux-i2c+bounces-2205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2A872DFF
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 05:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 947B328D2AA
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 04:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599F415AC4;
	Wed,  6 Mar 2024 04:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqHaGmDu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70F314AA0;
	Wed,  6 Mar 2024 04:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709698747; cv=none; b=eW6INsxp437t+K6aZg62M+YMqbUEaEEGAkYqI4lMQx+Q5luF123VaV4w/AGoYhrIsS5rOp7AqwnHnZO7CLH9t5n69PHVtsYpEWMuFhIgh3++zrEjS3Vx1i0z20WS60C6p37IpNhU8Q3me41AoX+spjK9zrtXLrmQV/hoKCtURKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709698747; c=relaxed/simple;
	bh=5Pw+SMb5Z+EesGkzLq0H/tkh40Zbyuozv0zo0dZBAPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cvvIoBF2Z1yDDmFXNumWX7kkK717pJ1JXfL5hDxiPh2MOcWhPSxuvkUkd7qA6V4RDk7xWQJKaQW2axwEASQjeognF09f8W6ucFnSD4DLMAqmTWEtBt/gxnqPfkhFFayQGctXQN+/+RIxrj/dn8WKZ7LuB6B02j6nNyauD+W1oQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqHaGmDu; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c1adc90830so3912797b6e.0;
        Tue, 05 Mar 2024 20:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709698745; x=1710303545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ia07b+oiIejGAElwxh61sogSjF1VjjfoCLW1rGgq9Fs=;
        b=IqHaGmDu2BjHkRnRmwsaAGHHotSEd1UHT2hv6HBXhMJPmzJgEau+jX7Vfk4ozdGTBU
         32guR5sw4FAEWcCRRiOPX2BePyRmq5hfP863TL80dkOMbOIy4woF3ugdIFeBsG4F28BZ
         eDaJAYhC1Q1rMhTL6QmH3EjUvygq4h39l6IeFH2/z+U6LQ7lBDy6ak6F1QyTp4Szd1U1
         iaBO0hUvcI0bQro2j3Osg5d3aniVVgdirjLZMKReGGnKnzsTC/0wmjeYQRN7M5H1vwpv
         1izPEb8bmE6L9P9JdygZS2nC6V2z7gduwq/jM1Cn/AdwLS0in7cabz5t4EspYacquflT
         pMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709698745; x=1710303545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ia07b+oiIejGAElwxh61sogSjF1VjjfoCLW1rGgq9Fs=;
        b=e3e5+Mni5syHe05LnSDKh6LQay/Igkm8GbVWS+suaPXo7phG5+CfPMEXxhp38gD/Gx
         uNrU1Cg2w4xKR4jlpUjRdmP+aFgjylw7v+oYebHUjO47LLq9FHK+yJo1suFbXi0RyxuI
         QJiMLUvBhMMGJ9YRSNyN8ZtHbYeSd1e2aS6eQBGDkNXFW+mzmBsgJVT08G0bkW4V/SqD
         G36U9SE90CNPX2YziV/JcKIwcUYCq7C07o+piZF1R7OSX2tSOzKFHJVLVGIV7JB9VRey
         NBMwUO8JqrkZ9kY2cPhRzFxGZcoyx4Y29bSEYCALhGnG18k5un9oMBIRLFkQ33jgZuaL
         P4zg==
X-Forwarded-Encrypted: i=1; AJvYcCVnSQsCNoBeXq1XMG3sOtI/bH2VjJ3Zs/XcKr7GtHur5GkKvfr11+QZPlBFhXlhIZMlO2oXN/VYXqIinGy5Sqr7dyHfW/pOI709uPg2
X-Gm-Message-State: AOJu0YxjSjHNTHfxu5Z+ShXzg1D7fqR3lxPlcfkkPDeA4/hZMxDw15Ul
	NaZnr96V8oUnqg5pLW/FCVZEIMrKveDP8wbxRo8OK5GdjPXvlWvP
X-Google-Smtp-Source: AGHT+IH7jgcWdrs/fUoR5LkWzNt6BEfbM04CMF/9F3+JaeB9BTs5TEvFdm+m1RiCyOQ/FRCUSFOaqg==
X-Received: by 2002:aca:1303:0:b0:3c1:f44d:b876 with SMTP id e3-20020aca1303000000b003c1f44db876mr3663043oii.44.1709698744726;
        Tue, 05 Mar 2024 20:19:04 -0800 (PST)
Received: from localhost.localdomain (125-229-101-177.hinet-ip.hinet.net. [125.229.101.177])
        by smtp.gmail.com with ESMTPSA id q12-20020a63504c000000b005df58c83e89sm10014129pgl.84.2024.03.05.20.19.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 05 Mar 2024 20:19:04 -0800 (PST)
From: "Hsin-Yu.Chen" <harry021633@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Hsin-Yu.Chen" <harry021633@gmail.com>
Subject: [PATCH] i2c: remove redundant condition
Date: Wed,  6 Mar 2024 12:19:00 +0800
Message-Id: <20240306041900.22885-1-harry021633@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C_M_RD is defined as 1 and `flag & I2C_M_RD` is one or zero
no need for an additional condition to obtain the value

Signed-off-by: Hsin-Yu.Chen <harry021633@gmail.com>
---
 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 652ecb7abeda..363dde9ef94f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -931,7 +931,7 @@ static inline int i2c_adapter_id(struct i2c_adapter *adap)
 
 static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
 {
-	return (msg->addr << 1) | (msg->flags & I2C_M_RD ? 1 : 0);
+	return (msg->addr << 1) | (msg->flags & I2C_M_RD);
 }
 
 u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
-- 
2.38.1


