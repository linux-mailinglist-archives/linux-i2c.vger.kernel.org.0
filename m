Return-Path: <linux-i2c+bounces-11975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FABB0B02C
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 15:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 792975619A9
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Jul 2025 13:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F28421CC4E;
	Sat, 19 Jul 2025 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZrsEDcQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB5DDC1;
	Sat, 19 Jul 2025 13:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752930653; cv=none; b=ODr1tkKXUKFbhMXKA+pdWhWQxucBXWpqLU7V9DHxUIkDz2rR0biCayLDeAvlzFEix9m2qamnDBRu1l73wHCuVg+1vCJK36DOFfbG0RUtugKjQgkyI3U6qF4scYFpyVwU8uDM2xsEO5D+EZO1VOmKoOFkSR8UYR6w3M4WJcx3S/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752930653; c=relaxed/simple;
	bh=rSTIGzJE4AZYfml7shVbzMPVYvWAf8JVrO1QpxdZuh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAcQRGrDv6vha2uMoYgy7GUL1gl1ZlS4cuj/3OmCptBK7iuaLApMcmQLT3GajTlfK0BWItDvD46G/b8/tVQJoObva6aASkU50bsgqk6yGbKPTsCNH3hsD+yem6CP+XB7svRal+dBtqsMgt7wTrwWm0/AO0xsyIV/xZXUtS4tp68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZrsEDcQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95A9C4CEE3;
	Sat, 19 Jul 2025 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752930652;
	bh=rSTIGzJE4AZYfml7shVbzMPVYvWAf8JVrO1QpxdZuh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nZrsEDcQp7EjPt8b6W+QExMsYf8U6TiOGHeo8WXIbgH3bzxNijIviTLT+bMd6S3pt
	 RILQ5JwahYtLFDFypUEGy3nX0D+ebLT1JvykCytL2c/wJSdt7e1r4zSQTrVokRiv0G
	 PosLZ2kDExIbc8isbgk8KmCur2leHVapofN+WITyYx4dxvsIHUZubAEFwk8X6NVqCw
	 v8uvPrEE1Q8bW/JRa8qlpYWaeNzgUg6VLsdP3aF6kLeIUnDDG4JsV1J0/P5kXxMFYe
	 7rMlTWu6xCKpeW6v5Qn65qPBlaNbUzn2yhabpGqKqOfemEn0azOOyDsH3Xz3Kqj72a
	 eZSu1Kp86Kvhw==
Message-ID: <43aaf42a-6756-4133-8422-03ab99a59d19@kernel.org>
Date: Sat, 19 Jul 2025 15:10:48 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple
 A7-A11, T2 compatibles
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 Nick Chan <towinchenmi@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
 <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.06.25 15:45, Nick Chan wrote:
> The I2C controllers found on Apple A7-A11, T2 SoCs are compatible with
> the existing driver so add their per-SoC compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Hi Andi,

I think usually this dt-binding change adding new compatibles should go 
through your tree.

If you want to I can also take it together with the other dts changes 
though.


Best,


Sven




