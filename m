Return-Path: <linux-i2c+bounces-12812-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6023EB5051A
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 20:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B0325E1B13
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 18:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E772EFD86;
	Tue,  9 Sep 2025 18:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uROxupoR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6912123506A;
	Tue,  9 Sep 2025 18:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441988; cv=none; b=mbgbRDAUZ4de8FsYk+ApJZ5DzBDedBFugs0v5aGTPtXBGPOaWg/1vWLAB+ayu9rlQgFIdpAwnTTzgtuy7eSKL1dPGy7BJHCG32rV8jlIgKY2RNRjqfd136zM63Y4gAuGGRk2/ITU2RSUhUqpkTSEuzZv5dwDYTnPdmBcZTShueI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441988; c=relaxed/simple;
	bh=nCr8ESlIs6mf395ZTGBVqnuE5keWNOCLbfwe5uM09Bs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=UMObbag8bQ2TkE+4LCG3ayBBQ4XMgSevqlajtGa51VFT85C3D8hosccqOo1WfU+q/fxk6D+WTr4YgeKPhyirG6DlpryUN13ZGD4dSeHF/aYx56QOAT3Xl9cyargM2Jkx8IgTMjOViN4WdRvQAdvmzgV8sy0oXV1W5sZk+Fkb2+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uROxupoR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0125C4CEF4;
	Tue,  9 Sep 2025 18:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757441988;
	bh=nCr8ESlIs6mf395ZTGBVqnuE5keWNOCLbfwe5uM09Bs=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=uROxupoR90HPgFLjMqDmzVa0r1uLGansJ5mgIgYDr88WMZBAnIMdFRqbA6AEBguhB
	 Drl0Q7LoUo3OFV7t7GOzanejOqNEiMkj+XJl0g5n4kknCAPJ+Rvm4MVU4BqDYRTyRn
	 wqijRLFqWWqfm2mX+RBKBeszTMS4/aNPbwtkDF3z9a8fxSSs+gsPCySA6lP+WHMLWB
	 1ChXxYVyuph0WgyW3xIolD8mMX6DeTH8s1F8hm51gHyHAV6Q3jpasqF/87TH1TVJov
	 UHX2aDXT2Sb0+EE3hkhP06ZtIYP1BG090b2Ahg8O/RqLn6jTati88JwH2THaQpdXqQ
	 z8YpGaUc0RWZg==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 20:19:42 +0200
Message-Id: <DCOH6SUB5M7K.1K4V1DRAERH1S@kernel.org>
Cc: "Igor Korotin" <igor.korotin.linux@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Asahi Lina" <lina+kernel@asahilina.net>, "Wedson Almeida Filho"
 <wedsonaf@gmail.com>, "Alex Hung" <alex.hung@amd.com>, "Tamir Duberstein"
 <tamird@gmail.com>, "Xiangfei Ding" <dingxiangfei2009@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/3] rust: i2c: add basic I2C device and driver
 abstractions
References: <20250820151427.1812482-1-igor.korotin.linux@gmail.com>
 <20250820151913.1814284-1-igor.korotin.linux@gmail.com>
 <CB269793-D165-4D22-95E5-F978C1ECC79E@collabora.com>
 <655ca23c-1fe6-498a-80b8-1b75044d9db3@gmail.com>
 <467F4F57-9452-4B68-931B-4A55A7CBC268@collabora.com>
In-Reply-To: <467F4F57-9452-4B68-931B-4A55A7CBC268@collabora.com>

On Tue Sep 9, 2025 at 7:53 PM CEST, Daniel Almeida wrote:
>> On 9 Sep 2025, at 14:19, Igor Korotin <igor.korotin.linux@gmail.com> wro=
te:
>> On 8/27/2025 7:37 PM, Daniel Almeida wrote:
>>>> +    /// Returns the driver's private data from the matching entry in =
the [`i2c::IdTable`], if any.
>>>> +    ///
>>>> +    /// If this returns `None`, it means there is no match with an en=
try in the [`i2c::IdTable`].
>>>> +    fn i2c_id_info(dev: &I2cClient) -> Option<&'static <Self as drive=
r::Adapter>::IdInfo> {
>>> Again, perhaps a private member function? I=E2=80=99m trying to simplif=
y the syntax here.
>>=20
>> Can you, please, kindly clarify what do you mean? If a function is not p=
ub/pub(crate),
>> it is a private function.
>
> I mean a function that takes &self or &mut self as applicable.

This just turns things around you you have to pass in the Adapter type, whi=
ch is
required by this function. Having the device ID table and ID info accessors=
 on
the device structure doesn't really make sense.

The current implementation is also in line with what we do in the driver co=
re
code and in other bus implementations, such as PCI.

