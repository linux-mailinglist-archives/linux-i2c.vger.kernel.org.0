Return-Path: <linux-i2c+bounces-10332-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B341A88793
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 17:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F53116B3C7
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 15:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB55D2798E6;
	Mon, 14 Apr 2025 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEG0SrJo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B22797B4;
	Mon, 14 Apr 2025 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744645374; cv=none; b=pilWq+i9SUwjJk+QSJfvLt3OXEUh6NP3Z2dOl5AakdrNP0RFplvICCrXZNQc8MFln3D9qXED61r9dd4Lvm6f5jRIWELqtwnr0+rOgC4lXQLtRqU5E9jBK33VWWdQcS9LCxZUUyMAiMaTxe0g67b96E9ZyULBjFRQireHHpBAMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744645374; c=relaxed/simple;
	bh=ArgTWo4x2CFscJFkuLJcGxeqCgmy5qAUc5MwffAw1Cg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdW2Rx69t8KcxHIuPTFlolXS+xal20iHWQ1vPl6AVWpPDnjd/ltmSC5uKQ3oLcKabTjVQyib4IH7SB4hHFLE3fSkxLaXByahD4wdsUTTCjdJU8iY0G9nHuU+svsbP5pH7lP6yeaTJgBDzTtLcj2WmyvcvZ1i+xRxIMN01efB0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEG0SrJo; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227d6b530d8so43280925ad.3;
        Mon, 14 Apr 2025 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744645372; x=1745250172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XJJwHD/DSdygcA+azSZln/silKp7gLNndAvbGA0vLs=;
        b=UEG0SrJowdiZxlP3RTAUxwyYu6/eKp2mEN3IsmhrqDJ+5ieSAPd7FJTttYFqXagoM/
         E1mXapyJjj7PZPxbYE5vXQZ2Z95rGacQ5OEA+SI+smGFIre8v98FA+++VoaeA097XdKC
         o1cP8IHbTH8imvtufbDjpy3Hcwrs5u/Xuw3AERmY2YYaWuKR+HIZ3JwqrHbWTBCijBg8
         DaYUMCE7RWbPTbRz3y8kc0X25XiqIxZ780ZDBWLWzMjhaxfddKO2nHawj5WRktVWRU8f
         98mwSNCRmEx2jrocP63HAnMqNRm3cB7ZwXWhcps2nLagXzdBMW5S+iaWAWw4JTd9JzdB
         vD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645372; x=1745250172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XJJwHD/DSdygcA+azSZln/silKp7gLNndAvbGA0vLs=;
        b=XDNu/bMW8EW6TWxk6mTChbEd3gsTwZ+6GT3RVxn8zisUarXgoaOWB91XokF5GZa5WF
         VPs80X4O70UuKb+ZHQm0aUsIMhkqcjBF0rxs2iSnQFvaLpTVOYo9iaaHittvARgZ+U8X
         tHZjKNJYyWBg7nVM+NP63AQsQnzgrRpg/Xw3JJIUWFPsyC3qif/LGWtA3UptOE00egaD
         9f2i9Bmp9DvTmNoeH2zHnsnLq43BJyO/Oo3zLh4Rm7TZ1tbNBym9uZOlGFA8MPlBWHM/
         bpzwqbE7ck+zmqyoY8jnF+HPDhHQZUn4V9m88+ugrBGvxQfTP+PgYAL59Hz3ZT38qdYl
         +DhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp30AWAWt78IdRu/JpNPJxT+pxUtxku/aMrSTCLUSBrWQkqymBxvS0A+alqqiQKhln6dgI9J3EQqCGaPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRmOFJfedSnqoDcvW42U3VG0aag1bDHCEita/LDeeg/+wwJAuC
	AtKiMZjpxej8pNSQExal7QITz6eas32OGowm9sNC/qdY45Pq4VrnPBZPfg==
X-Gm-Gg: ASbGncuhe43TKTKJY6i/m/fX4H3Ck/YACdsKNqicHQ3fydAyro4uZ0qhls6GxEaDxmh
	/Ng+RlxBy0EvbnN5voGHml4j/GRjk8zXJCNKpxZbb5FASAwMz+ZGHytZpy+77kaDsdN46D/Hzwq
	RAJKMM8UpoIma1MACGuA5U0o3QjXV3lWwDRZxRZHL6rho7Nhy+16UqJ1Rnq2n8dmvMJUeAYWVnO
	dMo4LqFJlqufKXLJJZ/EqdT+sBmIWEZIjS80jBX4Mz4YCl+LnMBwti0qGsYvODk4ZNrStBFGqH1
	O8pMcLvAfWuPUKJCd1qzTcqLfrlXHnSbZNdhmXDccnxDHmL3jqSne0YFMiQrNtpLAQ==
X-Google-Smtp-Source: AGHT+IFttF18delAa0kIwIaXxjlLZWoKj8OrO4BSzaBpj3Gzbgt/0yxIn7Od+EzF5YC/p0PdE+ISNQ==
X-Received: by 2002:a17:903:1b23:b0:215:89a0:416f with SMTP id d9443c01a7336-22bea4bd55bmr187692385ad.30.1744645372355;
        Mon, 14 Apr 2025 08:42:52 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([223.185.135.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb52d8sm100228885ad.178.2025.04.14.08.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:42:51 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: christophe.jaillet@wanadoo.fr
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] i2c: Fix reference leak in of_i2c_register_devices
Date: Mon, 14 Apr 2025 21:12:24 +0530
Message-ID: <20250414154224.27836-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1dacfce7-c66d-44c6-9a0c-2dd00bc24ffc@wanadoo.fr>
References: <1dacfce7-c66d-44c6-9a0c-2dd00bc24ffc@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a potential reference leak in of_i2c_register_devices where the
reference to the node is not released if device registration fails.
This ensures proper reference management and avoids memory leaks.

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
---
 drivers/i2c/i2c-core-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index 02feee6c9ba9..7c50905de8f1 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -107,6 +107,7 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 				 "Failed to create I2C device for %pOF\n",
 				 node);
 			of_node_clear_flag(node, OF_POPULATED);
+			of_node_put(node);
 		}
 	}
 
-- 
2.43.0


