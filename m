Return-Path: <linux-i2c+bounces-12767-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 161D7B48BEB
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 13:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C317D3C1A56
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 11:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFD12FE044;
	Mon,  8 Sep 2025 11:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw4AqMly"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07722FDC44;
	Mon,  8 Sep 2025 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757330069; cv=none; b=FZbypmMwDJNIX29bJNYtT8vb1h3fm0HRHK2utIHniBH6C31X/y9s+cxqIZczU7mmsfzIo9lStxa4Y2o3vmfW+m+sO1EPBJ2j6ZQAD4l4hUt6NXXN9j1QMwYH2LegjD7Hija0u8Gwsubz+cTFCH0LUvvqDjlXpr0Vmt+0qivA4pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757330069; c=relaxed/simple;
	bh=9rkfHgsTmUh0SVl0orvQr25hOxKAul2qbbeN0O/19vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNnsc7R4PWTuTesbHc1nDgKkDm/tB4hoDYEkLNt57lR3pSpZ7EI8RxfvIbHte8N4bBu16L17p3fad3X8nGn5Xvg/BP/qqBamWec9kCyVseuRwbPUPTS0pjMvHzetuqqOiFTCLYZzlQ6P1fSa2els+MBLfN1xvvtP5rQoy0hW4Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw4AqMly; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afeec747e60so807998066b.0;
        Mon, 08 Sep 2025 04:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757330066; x=1757934866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMEvLGAzrqg9Q3fmSW9NUDHWK0z3Jxj6SlKxGJLN/wc=;
        b=Yw4AqMlyuX9Ibo9R2QmRqeHoEX5vo2JQsARiLp/uSy67RSnn8RZ2wzJoyRSv8msVlg
         /jrJAESj8X5fzMIRk6rWvuGcTHM3HzNbOXhkIlxRkp7ljPaB5QlrcKeknoR0LgtwmeMe
         YmAQxg2Jv4Scr/HdpzU4LuDRPEJtVHGok+N8S2wi/sShZ+/oDKJHaIJJQ9i7IiVfGbO6
         GVCoGfDjlVCPVryg18PSe1TfsYZLWaEMpwtXWxFQI9nEmdrrsg4c+htF5HQ2+1k7oeFd
         dxY/4WUExkBvcQeKzhheY6K25W0zXeQQJMvKFHhoDV/G+7cYKf5yWWG02jC5yQdlS0+N
         ZeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757330066; x=1757934866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMEvLGAzrqg9Q3fmSW9NUDHWK0z3Jxj6SlKxGJLN/wc=;
        b=cmpPUiVz1QjDGzMi6Iq8I/+BuOdTu7C1kSoAKheRm4eckxCLc90U23Y3MrSP2qzKis
         1x9b0pL/Zvf511O8hJ9U7WwubIFO6nWcY7dAUWUQ8qblPtcEkRk3laYHCm7XyEdOySqe
         6qZlf/zHmcGQN2F65zZ35IoBHPlyLFAsnD3e+EQI/Vqo8cveaD129jBKJd2jyx3OjAtw
         QtPbbMhVvGR0n/LE02wx8ZNZuDscIU5uAUIMpMY5tKbxYtKUmJ9cbRKCNvZ2uNkDcAZ8
         zVbwh5n8h5KCnaqf5jlyJ39FwobttGuh3gMDzQio6pfnSB/TdPNSA9S6TacIhfRXsvhV
         PTtA==
X-Forwarded-Encrypted: i=1; AJvYcCVY41WMGhjl71UYO/iG++A/D417onYLo2pY/EXgThioWm5Wq3EsvceU9DgDRwG4gIZrXAjYWJHsez8BpwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyS+3Ei2x9D+ODTNNhuxF+0czH7SlZlwSI4wkAHLRlwOAOurJ2
	5QBmGs2RMyiXXvx47Zj8ZnkmdbgKL6c+3/EZqi+jV8l6G/UcD5XKuARE7aAiXA==
X-Gm-Gg: ASbGncsah/2YeNHWQe/i2nihXmVVvJzBcOUmmA4HmrUUCvAjUiC9fBqu6j5r5sEUTxj
	Zj7MymymsmtN0RY0p1FL9zp+v8IZWdumeLhhE3z7wgoS/HaDE5HHc/G5Aw1YQZb9yFQYOp/afym
	VJ9EDFPo+x/H8Mnd0vH0y7XV7QK2BU+ZNMIAMEMifpfDwMB0p9+vqelcilo/ZRJk6hUytjakZC5
	BU1On5NfeDHvGCC5ra6XZ+6K4KYvGLzx9CeEdoB3YyT8UqoXj7NwCFYWPCnlrmartgDpO4sMZQ/
	pkgXk6WJLRG2rrGf04Vd+xqFpT803w269YWuWlqfuULfJIT3sytO/1mRW0UPWgLLqy61wzkAzp2
	tOObScgDyFJG8L7c+Fg8NWOghoQ/Klw==
X-Google-Smtp-Source: AGHT+IE57ZEY/2AFkKliea3fNWIde9Xumd9K/letEZtCHMn6CiSxfl60XlTc7hYheqg7iP2mcb2ZcQ==
X-Received: by 2002:a17:907:3f8c:b0:afe:e7f1:28a2 with SMTP id a640c23a62f3a-b04b140a788mr646246566b.23.1757330065584;
        Mon, 08 Sep 2025 04:14:25 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0470f11088sm1211333966b.111.2025.09.08.04.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 04:14:25 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	Markus.Elfring@web.de
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH 0/3] i2c : PCF8584 : Cover Letter
Date: Mon,  8 Sep 2025 14:13:52 +0300
Message-ID: <20250908111355.79222-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adb7d136-eba4-4ed2-b893-4f7c43f8d678@web.de>
References: <adb7d136-eba4-4ed2-b893-4f7c43f8d678@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing:
    *built kernel and modules with I2C_ALGOPCF=m and my 3 patches applied on top.
    *installed kernel and external modules generated by build on my laptop
    *rebooted and loaded i2c-algo-pcf.ko with param i2c_debug=2/3/9.
    *No success message related to i2c_algo_pcf was seen in dmesg but also no errors.
    *Module loading and unloading successfull.
    *No PCF8584 Hardware was available.

Patches 1 and 3 report 4 and 6 warnings when running checkpatch on them. But the warnings will be fixed in a new patchset that addresses fixing warnings.

Cezar Chiru (3):
  i2c : pcf8584 : Fix debug macros defines of if statements
  i2c : PCF8584 : Fix do not use assignment in 'if' conditional
  i2c : PCF8584 : Fixed space required after different operators

 drivers/i2c/algos/i2c-algo-pcf.c | 62 ++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 23 deletions(-)

-- 
2.43.0


