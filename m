Return-Path: <linux-i2c+bounces-11862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC40AFB231
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 13:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB1A21AA265B
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 11:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A337B299951;
	Mon,  7 Jul 2025 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OydWPQIS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3951296155;
	Mon,  7 Jul 2025 11:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751887403; cv=none; b=nszmMEHPD1TdpGu2x9euPyeRtiqlE+7ObzxDaezqGHkywzMeH4zlOKkX5XDkLV1kqfCO4gN9GckpStvwuaoEAqsVYT/IJJTVyfB3O1d2ZF9WaXPX/JAayH/ofigFv65A2c6oJXQU6LAV3qXLjaEd3Jkj738jwOhyqXP25SdO/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751887403; c=relaxed/simple;
	bh=zYpKy3zoXx6tFNa3dHkNJBWhDM4hWDk5bp7SFg+ilIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azSuQ7qyzyc8KF9AJMa68gSQ52Pqi1oghgUwmc7vDcZG7qslV2qxHIYfpNyHMvJZ1M3JEXZIAJZVC1fMFdEwVcbquP6Gbb9ER346SufSWAuLdudhzh5mbmlpALQBZ5O9n4FlirkwB1Pex3O+pLiL3HoZNFArv1BYahu95zFumkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OydWPQIS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-454aaade1fbso33677825e9.3;
        Mon, 07 Jul 2025 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751887400; x=1752492200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TPVjeNQlRzgAMgy//+OuyCJbbVfiaWjK7V9mAikz/0=;
        b=OydWPQIS+B3iYohTF8e/7A3XxUZHNYreGtj2YXpepapBVfFE/tC9+RVnMfOAIpWZSa
         PFvILpJQ3vn6g4clONYtXMrWnSWmcALNVwq0zFtqXN3d9eqN1rheDr7ESU9TVK47GiRl
         TLB20jlsT1+fuCy4aJ0d/B6lxNbH2FFr6xaxes8piOhOqdUaHT3K++NXwgs4vSuTt+/8
         Gcpsm4JLBJH6Gvl9CMObi5pfXS1KKBfaDFEL9NMJhI85EPE/9c+AtADSpBNaEFFtMXBD
         Lim+wSrA8ofnPH7gc2Oxm7O1nAPRFNbBJvD+e2TfpmrdRGMDRbz+HUMYqud9dvaJrYYC
         F3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751887400; x=1752492200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TPVjeNQlRzgAMgy//+OuyCJbbVfiaWjK7V9mAikz/0=;
        b=Ex2KfmuzzftGGM9MAg1MA8t2CQWd221f3/N0+YylSd1Kh9gFhWY2kslWv3K1HnvXYo
         zNNbcVLQ5xk8du3+WgJhauHqxV1W+bGhjagwTLyZw+dqMiCqx58XMsBS0m6tyTyC4qAD
         FpHIwfhnP3n17c0xTvK+sFoCqEKYi4Qtt0c/SRlYT5fGnZeXyyU9hXyuNH9f6+GFmnH/
         B9PugTZtnvm1sDlIv8duL718AwpimTEqJaxCEWM0oM2OrXoq8zf7Z0Tl++Gfn61W6r7K
         iUgkfXuicmpZSXbLiCXSLuiWuxzSyjdDEvjpVj2/81wK2r0Rhgne2lg7cImIXOeqITuW
         j8qA==
X-Forwarded-Encrypted: i=1; AJvYcCVGCFSZA2dFkV6r0MR5DIqKfWQae/yqT3+nDHP7lMwUVBh1p5+KKxaWKtjxPsPKPhCWSKLvIQoE/gE=@vger.kernel.org, AJvYcCWBtYnqMoE40E9WvQkYadpizIR6CeRk8ZVfSgokSJrp0LYvPIesBlRvLFjw5LU/h74i1pWgEz0fHYJypTNk@vger.kernel.org, AJvYcCX/M42s/V362lNPy5uQwr1/nf+ZzKO482DPa2pow/PZyPcqcyN4ThkuZjRwfpi+iL4wJGiyLH4yhm0qvl0hIOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJjKSoxLCrXc7EBkvWGiFSfAwfB0nzDF3cvJtyurDSOLqt/PTI
	lp3VSE3C1NdMPCRcjW1N7n05ptVOKMqHeIhCMsdpKu8NjJvdG+qV6Gl6JKP1BaCE
X-Gm-Gg: ASbGncuRtJwDp+in7GKtW8npcaPvc7FP1GFpWnsYl+xPZZvb3g1ln/34h0GtHbscA+Y
	UOQxWlUFp2rGNk1wU236Ivyxx0jGXVM1eTa/jVQiKHF8O6E0UF8IqWYs/+2RixQ1yEBc8jQYTNv
	xLqew0nL8nIJyNthUw9m76WvWsqT/xDFO8h7rWjk388WhihFIc9DAJJfqFxCEHWuA7VoYvUa1Bh
	LWwypi8Kf8GEEtbr7NZccBwg7ynlJBwmVCng2588c2D4dk3yoMlIrzMwlHTkNumZx3UX5yrrkK6
	v1UpxBrHRg+K6lffxyo37lQ5SXjFvqcmzfxscRHKlwD9TUqmaIyxy6kfWkVGTGSzT81j
X-Google-Smtp-Source: AGHT+IGC9dHI7hG34Y33iS7Tohcxr0UIkxnnLlR/ZbwCJnzdqWYCXb792UejIfSJCcUscd30OWtpsg==
X-Received: by 2002:a05:600c:8b2f:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-454b4ec3e6fmr123912525e9.30.1751887399813;
        Mon, 07 Jul 2025 04:23:19 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030ba48sm9998966f8f.13.2025.07.07.04.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:23:19 -0700 (PDT)
Message-ID: <420eff5c-e569-4aec-81fe-ac8ad2060768@gmail.com>
Date: Mon, 7 Jul 2025 12:23:18 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] rust: i2c: add basic I2C device and driver
 abstractions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
 <20250704153657.1195687-1-igor.korotin.linux@gmail.com>
 <aGg2qkyrKBIPiSeE@cassiopeiae>
 <0ae92ad8-810f-4c10-a442-c403755cbab7@gmail.com>
 <CANiq72knUt_=vcvVqWaFz_VJEQ9W=4RiTzwSNyxwC_pyBoHB1Q@mail.gmail.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <CANiq72knUt_=vcvVqWaFz_VJEQ9W=4RiTzwSNyxwC_pyBoHB1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/7/25 11:47, Miguel Ojeda wrote:
> On Mon, Jul 7, 2025 at 12:31 PM Igor Korotin
> <igor.korotin.linux@gmail.com> wrote:
>>
>> As for being added as a reviewer or co-maintainer, I’m not yet confident
>> in my Rust skills. I’m learning Rust from scratch and, given my
>> extensive C-kernel background, I thought I’d start by contributing
>> something useful to the Rust side.
> 
> At the moment, for any given subsystem, it is possible that
> maintainers have even less Rust experience than you do :)
> 
> In general, it never hurts to offer to help with maintenance -- it
> shows you are committed to the code you want to add etc.
> 

Sounds reasonable from this perspective. In that case waiting for a
@Wolfram's response.

Best Regards
Igor



