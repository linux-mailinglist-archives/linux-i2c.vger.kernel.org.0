Return-Path: <linux-i2c+bounces-7884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0360C9C184F
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 09:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DE321C22BC1
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 08:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9D01DFDBF;
	Fri,  8 Nov 2024 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uuGbqETA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20221DE4D9
	for <linux-i2c@vger.kernel.org>; Fri,  8 Nov 2024 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055661; cv=none; b=f9XCT1kmT9BSs7sjjtbzgBrXCIJyrRvygLt0RP+wlzkRfuVLVMjm0UQLjfPT5NN8QRmtiDB2YGetw8CmO75y0tZTWPo95lCFHyXj9rfpdKqVeUNBSgnh/4NmnPkEOGjz93SETv60bULguNLizprRiEO06HKizCAGHW8IBWDQPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055661; c=relaxed/simple;
	bh=Kw5vsWimu0DEEJoOvAz3DPc5YUBq+0ME6wv92iHkafY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k2GLdm1xGX+rtyAc1ZRlf+RBhaboSi3BbB/PXlYdfAQJOIHQAiZOduRmWEiBVug6qQgkoFyalfksa/cNmg4Zf+9rmS0lDi9FHYLIkomFqqQDKDos0Cz2ManMNMgaQeVH4HmgpNKSyKyC6REbAPWHosd9LYVagAwuY7x0H5gq48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uuGbqETA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43158625112so16992725e9.3
        for <linux-i2c@vger.kernel.org>; Fri, 08 Nov 2024 00:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731055658; x=1731660458; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9AD8kCT+nT+KZ2MXqSRYTX2q6sk9d7vkvCTtFjV2TU=;
        b=uuGbqETA371S6SHpohC0xK3YcB5FlvBkXXCwMnvgs2IxyBSKc/dM2wgbrbxhtSV745
         +SdrlLisixi8yis2r3mmxfRxlTNeGxNnAvyvorKa21ue2p0IvieF2sKG3EAeJxxwsNLX
         uD9kRGbXKAXIcu9qenHA/4xF+CMmWHIQsuWbJ52fkDZU7+PkXcKtfCtvdAohO7dV8lZM
         vJOKw2sLHfp/Pdj827FjGwckhAL1Y0s/NMbYMfMMjS15rfIMwUmoAn2efOLku/vGf/ZO
         3i7yM7aVOQNbBGTt8yImhG2/ueR/jeGgiFhPPn2nW80LrY7NOU8IW5vSDByrXiVBFtd3
         ngJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731055658; x=1731660458;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A9AD8kCT+nT+KZ2MXqSRYTX2q6sk9d7vkvCTtFjV2TU=;
        b=q93w5RYxRokJ/1dMZBBpBhfy1zuQ2PcFGDxVgh1sadq9T42fs6Mz5+p+lkGI3gfXsT
         OAUq2KSxkIGGtuy3NOuAK5+7Mms8DxU41dcMqmwfAxBFwDZfyaWmrv+WBlSmI+W3p5hZ
         Gs2sbWsVx18s8xUwpWo78ZIvMQXp8s4mrEapVIpx0ZnRpBroWZgVpITWoloI+DcN0Viy
         33fP96/d4oNfOXJTNE/9Cklia1E7A2ZsGZlZryeBW1KvtQBudnZ1ZzFn8rwaupd6ct1T
         DGpplQ0PonB1z6Y3QQoITbRlMMIiTj06V7JgSwhAbyvgXgedVat2d+5yhOKtGU5YEwYu
         zhlw==
X-Forwarded-Encrypted: i=1; AJvYcCUp288F8HUcqtDCkfOjv1N3eqMwIBvCiXqzcQQVbtsyyPsB2kukAEr+n4uCXuMn1WBDuqF9ELhg5L0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvphVLPamOunymEKPXZYkAHHjoXyZBpgxjfRmd0qZeHImexibP
	kA25SlAzU0kTq5Ib8/8BKd9Can1b5JjrmtqMbwFJLGVhf1Cx4alL3x88uvpshsw=
X-Google-Smtp-Source: AGHT+IEGxCmPOWLzM0bzj/TXKrnSrKDuB1/okZ3cbyLHE4zCDXwSir+KcCmZbuM3Pt/+K5DFnkIxNg==
X-Received: by 2002:a05:6000:2aa:b0:37e:f1ed:67e8 with SMTP id ffacd0b85a97d-381f186dd5cmr1454470f8f.35.1731055658002;
        Fri, 08 Nov 2024 00:47:38 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:ecfd:9f8d:62a3:6ba8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970e23sm3930442f8f.18.2024.11.08.00.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 00:47:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,  Jonathan Corbet <corbet@lwn.net>,
  Patrick Rudolph <patrick.rudolph@9elements.com>,  Naresh Solanki
 <naresh.solanki@9elements.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
  linux-hwmon@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-i2c@vger.kernel.org,  Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v4 7/7] hwmon: (pmbus/tps25990): add initial support
In-Reply-To: <df0db75a-b5e1-4bd8-8a59-de85b0a77fa5@roeck-us.net> (Guenter
	Roeck's message of "Wed, 6 Nov 2024 10:59:11 -0800")
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
	<20241105-tps25990-v4-7-0e312ac70b62@baylibre.com>
	<df0db75a-b5e1-4bd8-8a59-de85b0a77fa5@roeck-us.net>
Date: Fri, 08 Nov 2024 09:47:36 +0100
Message-ID: <1jpln62jtj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 06 Nov 2024 at 10:59, Guenter Roeck <linux@roeck-us.net> wrote:

>> +
>> +static int tps25990_mfr_write_protect_set(struct i2c_client *client,
>> +					  u8 protect)
>> +{
>> +	/*
>> +	 * The chip has a single protection mode, set it regardless of
>> +	 * the specific protection requested
>> +	 */
>> +	return pmbus_write_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT,
>> +				     protect ? 0x0 : 0xa2);
>
> After some thought, I think it would be better to reject all protect values
> other than 0 (no write protection) and PB_WP_ALL because that is what the chip
> supports. Something like

Since operation would not be allowed, it's maps the closest indeed.

>
> 	if (protect & ~PB_WP_ALL)
> 		return -ENXIO;		// or -EINVAL ? Not really sure.

The command is supported but the argument would not be, so -EINVAL seems
appropriate to me.

>
> Thanks,
> Guenter

-- 
Jerome

