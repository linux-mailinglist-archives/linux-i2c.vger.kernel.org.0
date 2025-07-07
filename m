Return-Path: <linux-i2c+bounces-11858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E8BAFB14A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 12:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B05817FA03
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 10:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4567293C59;
	Mon,  7 Jul 2025 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd2E2KAV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B391D5CD1;
	Mon,  7 Jul 2025 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884507; cv=none; b=C4N4RvBnxHBi2KjdQuocm9uyyp+CITZUlng+jepfFEEZqP8ARI7Xx2Gq0nv3xpS7MaOrnj8TOjctiI3wj1GpwSQ/1KaMzlIkPrekGivaYIlu6/bEx268Vf2ySPZC9VxjzOXRYXgJYyWGyoIKQC+7chSZmhOgHOrdz7k+TJQYbSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884507; c=relaxed/simple;
	bh=PfxWDdMcBSWHSetCW5p3SPef62MsJwWHc7BeKQI4m08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBYr4lywb1gjO33vZiLZN52S/Ya5ogv6n7wOv7pc3WqenOtTQAY/ZAdjFpRgepsHLm6DBLQMkLNxIvf63A1vDBUmv6WTYVppDS9PsfeaOuoZgnRUkT1LZx03dyLUsV95/6WHNiJiN5rxp53yW3DYeUqNlpVZWHyFVOwlgbKPpBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yd2E2KAV; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a54700a463so1527068f8f.1;
        Mon, 07 Jul 2025 03:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751884504; x=1752489304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zj807uPCVusFKDZrA5AXl/Ioh4c3lqNRbc9GPkOsoqU=;
        b=Yd2E2KAVxczpgR0ekFDzLZExj0wG2atU8jZbWmHB3WyWyvZcstwUweGaj9u9v/UB+w
         aRgTR+H0HWgHDgxP9YQTCIzhko193Fhy2IqSmkiAb7QeQO6KLuFOzNg/Mv9RUQFiqBZS
         gzLz0wY0mQ08Yts9pR/qtIqa8xY1MdR7SBZ/nh54ug3cuONvQMJSdvK3tu2VTNRu+FO4
         m3mRvfNz99/mry2ThSqUJOmJrfnZFAB0E2WHcK4HlAw9v+jOoVZwi0bbLPzscivX90fP
         VYOJXymQrX6NJtKLo8m7ynaenl1BaKyx+cySgUp+IxeD+xo/scAcPCw1liVVYi0ucicJ
         4blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751884504; x=1752489304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj807uPCVusFKDZrA5AXl/Ioh4c3lqNRbc9GPkOsoqU=;
        b=gczKDa9NGXmNqSaW9p4NBCSV4aBCvg+hxXWdvXGd2s3EAcfdn60Z1TOst6cMoeIkm2
         0XnvGCAlrWcoDfZA2i6AfPOPH2eRoRNHQNFwMEs0FBTNKQUCziMxGHZDhIYz3QTOKWv1
         PLXs8IQrNUqDXJkkD/izVq+k6wiH5XkvKjgud/RppMrTcBFYGllSqZluOiWesNu5A+cO
         F5H4wNmeXehJEjqbg/ZSULTjQU+iPFSTsw+qP+AC3PDuZeSjDY3+0ctmCg6n+8hkmifo
         tFPiQzmIaHqxYSCtaRzVdd+YI677tvs7ax0qDqtEiLEdlH3OhMlG5wwt1Y1Ukyu/0dMv
         W0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVN65FTQR+wLJECG+8rIx8L4t5nonwNCDScUu1+wu2jbRLoPARSiLuo8HCsS4msXtzlmArjniYUqxU=@vger.kernel.org, AJvYcCW5mu7AKnZ7FUQFJ+eLRk76s1mX3dxSJRgMgKYY5OJVP0PjuNYwFgEyoIwHXrbmyViVmJWL3s9CoqYkPfLG@vger.kernel.org, AJvYcCXS3zMMMXPfUX0ZjbpjNm5hdk+ptjNxb7eepROcXWNSzE2dpOuGlI8+IDXT0rGUBlXIGJqGXo1hQan++DTK2ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdAIMffyUJwglmHtAuNsAo3F05FIMa59F8Iua55pMbFmc7i65E
	I3ywjvqWuckuEpr5hoJi5MRLjt5zhBu4XHSyD+uWrc4PCZsbVCHCQXYL
