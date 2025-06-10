Return-Path: <linux-i2c+bounces-11318-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2881AD2CD7
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 06:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D20323A8389
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 04:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508CA217657;
	Tue, 10 Jun 2025 04:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIgBgczs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFEA170A23;
	Tue, 10 Jun 2025 04:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749530726; cv=none; b=dv5BHcM741yQ8ZIIF0e8MJLOEEJXcAwL4WB3s76X0Okr5BsxcCAp7zEQAUrKuDXfLwUel0ZCpGumpfVvCZQ/svoWMQBOyVOKkSu6bRFpnZgejwUJp6lKGOSDjkIAGmXIHW6jT/imA3PZQQx39ne2+/VntKnmRi+f1Q+avGNatMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749530726; c=relaxed/simple;
	bh=yltZ1Vl2x0dJiqzIghjPsKkjp790cirFxMQUzcnSh5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSNsvoQfCayczDrYyGZlk9who7JlwBi6BNnpqUckbU+ZXey+33+6DBXXM2JK82+lHeB/AkvNijf98m1BJdRUOvcU97+Ga4SUXHWpa3ISnNzVgcMoha5MxbZWap2Lzz5Ycd0KgFBap8PVTQbKUbKxegWCy3eY2ZdfwfVhFCsa/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIgBgczs; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234bfe37cccso61144775ad.0;
        Mon, 09 Jun 2025 21:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749530724; x=1750135524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/Et+5TuD3+3/eVjp6CpBE4hmFK8ASCNFdhg+aniT+Y=;
        b=TIgBgczsAdwE3bz7SlubtzEF9d/yNz5TVsCsz5EGPLYnPhPFaXHwBIncuTJzSta0JN
         Qa9XwIdOu2s6Ks36jWt7IbW8h0qMp7iBBYmETo2YG1ISyd03wYMgCyScdJ+ezTWPg3fm
         WacAtFL/z5g411Kh/vkSfRTPfaWbzAKgas4WqudLdR4ETZ7oWUZcMyjxmDXU1QctwbMp
         +mk1JTmcxvW5liN7LVJz/uXrG20YAjPDWD8kEryuKiacFMtnzDNzcOTsGYHKKCrrYjj9
         9aRxRuOoQfJBm6lqo3ZQ41u+vVznnHzzVPvWvz7SwtcItHeyMtfyrDQfXleqFSq+O7cB
         7XUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749530724; x=1750135524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/Et+5TuD3+3/eVjp6CpBE4hmFK8ASCNFdhg+aniT+Y=;
        b=sgED2s6yUmsxyK8db7m/6rbDwZzRjxagzCuf2tajK6xIogV5KHyPmdYz50vh9+QUD/
         PvjmFkgFtB0Dips4xtdSgxMW+BlZTIgFZsvRcsdwrBQTaslHWb4t84KddQU6rLa+eHXF
         L4lf8yPfj2lQ5UW7MoslILmauOo6h8LOe5RpN8pAgGYe2NUGtIOGo68FP2mSKogTn15Z
         O89Yxah34O9e3PMJ4P3nxMrnZaYUOHNNnOvevfU6/v6lB7WLMDegRrVqy3RKeVFC3orG
         u1PXkzSbIUVRwlhFKOBwLfHeSYd7Gk+9ZgdSQHc1Q7REGkgROHSiZOLr16EnlA/Ne7l1
         spBw==
X-Forwarded-Encrypted: i=1; AJvYcCUCPcFrBmS6z0K4mMGPjm2Cpw9evu3RmNYdgsLmRkhHiqbAxSPyWnoPUg8fWwFFUuVm3hEmWb8n9hxnxkli@vger.kernel.org, AJvYcCXgEPAepYoH/CPsNKidY3to2LNRfwNdZ+XYZy80XcJnypDVj0k3v2ihrHMFQ8s4WX8H/s+bfELW98J/@vger.kernel.org
X-Gm-Message-State: AOJu0YxC5EE9GeY/ywObpgLWHYcnN5IWZwRzu6VCQhPc4dTljWJNAZtY
	9zIG2yjh2ytnydaTlOOEYvacQComVVPJMnktkFo5kWGZ0yquy7tBmnVz
X-Gm-Gg: ASbGncvf9/L1HUgX8nVkCtNe2Zf59NvGMxa19lnaap2rXeKow0FFG/U5WEnI2aAVSOx
	Mt6C8bY0SwfyRenRCJNke6zNjOZ/NZfv5YpTuKk7AfT9lP/tGRxhQzeetqrRm9ErGRwDvp0oQ64
	dR1Y3wIS6HApPckP2358M6IrxQpgYoo3880rcvzg+qLI0/hR1qNsZFIP6lJB4bDpANJSnVYhM8O
	ABmzY3wqbEFEEfwDcFQnpWVpPfoI+PGv8feAD1k+MdDDLSKONLSeBQBLFH5UxrF8oozY1pgnk/a
	z/+dgfsXrGmU68LD1L53sy3tBPc2zV2wWvQn/LXDe8Z9RuwCxVN1xsyvVMRISWZ7zwTVlnF56T2
	omk3c/cE6cw==
X-Google-Smtp-Source: AGHT+IHeRu19sm8U6zfByMrOVx2wCrnbnafwzEKk+Sxwil3JgYJqscTx70zWuYMZYSWgk7wrVdu93w==
X-Received: by 2002:a17:903:22d0:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-23601d247demr212907365ad.21.1749530723858;
        Mon, 09 Jun 2025 21:45:23 -0700 (PDT)
Received: from [192.168.0.119] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034109c4sm62853365ad.210.2025.06.09.21.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 21:45:23 -0700 (PDT)
Message-ID: <81f03b76-abd5-4803-b8cd-679013aed359@gmail.com>
Date: Tue, 10 Jun 2025 12:45:19 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] I2C dt nodes and bindings for Apple A7-A11 SoCs
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-i2c@vger.kernel.org, asahi@lists.linux.dev,
 Sven Peter <sven@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
 Andi Shyti <andi.shyti@kernel.org>, Janne Grunau <j@jannau.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
 <174950228622.2915605.1412644681389156564.robh@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <174950228622.2915605.1412644681389156564.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Rob Herring (Arm) 於 2025/6/10 凌晨4:53 寫道:
> On Mon, 09 Jun 2025 22:56:17 +0800, Nick Chan wrote:
>> Hi,
>>
>> This series adds the device tree nodes and bindings for I2C on Apple A7-A11
>> SoCs, since the existing driver appears to be compatible. The drivers for the
>> attached Dialog DA2xxx PMIC will be in a future patch series.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>> Nick Chan (8):
>>       arm64: dts: apple: s5l8960x: Add I2C nodes
>>       arm64: dts: apple: t7000: Add I2C nodes
>>       arm64: dts: apple: t7001: Add I2C nodes
>>       arm64: dts: apple: s800-0-3: Add I2C nodes
>>       arm64: dts: apple: s8001: Add I2C nodes
>>       arm64: dts: apple: t8010: Add I2C nodes
>>       arm64: dts: apple: t8011: Add I2C nodes
>>       arm64: dts: apple: t8015: Add I2C nodes
>>
>>  arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/s8001.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t7000.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t7001.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t8010.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t8011.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t8015.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  8 files changed, 589 insertions(+)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250527-i2c-no-t2-2f3589996d14
>>
>> Best regards,
>> --
>> Nick Chan <towinchenmi@gmail.com>
>>
>>
>>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.

forgot to include patch with the actual bindings v2 should fix the issue

[...]

>
Nick Chan

