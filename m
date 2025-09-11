Return-Path: <linux-i2c+bounces-12892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46513B53C3E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 21:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 002CC5A664A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 19:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCE925DB1C;
	Thu, 11 Sep 2025 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ammDGvnC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A525CC74;
	Thu, 11 Sep 2025 19:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757618725; cv=pass; b=Twui++VaVVfUO0yEsA3mprrI/8gPqp9U1LBb/n4AsCAET1n6HpWyzk8vp3e3b3Gs6NaZ7T/13+HmN6EPjGXLgPKDFqf9v8wvmpas18PAILx/3IdjAOYPeM6CyrqW69AsLH+EqmM8GjWc846urcDYAbI8zV6vMvRWZdZd+HLc4J0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757618725; c=relaxed/simple;
	bh=vjD8izA5NiSgnX/hGpiBNnf0hK2bHDEPlIgCnvgxk6E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HGXGGdUUBK5Ks34bftskORtBypy8dzq02QqNk4Ejr+OcUPu3C5Vwy/MvaRPNcAlpHDP2fj9Q1eIwAKKCWuvcYXkgJMSW7GKMfkH3vRDmNIVDCQAJx+GPYClbpfISibsHUb+W3V3CYlr1cdricXsDhNwXn9tjGwQyODCHEMji8V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ammDGvnC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757618691; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jf0eLKFmmeoxZRQqTkzF/BchS3lmeruPIeolnkQQqo28pMh7jQvjIna9l5lqYHeFGyQwIubasTTaQ3iy98aLHdcL4M1tAerrE5zigSpA/n3GX81pcOuYi4/2DHX9Wvx7mbTMz56hbe8TeW2PZWShSCpHuRpmbf/RGkpZHEqqvOU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757618691; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nuRljL+hbej1PSlFfKE0m1fHSF8CjKkmOAxOOTpu5SY=; 
	b=OWjoH09+fiAOg/md6e5DvBkds2QUkV0jtBCrgmxy72HrPS5yInpOnHZ38WQrBqwjWDjd0nV6NAdsiycEy1EKiPNZq0tBgqURURf6JP6MRQuPEh/Y9pTFlsbjUc7Pq5w1gVabOiZbyzhM2lZd627y5uJy7iAKrbYt+khG13Z4Wx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757618691;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=nuRljL+hbej1PSlFfKE0m1fHSF8CjKkmOAxOOTpu5SY=;
	b=ammDGvnCvAffgdaJTtJTMCDxkMNNOmpQ8hqvXHG19/QgSNBuGt/N4Nwl8IHPn6cJ
	9eBN4jp7LEwjVVkSLTTvmxJkD9T6H0C4OUIB93pvpyo9DVJSoHuRqKWNhM3hxeCnmAm
	dszAvr3TJJVBcuqSXjWuoF11f8coBQRp5euFL3uA=
Received: by mx.zohomail.com with SMTPS id 1757618688708131.44302071453149;
	Thu, 11 Sep 2025 12:24:48 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 1/3] rust: i2c: add basic I2C device and driver
 abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250911154936.97118-1-igor.korotin.linux@gmail.com>
Date: Thu, 11 Sep 2025 16:24:30 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
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
Message-Id: <5BD2518E-6D56-4BD7-8D69-CB437E02AB38@collabora.com>
References: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
 <20250911154936.97118-1-igor.korotin.linux@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Igor,

> On 11 Sep 2025, at 12:49, Igor Korotin <igor.korotin.linux@gmail.com> =
wrote:
>=20
> Implement the core abstractions needed for I2C drivers, including:
>=20
> * `i2c::Driver` =E2=80=94 the trait drivers must implement, including =
`probe`
>=20
> * `i2c::I2cClient` =E2=80=94 a safe wrapper around `struct i2c_client`
>=20
> * `i2c::Adapter` =E2=80=94 implements `driver::RegistrationOps` to =
hook into the
>  generic `driver::Registration` machinery
>=20
> * `i2c::DeviceId` =E2=80=94 a `RawDeviceIdIndex` implementation for =
I2C device IDs
>=20
> Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>

I=E2=80=99m a bit swamped for the next 2-3 days, but I will review this =
soon.

Feel free to ping me otherwise.

=E2=80=94 Daniel=

