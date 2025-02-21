Return-Path: <linux-i2c+bounces-9526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51340A400F4
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 21:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6D11896350
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 20:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B9225333B;
	Fri, 21 Feb 2025 20:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bw5zB1qj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE29253331
	for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2025 20:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169800; cv=none; b=NNIXoU76S0bIpUrSthnh3zQscFEChYg4oxIXSS9yXZxUMpXGS1FGKllIBvEP+xnj+WpiQhGKm5EqwFlWmzae+JwGMP501z5yLAd0NWDOirRkryF28t8afK4EQl3uThUQm3FyhcQIubWrdxTSRLVuWC54+2g+O6FrwzC67iaHvcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169800; c=relaxed/simple;
	bh=fdClsAYlCVg4S/LxTIbAsqEJNDh4G9hG3IA5JJlcQdI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Hi2Hn0JTaihN+2KDIfIJjtys7Qn+iyPKiMCVvooArj5W3a0L0u7eDPe09xnTyedlfgEI67hy821bTrvUya238Jk8n4uanSSgBTjF3Cu1k2wjbnnc9D7vg6CcmkPqjWHdQ2BEsHDWWKEvT15IOcJWDOEwLaC6lSVG6ZVDf6T9T/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bw5zB1qj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so21534095e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2025 12:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169797; x=1740774597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R/iIV9oyvJnN5NjB+DZojcdUVKM5TUfvBAJ8b+/2c5M=;
        b=bw5zB1qjafIl2OjaKVEBQ1pKbw+puWOS7UeeCX8BzVjEGHrcFt2IXIF6tkeNvhuciF
         OP7WGUvG/IZb1UBe3WX23JSNpoLUud8jgM44qO+GvHMyIfeLcdX4NPEOWdexK261D6kB
         iM9CqzuJhIbB07Oye8zGvgbXIGqGUS9n9WIzTkdRk2maj7sWgCO8zAypdwyQG7GY2cvw
         f1aVcBcsqznSU+DabBrpMk9Kb9bU1ypASsaMHQR/VmteWhzxwdZK454VFdInLWIKhzac
         1fgYV0UY4exVWuP2rzISkxlPcqdizfh2I3iHTvuKfkw2f/uzxNSgRHFIBl1uvmn0P0V7
         oluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169797; x=1740774597;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/iIV9oyvJnN5NjB+DZojcdUVKM5TUfvBAJ8b+/2c5M=;
        b=vUMmmvsYSZjThcqQI+kf9QdtgM7LaHwSGQmVD+boz9FHoUKhv+KsiVC50TWlEwxAI0
         u2Hln/zGlmZhcuGGeYb1ntp0pXjgMXJZv/V3EkqNDPDQ4dM+4fomEbjICheCWQZTJgSx
         qP/gkPvg4KUAhynQCFhxsJ+bMZ0CDiEEkRoBt9pv4tt0j20GCI61HAGwGLz3I8PG2E6z
         VRPiHYzuoQRR1lr87z85saBhOQRaJYlpnlnOzhUdMOtao7ul7wVgLGMd5SQl0qiYfjMd
         rnualKBPmJydu9wgwsPNpk9h59Kt0P6LwgcpxMQlf1IT99Mnw0JPvPJkxvJdCC90rH8W
         M3MQ==
X-Gm-Message-State: AOJu0Yy7hzr+ezF4HidnLiqUtpOlNAohwIEDn52jbbHD4ecPV6lY1p9Q
	5arXuMbxTgWXzdnDmJffDbLzfo3LvzyY7MSJe60zXkZZacGaeK/O
X-Gm-Gg: ASbGncs/aPu4olHD9BF5jVP3Ay5KAuq+4aqx7el15/aFBwhUrYRdW5UBN+Ibq8mxzHH
	KUFNdoHWOpITURvCu2h+S19XqRhytbGPhf29aHhrX7y1sx31z3gSmNBYB2aUNE/4TL4hdgEnQXB
	v1HcqtQsNhzSfF3V4JaXuAIFilSavK9XAbA2EQrcpoii/2A7I/57jN/cXmrG7mwCwEEX1a6beEC
	QQiO6lFb8705nvI7BMqLQSBmV6uDGNl3uG3Rozm9YEVAJG4mum60J9ULEWT8fVkEiHcyHI2HImN
	+X7wtrroJs6Mx+qsLnhQEAmAvnxg/27LwpA7mALdu/sdsulwgEBLK4Zte7rv6lJW2XMryDkzuE+
	w5gKDL3ApDK7Dli/FxmWs9BXMRH0EkMiplZrzNlJD6a9rhklJ7jKXTxuwFXMG/6T5Qe3c51EdK+
	+yarjZV9cXtpTF
X-Google-Smtp-Source: AGHT+IHYudsUGeJaSdkgJ8rYJ7Y0M+4GPN8U/00etRKGSiFQ4WFsoPAmHsvMuDvC/Dn5ZKMCsKneqA==
X-Received: by 2002:a5d:6d8e:0:b0:38d:e420:3942 with SMTP id ffacd0b85a97d-38f61499154mr7115123f8f.3.1740169796536;
        Fri, 21 Feb 2025 12:29:56 -0800 (PST)
Received: from ?IPV6:2a02:3100:b29e:900:9dc2:647a:dfc:6311? (dynamic-2a02-3100-b29e-0900-9dc2-647a-0dfc-6311.310.pool.telefonica.de. [2a02:3100:b29e:900:9dc2:647a:dfc:6311])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-439b030bd09sm27547865e9.29.2025.02.21.12.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 12:29:56 -0800 (PST)
Message-ID: <ad4ef645-5d03-4833-a0b6-f31f8fd06483@gmail.com>
Date: Fri, 21 Feb 2025 21:30:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] i2c: i801: Improve too small kill wait time in
 i801_check_post
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <f620328f-1e0e-4875-916b-544181a13f0b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <f620328f-1e0e-4875-916b-544181a13f0b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In my tests terminating a transaction took about 25ms, what is
in line with the chip-internal timeout as described in 5.21.3.2
"Bus Time Out" in [0]. Therefore the 2ms delay is too low.
Instead of a fixed delay let's use i801_wait_intr() here,
this also facilitates the status handling.

This potential issue seems to have been existing forever, but as no
related problem is known, treat it as an improvement.

[0] Intel document #326776-003, 7 Series PCH datasheet

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 9097bb9cd..6a4147054 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -441,12 +441,11 @@ static int i801_check_post(struct i801_priv *priv, int status)
 	if (unlikely(status < 0)) {
 		/* try to stop the current command */
 		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
-		usleep_range(1000, 2000);
+		status = i801_wait_intr(priv);
 		outb_p(0, SMBHSTCNT(priv));
 
 		/* Check if it worked */
-		status = inb_p(SMBHSTSTS(priv));
-		if ((status & SMBHSTSTS_HOST_BUSY) || !(status & SMBHSTSTS_FAILED))
+		if (status < 0 || !(status & SMBHSTSTS_FAILED))
 			pci_dbg(priv->pci_dev, "Failed terminating the transaction\n");
 		return -ETIMEDOUT;
 	}
-- 
2.48.1



