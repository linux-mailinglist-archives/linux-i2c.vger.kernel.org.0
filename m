Return-Path: <linux-i2c+bounces-10929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6707AB2AA6
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 21:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E9F8189795E
	for <lists+linux-i2c@lfdr.de>; Sun, 11 May 2025 19:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325B41B87C9;
	Sun, 11 May 2025 19:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKcwIj7N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F32AEE1
	for <linux-i2c@vger.kernel.org>; Sun, 11 May 2025 19:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746993336; cv=none; b=rHGYEdnd51PTSMwaz8NIOd/DPI0HKPDal8xyyYzBfdXbrQglqt0hlgrAY484jWMaK469/N59jwOR+6DM3E3PRR2fRGOYp+9+udvyyvrkuGYtEU0afZ3ZUrAwrVvxiaxnndOEx2TlKElWzempUTF7b0UxY+W3etZdGR5jmTkgaPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746993336; c=relaxed/simple;
	bh=JiqEHX7ZRzSCGeT3fQYrRSLgdK65lYci8orBdPhfA8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+CtxeXnSpAuOWXyrVfx8Ge1B++snp8bAVShIy5Y30h3faoHHkRPymKrImlOFXVsUmjD+geg8rrhNZR8JFdh+xv4q7fV/1b3nSGpNoa0glmfbiA6KlHDQLf3x5nschnudGlg9TDZ3+snlR39DRvDIFuCAktkjR+t6VP9/I5o8mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKcwIj7N; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so39024295e9.1
        for <linux-i2c@vger.kernel.org>; Sun, 11 May 2025 12:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746993332; x=1747598132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/90b93kGZZqa+YLvrUEnVn8IfbOBeAMD+a1U9ykH500=;
        b=gKcwIj7N9iQLvEXKvcDlExJiD2yYb0DuafOyl6JHkCrVx94my+sD3/rx4WvJwQRBRV
         djyTr1pYz6JTPr4HqbXUqkYcDlyF8GBNf5bwdb7Nxtst5y1CEiMkcn1EMc1XjA1q7KZ4
         JhpgX4s03bjthkqEyVs38+JDfRhAjqMQgPgc1n7PbCwHsi/yRmwAU78TByMsvQ7L7bIo
         cU77pHSThYY6thIeTNyLABeieeCQiqswzOah2O6ZjyWx6tpjUdzLyqlE/nd4L/BrQGSN
         t3CqhFg7LzXwl27hTeFsg4hieZXW39NgbgGOZV7pFqe48lPyIJI3IpGeupNO7U7I8PE+
         auNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746993332; x=1747598132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/90b93kGZZqa+YLvrUEnVn8IfbOBeAMD+a1U9ykH500=;
        b=iEv76IRietn000eWJLqK60tvHC62A3tI2IGhCeB7+H6/WPaoobMnqUUx1cAheCx+tk
         it71DnkHorpwoWF//z5n2eaUp8O7nweMmjM4hE4oT6Zc/asp/gjbe153jL8yPuTuuQwz
         GJBdRYvakj7GiOvBf+JryPNwd9DcTjOuU4IXs1GKiwSRmKkoyn11P2+R68zPYgbN4AcD
         C757Z1yMHwyFSc5wBc5uuJ4hPepuMzWDfXXxGzz5h0nB3Ha2nbk5DVo7Vi00reH2kelg
         q01lYnWzQ/KnCiZbcx9Ep1gnp9i/P4IsXRzp86/DEM/kgj4iDWGRW5fLh5HYphKwkjxJ
         pyCQ==
X-Gm-Message-State: AOJu0YwyB8h2kNIyVYWS8X6rpAIS2FcYLxoErHFwUsDVVA+WKddDQlpl
	XGh9+sCrPIrbkGjSa7uGss+O2PyX50fzgkzmXLH5EF+BuhFCf+i4a8diCA==
X-Gm-Gg: ASbGncuzWZQo4YVg3Iwlk26jeb/cO/EX6JZAdSYFJtUJs8Km3s5VVDl5EtBpwDZ823e
	usD1TUsgJQNsEW9mjrwTZ/qCQo/ogibY6Ng3p0t7zmc5Kuvp3/D58G1qD7ImNjjCpcBhsVwURub
	Erp9Tu39N02bG6m27/cHP/kySpw7FeK5ikovJ/mGh6oOZHoyV/Eq7NI63Rhw+SwKp+w5irKTW3i
	T4Inc31XAWkFySoGjp8SiToqKnfKeTWA5V9igfyms7RYiraJeVMhW1z/67ScnCNt3/5MRErwdv6
	DztTa/QfjvqVOTZ0Ty5wDfsdbDQ7Kk4wz+LZ5rrWzryEkOF/NyTs4U2GTGuEaQU0sH+jC+p3437
	lr2VhJfpqg0abbqObiwA=
X-Google-Smtp-Source: AGHT+IHykfuVNtQC/PNwOKZjL2/HeP+VeCaGzPrGuAeDh4RfmP6raPDpTYtVgU9v7M14iP+3QzkwDQ==
X-Received: by 2002:a05:600c:8708:b0:441:a715:664a with SMTP id 5b1f17b1804b1-442d6dd9d8cmr80789365e9.20.1746993332303;
        Sun, 11 May 2025 12:55:32 -0700 (PDT)
Received: from [192.168.37.78] (mob-194-230-145-210.cgn.sunrise.net. [194.230.145.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d685c2d7sm100762255e9.30.2025.05.11.12.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 12:55:30 -0700 (PDT)
Message-ID: <800aae56-a00e-44e2-889a-571abcc54c56@gmail.com>
Date: Sun, 11 May 2025 21:55:28 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] i2c: xgene-slimpro: Replace dev_err() with
 dev_err_probe() in probe function
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org
References: <20250415183447.396277-1-e.zanda1@gmail.com>
 <20250415183447.396277-9-e.zanda1@gmail.com>
 <irmthictkubsmmz3cln65hz7pj227m7neqhuws5ecnzgvgdac3@tznat4u3jlic>
Content-Language: en-US
From: Enrico Zanda <e.zanda1@gmail.com>
In-Reply-To: <irmthictkubsmmz3cln65hz7pj227m7neqhuws5ecnzgvgdac3@tznat4u3jlic>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Andi,

On 4/16/25 23:19, Andi Shyti wrote:
> these lines were removed by 1dde04276b4d ("i2c: xgene-slimpro:
> Simplify PCC shared memory region handling").
> 
> Can you please rebase your work on top of my branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> 
> branch i2c/i2c-host.

I will rebase and send a new patch.

Thanks,
Enrico


