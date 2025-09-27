Return-Path: <linux-i2c+bounces-13241-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ACEBA5DA8
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 173554E1C4B
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA992D6605;
	Sat, 27 Sep 2025 10:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKAEamp3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6D21F91D6
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758968605; cv=none; b=O9YV7HwoXy8A+ucXgvEkA5ACPa0CnOurgCEWNPg5IMzhhCOFb45ddkqJZWSh/L1lxAez+k0a0ZAnO/orSw7hDpzYWM/FMlxLWRTinTlihOhxh34fUm8XMdpauHQsPJkmOYKok8VXfCYvufDAe2je5jFHDEBz3x42J5+kOB6X0FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758968605; c=relaxed/simple;
	bh=hSP0UkVo3smxyzxl5cC2FsaVSah/lhvXDVxNIWdha6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BlBthk0F8Oy/M2up4VsAU3hcP2bXu2ye/2tCPSaWOnQ2Qc23vDtwMFdEzh4Fh/WBpLsU7BS1FBgxj+joWm/juhW5CwZkjKrScQFfddHlH6TgJ8ik5Nllue5J/SWPsh/9l0EG8fP50U6SA+aS5woySPMMn7V8mBTVyO22FN+nCoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKAEamp3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso2397920f8f.0
        for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758968602; x=1759573402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=in7+4Iwa+nIWx1yXee5icFLUsBp15xu7p/S27zHgbMc=;
        b=XKAEamp3XY3BMOZ7S0TVDFIrfcKWrfbWIfX26jXckQLGX4qnubucXJAegWgR5mZQhA
         RnFL4e3+2YxJfbxg88UMhp3CzRR3/l+wLRR1W6W9CkoG7HXUfsi0mY9IRDs58xGiafic
         6ZHj4ABdeDib1Y0Scj02vk6VcLpHRqpLEsrpji+7OfiUDWGeHb9N70JoVfj7oEmbOaEb
         pfpguJGVR4n/MC99oHXC4PGtf1Gt6P/b2vdF97l9F3Sv1KQpl2Bb05Z+ReUSyC+v7Bhz
         RXB94aGpExGjNY0JtQz8tL1XUB5Kc4V5ZpfA/cuVQB7eTdYD176xG28WsVFLJH7vnrrY
         r+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758968602; x=1759573402;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=in7+4Iwa+nIWx1yXee5icFLUsBp15xu7p/S27zHgbMc=;
        b=GQ2gnhwtaUUy9NM8GrrIJKpXFwGDydeOHYyCWvqDPYISTAMwPYq28+v85/5EOOgDEw
         IT2ug1BT5GQSn93YZqT21ybYPrzn7gAysZ4lDe1QOrEjZhDFYOna19//nrSWUMbDLbYM
         7B5iprZw/F7IlFhhGn1mwcEueeVVGIWx8VQA8mcygDnUp4lz1K8U3/bsnn59yjsoXdz1
         9rpJZOaRqGzrw5B2XhaTdyVIievG0BL0dEhnYGLIxVU46uYlSYOD0DBP2xZCqIOmLqjM
         U4Ss5XqOvqVseQ37hEclu1bDJo8yZDAGRw49MqoXRjYZ/LodcNVjRSOu0Qym+zHk+Ru5
         IbfQ==
X-Gm-Message-State: AOJu0Yxv+IG8mgu3XnbWX3EYSrjogyMkt3xSBLgwQYVTEQWQ0nxSAY57
	bYmYEuQfCJdu7DaP2N4085RcVvipfWMopvtZp13P9RqIrJy2+xZ2JlhV
X-Gm-Gg: ASbGncu0e2JugaPPTMnyuadEijdm9cLcVULfY1i3zKs2BO2zdlhPmPfzkJNwBuI2+1b
	pugchl5L9pz3pknvME1QH5VEXM57Tumz7wr7BlEpT3R+k52wXJBTryUg0qm7M+LHgrLztYJgTAW
	n7u6reyM5/qJYct8kLYU2UsWhMRTLTFuwWImKlSSJteaZ18UYhoFfQhejLl4DL0QzjcMUZ8F2Pv
	MAKHwaiMzxDHZtuA6oWO6k+Rs06/UHIL9RAi9DNKRig/9qMg28gNIYErsz2i1lppMjhC2/jmhfX
	qnmN7nRZryjdz3GUttl7gvqBST63DY0Z+xY8WsHfyHlXnuElEa8zVO7uTnDambpGGVvn4nGTvyO
	iqcQof5/gRrvO0oq67JobouIGevZusVz11B4qrtO+pjIoFEcGr1dUia3OGoAK7cvfZIx+YiseYO
	SJNCxKZplwumBE6O4EdVGWyXBx8Tp1tlwh
X-Google-Smtp-Source: AGHT+IGrFnvKHtAi4Y3nWafYrrOqgHxO338Bp1mW+r8fwkoAEnIvgFWt8NrSHcpvK5R1+smnt6PNXA==
X-Received: by 2002:a05:6000:2210:b0:3fd:271d:e2a5 with SMTP id ffacd0b85a97d-418005f506bmr2379315f8f.11.1758968601943;
        Sat, 27 Sep 2025 03:23:21 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f11a:4401:dd3b:2a2c:62a3:2127? ([2001:9e8:f11a:4401:dd3b:2a2c:62a3:2127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc56f7badsm10291549f8f.29.2025.09.27.03.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 03:23:21 -0700 (PDT)
Message-ID: <3203ee4c-b320-45cf-b63c-49f589909dfb@gmail.com>
Date: Sat, 27 Sep 2025 12:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i2c-host v6] i2c: rtl9300: Implement I2C block read and
 write
Content-Language: en-US
To: Sven Eckelmann <sven@narfation.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Harshal Gohel <hg@simonwunderlich.de>,
 Simon Wunderlich <sw@simonwunderlich.de>, Andi Shyti
 <andi.shyti@kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <20250926-i2c-rtl9300-multi-byte-v6-1-a2d7d8926105@narfation.org>
 <1838669.VLH7GnMWUR@ripper> <aNZQnlUML0jIhXIM@shikoro>
 <13214546.O9o76ZdvQC@sven-desktop>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <13214546.O9o76ZdvQC@sven-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27.09.25 11:55, Sven Eckelmann wrote:
> Understandable, there was a lot going on at the same time for this niche i2c 
> host driver. Please check the "Order" in 
> https://lore.kernel.org/r/20250927-i2c-rtl9300-multi-byte-v7-0-c0fd0e78b818@narfation.org

Sorry for bringing back some confusion but I had to fix one final thing in my patch series.
The order Sven mentioned is fine but please use v8 of my series [2].

To wrap it up:
[1] needs to come first
[2] then this can be merged

> Kind regards,
> 	Sven

Best regards,
Jonas Jelonek

[1] https://lore.kernel.org/linux-i2c/20250927-i2c-rtl9300-multi-byte-v7-0-c0fd0e78b818@narfation.org/
[2] https://lore.kernel.org/linux-i2c/20250927101931.71575-1-jelonek.jonas@gmail.com/

