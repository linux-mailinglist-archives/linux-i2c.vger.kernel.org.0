Return-Path: <linux-i2c+bounces-11350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEF5AD3F82
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 18:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D515517C605
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 16:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF97523C4F6;
	Tue, 10 Jun 2025 16:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c5BtzaQN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6C51494CC;
	Tue, 10 Jun 2025 16:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574299; cv=none; b=J+9AUmLGwKK+T+LVktz4g8aMRHz1Qnfyxo+n2WMOJdDEFD9ZXprDTS0xoU7s83ZNBMfiiYs5YAoizJpxugb1iHMo3YL+D+enuoKjTdpfUsB5cwyDj+/vgrqgi+5duuvfLpjmRvcoAcsBP7xz92Clx1JAIE4jabiv7dSpPrUoQek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574299; c=relaxed/simple;
	bh=O2hBNT2vFnfr2GKirm5zT02sWMH4fe9vNHz+wUQLrYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M3zVUOfpY3W0ezTOYPK47ubMiSaDQnYJ+ddoo6Z0E9c68qgDFmqZu2c38/2lepABpi2YoPjMVxUdsimHvxTOdyvUeh3rNT4Tc5B/FjpNF4ljldKi5BLsURgKf57BsDEQws2QnlVuiYQGR6u7DJ3mM+jMf3fMZztLbYvpN1rBDkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c5BtzaQN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB19C4CEED;
	Tue, 10 Jun 2025 16:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749574298;
	bh=O2hBNT2vFnfr2GKirm5zT02sWMH4fe9vNHz+wUQLrYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c5BtzaQNc4JDuBf8SjSi1dNIZnnB7X9eMkM1Y6WQwIuEJnpLxFosTWtnX2NMU3tjY
	 fDMHsiY12crShD6NJJmTgZPbeyDlNaKyeQ6q206Mx64XKepiXWcgRqLgumT7DPrO+r
	 WuSuexJ6yNPdL8hK4QJx+ipHA67Q4IyD96nbRTK2FqZfNcSvkuLgaxnw6eDFcp8Uzd
	 QWr9QoHKkj1DfHqqUuN6p1yWKjS9cyUM+1uJwDLdqgzRXlI3ZuX/kvzm9aHynleOJz
	 g+yFJGcoEjITQqMl7sCN7cl49gi/xybiCvQ/awXLXIP8GlYuEEsUQGVa3C0NXP49dI
	 JB+DgTnAmYJAw==
Message-ID: <79b9fa2e-ea04-43f7-8b12-c2cba2a363fb@kernel.org>
Date: Tue, 10 Jun 2025 18:51:34 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple
 A7-A11, T2 compatibles
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>
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

Reviewed-by: Sven Peter <sven@kernel.org>



