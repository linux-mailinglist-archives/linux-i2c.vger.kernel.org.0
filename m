Return-Path: <linux-i2c+bounces-13117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56741B96723
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 16:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B10D2324AD8
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 14:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3242641EE;
	Tue, 23 Sep 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BglUpkpa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B598D243371
	for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638976; cv=none; b=srW/1anu1ZUmNXqjrfghMgbWmclc4T/N3XzOzq9QMB4wBSRue8sz8pchwfYmER7VCaxqdQdLMYIp3dAGqrbFivEKQUrhAdnaoI79+vc9oQpiCB6MUQ9PqUxHxT0QkYRTBn8IJsyMP5wxlR+u05lxiN0mrFsTQzczrhcgHSpheZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638976; c=relaxed/simple;
	bh=sLM1xctq1sZCetv1t/FXrLccMl5BHb26sBKtCXVwXcY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mDSANSRWrIdUpie3jPlW1XF1SzW3HzbuNOEnrQTpUxky9yGS6dRJSKUv9qXfxanTkrfbh8iYvpoXw7XSWyCJnvguQkw6jzzon7vErwtbDyFcOnDbQVq4rhcFVL9C2blKdMyR6QJ0mCKOlpBvlT02Un8FRQFxhTcT/jimK2yAAK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BglUpkpa; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-330a4d4359bso3419287a91.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Sep 2025 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758638974; x=1759243774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp7+9xFuqi62hdNhf2W1lvuRdA3Rtjn+hEtiwRUgEms=;
        b=BglUpkpasnTMsxJ1kob2YRj1IusV3UOU4iwbeZUp2FaU3BgFplLW7qN8mQZsLJ/Me3
         7pXdZ4MJujUW9a+NIcmTCloW+5dpuHcg7FvQcIaVead4QVL3MFULBWiDAsf5ngoPv9v0
         ZM89eRr6vFuIb1HCidoCzpBhyySmJXW7F6DlIYFmX0lhocYMz6TTkAEWRwpUmLeaL4PP
         D5pc7kziwnILkPtdDZofElf0DUSIn1G4fyWjT+WUgcuQ2/oLxO/MdyNDEnW53nAhtc/r
         kxk9FVcCsrEEoW2+/KkTGH7zJxdt0tLKRg8lZMkxUyZ4Y0DeX/0GzIyUCLyFjEjVb8ij
         RWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638974; x=1759243774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xp7+9xFuqi62hdNhf2W1lvuRdA3Rtjn+hEtiwRUgEms=;
        b=fXfpbkVIvDHuz/lUn2ipAaDcZPawQjfio32GnBZvv6tw4WtiEs5J5ZW0s9nR/IOtd6
         R23sQ9n30A5hpCkAWcSJI3t/10RRjXJoVLu1T8DupZMXahc3Xqtj9abekfLjfTG9F/oL
         vRQb9jtaZTupE2WAwm90p3NwpjUhn/0olXrnx4Ji26+pKfpZb7KWB0YAtI93glSy6cZW
         8FzV1agPa3qdmVju5XDAIaQTBTPI4AiLxwg4pqYYcKqSAJcVtwUZyv1GwOAP5pdCuPlr
         lc2HuWgcIwpaSSULrf/k91ko91wUt/QviccqUf18nlPOTK31LrU9zUyy0fc6C1eWf5Zr
         EB1g==
X-Forwarded-Encrypted: i=1; AJvYcCX2xzz0A1EVRiuxnHGI3GgXzZKEjIIlOqa2Z/wFIBWK3X+YthsLtzOH92s8/YW3qE7M6SIAUWmrgPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwy4ULLtA1HNku42fGVs2hthEF0SeutGewJLmwhOAqrhG6Xnq1
	ent4r6870MubgDI+/zzpJMvdCvbhxjopE6+HRLw+pu/AYJvubF2Cyoxi
X-Gm-Gg: ASbGncuiusNzTkZAU4fQx3NLxSa7J0lAbBrppfb93vccGT2NjlLo5l0Re+ucYSq6+LT
	SwZwUDsD0I5JQXJyzerbXa/bKh7CJ1hpMkjmyxkucXpfVq3cc3d3myOuqQij26ETs5G6BHs50f4
	0N9HSQdSL+x3gaw9ZwQgtrkkZNHp6STI3lAA3cgI6yOQnmiLpAScUGy5l0vu59afCg4hwDgwlJd
	NnaLuWogXDpdSloRUUME4J6dLEc5ricwJ6haW3OWSyovdbJn+S6Ce+RJJxFVShzN6eTkJlKoNFv
	jNwRiBUOt/IhAVZOY/eZk3XxL7W8u8+WoE4obMxaZrNmBLWJWX7JHJTVT1fNUpSTAk/ba+2ay8x
	aE3bgYv1ulIFSyexqN/LsoVxkLlMYy6qRN03O6xJ7E2RtjGAcsHo=
X-Google-Smtp-Source: AGHT+IEPHh/2ebqkGgimtTNshZ35ZBhXt9O04HK+1pd/wsmqmpdSWNANzUnELZmpu3VzsIEIQkb+0g==
X-Received: by 2002:a17:90b:4a8a:b0:327:9e88:7714 with SMTP id 98e67ed59e1d1-332a97051f7mr3565283a91.37.1758638973819;
        Tue, 23 Sep 2025 07:49:33 -0700 (PDT)
Received: from ti-am64x-sdk.. ([152.57.99.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed2771d43sm19092682a91.26.2025.09.23.07.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:49:33 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Michael Zaidman <michael.zaidman@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: bhanuseshukumar@gmail.com,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] HID: ft260: Use sysfs_emit to write formatted data to user buffer in sysfs show function.
Date: Tue, 23 Sep 2025 20:19:26 +0530
Message-Id: <20250923144926.307315-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline with sysfs documentation, sysfs_emit is used in show function
to write formatted data into user buffer. sysfs_emit is already PAGE_SIZE
aware.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: Patch is compile tested and verified with checkpatch.

 drivers/hid/hid-ft260.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 333341e80b0e..8677bea46bea 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -826,7 +826,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret < 0)
 		return ret;
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", *field);
+	return sysfs_emit(buf, "%d\n", *field);
 }
 
 static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
@@ -838,7 +838,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret < 0)
 		return ret;
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
+	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
 }
 
 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
-- 
2.34.1


