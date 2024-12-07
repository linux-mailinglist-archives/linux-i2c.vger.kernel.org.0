Return-Path: <linux-i2c+bounces-8366-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D819E7FE9
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 13:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D8F91653FC
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 12:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC161474D3;
	Sat,  7 Dec 2024 12:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnVDwX2t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D17146019;
	Sat,  7 Dec 2024 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733575495; cv=none; b=C9jQREurgDlCEJLqiDmO4bH8J38bqPz1yTRzNhVfZPperoTErXoxCKNg1H6x2Tsp6RUckwME9JgQ4GIF46weUyEaI3HKiAr8aygOHt9HtJWVV1harnulgzIRltPV6epbfOE6sTDhMuU+R/BGnDCxWjFz+jl2WPEHtaBJPJoPTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733575495; c=relaxed/simple;
	bh=ZQiYl+yF7ZmNyXH0sDvnPCu11Nf7kHjyeXP+B0FEETA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0pge4T6yY4vF4kmOGAIU89f9xcM7FA5hwlmkrav5kWCsEQ3AQETBBw9r2zyxRbkPS2TjR7QoI1gtVvHXmwEuL2WKINUGxohHCskZqK5JHaIZT1LKlb5wwrbkyNisjfSH0ca6b0E9D4vKdXY+ScRpuZPTPOusqkkjHj390AU2Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnVDwX2t; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7256dc42176so3255961b3a.3;
        Sat, 07 Dec 2024 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733575493; x=1734180293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aTApM3TBvXu60J320dXWpHizSsg3CAfWttCGDerVGgY=;
        b=AnVDwX2t6Urv4sWgegNSJQrxrw3nTrBAtcOiX71lseEFXayQZ9p8xA0KglJRLmBsOb
         V+MxFOW7mp61kjcgl8Wti5EaJiFMtmdwWLiZD50bUoNY0tA/JH0yGWeNbmOjWBnBd0sN
         lrz2rBvJeY6bjxAxpQc17wOjQw7NxNOdJW5CYWfIX0bgwzS1jz9s5Ysf5bBMbG+KEWFO
         kp6bi86PahWR8LViKIuQA9N1+MCa59x0ZNWMgTBhv9OH7hI6EfhUyhR6/0ogJrw8Q8Zl
         HT42eBZXXaQ3zXZnU8EenuIxKMTyGO9JWYHyJBAiYCoY9blNd8NcVc21JJZCJh5vI1iV
         tCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733575493; x=1734180293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTApM3TBvXu60J320dXWpHizSsg3CAfWttCGDerVGgY=;
        b=NXYi5wkUr69EgrD22vrlcYglY+bBM0XJlGJkrFuMaewJoxdTWnPhg8YERF08hhfyNR
         O9/FvEt/TQa+wZ7Ysb4JEXcEP2h8WhUkWSDuPRttks1YGyzWfmfItKmfeAX4bVoSC5MU
         dN3amOs99gcSsLK7OgAQ1WhBAz5wsLusLxQHC8qAcghdKX2e7JAkSBLdbSnoJ7p78On4
         oDMHvjZ154C3BUNKtjsAF8INFINuv4CYQsCtHoR/TVKxHopv47tQVEG7IW/qW2QiShvF
         SZ0yyHm2jwd+/g+DNQgdT98y4FCkWQf0MQegvW3vpP7G8Jcp/LTLid6Rpe9lb9L8LpvW
         8nrA==
X-Forwarded-Encrypted: i=1; AJvYcCXPRDSPCLRi0b/fPDWBGcTQueFqHjhBHc67iYWs7K+5rOU57fFSJPUG4Vc072eL4ywM6IeDgWJtxVQULA==@vger.kernel.org, AJvYcCXVF3qdsANYxCpfNxFp855WIUa+cZV8qICvikHgONyq1cBODuh3E18l16fIWdZ8bsKOJ4MO/dmd9Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbzjTqwxqLvbgEscJU7iXv2WDWOhLThKFjjiLSiNJoj3PvGDCL
	zhEpZC3knEprrfnXT+vZ+de2OjToj/QU+jIjYBPHjW9GcvGbNXmg
X-Gm-Gg: ASbGncsKfmMMuF6afvYmnSQKhPIDd6CHivGLwVdEj7F08l9wYIp2TzpnFXpRqDB3nqs
	46uze617WKBSfz/04qrra0HYZfSHdt5Rz5mcCdIu170loJkkQZgNCKkrToHtL+PMlP8isfkEeBl
	I2mEH00IcT95GJ0pJNldcOV9ijPHiXX5QYPmu3DTnJJLd3irne/2eCX4UDFW4vK6udPpUQDQFBc
	8HaaIJ7D7zZb16S4pcL3A0MkvKq44tfv8BshwxwnueP50H91KFvTRc=
X-Google-Smtp-Source: AGHT+IFR33pSremvHHbTtQOK22aOSRDr4tG2TI3TJK5dWlt1Rl/mi7RIrlL/e5TWQ9D+DRaDroEu8w==
X-Received: by 2002:a05:6a20:72a0:b0:1e0:f390:f2ad with SMTP id adf61e73a8af0-1e1870bb417mr9571826637.18.1733575493493;
        Sat, 07 Dec 2024 04:44:53 -0800 (PST)
Received: from melbuntu.. ([122.171.22.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725c82b4852sm1700850b3a.135.2024.12.07.04.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 04:44:53 -0800 (PST)
From: Dhruv Menon <dhruvmenon1104@gmail.com>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	vigneshr@ti.com,
	andi.shyti@kernel.org
Cc: jmkrzyszt@gmail.com,
	tony@atomide.com,
	khilman@baylibre.com,
	rogerq@kernel.org,
	linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Dhruv Menon <dhruvmenon1104@gmail.com>
Subject: [PATCH v3 2/2] i2c: omap: remove unused parameter
Date: Sat,  7 Dec 2024 18:12:03 +0530
Message-ID: <e4327ab4199883ec2554222c2697225abb797491.1733217877.git.dhruvmenon1104@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1733217877.git.dhruvmenon1104@gmail.com>
References: <cover.1733217877.git.dhruvmenon1104@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameters `is_rdr` in `omap_i2c_receive_data` and `is_xdr` in
`omap_i2c_transmit_data` were unused in the function implementations.
This commit removes these parameters.

Signed-off-by: Dhruv Menon <dhruvmenon1104@gmail.com>
---
 drivers/i2c/busses/i2c-omap.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index df945ddfe089..9838d89df385 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -990,8 +990,7 @@ static int errata_omap3_i462(struct omap_i2c_dev *omap)
 	return 0;
 }
 
-static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_rdr)
+static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1011,8 +1010,7 @@ static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
 	}
 }
 
-static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_xdr)
+static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1128,7 +1126,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 					OMAP_I2C_BUFSTAT_REG) >> 8) & 0x3F;
 			}
 
-			omap_i2c_receive_data(omap, num_bytes, true);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
 			continue;
 		}
@@ -1139,7 +1137,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			omap_i2c_receive_data(omap, num_bytes, false);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RRDY);
 			continue;
 		}
@@ -1151,7 +1149,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->fifo_size)
 				num_bytes = omap->buf_len;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, true);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
@@ -1166,7 +1164,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, false);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
-- 
2.43.0


