Return-Path: <linux-i2c+bounces-12945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09459B56C26
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 22:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A240C3A9CAB
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Sep 2025 20:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAD5284678;
	Sun, 14 Sep 2025 20:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVGdgDDK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8F81A38F9
	for <linux-i2c@vger.kernel.org>; Sun, 14 Sep 2025 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757881458; cv=none; b=sDMYDG1wgkeRvwWcHhEJueQEGFSYIqeMpPOjB1VZ52tyiBMmqtJkOOFPtjPSTVRYWEXWb2wBY7/YqKPJXzyfNsEKtfxz9lYgqCDGGG4Os4C5IZ5xjSMkhqT+qIeZAT21krlO8V3agFuicf+CYkTZ3K7b0eAtCVgGzIy+9OWkz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757881458; c=relaxed/simple;
	bh=92McgIEC3HPtY6sMaUjW1GKNySzIx2gDHz2ZUhyYuMY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=WJhEWd3X7iR4aIxOORx2oy52es0BTeFz4lljGc2LtqQ+0nHYtniGt2LVh8s7Zgpx3dSyI4tLetWWeeRjziPHIfSpDM9zwMVGWQ7zxAtw1gGuRBSPJ18LBzf2VUKxPW+6Ceyc7y3PCK/1c1fYtTN7nxiL4YdHvFrIFiVc0XF9VkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVGdgDDK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so24339015e9.0
        for <linux-i2c@vger.kernel.org>; Sun, 14 Sep 2025 13:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757881455; x=1758486255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTd8RUqG1aS3jZ/JcjkpTK5jxonWDzX5HJt3afNIWDU=;
        b=VVGdgDDK95RmMbPQVJzWwk0yEuaqY1YXLrfoVokhhEvjoqgAvh64gomW/hs2l1rpDJ
         gS75YtDijW/CZN7lYKQ+VVbja2jyCFYLMuOK7vhCoD8Zny49EcHeSs3XNg7YskGvPe25
         p2T2zenZ3mJqMZbElAb+O3jp3t3i73jFDL0SCtHaGnfIhxe3+ZgZbIY4I9ElOEJnMMUq
         PzI1UKMBpfIlUtxHEoToZLnkThJUkCTgpRZlvFCJC7nv2BFOkMGvXiVhvdm2mq1ijLS9
         vscWVgfNouaHPUmVDDkJ1iPePWBr0jLSufMlgP4d+4hOQ089vfXWLEgVaHkvTrraDwqZ
         vR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757881455; x=1758486255;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTd8RUqG1aS3jZ/JcjkpTK5jxonWDzX5HJt3afNIWDU=;
        b=pqOTZHlWUn/KelTHMTd1N7spq0ty+pbZSfKso0H1qsbbJMs8g0I3Wq0eAsvSHey4Fp
         SrWKbvbGpe+9kiuSPD1Hcgi0yemY1+isHcZrszNKq0GYuVGuCviN3uX4qP1Pc6JF1z9X
         2yUdOAZouLBfU/6NqxEuScY2Az/lzjoN3DZUFjP1nZ9tdE0ZI956aA9Iq0sMlNHwSszS
         iRpuETCPdqNs05IM0yJaSgQQuk3UqAyw3YIR3YZ/DSrtdvbMTr4WEeuU4rUSyc2UdJ1W
         DJftHuyh25xEu6TiMPh+s6FQEmsdZBOn2QiP6wxD1/WfwOlyTqk4MQuR3um5R7IaBTan
         IETg==
X-Gm-Message-State: AOJu0YyUWlFUkrJnbt5fiz2rGn2meq7bufE8Zrmt9RRmUHWclfROVot1
	etq4Dr8jlpF0xyyt/0b8ZFo4N1EdxKrLKIzSN2bwhn48ABXF/CvOzoFQ0vYLQF68
