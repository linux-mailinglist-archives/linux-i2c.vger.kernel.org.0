Return-Path: <linux-i2c+bounces-2117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 150D086F25C
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 21:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96790282283
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 20:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA32A3FE2E;
	Sat,  2 Mar 2024 20:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeEiNCFe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732031756E
	for <linux-i2c@vger.kernel.org>; Sat,  2 Mar 2024 20:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709410992; cv=none; b=u7YQdBi+emIfFotdoyGACF1xh04d1TFS+xaWU8IahqD+31yCIB6YnPGjoE+V43sXtfxl966z7GEXF5237k0uU7/H8o6bzWySOZQmzNa7XelXZySdXJn/I6Sfz/rdF+4Cy4yLDT7oYTesIBRGLDKUgrBch/tuWn13XZjS9teYbM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709410992; c=relaxed/simple;
	bh=KJO6jpAXgs2QSowGBTmkb0nTpQ4hDFSKtHK/22GXli8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rU7otSvOnffLebCYMisNw0DU88gXcgAKEvH5NARyn/xs3UqN6gTqThFjGaDZ3t2wwmfP+JB29+VjyDVrCA7yDm13dijCiCm2X4SBtWhUW8BKfV6zAuNi5DKf/6JX41CtWKQworNAo5HNF3nPBvFVoWF0Jgqj1UWAXiZanGAgaqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeEiNCFe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so4508259a12.0
        for <linux-i2c@vger.kernel.org>; Sat, 02 Mar 2024 12:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709410989; x=1710015789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcYrz1gCUJRD3YPeO6mNprQcavoa6+JCZjI4vkSckYE=;
        b=jeEiNCFeEmRHbav5XpNdLHL5y3v2DTuiMzdj2bWat+Icll/VY1ox3Y6Zuci8+/Pbbn
         R6sqhJ2UNf6n9mxzeICNqhk3OKO+NLm3Paq2rlgXmBXDfEcVKjKYXIF7lNiCAD5Mayl8
         yXmxMDWbdAogJU/nmfB/+cw0o1I0M+fvZZ5PDawngCFwU22TZ9CpjgoIYYaoX+7l0/D+
         /2/tkyBA4KIiLitvbiYjrlEv7++iYOefJJnwNe6q2Vma0MyHfvttIBf1hT4VMIrUjgFb
         pn4YUeNSJoObO2SAxGF4AAPfx0d8gUTZk28vOWci0X5SZbP0Rqtog5TRf84FmRhchNVt
         1n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709410989; x=1710015789;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcYrz1gCUJRD3YPeO6mNprQcavoa6+JCZjI4vkSckYE=;
        b=gPAlTkFEJGJaK9E1koSgyKtERUR8qaLN0Oc1eOB/eQvzmN2adSZDyiegzplVKWAas2
         kIb6fvNuL0x30X5HnG+8lEjsTkbT/fWbnn2Si26TCoeWqQyIUuj6HNGQg4IJK2DOvRZS
         YbHOMWIuBGryVXPRgBQAnlUkM42y6+jrR4Kn+tJCFrQpvU8iWoYVetVpKx1kKjzs4mEM
         yIG/RfEtGUiQYPUGUnIlIbqnR5MD4M9AmNen59z+N0JfiISE52Girnxx/yAnad5da+Me
         ayHyGCPGdanyTXJXwGaFfIxhKtikiMQK/VgCgGJarMbl2BxVPb0FDaA2DpZuJnXvjaj1
         uTWA==
X-Forwarded-Encrypted: i=1; AJvYcCU5tz/+W24+A/l/NvzUgEQzvPZF5czFHSpOCRFqkiyHz+huotjJzXY32NegHq63ZAbrgrFcrnH85v1EcMA2YBceeGCLAw3241BL
X-Gm-Message-State: AOJu0YzSVEtM86ZqqEY1mr5nOaRZgR+KBB6XKL8dygSmmwBowbujbuwd
	BlH1DWdu/NSvSsibXFMa+y9PJkCbCQZUQugcgRBQs+SYPlFvDyC3
X-Google-Smtp-Source: AGHT+IFAYcnhHxPBTjelUtEEwNPjdheGYepfHMPC/0USMiyP9BLJLlbVND8XfvYy1VVfwYBVKNK+8w==
X-Received: by 2002:a05:6402:1d91:b0:566:b09e:8d24 with SMTP id dk17-20020a0564021d9100b00566b09e8d24mr3078788edb.12.1709410988487;
        Sat, 02 Mar 2024 12:23:08 -0800 (PST)
Received: from ?IPV6:2a01:c23:bcce:a400:2519:2036:7f0:6005? (dynamic-2a01-0c23-bcce-a400-2519-2036-07f0-6005.c23.pool.telefonica.de. [2a01:c23:bcce:a400:2519:2036:7f0:6005])
        by smtp.googlemail.com with ESMTPSA id v26-20020a50d59a000000b005643b41d128sm3013130edi.5.2024.03.02.12.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 12:23:08 -0800 (PST)
Message-ID: <636a3ac2-b85b-4b6d-964b-9c9df4c29ab5@gmail.com>
Date: Sat, 2 Mar 2024 21:23:08 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] i2c: i801: Call i2c_register_spd for muxed child
 segments
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
 <cf8058db-03d2-4d47-bc39-2645c3d42e10@gmail.com> <Zdxprq9jukWj0XJF@shikoro>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Zdxprq9jukWj0XJF@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 11:36, Wolfram Sang wrote:
> On Thu, Feb 22, 2024 at 11:25:43PM +0100, Heiner Kallweit wrote:
>> Once the gpio mux driver binds to the "i2c-mux-gpio" platform device,
>> this creates the i2c adapters for the muxed child segments.
>> We can use the bus notifier mechanism to check for creation of the
>> child i2d adapters, and call i2c_register_spd() for them. This allows
>> to detect all DIMM's on systems with more than 8 memory slots.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Yay, this looks *much* better. Thanks for doing it! Sadly, I can also
> only review, not test. Let's hope someone can step up to do the real
> testing. Maybe resend it as RFT to lkml?
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
Ah yes, I'll do this.

