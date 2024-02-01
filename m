Return-Path: <linux-i2c+bounces-1598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C78461C8
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 21:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CEA1F2341C
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 20:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5D98563C;
	Thu,  1 Feb 2024 20:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRRb6ggg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4419B82C7D
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 20:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706818177; cv=none; b=H40/hG97rwY7qYAMUvMT97QMA22jbxT+WJxmlahb+fvnkMHPfA3dZROn11XUAsfz0ppU/yOQdouT2650ycK7ry+7d+MGWIzsfiruErNoXlpgc/l36X/PtBjhrD0TaJdSdcdmsOOAIkVGoRteVLZf4aYm0CnH3DTaTbmxICNxKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706818177; c=relaxed/simple;
	bh=j8CYTO7z2wK7xicgOXxrAoXAOAAoR5crqa/Z4b47ZWY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=W7Q8AcZM+Udbx6DkXo7UUJy7Enao3vNy23C4dciEuy1jOxPbN01gw8BwM53pKGBuCuwx2DDMOBtU6cLk+KFNq1mdg+gvgPLbXQlBKSyC7u5i1wAYyWYW5ImiRBWJgLtUvKRCTlIBinRmbLa/7NYY+kzkv6PZrsAUOYYn5GGKL/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRRb6ggg; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51121c08535so2149704e87.3
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 12:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706818173; x=1707422973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cL+oab1PwXbUEQn6U4Qt6LB93UX3+/m2e9dcDFPF/Eo=;
        b=hRRb6gggyaImqLlRUNQ4QXJ+AX8fqKLVToxtj4OXS7xcxmV6ZsImiqvVr4RQiQVPtd
         SAtMw1dOvm4vikA1rkJKGtJE7Q/MAxjuQfX4mPTO42xNPhVcnHphlHzAqKDd+paFT7nB
         PxJyX6VV1at6c6BqpAQSNagccB+mSGaNt4g80i+uSBsSgcAyF+jLUxf9QUAG8G6p9RcV
         FdVLmGSu9orFkm1ijTQz7VMzQzl6uO73B3dv9WelU4vyT3qh2NpaN2Km5Sa45eTu9WoD
         jKgsZrRPh+z8qwQdEORP6Sx4bAkDp1KOtkDIGhzJTCXf/avS9JxjIjZffrh1WrexZ6d4
         +JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706818173; x=1707422973;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL+oab1PwXbUEQn6U4Qt6LB93UX3+/m2e9dcDFPF/Eo=;
        b=rTbQ/10AckXBplVZK8jVBfg/JT9idby/y+BcUh+3dgsy0xyyNSJM6YrljLYv6/rZMQ
         zv1H/z2Wv4jmhyCI4r+UtfM9KeIbOJgSvuL5O6wFy/E4QQSZpe09ZiteX+GJ6BAL2HzP
         6Yyy1IFZ16mDuaznhV3xsrzuQsCMZqZs2rewyY5Dd+nxak4C5j2QMpRipnzS6dLgjDKe
         WBZWwuZ6NMhn62k3aqfTHkuoO05H66Ueg17jq7nlJHxkQJzzmfuvDxzLwj29piSyY+Ok
         dv6Oy1EWztmTUm3h2U25WL7OOBVN4ltFmA+krtbFaLDqyopNo+LWOIkl12tcp+TI2v+d
         2slw==
X-Gm-Message-State: AOJu0Yxxy+SeBmMJjlPYCGmX9vteHFGmF1FadvEeJu+0deRENDyWmDea
	q5wlvK2rREZj4NgGzZoFRaEomwp/MrBh/7SSGxQxITsH9/Rr7QIcjHdrHYVM
X-Google-Smtp-Source: AGHT+IH8ErmjzDmdeX+FWMUcQrsoIu0ZotB+OoGx1V6I8X8bjEIDh5pPz5AwajlbgKngtSryKdfPGg==
X-Received: by 2002:a19:ca41:0:b0:510:c6c:3176 with SMTP id h1-20020a19ca41000000b005100c6c3176mr2127375lfj.47.1706818172833;
        Thu, 01 Feb 2024 12:09:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUdYkyzU0mo5pO/TUqCkhqTasIBVJ90c4iF05YFz1+PxWKc4JUUr5Ma7ieytU4nIe7E0Sgo7M24wwyfrPRtl69UExNmV+iBcyPHzAeSrHCEsyY=
Received: from ?IPV6:2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac? (dynamic-2a01-0c23-bcb7-3100-59fd-7b30-8e23-b0ac.c23.pool.telefonica.de. [2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac])
        by smtp.googlemail.com with ESMTPSA id cb11-20020a170906a44b00b00a349318ea10sm114415ejb.199.2024.02.01.12.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 12:09:32 -0800 (PST)
Message-ID: <a94371e7-e3b7-4bf3-b4b6-1ba2ad196b5f@gmail.com>
Date: Thu, 1 Feb 2024 21:09:33 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/5] i2c: i801: Define FEATURES_ICH5 as an extension of
 FEATURES_ICH4
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <54845225-ffa5-4983-8bb5-3aa70ef72c72@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <54845225-ffa5-4983-8bb5-3aa70ef72c72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This change simplifies the code a little and makes clearer that the
ICH5 feature set is an extension of the ICH4 feature set.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index b9b850b69..44ae6326d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -969,11 +969,10 @@ static const struct i2c_algorithm smbus_algorithm = {
 	.functionality	= i801_func,
 };
 
-#define FEATURES_ICH5	(FEATURE_BLOCK_PROC | FEATURE_I2C_BLOCK_READ	| \
-			 FEATURE_IRQ | FEATURE_SMBUS_PEC		| \
-			 FEATURE_BLOCK_BUFFER | FEATURE_HOST_NOTIFY)
 #define FEATURES_ICH4	(FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER | \
 			 FEATURE_HOST_NOTIFY)
+#define FEATURES_ICH5	(FEATURES_ICH4 | FEATURE_BLOCK_PROC | \
+			 FEATURE_I2C_BLOCK_READ | FEATURE_IRQ)
 
 static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, 82801AA_3,			0)				 },
-- 
2.43.0



