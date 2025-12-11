Return-Path: <linux-i2c+bounces-14510-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 215C7CB692F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 17:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40A943012779
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 16:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D362D5A14;
	Thu, 11 Dec 2025 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DA7Jz8sI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0222A813;
	Thu, 11 Dec 2025 16:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765472155; cv=none; b=bYZ+cB3HStDtKv5mqvteHEnzR3E1zSSduF+uuVwtZZNNwGxcZZUIV38KsMNv6YFi7u24Un3BDVyo8LZweDWz7UbHqQvbt/uLpW6d9+cYiwA7/NAxB2h16VC9gjNWAcaMs5bAWOMfrPpSb3Xiby7oZX0p/2TuDcVefGs9QmrkRLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765472155; c=relaxed/simple;
	bh=p1wXN1Wr+B3KKDcmzUhjXYWeO1t5k47iSeRckuWz7jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0Y2/FPc4HeakZ9yiVd5f+nPIxwYOrE5PfM3xQav5HR20+Ght1h/23SuV38wexdKPkJ7KomMml91KCwGadh/CDw3VQXpVY4ykGGp7LbXFzebBRuH4kAuJu145W2bjV2Htjb3Q93qsvBjwk7smRGBRwuQjjR4sjVP+12k5onRh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DA7Jz8sI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C15FC4CEF7;
	Thu, 11 Dec 2025 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765472154;
	bh=p1wXN1Wr+B3KKDcmzUhjXYWeO1t5k47iSeRckuWz7jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DA7Jz8sIqptqoXVCIONcKg4aA00Jo+7Ibmpw0oib4G7Q+yZCMIEi/VJByqKAWXwZH
	 06Racp2pVu6pGrzoFBUbrhMs1vl5f1Zz8AERcYjsMG5dlVHUe0oCwbRgzYYe929Pgh
	 t6Gy1J/135ONdyfqDsVx9E+w4ZgtorTb7fRVf30FbSV+YNjEOWcs8sZRLOICOt1tf3
	 rTlKPn09wRhBpdyfN0NpquK4XG+ckriorFLZXyDP6P911T56i7UyqCKbetHbwROZ8D
	 jSo/B3N0GWfdjGWzwcS+gLiFvZLqrz4b8yQMlDKSykpI3yDmvTR6Y3S8SSCjYfQnbs
	 nPx1bGntv8zdg==
Date: Thu, 11 Dec 2025 10:55:45 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: eeprom: at24: Add compatible for
 Giantec GT24P64A
Message-ID: <176547214530.1553950.16205619497487516656.robh@kernel.org>
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
 <20251210-fp4-cam-prep-v1-1-0eacbff271ec@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-fp4-cam-prep-v1-1-0eacbff271ec@fairphone.com>


On Wed, 10 Dec 2025 10:05:27 +0900, Luca Weiss wrote:
> Add the compatible for another 64Kb EEPROM from Giantec.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


