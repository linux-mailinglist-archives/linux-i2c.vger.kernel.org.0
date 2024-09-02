Return-Path: <linux-i2c+bounces-6012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41080968E8E
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 21:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E505F283734
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 19:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E5F1A2640;
	Mon,  2 Sep 2024 19:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSFzcA+n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5761A3A84
	for <linux-i2c@vger.kernel.org>; Mon,  2 Sep 2024 19:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725306845; cv=none; b=jyMDsS3f9Fo4Nh8CDNTCOvmNVw8JeSdN/LYCKJZVi0o92L5RyESKhIRQugxtlOZo4mr+rtC9jXFrlCL4WGvbaLT98SHHWpmTRlSRaLTDQEBI5BWEFFe2B2Bt8vVsdBz9H2QKU+PTHi7nzL8s5mcVrNTjBORtzt9V8jf3PohnHtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725306845; c=relaxed/simple;
	bh=My6nhz3qB/2erdIqqLf3mj/Hq7aPwpGCSKFLSHapIXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Pnarqb4DiXa9jbsza1ASv9+PkJkLDuOIB7W2GCp8mTcu/CIwvRP0DTDnkh7Ftisc0TuJQzcfD+AWhlK5PHnAC0FolU2bBVmTwWoqrxSRcj1sliPNTg26fRbrQ8ukDs25S5qDsZJEdeh1CgFhuNegfdKxWENwGcG6Yj/8Pt7/q3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSFzcA+n; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a869f6ce2b9so498231266b.2
        for <linux-i2c@vger.kernel.org>; Mon, 02 Sep 2024 12:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725306842; x=1725911642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug1LCjX3GMRe0JeKoYLNLz4o2MyXSBIoRIIS1ICKDSw=;
        b=CSFzcA+nw4e19NQn9DW0S2WSmHgS7HtLRgsR3WnHor+UevXlpF8tATEQt9myRx6yjQ
         ZLpIooYLE3YRABk9GRJE87jIeODF/cWL4FVr9ZtOSyVXZjJbuLD4/c1Bz2CW/W9hsoeq
         DMSqYvdHCex2vaMHIV0K3/OytLloi6af8dd8zPoFBPb+GhPptVhA2TrHH3XxUDj8RZSw
         b59GYltShMpIhks6ofQJHCgMyupTbHeOc3rVTVUBdMcecza3Y6PVhRUu6nu/vcXUOsnO
         LF0BGsDnxveUF54g88u26mxxzZGk8Af5JiGgMNUxDQmYmQB9QlfDeYCt90yjurM1DQ5Q
         +4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725306842; x=1725911642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ug1LCjX3GMRe0JeKoYLNLz4o2MyXSBIoRIIS1ICKDSw=;
        b=oLF5ucrM+rgVWbEOFlFOOF7Z1jYze1YEKyO0NgNeiJ7C2xrbYUC3x+nHpq+7U1PaKt
         X9jDRKHQ4HD371ZIvUkUHQE1X698i0i7bbb1rK0iVombmkFNJnjLzZGm9tV7YT8+Tz0M
         tXTlnxDw5Xvpv0D+cl162eb3Ovh+OuLTxVpDTkwWTmEIxGi33BfPxfSXjoK1hrn8GScK
         0rhkVBoBStIHz3IB0WZVyaY+qhCGFRMvKdmiEcYhwZxiBR0TViGNK6eghqJmxOHa8Ct4
         IEXo/MfcFObskqtI1k59s2O+Cu2fZZeTU9zFO//K+v0eYw69WAAc+u8Nywpjn3ln63qa
         uEGg==
X-Forwarded-Encrypted: i=1; AJvYcCV63ydlxY/fiAq3ExBDfL07uO2JKt8daLXOkZt0zDheA/x3e/82O6mM8RNrd469217cDO6om3uM+Wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM0XIk5YemhE/8rky9fUTqidRnmYpegcap5BqooXJGoZDiMOTK
	IxBMB7mkv4/INoQ10fLU547+JsW2ozpMIp146YR3k4UmvtXj/9RE
X-Google-Smtp-Source: AGHT+IG4lHpp2oVnl4nUfpIPdRZxSEYYBNOygxachgFMO/2whwrVNQzanglsnoafghI8YAvuwin2LA==
X-Received: by 2002:a17:907:1c1f:b0:a6e:f7bc:dcab with SMTP id a640c23a62f3a-a897fad848dmr1121183966b.65.1725306842005;
        Mon, 02 Sep 2024 12:54:02 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bc00:6b00:fd2d:3fc2:a936:4a81? (dynamic-2a01-0c23-bc00-6b00-fd2d-3fc2-a936-4a81.c23.pool.telefonica.de. [2a01:c23:bc00:6b00:fd2d:3fc2:a936:4a81])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a8988feb0fcsm594707266b.45.2024.09.02.12.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 12:54:01 -0700 (PDT)
Message-ID: <b88626a2-28a5-41a8-9d69-20853858bfea@gmail.com>
Date: Mon, 2 Sep 2024 21:54:01 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: Remove I2C_COMPAT config symbol and related code
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com>
 <ZtQueK8Y9x0FCWD1@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZtQueK8Y9x0FCWD1@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2024 11:06, Wolfram Sang wrote:
> Hi Heiner,
> 
> On Wed, Aug 21, 2024 at 10:13:04PM +0200, Heiner Kallweit wrote:
>> This code was added with 2bb5095affdb ("i2c: Provide compatibility links
>> for i2c adapters"). Commit message stated: Provide compatibility links
>> for [...] the time being. We will remove them after a long transition
>> period.
>> 15 years should have been a long enough transition period.
> 
> Well, in general, I totally agree.
> 
> It seems, however, that this slipped through the cracks. My Debian
> kernelconfig has I2C_COMPAT still enabled, so I am reluctant to remove
> it from one kernel release to the next.
> 
> I wonder if we need some printout that it is really going away for a few
> kernel releases.
> 
I'm not aware of an option to only warn if the deprecated ABI is accessed
by userspace. So we would have to warn every user if I2C_COMPAT is enabled.
That's something Greg doesn't like. I see his point, but not sure how
to do better.

> Opinions? Jean?
> 
> Happy hacking,
> 
>    Wolfram
> 


