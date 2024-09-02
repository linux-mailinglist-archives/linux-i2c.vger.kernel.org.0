Return-Path: <linux-i2c+bounces-6008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85713968E0F
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 21:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAB5D1C22401
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 19:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF022824A3;
	Mon,  2 Sep 2024 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlDmzTl7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B3710F1;
	Mon,  2 Sep 2024 19:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725303628; cv=none; b=gVZ6AArezYEoy7QgLls2/iFwBnhBg778NmjNG9LiGw4bFIXvc3nQNHjOzrMhzTLjE2Muf4WE+o7tNQuXDANqAfswRg9u8aeOOTFC2/BdzPpK97OXns5wI0Vj1tL3SRyaloRvJvdnbbABOH2Up2mhQyz/H/areRXL+C6o5t4ESdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725303628; c=relaxed/simple;
	bh=YKGvuhdo4fC+73jrBTfa+covf+V3Qnnml9Jc8dPUqOk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=B2Fajy7+dSRKdsNiJKDykehY37fzDcHlNdxpR9X95ZwCh2PWPVAH94QW05394fkYx19sohgKkt9OmXMZnKf/UDN78iE2eI/kZ4sCnyiLljmNrrTffS8Y5fDa67z57T6qm0867QUB6ezDmYgunIhfVLTvO5m/13suOtFpKA2i3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlDmzTl7; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a869332c2c2so878966966b.0;
        Mon, 02 Sep 2024 12:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725303625; x=1725908425; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqjRbFhN0PRiQOwi/yz07AgsuoohB5nPt9A6oOIy77M=;
        b=DlDmzTl7YU1WM5WKkfrGRPWyNbgUJOi5fes6qLUAr0VURNKIRrK8q77/EhYbMc3XFl
         hnshPxksSw8yCKVj7luOMMvMe7Zgj+B4ggyj102cYEQuaK6Ac5Ahzm4Wj7WqBITysGbF
         kiohEToDQe6oL479Pe0E9CG6HytCM4qQ7/cZIyCLuKYgSWq2XvTg1QHlZRWAK/5i+gWs
         +VFaQS4T/Gfb+istNTF4Ix88f539pQH54TwlKElHQXnwWNzXgxeruBPovTrH09tzoyV6
         A46nrSr3a8IELzzp50LAMj9m9KtH4E3acbiqCiZIpc7/CB1wYDj5vBhsc9rZJ+ThSOr/
         p4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725303625; x=1725908425;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqjRbFhN0PRiQOwi/yz07AgsuoohB5nPt9A6oOIy77M=;
        b=jN8RTdCxLD7rzooJ3MWE7DvXpIAMYgUiBffjamQyTdjvhDPVcElvRms5cOLWVjvVYO
         JbmMhw5R+O+KyzVjMzMPqIsElEYH386OQWaN49gL9GjS1MBkI5hC7H2u4vZYAit7HTsq
         xC1w27e6PbDTHlhaTcEG6akxzqpvOFRSykm8wcQLX7vybop6Tppm+vMrtmumFFxu4sM2
         gbL/00K9diswWYGam01cl59GUbkQINTGVDD67hiraJn45UxmogYjvuj3UavbKESFmFcc
         2uCsdW561ZiDLLcUtPkV2PlZ+7BhVFLz2Fvr71x2Ho2oaX+MZv/QYBLt6KV0ScLFYOa6
         aMMA==
X-Forwarded-Encrypted: i=1; AJvYcCVBWAziQ5pwipAaYrOdiwkQQzqJAgzxqd8lFzHbR7jqtc7N3ADpoTpNx08oTjDLcWXzAKrAm2cZOP4viwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGgOV82KKIBd49+f94RwW1DvU79isc3gJUNv6qsFpiq+67EoA
	fEqim0iJXQsphF1O3VlvPRBDkuM4mZ3DcP+uTiWCKPJIEUinV+Zx
X-Google-Smtp-Source: AGHT+IG1v/UszOK68Lz/I82YcfsZBboRZW6lpXCY/r0AmNhETVGrq7RxkguTuy1jHHk7rZvT7MSmlw==
X-Received: by 2002:a17:907:3188:b0:a72:4207:479b with SMTP id a640c23a62f3a-a898231e941mr1457723166b.5.1725303625033;
        Mon, 02 Sep 2024 12:00:25 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bc00:6b00:fd2d:3fc2:a936:4a81? (dynamic-2a01-0c23-bc00-6b00-fd2d-3fc2-a936-4a81.c23.pool.telefonica.de. [2a01:c23:bc00:6b00:fd2d:3fc2:a936:4a81])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a8988feb453sm590895466b.36.2024.09.02.12.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 12:00:24 -0700 (PDT)
Message-ID: <4660a46b-9128-4407-8baa-f257245784a3@gmail.com>
Date: Mon, 2 Sep 2024 21:00:25 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] i2c: core: prepare dropping support for I2C_COMPAT
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I2C_COMPAT has been considered deprecated for 15 years now.
Therefore make it default n, before we remove support for it in the
near future. In addition warn any potential user of the old ABI.

Heiner Kallweit (2):
  i2c: core: Switch I2C_COMPAT to default n
  driver core: class: warn if a compatibility class is registered

 drivers/base/class.c | 3 +++
 drivers/i2c/Kconfig  | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.46.0


