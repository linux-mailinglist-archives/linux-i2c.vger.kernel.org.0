Return-Path: <linux-i2c+bounces-12203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2B1B1F97C
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 11:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DD941899AA9
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 09:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6DB23B610;
	Sun, 10 Aug 2025 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0ZXXLbq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D6F198E9B;
	Sun, 10 Aug 2025 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754818318; cv=none; b=gk6KJc7uaGfVm2/R2sO4qabeo3drzvqRrff57jEvUSXWTuGLYR1ktHI90w49YAOecA1zhNjfrSCWDEHU8ozkCmXBNjTUDcRij6+Z0h0uuXcgLlUO92KSU+tOEvY3ER92NN6f9ojNYAoX3umBl7F1MVJUP4t4mdvdem0EftwBxwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754818318; c=relaxed/simple;
	bh=h2G8SsP6afRXPyGZBJmneXv9Eavg+d3o0Ug+i1innPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lh/rcOdBodJHMpzQc9Ap0Iu0u6MfP4eVErHfF78sxX+atmNfs+Gv80zKNGfC6+hbkzpK6kMGjwU78EGW6Sgfij3MgJQGqkxmhZ8Avj4hpOXMB2obgInlJeiV5GtOK/Czcv+OzWaEJ6ja4aJIlzBKiuGRbMLuxhJ5eCNu+yvTD9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0ZXXLbq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-459fdc391c6so8377885e9.3;
        Sun, 10 Aug 2025 02:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754818315; x=1755423115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u14rtgFwEgrE0ibL98Zaja2s4eUTO1/wcJduf4UrEx4=;
        b=L0ZXXLbqUNgTIJgcFHlO4N5S3+qNhxrUzNZew9N2V4P5wLebSXDvpnWCNoMrIvwOG6
         z3R7O0Dh0gVbgWScueKVpyrqZg+P9qWTVLuGXRuI3IL/El5ATP926lxNxYreBgRhDwW9
         8ARrx7yvCPlAMW+rTe2OqXBSYwDBLN6h4Z0k5tis8qL+LVhUgyX9WNRDg8g50Tm7CjeZ
         1Kb7YjVKArhQjHjZrAyNEB4gNGpA0DAyT6i28U4a8c3Ee32hDWFZ4aPf7U3LuEfkGsQ+
         WbRZoZXSI1Av905CPlcDOeIcW8h8rVULtNr+gn4zbDu5UTNdiEvK94Wia600NQTu+3eZ
         W+Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754818315; x=1755423115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u14rtgFwEgrE0ibL98Zaja2s4eUTO1/wcJduf4UrEx4=;
        b=c4OS4HR1K0I8VYydHV7eFkRAe5MaUmXsrzXDRvQejLyTmeAPasy4svWPqcY1TDWk+w
         ZR/i++1jHSss3TjI6LHJXgl94kHqR2oBtcgih4/2jUwcTCUV8CpQSxdMyGNz1eZn99WJ
         Up78+q9LRvx6T1fS82hS7o0Lo9EzPecNyGFkbuYrO52aCXThKbrudNGDpZyr6cbrp/su
         avBBJYQdvoouvvLF/c2Y9SigcnheF/bYcli5EzGTbFm/UCTgTTL/bOSQzXYEmEl620yC
         I5muHznGhew1tcPx2uJliqIbdzYrotgdn9f/UX08E7Nqm88OA9eeSv/1TAR9wsiD184i
         3GNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMOznNfbKCbmN6GrxCIqcfUKuOxGmRnVNTZteGJHhmA42slgwW3wzDJv8p8r3kc3P+/8Hxft8zxGct@vger.kernel.org, AJvYcCVmBzm6N+JK6gAc/TbdB1E9zKadQq1q6hkBicAf3LYFoF1LF8qm7h5Xz4VoL5sFjD/shCNm7GpMCtdmedUy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0TeqR0w8TsdIsF8aRNvUa268X2cItXXTFTzqT+PpKGuLws7iJ
	h3Vfa7QFSskmYreud/auV3D+9mIe8hk+crC0gGxCGQeW9HvcCd80xXsb