X-Gm-Gg: ASbGnct/ppXCJqhEohnlulWZgWd4C6VEj659IKSNIUZ34AKn1mldNNas/wc65uOxrXK
	97w4hVBVxjoWtc6+ermbhu5yEAkvbseyBZ1rZbboXcEVRyW7a92BrEAdYEaxCUhTuDptcNU3q8H
	r0vwjjbCwozMNiL4ZDqoxl2NWO9LlPlXov+PlzrPJYVr8Su+yFtX5BU6hbphN6HfCEuDAsKrMUg
	xGcLOb2w+iN84YAO98PD8p65QiWZVIj9seMwrNXZDG0MTvYNxrub9Hep455OZGhav+LEmMwqVBy
	zlQDKw1PUrs4nakT5RSYZH0eD6GO1HREgqumCUT+zkBKa6F4ZeiXcZT/AtHl6ZJaSDjUxJSv+RW
	wvUD+o5gK0Y7CC4dQyBEr5ybM/B9VxGL3SL4kQ6lNWCzd3OV+Wj2g12+gHCuvANr5AseK+0cn1E
	1tK2/fqnrhHcugmqnyAkx5mYK9Zk3Li+xBID4N/31jqxM2+lRJa+isaOnQyIKlfs/XCqZVDkEk
X-Google-Smtp-Source: AGHT+IHVV8V6uTfvyPmDn8T8zJiYSjQyjkRjx/VHK0/dkMj0WXb3qjBQ0Z1fGnefCmNtskf9rRtyoA==
X-Received: by 2002:a05:600c:83cf:b0:45b:43cc:e558 with SMTP id 5b1f17b1804b1-45f21207be1mr81567025e9.35.1757881454679;
        Sun, 14 Sep 2025 13:24:14 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f49:dd00:818b:e162:8b70:83cb? (p200300ea8f49dd00818be1628b7083cb.dip0.t-ipconnect.de. [2003:ea:8f49:dd00:818b:e162:8b70:83cb])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e016b5cbcsm151772185e9.11.2025.09.14.13.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 13:24:14 -0700 (PDT)
Message-ID: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
Date: Sun, 14 Sep 2025 22:24:13 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i2c-boardinfo: Annotate code used in init phase only
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Annotate two places in boardinfo code:
- __i2c_first_dynamic_bus_num is set in init phase. Annotate it as
  __ro_after_init to prevent later changes.
- i2c_register_board_info() is used in init phase only, so annotate it
  as __init, allowing to free the memory after init phase.
  This is safe, see comment: "done in board-specific init code near
  arch_initcall() time"

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-boardinfo.c | 4 ++--
 include/linux/i2c.h         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-boardinfo.c b/drivers/i2c/i2c-boardinfo.c
index 4df8ad092..338800321 100644
--- a/drivers/i2c/i2c-boardinfo.c
+++ b/drivers/i2c/i2c-boardinfo.c
@@ -22,7 +22,7 @@ EXPORT_SYMBOL_GPL(__i2c_board_lock);
 LIST_HEAD(__i2c_board_list);
 EXPORT_SYMBOL_GPL(__i2c_board_list);
 
-int __i2c_first_dynamic_bus_num;
+int __i2c_first_dynamic_bus_num __ro_after_init;
 EXPORT_SYMBOL_GPL(__i2c_first_dynamic_bus_num);
 
 
@@ -48,7 +48,7 @@ EXPORT_SYMBOL_GPL(__i2c_first_dynamic_bus_num);
  * The board info passed can safely be __initdata, but be careful of embedded
  * pointers (for platform_data, functions, etc) since that won't be copied.
  */
-int i2c_register_board_info(int busnum, struct i2c_board_info const *info, unsigned len)
+int __init i2c_register_board_info(int busnum, struct i2c_board_info const *info, unsigned len)
 {
 	int status;
 
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51..11a19241e 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -499,7 +499,7 @@ static inline struct i2c_client *i2c_verify_client(struct device *dev)
  * Modules for add-on boards must use other calls.
  */
 #ifdef CONFIG_I2C_BOARDINFO
-int
+int __init
 i2c_register_board_info(int busnum, struct i2c_board_info const *info,
 			unsigned n);
 #else
-- 
2.51.0


