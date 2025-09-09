Return-Path: <linux-i2c+bounces-12813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C6AB50521
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 20:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93AF15E6811
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 18:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B3E326D62;
	Tue,  9 Sep 2025 18:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="VBLIms0F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A92FC88C;
	Tue,  9 Sep 2025 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757442213; cv=pass; b=MQ5Guz9SX1vVD8vN8d0Bz7wQzwQ5B0K9lHL2xdYtE7H/g5zJmBo88NUYSOcyy+Rr1S8rSDS1/hy7HVSngMF2khsKhOEhQsq5LMqm+AFm6Mu6Gt3tQCOc6AueKwYOdcStC7Dl4UoodCvEX+dzffLVR7jIYfG8P6ml5/v+BRvwB/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757442213; c=relaxed/simple;
	bh=ubRkoJFbuAK+yS+v4W1ZNa9lC41JmMiyAmj1e7TS7bQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aXJVm6CkNgjQ3Aqu53NHHFrOOw8+IYrXsiXR4CPLnoF1YGgnN72qEEvXGIMHtvvQWEeQ8InTqkfAR0tB4oosZsZanl+4u8jMzIVd7AsXppnQ1/DtTwNUSj6hlHRa8JderALy/z+HOt8mlfnjECRbA5/9bBOhbAIdA5h2qHUozKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=VBLIms0F; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757442183; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bI40IG7HNevlCHBra3f0TBjpeg1nf2SprMYCxigrt3GtNFX4Drq51/bZfQKkOgsV8CiF23JBR6BvRLhHysGM78awQOOsEU0FQBh8w7KJFfObP46m0Mz1hadxZAm0lezTXBE6SUOnPHx5hpAEAhEWvwpAAuqKk5U3E7KsjQprW8E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757442183; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MRRNEQt8u3ZdYDHCaJT8rczhY+A4PzkMymyQNNuh5Tg=; 
	b=HPwyUZ/xwN/NCSU5bS1fu1TluQJ8XIfNn9r2lVuZeQDUDDnglxf9Cvse0KKmfpQVXeNJJm8Fuw1MxaUMrY8IFxaR7IQvHGeM95DIh3zer5JmBR1ggqeIcqAgzE6mbQ9+6ZeKxlmZ2yLWSLBrJgJqHTAG2ZH8zdx4AB/ASjUvams=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757442182;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=MRRNEQt8u3ZdYDHCaJT8rczhY+A4PzkMymyQNNuh5Tg=;
	b=VBLIms0FlinvQ4dVLcIWgjPqMfaYGAbxG2k0ecqafoC2Sl8W1LxDHShuKo6KzgXC
	NqhRpVX390Gr2X1e2nnFy1eEPOTV69fyiSjwxzGhEBHIWLTBIGuUc9SQMEHmQJVbemZ
	xh2+fIdsXPj4cjdhjpeJ3t5vVgU2JDH48KrbDy6o=
Received: by mx.zohomail.com with SMTPS id 1757442181262749.6141457442421;
	Tue, 9 Sep 2025 11:23:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v4 1/3] rust: i2c: add basic I2C device and driver
 abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DCOH6SUB5M7K.1K4V1DRAERH1S@kernel.org>
Date: Tue, 9 Sep 2025 15:22:42 -0300
Cc: Igor Korotin <igor.korotin.linux@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 linux-i2c@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F8146F2E-E66B-4F47-816D-40AAFE8B65F7@collabora.com>
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
 <20250820151913.1814284-1-igor.korotin.linux@gmail.com>
 <CB269793-D165-4D22-95E5-F978C1ECC79E@collabora.com>
 <655ca23c-1fe6-498a-80b8-1b75044d9db3@gmail.com>
 <467F4F57-9452-4B68-931B-4A55A7CBC268@collabora.com>
 <DCOH6SUB5M7K.1K4V1DRAERH1S@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 9 Sep 2025, at 15:19, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Tue Sep 9, 2025 at 7:53 PM CEST, Daniel Almeida wrote:
>>> On 9 Sep 2025, at 14:19, Igor Korotin <igor.korotin.linux@gmail.com> =
wrote:
>>> On 8/27/2025 7:37 PM, Daniel Almeida wrote:
>>>>> +    /// Returns the driver's private data from the matching entry =
in the [`i2c::IdTable`], if any.
>>>>> +    ///
>>>>> +    /// If this returns `None`, it means there is no match with =
an entry in the [`i2c::IdTable`].
>>>>> +    fn i2c_id_info(dev: &I2cClient) -> Option<&'static <Self as =
driver::Adapter>::IdInfo> {
>>>> Again, perhaps a private member function? I=E2=80=99m trying to =
simplify the syntax here.
>>>=20
>>> Can you, please, kindly clarify what do you mean? If a function is =
not pub/pub(crate),
>>> it is a private function.
>>=20
>> I mean a function that takes &self or &mut self as applicable.
>=20
> This just turns things around you you have to pass in the Adapter =
type, which is
> required by this function. Having the device ID table and ID info =
accessors on
> the device structure doesn't really make sense.
>=20
> The current implementation is also in line with what we do in the =
driver core
> code and in other bus implementations, such as PCI.

Ok then, in which case feel free to disregard my previous comment :)

=E2=80=94 Daniel=

