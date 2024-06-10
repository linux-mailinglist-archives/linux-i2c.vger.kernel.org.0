Return-Path: <linux-i2c+bounces-3951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D2D902451
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85AD9280A6C
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 14:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20FA142E60;
	Mon, 10 Jun 2024 14:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEUn+buu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3877135A6E;
	Mon, 10 Jun 2024 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718030480; cv=none; b=CAKsklFfaUjC1bd2AHZ+rV55YlV51TyOlaYIcB5zZLuHcIQlzieRfsdWuRgFvoz/Gxoqd9L2lKW4JE9Y6oFL5QnNVuhV6wtFjT7ZU+k0dfndcDDmMpEtRLDEQF6bpe6gLhs82YCG5S2nDRcgHRm/1MYSuXU9aO59/4b4E4inslA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718030480; c=relaxed/simple;
	bh=mdCr1zf8B7Ll/Iil5q/KFUOYdJ9yYqfw+FAXpSBZsps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjgrkxaaM0nCBw/ERLUPq4eyVYQBH9dejfXsHIzP7JE1Pyq6GIwDmO4VUimKBFgSoxD6P7D7icpdqX6ys5Dk545dTP0dGf6ln9/Zr1/0C8xd1FVdLuMVIFVWAtq+eVP92yBapMb92e18wVkDWWMpdrnGNmgbrq5Htb6GT/fBnxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEUn+buu; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2c3051aee3fso933417a91.3;
        Mon, 10 Jun 2024 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718030478; x=1718635278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+PkgdXXou89sVVpBiLAp6lG13UU9DXBepbNyS0RY/Y=;
        b=FEUn+buuiXORtCh28hb98/EYcrNAZVCnhqKdunKb8E356KgjY9+AVhlPLD4aIGGIDX
         D1JEbi4M0vekvSprLD1hxfz2XkzRhLDXCiLo4VA34e9VxlDLDRpJeFjBmeFI+mtk6HjU
         w3RphND9X4qUJvAmQei2+lunw9NFe2Y3I/2vF6GtDAJNclmyOz1PZujQnQ7+JO0BsnhO
         coj/Uih0Ln+BCB2F78BuJ9ECSezuNA0ouXagy8AHzb37K7LgVArpC3tMVS8k0vGhHzVm
         bx90lp+5GNmS+1Oz2bdws1ZpVNpFGY4By34lDJTL9kW2cIlDcBxnhfFEGMO0Kdx0qRKf
         tqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030478; x=1718635278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4+PkgdXXou89sVVpBiLAp6lG13UU9DXBepbNyS0RY/Y=;
        b=XLJ91F6TwGmZt4HxEuMnKgBuJKTMu0JNMairoj5h8yEwAsEv9H7aC3Gb3yS0lz/+QL
         DRdyZ9zgeFu8nWfAhfM65VJvRek9kzTKeqg6lMmcEGaxup3ggrLukXQvzgslXGCiwuS9
         TT02S+3LugYwR50o81hd5nAqONvMwYsquXupWGvxpA8J7SHRWaFeairhksZ+02kUiyyC
         l3/x5RCf8ehVlr2XMV8FOuWAP6Kr/0DoiVD2GPthTi1GOd28SFJEKe9SR4EntalQXtKh
         ZZMIo9XM4hmGtiCnTh0vilIYfUSmOijbIfZSbsNQZI672IO/r6pgCRhF09fNl6GLnDc9
         7Bdg==
X-Forwarded-Encrypted: i=1; AJvYcCVfm7oCUNaTsE9JZbzpbj89Xv49bdXsHX/bPiWfzYvEcdyIe0w3mBW97aHwiDzsElh6bdjg9+mxzYniHcSveY9EdhgyHItVID0njR2xClIh7BhK2AvoymlD8W5tFkVm5/njxa0ayZcc3w==
X-Gm-Message-State: AOJu0YzDNYdVwA9JiNrNwButvNDAZvYaskjor3/26haF/CFCITP+lO4o
	Q1Qs1riXKyqDuufTIrSd8HrgCPxlh4aZyiuvTr6knRfvt9T+OJyV5xVLGw==
X-Google-Smtp-Source: AGHT+IEGHyGgx8eoYjZQOIoTylQHokUeZXRI3h1OVpag1CSxhFFMIg9ikpFiBCJNpDgpFi20vteGiA==
X-Received: by 2002:a17:90a:2ec2:b0:2bd:d42a:e071 with SMTP id 98e67ed59e1d1-2c2bcc6b2b7mr8645226a91.30.1718030477777;
        Mon, 10 Jun 2024 07:41:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c31f22a9d9sm726864a91.40.2024.06.10.07.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:41:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactcode.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Armin Wolf <W_Armin@gmx.de>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v5 5/6] i2c: smbus: Support DDR5 and LPDDR5 SPD EEPROMs
Date: Mon, 10 Jun 2024 07:41:02 -0700
Message-Id: <20240610144103.1970359-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610144103.1970359-1-linux@roeck-us.net>
References: <20240610144103.1970359-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Detect (LP)DDR5 memory and instantiate the SPD5118 driver automatically.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v5: Added reference to LPDDR5 to subject and description
    Updated comments associated with i2c_register_spd()
    to include support for (LP)DDR5

v4: New patch

 drivers/i2c/i2c-smbus.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 97f338b123b1..f809f0ef2004 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -308,7 +308,7 @@ EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);
  * target systems are the same.
  * Restrictions to automatic SPD instantiation:
  *  - Only works if all filled slots have the same memory type
- *  - Only works for DDR, DDR2, DDR3 and DDR4 for now
+ *  - Only works for (LP)DDR memory types up to DDR5
  *  - Only works on systems with 1 to 8 memory slots
  */
 #if IS_ENABLED(CONFIG_DMI)
@@ -382,6 +382,10 @@ void i2c_register_spd(struct i2c_adapter *adap)
 	case 0x1E:	/* LPDDR4 */
 		name = "ee1004";
 		break;
+	case 0x22:	/* DDR5 */
+	case 0x23:	/* LPDDR5 */
+		name = "spd5118";
+		break;
 	default:
 		dev_info(&adap->dev,
 			 "Memory type 0x%02x not supported yet, not instantiating SPD\n",
-- 
2.39.2


