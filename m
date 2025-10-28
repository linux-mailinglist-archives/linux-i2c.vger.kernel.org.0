Return-Path: <linux-i2c+bounces-13873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A342C16B48
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 21:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF9924EEE71
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 20:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A0C34DCFC;
	Tue, 28 Oct 2025 20:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI7RRDf5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2363B23EA96
	for <linux-i2c@vger.kernel.org>; Tue, 28 Oct 2025 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681642; cv=none; b=lj43ueLBKSvD2mtRA7wPw6q+yh5sWgQVZ8lEL1LvbA2isWONJ2PWwRzFOEXldA689TBhaay/3+b72xnBty8GQT7gM8amKkQrLAtykB8XkN07qLGfhoEw5dmkmQ/kOorUxpbrq9+USC7aEEWD27N7krz26Zi+aGW4EFn+pQsN3dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681642; c=relaxed/simple;
	bh=gKg0Dw7Paitg3iXBUhHKunRE5ysCLnjUhDe/xfwXzrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAbcXHtei45eWDswxEnlyaE84wMmS69CCh7cWiebTuGxhbtYOqE20wVZ5bomKTZPrFgLAFk3IRPpcJ9Dqw54NFeVv+tk93q2V97U2Qcax1wC8uNr1TUVDGMNv/z3IdxRyKiElPTPtcThcJCCQmdAvl6h6haxS2AqWdAKsbWQgY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI7RRDf5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so25464435e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 28 Oct 2025 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761681639; x=1762286439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mL851umhUPJLZ6fct/l6q3TFneLb85EfFLqNrx5cTZg=;
        b=AI7RRDf5yH6zsSvodwvn/lJD2JvPZgGpoZaVyT0O/ZcWoBkp97oYatqKpn2tR4deJS
         j5GXFZFVnhV7zs1TQNthPh9hnAx5Ffw/OylAlDHCDAswvY3QT/ywImCHD6yCyAnDdrGR
         SR89afuRIgi6oaxoEr13wx7+tjn4H+bjcwGTaC5vemcBOeLSgKhp/krFjpMypXf/O3bC
         cX6eDk39yznXO7lyw4jqtdyaeTvMac9lNqdoKHaZ5N1FJO3az4r1AnYOP3G8cJB3y01B
         xMARHUUohB5D3tnHeFDStaiE8/2xOzX63WG7itOqZDDrFixdkMwd1P/SkYBGMY6wObgo
         Hp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681639; x=1762286439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mL851umhUPJLZ6fct/l6q3TFneLb85EfFLqNrx5cTZg=;
        b=K1FNhVP4a2HoutvMH1Uy9rgpH6pvfKNUYzAvVBOFy43Nb6HuWsvi7AfJ1ELfHTbvJN
         ffvdhpqadCYDqmjhtQzPPeHTMK6radcIodLwKdMqUIxSwbXKRpwOlRAYO6NS3zoxIyVu
         TSoLXneauQ/F84Wk9Wo7PdGADwKyWN1opY22sCMOHimmwqmHXPG/HGa1EhJp1VtAYiq1
         uEWrTXAkHoXWDMdz9mwcTUN5urik2a69A4nXxU7RNZtxl+oiLULpBVq5kS8ZHd4SSRs2
         PafGiiNLF1Di8N7jq9trN7DrewEGBUFaTSr6o1Cfi+1AeNuBfObb3g06TWFzmu0r5o+8
         lK3g==
X-Forwarded-Encrypted: i=1; AJvYcCUs6OdQ4iGDzLL2zVA8jS8RiWrS+AtGKMF3TLgQRg1te5GEiImOfazuokzD1VOmIVSVISJM7mPmJfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIxOcP6EZO+sKqj/I9XkFP9JtpZS/YelF0CP1hiE629warkbU4
	C4yttAGgfO7tCnPH8n+1FXmuRfpG90VG6jjj6E/GaQ0KJ6HRdnE6U4lJ
