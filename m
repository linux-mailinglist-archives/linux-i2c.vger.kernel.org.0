Return-Path: <linux-i2c+bounces-1487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE30683E5BA
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 23:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C64D1C2125E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 22:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA792562B;
	Fri, 26 Jan 2024 22:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlRra90O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D73D1CD34;
	Fri, 26 Jan 2024 22:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308803; cv=none; b=T81yldOlgWRRCq4z8wIodNihf7R7xUD9q84dMBCCU4pHebKHWhBaEGIGAlP3HDUuCuIqfSNJoqc3Bxtmv/j+qq/SPRLGPJrWT/8kmQcXWP1iHg5UcfA6BprBlG4xUo9P+rncmChojekdDcHvtMoBeKhx4wEBDHy4JCs9e7HSny4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308803; c=relaxed/simple;
	bh=M9DG2bRCzaRiQXOPCDukEnxTtO8tFrrQaLfyRuQcO0o=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Gbm64wwYmghCvmjoFxysPJvEwYhTXNOIa6Gd8qVz6ds1J0jNI5AlXWQKMVL5y06ZsuUC8xeLs6zyGLy94c1+gBGzUIkbOG6VYbC52JDD6KKk1SfBYGzTifRKBjHRQhpypKQ3rSvTkOX2QvFNp8cSU5KlZtHlB15sSkRftLS2Gx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlRra90O; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e0af93fdaaso570315a34.3;
        Fri, 26 Jan 2024 14:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706308801; x=1706913601; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8QG5AfrdWA7t9o5OrkA87ptQ9i3FCLbGpi7NMLqb+o=;
        b=OlRra90OV467gevbjjGvL20fG075OqpxLeiBXp8lhdyYyd/WeZWSzQ7okEZO4qR4XV
         XFYLA9aspni247epv96jmsD9KcsQzNUjHQ6kztBdGurTdgJNMsbUZPcqw8AMihnyL4Z0
         M7TqtgOIOQWEmIAAiYPsI00WxCXRxQMGjlcLcmU2ufPoyg2waoL4nCzqkniYdFTn+cm0
         nqZs5inZhIePSHOI/bhZvfXtSyHGw99yhrRPtYL885v0HiHs/Iynb5zn6bbpB+L7Plrr
         /v/wfVJHnhk4Kb+D1fsRzmP1scglzRNdEB4x1BuypMZueFPAsvwE3EpWyVLRGRK2uPk3
         skqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308801; x=1706913601;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8QG5AfrdWA7t9o5OrkA87ptQ9i3FCLbGpi7NMLqb+o=;
        b=JqXLoosK461XbSzsw/zb9c3klywe06RbJv5YIPZgg5Yg9MvwpLjJ1dke1e37kWQO8O
         ZfC55SAb4GQv1UT0mLXZ0ndSES36bgJZsZhKcC2SW6THT6rNWX5RU5TQw3QpyilTIExO
         noQ7qI8AxzanLINxa+ChtFqeIUe0+CMM8xG83P5c6jhfh0GZfESRy99CdnJUlJtCUBfr
         QaO+VzF0O+CDzLPx9NiwDw6/R9c05xvdLNhINic9yAZihjPalZ14Kx/TRhul0SFOIbO6
         fIjmVPsAUz9q7qe38BsElZ6iOucIX0hBnqbHTzNgzJfw5mgAxh9VI5ZVPS7r2BH6Vf3j
         JpsQ==
X-Gm-Message-State: AOJu0Yzq69W8TzzrMwmNC+4f6VvQBvntQ/d8NuHnBU7RIlDglMudygUN
	w8MpLc3siuaEdbsvAqRhjO2AFZ1luS4rAL9J4/83oYFHcsx1staZ
X-Google-Smtp-Source: AGHT+IGIx68tF4EznZB6ueC2apxIyiN8YJffgTDMb97phxTkbCltXMSsLph4b0VcNSLfT7Sw09h6AA==
X-Received: by 2002:a05:6830:10d3:b0:6e1:1570:d4a2 with SMTP id z19-20020a05683010d300b006e11570d4a2mr693010oto.33.1706308801080;
        Fri, 26 Jan 2024 14:40:01 -0800 (PST)
Received: from ?IPV6:2a01:c23:b936:a00:2153:65f5:37dd:e726? (dynamic-2a01-0c23-b936-0a00-2153-65f5-37dd-e726.c23.pool.telefonica.de. [2a01:c23:b936:a00:2153:65f5:37dd:e726])
        by smtp.googlemail.com with ESMTPSA id nh10-20020a056214390a00b00686a22aeafasm893283qvb.18.2024.01.26.14.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 14:40:00 -0800 (PST)
Message-ID: <8b40e95a-6c4f-4109-afb3-615c6d1e0477@gmail.com>
Date: Fri, 26 Jan 2024 23:39:58 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] media: ddbridge: Remove unused class-based I2C autoprobing
 code
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The I2C_CLASS_TV_xxx constants don't exist in kernel code, seems like
this was copied from out-of-tree code. The supported I2C_CLASS_xxx
constants reside in include/linux/i2c.h.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/media/pci/ddbridge/ddbridge-i2c.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/pci/ddbridge/ddbridge-i2c.c b/drivers/media/pci/ddbridge/ddbridge-i2c.c
index c894be180..2db65eab2 100644
--- a/drivers/media/pci/ddbridge/ddbridge-i2c.c
+++ b/drivers/media/pci/ddbridge/ddbridge-i2c.c
@@ -170,13 +170,6 @@ static int ddb_i2c_add(struct ddb *dev, struct ddb_i2c *i2c,
 
 	adap = &i2c->adap;
 	i2c_set_adapdata(adap, i2c);
-#ifdef I2C_ADAP_CLASS_TV_DIGITAL
-	adap->class = I2C_ADAP_CLASS_TV_DIGITAL | I2C_CLASS_TV_ANALOG;
-#else
-#ifdef I2C_CLASS_TV_ANALOG
-	adap->class = I2C_CLASS_TV_ANALOG;
-#endif
-#endif
 	snprintf(adap->name, I2C_NAME_SIZE, "ddbridge_%02x.%x.%x",
 		 dev->nr, i2c->link, i);
 	adap->algo = &ddb_i2c_algo;
-- 
2.43.0


