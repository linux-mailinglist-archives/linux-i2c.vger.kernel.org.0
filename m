Return-Path: <linux-i2c+bounces-15100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CD7D18FFF
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:04:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EDFB301A1F5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 13:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5E438FEF9;
	Tue, 13 Jan 2026 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="V+1h2I/i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BACD38B7C5
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309454; cv=none; b=XMyFRzmkpTzSqIu4Fjwu+Khxd7zrEgSfYS6OJ2BYvezWOGChTCGUHvjR30/ZCL9JGVsuHdgi637BdsgIkiwQQf3n9uzb5Ze9b5YF9fDNUX1D2NEVyz4FAasJyRZErehN3OxLiOj2GCUq1j8tY35RfQ6NSO/+GACeMSNSuqEjBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309454; c=relaxed/simple;
	bh=7zHYQuLMLThX61XguZDJYltNArOv8k/59IiGsM+379E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsYMWK++JMsednoa6/3Bq2ehWN0BvKLD4BNtU+21YcpHZK6CuLMECNMeAtbArghrICNPJEKMJu5C+ZryjuN1ZF7MjgJqRgCTscYRS+psEwS0GrQW+6o2fzk6zk7C0vjBg4H1flbDyKMVT/l6+oc5ei6A4z5ZxQlae+qHqcK9QwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=V+1h2I/i; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7DPc
	02BPDXRCPlk55tE1zQ0yL7hZ4M+jB2XH8eiaI/I=; b=V+1h2I/iWdDQ7lWhEi2l
	9pJAtKZx+A6z/JC/8qe1ZTjaH2STVl1tsXNQ1KIX2ObdGT9BSYi4MCDq78mpqmPx
	5SQtOie9cfkkiG9X8CBwC+lCS/Gf2q1FyXTbSYE+4TcaDFbDe32ocmZZXjefETjF
	ahT8VBejvt3D6z050ICyY93HKlWeBwyhN0hZKQIwdh88FqKd4EI7gvt1sviqw2h2
	OejEjQS8cjiHsCd45kYAY+lTCAwhLqu8/HPAFZvzaNEKS2Y2H4pfx3wAcsVYVk9+
	qVsC6/DIoT3AD//boMi4BQobmP2E8+7hxyUKGtASFmqcsdWcBUP5Dvezz1/rYuJ2
	dA==
Received: (qmail 1687664 invoked from network); 13 Jan 2026 14:04:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 14:04:10 +0100
X-UD-Smtp-Session: l3s3148p1@QnyfoERI7q0ujnvx
Date: Tue, 13 Jan 2026 14:04:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: i2c: st,stm32-i2c: add 'power-domains'
 property
Message-ID: <aWZCyYc8QAY1LOtF@ninjato>
References: <20251215-stm32-i2c-mp2x-dt-updates-v1-0-2738a05a7af8@foss.st.com>
 <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-stm32-i2c-mp2x-dt-updates-v1-1-2738a05a7af8@foss.st.com>

On Mon, Dec 15, 2025 at 01:19:40PM +0100, Alain Volmat wrote:
> STM32 I2C may be in a power domain which is the case for the STM32MP2x
> based boards. Allow a single 'power-domains' entry for STM32 I2C.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Applied to for-next, thanks!