X-Gm-Gg: ASbGncvgDCRe1EAeolrvAWzluFvO4kEEoKI+BmUCQoydnWJ9svkOgaIULSonceziYsO
	gUKI40bi2355yuyf6ETu12+/5mw42X0g17fk/sIubJewVSf5rBioj5U1A8VWL0DBF7WdGHr5r0u
	tXmsf1d96A+jAeYqCH/U+LjStoQGT0IgeGvWszrabk8ec4amPwH5tcyJ0yjNT1fFxDCYh+qmZn/
	+3DTkXigRC/crrFTaG0i6BcjevcUWQGY4ORgefkQ61aPfCT+gBqihGd0Q0eWiBl/StNvtzWp990
	Kab9vixB5XjC1nYz3sy8GTm6WHzyTtIx5oCCftLQC33r7oK8sNII9DSMapRMcQ6zdjx0pxyvj+q
	YGOwk5pgHVCdP8cx79Mr3ND49deHmY0yW0GyYKAljxS647FEJ4W2ZCBtxK3jWWQ47kOKb1jfgyU
	PIPYv4zrAcFzdX7d4bOMxm4w==
X-Google-Smtp-Source: AGHT+IHPsiQ1NQMEW9rc47kReawceS6bb/ad9/yp1s1myFrHWpSe48jc86Bnood9Avsd0+OeaLA3ew==
X-Received: by 2002:a05:6000:24c3:b0:3b8:d4c5:686f with SMTP id ffacd0b85a97d-3b900b83c71mr7889832f8f.39.1754818314638;
        Sun, 10 Aug 2025 02:31:54 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f12c:bb32:3d75:9109:b5a7:a261? ([2001:9e8:f12c:bb32:3d75:9109:b5a7:a261])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm37918483f8f.70.2025.08.10.02.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Aug 2025 02:31:54 -0700 (PDT)
Message-ID: <d01e5498-b2b0-473b-b8e7-339825c45043@gmail.com>
Date: Sun, 10 Aug 2025 11:31:53 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/11] i2c: rtl9300: remove SMBus Quick operation
 support
Content-Language: en-GB
To: Sven Eckelmann <sven@narfation.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Markus Stockhausen <markus.stockhausen@gmx.de>,
 Harshal Gohel <hg@simonwunderlich.de>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
 <20250809220713.1038947-7-jelonek.jonas@gmail.com>
 <3644932.iIbC2pHGDl@sven-desktop>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <3644932.iIbC2pHGDl@sven-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10.08.2025 09:13, Sven Eckelmann wrote:
> On Sunday, 10 August 2025 00:07:07 CEST Jonas Jelonek wrote:
> [...]
>> The current implementation of SMBus Quick operation passes a length of
>> 0 (which is actually invalid). Before the fix of a bug in a previous
>> commit, this led to a read operation of 16 bytes from any register (the
>> one of a former transaction or any other value.
>>
>> Although there are currently no reports of actual issues this caused.
>> However, as an example, i2cdetect by default uses Quick Write operation
>> to probe the bus and this may already write anything to some register
>> of a device, causing unintended behaviour. This could be the cause of a
>> recent brick of one of my DAC cables where there was a checksum mismatch
>> of the EEPROM after having run 'i2cdetect -l' before.
> [...]
>
> Nice find. I've actually observed odd behavior after/during probing and 
> attributed it only to the other problems (especially the low timeout + missing 
> check) we found and never did a deep dive to figure out what happened on the 
> bus during the probe. Possible that this could be related.

Haven't actually described my issue in detail in the commit message (may add
this in the next version) but it perfectly makes sense. Quick operation in the
driver passed a length of 0 to config_xfer. Internally, this leads to a value of
0xf in the DATA_WIDTH register meaning 16 bytes to be read/written because
of:

(len - 1) & 0xf

The register value obviously was assumed to be 0 by the hardware and data
was completely zeroed too. Then it did a 16-byte write of that. Unfortunately,
the EEPROM of my DAC isn't write-protected so it was written to the EEPROM
causing checksum error on next boot (was able to fix that though).

> Reviewed-by: Sven Eckelmann <sven@narfation.org>

Thanks!

> Kind regards,
> 	Sven

Best,
Jonas