X-Gm-Gg: ASbGncvOFG9Ow8It+hCiNPkrmsWBJklKqAL38KyUPp2dELX9skV38mXkZTWiauiiRIp
	AHuAeVRg7SJt2XRTzcZTVl98UBaXHL6AUfq/NCdqYcGGas/vTnrocDLKxuUr1+3/mZXsT1ZIDxy
	I5bVKe8mSmSdvS4ygJBytFfbSwlZcFNN6ErMqzzXrKlZ3E567D0wmHvbUrNQt0+fMlLDLTJQ8Uz
	e0aXDv2w+ddjVCP1UmlPMmDSH344kxoQCKkK3rruR6ACYjIev8Z9jSwuAoSLlJcMFIWaXNA1RKL
	OpFksNWkMpcPn6JCI0pXv4rnMv7G4D3L4+YC1KAJTf1/0wIXT8AL8DJesKCgFeLeu26u2VzLp5q
	sMuI=
X-Google-Smtp-Source: AGHT+IHIoKVaBZhKiY3W9jzsryismzNMlNImVeWWr+E2YaHOs38YIVOJXPEXTGRhlT2FKmFYOnN8EQ==
X-Received: by 2002:a05:6000:2386:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3b48f763f20mr9860597f8f.0.1751884503915;
        Mon, 07 Jul 2025 03:35:03 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454c041cd4asm53888675e9.28.2025.07.07.03.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 03:35:03 -0700 (PDT)
Message-ID: <7cc9e6dc-6ded-40b5-ab0b-871b5741244e@gmail.com>
Date: Mon, 7 Jul 2025 11:35:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] rust: i2c: add manual I2C device creation
 abstractions
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
References: <20250704153332.1193214-1-igor.korotin.linux@gmail.com>
 <20250704153912.1197034-1-igor.korotin.linux@gmail.com>
 <aGgxfNh-sgkJls_h@cassiopeiae>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <aGgxfNh-sgkJls_h@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/4/25 20:54, Danilo Krummrich wrote:
> On Fri, Jul 04, 2025 at 04:39:12PM +0100, Igor Korotin wrote:
>> -pub struct Device<Ctx: device::DeviceContext = device::Normal>(
>> +pub struct Device<Ctx: device::DeviceContext = device::Normal, State: DeviceState = state::Borrowed>(
>>      Opaque<bindings::i2c_client>,
>>      PhantomData<Ctx>,
>> +    PhantomData<State>,
>>  );
> 
> I see what you're doing here, but I think you're thinking this way too
> complicated.
> 
> I recommend not to reuse the Device type to register a new I2C client device,
> it's adding too much complexity without any real value.
> 
> You also don't want the DeviceContext types for a device registration, since the
> registration will never have any other DeviceContext than device::Normal (see
> also my comment on the sample module).
> 
> DeviceContext types are only useful for &Device (i.e. references) given out for
> a specific scope, such as probe(), remove(), etc.
> 
> The only thing you really want to do is to register a new I2C client device, get
> a i2c::Registration instance and call i2c_unregister_device() when the
> i2c::Registration is dropped.
> 
> This is exactly the same use-case as we have in the auxiliary bus. I highly
> recommend looking at what auxiliary::Registration does [1].
> 
> Also note that if you want a reference to the device in the i2c::Registration,
> you can also add a i2c::Registration::device() method that returns an
> &i2c::Device, which through into() you can obtain an ARef<i2c::Device> from.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/rust/kernel/auxiliary.rs?h=v6.16-rc4#n299

Noted. Will take a look. Thanks for the review

Best Regards
Igor


