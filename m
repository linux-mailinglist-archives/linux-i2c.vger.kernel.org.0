Return-Path: <linux-i2c+bounces-13810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28299C0A8EA
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 15:06:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 868F74E5711
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 14:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532DE1DF26A;
	Sun, 26 Oct 2025 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDNmgYnW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849EA14386D
	for <linux-i2c@vger.kernel.org>; Sun, 26 Oct 2025 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761487571; cv=none; b=L+tpFPmfzcAyWQh/BiCUjuk0lg/wkr23SsSoDIAMdNAyDu/QPRLEMnAH5JSWlfuDNVes30qdNH7neimfWO7NmL1ehngDAlxl1YCvgWDbGFxWcts/xFrRNTojApjE8guaZpjB+j2cB07F2AiK6xsP+LN2ILAwnVi52Svtmw+ALas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761487571; c=relaxed/simple;
	bh=gYfqNtP11KH0UKN4RQH1Rz6mdSU+g18C9eAFYuwbCwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LYKmec8EfattvYU5sfx2ikTR7PaoWZgCEpTGzQ3SDC/BgldQ22FkJO5Y3lwULnG5y74CB1QyhrFK0yC69nnN0wzuRq2lsZTMmSuj2ZsHGO1ymHrImhtSBImBsQmge3GhfSPtzTQ9pg8NdAFnNnSDWQJ7AuNqjsBIu3v1unFIH+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDNmgYnW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47117f92e32so33321955e9.1
        for <linux-i2c@vger.kernel.org>; Sun, 26 Oct 2025 07:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761487568; x=1762092368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CLYx4uDhgheZtG8ZPIY5i/GgmjTVBk+AimSR2MYYAhE=;
        b=HDNmgYnW/J8JREIXG+CVkGbLs7NyB02KJ9Z/QZcDnkNqV/TmISojhsTT5juJBs5+Hb
         JbhNbGoUJHnGTNkaxHwnNGop6mEG3vJn5UqevjdbQjIRUNQnyR6Xb1kgicpozqHPhjX1
         keuoAlv0dmwwm6csMF7TAeVSoMatGrgQlE3VgJwZhcgjP3JAfgw6TlXrgGjFB26zhvsd
         sKAL+nJ7tWOkFyw4Bis3egxRhy4KBWYDrMTOAsMV39vzd6IzWzTde2l9FUDe+NcKmD9e
         ZxAq+HVn4HFkDBWIl4wBC6DgyaTTHecvV3ASs8QbwXRyJ7GlkYMH8fA4d8naNVe94iyw
         FxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761487568; x=1762092368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CLYx4uDhgheZtG8ZPIY5i/GgmjTVBk+AimSR2MYYAhE=;
        b=vJGhuOAaDeXb0napJxI/DLOnpykJmbRV8EF0K12J2zAc+Q+FXvn6YW83FCpQDI2Nw0
         bZo8Qsb+N9C+LL/S1WDgYhP0Flyqt9HBM+rkVJgGJ6dYTVN1wQKfiAjaAwdLt217brtY
         vILATdr4uIkTgZkYG9r16C12ekVtoUfvSC52mh0n+cl6JT8jvhYIqhCMv9cgS+OEQclH
         6sW4pIWJQd32Scqbqv5gltZ16/TAt4lUIAN90jzEevtogAn5S0NtRmSUjTX3Y+DSr3UC
         45PSnX48lj5txgRgvFf8m3Verw9BU80rP+sEjxx7fEmVG9jhflQruWjmaBMupptdWsnv
         b8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR/lmB8kx/kQAjHBvWG0yMg23YyGU7bEiBvHy0S0ZFwaBso/hGV8Fbclgr/w0tgyQQ0vReHC+GxnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg79KU4IPYMy7BTgt1izw4dJfSpdvLlVoFhivLSkhl9eJg0FwE
	W8We0m8qLsWCyN0RuU2EI2/ooVLK3dPKIraUBKx/PxZ1XAZX5ouDu7U8
X-Gm-Gg: ASbGncvV//azMz5yT2JEixz/C/tvfs1LAQcS86kr55S5d6IsRe3tiXazQC9bFVK6Uod
	DNP3S8767kAaTl1A0SVa3XLFmyBqbx8Bx8/O7aNNWmz+Z0PH8yWyDpyhJ0ZdwZPUhFLYZMEsJUQ
	teS1GFvd/C4Xx650Jnj6UvSnlKtcA8TyJZZOYkA+2NKXHkr4jYRVx89cquxc7yIzd0Nn9PH0e5M
	1wSO4d0tT2tdYkwKafuyIWMNFcKhGRs6/pHtxh2QJBvnovvoZ46Y0lGKr4n3ABpM1WkXJGIHA9q
	ssNo7vFiqlD6TZ3PzuQrFioqrc44XWuwWmYiYuefx/PVRNm+YWZFtvE9eDZXwKRCo9d7+25bzvB
	Y4d4k1CA34TFcDjAjtqsK962TU7fB/tH8mamWJkJmWejagIcPN6ti54iHNDGp/L5gK8qnpDADst
	tLKXnl71KM7KhaY9uvZzftycRiQ/6BHwIadDVx9+zx0RGokewy9snyhHZj0bkpQ61EIUSC4JcY
X-Google-Smtp-Source: AGHT+IFmodXofCaWJ2V4mG96wHunmtMwZMrtD3TBF632Rx9mURjIzVc1Cf5tYh6QvMESkaUrVCJQVQ==
X-Received: by 2002:a05:600c:518f:b0:46e:4a60:ea2c with SMTP id 5b1f17b1804b1-47117925e1dmr261093285e9.37.1761487567654;
        Sun, 26 Oct 2025 07:06:07 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7? ([2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df6b9sm9139538f8f.44.2025.10.26.07.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 07:06:07 -0700 (PDT)
Message-ID: <72e286cb-7517-494d-a8ed-769b5fb8baee@gmail.com>
Date: Sun, 26 Oct 2025 14:06:05 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] samples: rust: add Rust I2C sample driver
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
References: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
 <20251005102348.41935-1-igor.korotin.linux@gmail.com>
 <b09c7c91-b801-40df-8cd8-731837ba2553@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <b09c7c91-b801-40df-8cd8-731837ba2553@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Danilo

On 10/26/2025 10:48 AM, Danilo Krummrich wrote:
> On 10/5/25 12:23 PM, Igor Korotin wrote:
>> +impl Drop for SampleDriver {
>> +    fn drop(&mut self) {
>> +        dev_info!(self.idev.as_ref(), "Remove Rust I2C driver sample.\n");
>> +    }
>> +}
> 
> NIT: Please use the i2c::Driver::unbind() callback instead.

Thanks for the feedback.
I’ll move this into the i2c::Driver::unbind() callback.

Should I send v7?

Best,
Igor

