Return-Path: <linux-i2c+bounces-7602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 648809B15CC
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 09:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C6331C214A5
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 07:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22A118562F;
	Sat, 26 Oct 2024 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1OpSz5m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBCA41C69
	for <linux-i2c@vger.kernel.org>; Sat, 26 Oct 2024 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729927269; cv=none; b=R6U19d8HPIZYwnt9EfqMLxDqdNKOCQOsdbrQ7ouddRTPvRMHWL+U7iQQ87dxj7WrdaKYROYt38LiCVpkPD2Do/3PFTFw0GXiyVloLagJMW4ovnL6tpylBM7nAlslho0ZGVh1ZZgK7izvaFEzJvnqbNwrg9arXk+EtyYEXVSvJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729927269; c=relaxed/simple;
	bh=xRWUfV4bMhGm5rXBJ3/cfEQLUElemKl2Z3XinKeAE4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VW3/3tZnkrO3W9P3YoON5IdY8KloMORuurXCBY4N7WiIKHHdGsAfLyMTQ3kwYGg6wj9KjERMkovY1gj4/PK0lciWwW9ey3QTC07Yz+Tj+73348xnhTP77j/PN1wZ5il9xMb1yIpQYpWoaD7QtX7A8uRP7TGuX/thc3tc+sqrA2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1OpSz5m; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d3ecad390so2771283f8f.1
        for <linux-i2c@vger.kernel.org>; Sat, 26 Oct 2024 00:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729927265; x=1730532065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HPedWigh3naXCh3blfYtrbUjkwvZYaZCeb63vBk9Lkc=;
        b=i1OpSz5mOAIOtp5aXHqgupgAa6Vgklo5yO9XivszrZGiMihjujzNG2A62vdJ5ruRCX
         9fXu7QSCc6Hz+yNJ86gf1BgVMTwps/PuHbt8lYg+L25chv+oh9BOaC6+e3xstQxhSDd3
         nr0q/Veb7dGpn7EYVGlrpTa8YR3U9/nbVPXofXFYeUbJPhGt8dxtO6VcUdHT+oqE4E0U
         WHjh/5k8YFr2eQOWTe3O32kokX3De8NnyXXTfNvE7XEBhDG/DfeaNH1l4sghX2qlKTPX
         Kj8sA01Hzied7e8y3b+rXYIEIXzhoAMH8ljoYy9FVb1Zmm4VsT+Dzx76bovTly+U1MgM
         YEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729927265; x=1730532065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HPedWigh3naXCh3blfYtrbUjkwvZYaZCeb63vBk9Lkc=;
        b=efAxnNvAaFZis8MccfspJcAYzqTnpPdK4zQyzknzgnhPIDMITgMSKFhhLKdHh3PNKg
         h6GtEOnHcIgqk+a6IldzK16ZCxTITixDvy+FeaDOrCsIbYOPg/a3GxhMXs/akf8MCssZ
         oU7PUyKjGmZDuUNyHpb7KH3HZX7izVF0ukqUR3izHBL5KgsnTBDuvWhplO4c7WPWs8V+
         NXZizTTNNHOD4oHJ8db5NDqOSpcoiForzGh/WKZ6FVhrfRjZDGhDuIeULJhXiM6cqS9c
         nROSJssDnq3f4L3H04u3q9RpM6s+vaCIdPUfXgy91BUL0/cIfY8tJiQxq5wPQO8gKh4x
         qWXw==
X-Forwarded-Encrypted: i=1; AJvYcCWDjpkKA2UxXU/yiblJ0MuNUCn91tG8UEWpqzkPr8cfGLEaBajyY5ljGdiKTx4ekTVZgqRuTVlxcto=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCYykFWFzeDM8MMEofrkODieSsz3EWzR85/GAxPzupEh8kgevp
	40p1iw1GsPUcJoqNn1nDa0C3+oREjAehd8YSiXJfgVtNmvSLkJgp+iJdknCqkSQ=
X-Google-Smtp-Source: AGHT+IG6PK2ZTy2JhkgdSJ0N8HMtlr8YOWZIDu1LZe0bSYjtnk5No8OeJmfP2aH2IOP2aTxU73p9sg==
X-Received: by 2002:adf:e611:0:b0:37d:2e74:2eea with SMTP id ffacd0b85a97d-38060ea6542mr1738098f8f.5.1729927264600;
        Sat, 26 Oct 2024 00:21:04 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b3af02sm3529093f8f.25.2024.10.26.00.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 00:21:04 -0700 (PDT)
Message-ID: <d8b903ff-4a66-4d9d-8bad-099ff9d83a54@linaro.org>
Date: Sat, 26 Oct 2024 08:21:02 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: core: Check read_only flag for force_ro in
 bin_attr_nvmem_write()
To: Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20240713154001.107439-1-marex@denx.de>
 <c181a856-164b-41cf-b512-b8dba3247ae3@denx.de>
 <d2b8f767-c5c9-409d-a6fa-1c101b90c9fc@denx.de>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <d2b8f767-c5c9-409d-a6fa-1c101b90c9fc@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Apologies, some how I missed this email.

On 26/10/2024 00:15, Marek Vasut wrote:
> On 9/25/24 12:42 AM, Marek Vasut wrote:
>> On 7/13/24 5:39 PM, Marek Vasut wrote:
>>> The bin_attr_nvmem_write() must check the read_only flag and block
>>> writes on read-only devices, now that a nvmem device can be switched
>>> between read-write and read-only mode at runtime using the force_ro
>>> attribute. Add the missing check.
>>>
>>> Fixes: 9d7eb234ac7a ("nvmem: core: Implement force_ro sysfs attribute")
>>> Signed-off-by: Marek Vasut <marex@denx.de>

Applied with CC stable.

--srini
>>> ---
>>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> Cc: linux-kernel@vger.kernel.org
>> It seems this bugfix is not even in next, any news ?
> 
> This is still broken, bugfix is available for three months now, but not 
> picked up. Any news?