X-Gm-Gg: ASbGnctg1wCgZpsxg2a/VQh3ZgIl97zF0jNJrZX3I9PbRYAowgLrxhhPAMmo98i6F8i
	37vQtvnvYXZ8W2pcdHXhy+29Q8p89uGRvQYkXGj13Zg8BF0DdDCOIyPb32sLATslMpSepgIQEXE
	55w10Sog3l8Jt0Ln16nCPBMEYcz5I6a8AJWtr7AxGQXKjJ7ilU57Q91HHxxrMLegWWX070Bc9lq
	94O/WGb9Ns2n4YzaYXUNdgNr6fZNepPmJ452OaA/6UZZ9Mk6JLSSXilbXFk7eKDmFQrzBqP+lCs
	G0mWt2OK6rO/OWYSZgz0jiTYnRzFTbV2tL/hMOrCwh++0agm9jgivRysLhN6G5tP3pBasafhT47
	neAYm8QSqi5x/NpPfYwXb6TctIvu3iKhJfAb+WbuPQcVBq7dlPFBH1cj1qd014t9XS2FhGU9+gB
	Lc6MMKfRkaU2VdaNBNLTf21uWXFuemCG8VQlw7WUZHKc1/oXAQ5KT/SrAY67wx/jGK
X-Google-Smtp-Source: AGHT+IE/cBkMs1Ecb7E2+3QULB4TXzU55o3BTa1Vq4AzJPk/MOxEfEIBV9ttaFmvDXICTt90aFlWKQ==
X-Received: by 2002:a05:600c:46c3:b0:477:be4:7a52 with SMTP id 5b1f17b1804b1-4771e1f3bc7mr4985065e9.39.1761681639187;
        Tue, 28 Oct 2025 13:00:39 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:1c86:bfdc:bc48:7705? ([2a02:c7c:8b21:7400:1c86:bfdc:bc48:7705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b9994sm7557365e9.16.2025.10.28.13.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 13:00:38 -0700 (PDT)
Message-ID: <56672794-727b-4ed2-aa73-9e976e266346@gmail.com>
Date: Tue, 28 Oct 2025 20:00:38 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] rust: i2c: Add basic I2C driver abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
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
References: <508bd9a1-c75a-4d1d-bed7-ee759ac5a701@kernel.org>
 <20251026184143.280797-1-igor.korotin.linux@gmail.com>
 <4568187f-ab63-4c86-b327-90720ad20ac9@kernel.org>
 <30fbb191-5300-45e9-93d3-8b2ef5cf18ef@gmail.com>
 <DDTFXY5VJCS2.1ZB9EPNLDTPAC@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DDTFXY5VJCS2.1ZB9EPNLDTPAC@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Danilo

On 10/27/2025 10:00 PM, Danilo Krummrich wrote:
> In fact, quite some C drivers are already doing exactly this by hand. For
> instance, see [3]. Four lines after [3], raa215300_rtc_unregister_device() is
> registered with devm_add_action_or_reset(), which calls i2c_unregister_device().

Now that you’ve mentioned the parent device, I finally understand what 
you mean.
Originally, I started my Rust-for-Linux journey with the goal of 
rewriting one of
our platform drivers that has I2C children — and yes, it has a root 
platform_device.
For now, I’ve put that rewrite on hold and focused on the I2C part 
instead, which
is why I was thinking from the perspective of rust_driver_i2c.rs: it’s a 
purely
artificial sample driver that creates an I2C client for a non-existent 
physical
device using an I2C adapter. That’s why the puzzle didn’t fit together 
for me earlier.

> Having that said, I'm a bit curious now: What is your use-case for
> i2c:Registration?

As for my view of i2c::Registration, I see it as a safe wrapper around 
i2c_new_client_device that holds a pointer to the newly created I2C 
client and releases it automatically when dropped.

Thanks for the explanation, I'll drop a new version when ready

Best Regards
Igor

