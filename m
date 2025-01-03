Return-Path: <linux-i2c+bounces-8903-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECBAA00FB3
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 22:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0EEA18852CE
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 21:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D64D201262;
	Fri,  3 Jan 2025 21:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pECRVEB+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C24201113;
	Fri,  3 Jan 2025 21:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735938894; cv=none; b=rjs6qVOTBHISa5IG2EN3yiQQEY6tzLj6+dSG56BbtEEcVex8NsLVHTY/iraucAmNRvkhSbwfdNffLxPFlYgTZd8yHu0otG54WwZl8TrSZBnq9ZFJKorSmZBdZrSrRxNnED/jQXysnLr/7mwAw21CPm4+bC5UM2snJgLj99J5UeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735938894; c=relaxed/simple;
	bh=MMWnWb5iGCwcpwOoE5EbuH9SKEw1YOyvovxZm/fYqIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trioTZn7da58H6iPVkdpGHpdGLzIpBSC/XGn73UmqEdlkhKtG04OaVQBGE8heE36CBAiupfWwnruIOkk14tFGqSxMHZ7K6v3P1/z5iblATIvPXM1tivtbfP1WLKiEmDFGZB3SvlkXFXkD2Ta5BJkp5aWcCAi+J27FF0px6Ge9Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pECRVEB+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABE4C4CED2;
	Fri,  3 Jan 2025 21:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735938893;
	bh=MMWnWb5iGCwcpwOoE5EbuH9SKEw1YOyvovxZm/fYqIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pECRVEB+UcUY4z2lcadf7vu4mXlc7r7MTwpQFxRq/0AllvMvu9ze7d2AhJVZH68nF
	 364SlBBvQ+xIxYMCSEKYm1w8kg6fFF5Rb4qPiA/I/BtaJTWrsFPUrzFdeX6nBafqti
	 boFbR7aqIa2UG0hwJaqrTtkXnhOo5ZVAC5cqLcZ8KoFwu5DITzmuAiC5Qvp+yyeKPO
	 58qM4ZVf1reHhU0Ol45C7zksyY0fFy9ZOfXleE4cwaXMAqT/7i428kl/txb6YJ+7x6
	 IfVNJXMcW0MHkGlJdmSGXBv5sQnb5o+UHr4U3Amdz0bxgjMlafYPL5vtTlVqXhXG/T
	 /cpquKCX4qhkA==
Date: Fri, 3 Jan 2025 15:14:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: vendor-prefixes: Add Puya Semiconductor
 (Shanghai) Co., Ltd.
Message-ID: <173593889111.2841683.11350344430804894650.robh@kernel.org>
References: <20250103-fp5-cam-eeprom-v1-0-88dee1b36f8e@fairphone.com>
 <20250103-fp5-cam-eeprom-v1-2-88dee1b36f8e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-fp5-cam-eeprom-v1-2-88dee1b36f8e@fairphone.com>


On Fri, 03 Jan 2025 12:11:58 +0100, Luca Weiss wrote:
> Add the vendor prefix for a manufacturer of EEPROM chips among others.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


