Return-Path: <linux-i2c+bounces-2951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A43198A5CD9
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 23:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12367B23677
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 21:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF453156974;
	Mon, 15 Apr 2024 21:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHqNfBuU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DCE25601
	for <linux-i2c@vger.kernel.org>; Mon, 15 Apr 2024 21:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713216036; cv=none; b=IWVDWwUaLdPp4gx2rxGy1tiR89UWGKtkEO0uxyzqcdy+tZd2X9ylYHziL7svruKgBljOIcTlvcHWTITW3v4LdHMcej3CvwMBfpwxIO0Pq24BDePgrG9TvFvyVWGWEg38jcN8c0rRQaHFQNV3qA4qIP+NLhg6mc8zSYkB2GT+uTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713216036; c=relaxed/simple;
	bh=769NkQTcEQWpuTJO4/1YWh57LEoUKQYYBaSl+KOXQkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPUSlTeSGtLeg9hsoguH/IY4Fol7UiALgkNZ4s4RePJ1U/7WsRF2JaUcDlDCgoh7buRU6KHu37quOK+3rUmQ/e56ZvoTuO9JlB9CDYo6sMQKcY8iqxEPketWocidKR2F6gKnNxu5owJISoAMi6+G2wIKs6iwZZbBshBQ1ql+ufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHqNfBuU; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-518931f8d23so2701940e87.3
        for <linux-i2c@vger.kernel.org>; Mon, 15 Apr 2024 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713216033; x=1713820833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zeueaGnU6XOZeSsdOSQ0HQccWrMxGDCthKAFPLXXFZw=;
        b=QHqNfBuUhwrx6eIEXbnXIkmE+JOysQF7itVwC4r6znBcHj+QNYLtX25uIsV5YvhMff
         6AubrSmye9VzfhizfVeeelEem+3u6T3h++c96UsBkGaSfL+BbttCXh//e8cvLn0nCycU
         seZ+TSImT5BlpH3q5gwQx5KRHv74lX1s3DvcNHu+utEu3Z6or3dJsBe9h5Iwz9E6K8CY
         nr8q2wqCVwApp7KMZ0A6btIslPrlW5WHehFOB/fbj6hXXG0NYANThVVTpy+QXtinYlAI
         1e5C+4re/3AsU0t/FGWRe0iEvGEPkQyYxx88R8jYbBOi/YUchz1QL0vV416yKqJ4yife
         gMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713216033; x=1713820833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeueaGnU6XOZeSsdOSQ0HQccWrMxGDCthKAFPLXXFZw=;
        b=pHYtyjV87TvR4+2nxeUksEZasW8icb1ZyGLyVy4r9HpL95y//BBFfhseGOKzIg13rH
         iskgQAJTYD5JGjgs7vIrlTOZT5cqB/wHlELxKt3f+cIu+pnRsqlqUav5Vlj8QAVHWrRm
         0O7DbK+xPJa5a4WS1G4CD9TodAHS7K1vQr4TZTp69tbsZccTK6eoTkp41f/ZUF0sQAOt
         POZK9BFBfgJoSxQsM/TCAEPihA2Z++IurT4e62g8toPY9M8erBDLwJbV4s6Phsqch5Xg
         nrul9Cf69NkOdkTnaR4VzHE+2m9nVLRWTlX7cbodSSQ8suj/Q0L2pI1gqG55/6qeZtFm
         zTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe6T2td3Pby0HH+RFY8CSQ8UwsjwA19YyMVd5UMX5mzig3eCzJTVj7r7dfDyrhXYBP7zkWpyYtTIOobhzQ3Pl5TXXzkQhSkopH
X-Gm-Message-State: AOJu0YyCgR3YaQ19Y/4T+ER7LUBf3eue1KwH1EaJOKdVnOjo1A+3mF58
	tyXC0a5Fb9U3/2t8ggDBO1Wn+NI+b8zycDGdyqiVbuaYVOndu/Nf
X-Google-Smtp-Source: AGHT+IFX7hmdl8n+AOIHloCFOG88wbQTeuB+2nxgAdk2ZEgVlwmPCE5HqnNYG+oQRBB893lpl5iO3g==
X-Received: by 2002:a05:6512:92b:b0:516:d444:c0d1 with SMTP id f11-20020a056512092b00b00516d444c0d1mr6583831lft.37.1713216032877;
        Mon, 15 Apr 2024 14:20:32 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f? (dynamic-2a01-0c22-6fba-a100-05c1-bdd1-c074-ea9f.c22.pool.telefonica.de. [2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f])
        by smtp.googlemail.com with ESMTPSA id h23-20020a0564020e9700b005701eea9b1esm2455279eda.86.2024.04.15.14.20.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 14:20:32 -0700 (PDT)
Message-ID: <b23344c6-7bca-4b83-a5de-5718dcfcff76@gmail.com>
Date: Mon, 15 Apr 2024 23:20:31 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: Annotate apanel_addr as __ro_after_init
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <41efcfe2-7e05-4a11-bd02-40d9e525c415@gmail.com>
 <hezbbhcsjewtn7xbpfsbp34qczx5xw7swk4pthic4bguj6cumo@umb5mkckaxj6>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <hezbbhcsjewtn7xbpfsbp34qczx5xw7swk4pthic4bguj6cumo@umb5mkckaxj6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2024 23:05, Andi Shyti wrote:
> Hi Heiner,
> 
> On Fri, Apr 12, 2024 at 12:21:58PM +0200, Heiner Kallweit wrote:
>> Annotate this variable as __ro_after_init to protect it from being
>> overwritten later.
> 
> What is the reason behind this patch? Where is the risk of
> overwriting this variable?
> 
The annotation makes clear that this variable is to be written
by init code only, w/o having to check all usage in the driver.
Currently the variable isn't written later, however the annotation
protects from any such potential attempt in the future.
The original commit message has more arguments for using this
annotation. https://lwn.net/Articles/676145/

> Andi

Heiner


