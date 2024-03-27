Return-Path: <linux-i2c+bounces-2626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B51E288D70A
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 08:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5B681C24187
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 07:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5662328DA5;
	Wed, 27 Mar 2024 07:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VfMgmRxF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A03524211;
	Wed, 27 Mar 2024 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711523714; cv=none; b=QrawCD72gkxLauNlx9aAeT57Xd+wBP8vIIjBYd4PFWX8O2AO4y+WPEPOu90EjHiwxngoIGUMNkyrKzWovvwo2Ow3JP64eJzd+T8J/xkJ1gYsVa+V96c8dg8yzgm7bKy8jgxh2lH9wFAse7vc9C8gXDhwKDF048trGZRI/XCjPrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711523714; c=relaxed/simple;
	bh=FpltiPoOASUUqaJrAExtzb8bLYhXKlhsV1BX25LynyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7FutSJZFrK9uLcZ3AqbCs5FsedLUowuZRuLmX7BVvEn9elK0hPcIwCh+XgewadHdmwkbtz9UJiddgnCMSYKluQNs1CtHx1+l25jdo37sFisAZNJz+5yvVzMXcXuqvAakuzy1yIiBxlMn3I0HSL6jcQ038Hkv4nkf0JYGkhn7qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VfMgmRxF; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EBAD260003;
	Wed, 27 Mar 2024 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711523705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpltiPoOASUUqaJrAExtzb8bLYhXKlhsV1BX25LynyQ=;
	b=VfMgmRxFYX4HLXhCtPo9SVwr9StoByzqEyU48zdz29ynsFKM4bTU8jfUjDbdvaZKdMu7Jh
	uEt7edg1OmMEo50g/tK7fwaSNu4HNQoej1KckJX1lgSzU1WHgytP86s/R/59TiXGkX3qk6
	uLIwa308iZeafubo5l2bSrhKpepxhrWK8IKS6dQJ1weUH0RMauJy5RX/E6QuA0UfESe5k/
	//wJD8B0to1epvnfj59VDEyaWWdXm4GqQcDJA6RI3enX7n5fMtDSNSR5DhvWnVJbFxHBH+
	3nGFHSQ8GDquX2aRBn5PKcAmM6vRsEH/G6LDBqhh2fTOB7Kk5Uu5YT3Ppprt/w==
Date: Wed, 27 Mar 2024 08:14:56 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, James Clark
 <james.clark@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michal Simek
 <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>, Alex Williamson
 <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-input@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH 18/19] memory: pl353-smc: drop owner assignment
Message-ID: <20240327081457.0347cf17@xps-13>
In-Reply-To: <20240326-module-owner-amba-v1-18-4517b091385b@linaro.org>
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
	<20240326-module-owner-amba-v1-18-4517b091385b@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Krzysztof,

krzysztof.kozlowski@linaro.org wrote on Tue, 26 Mar 2024 21:23:48 +0100:

> Amba bus core already sets owner, so driver does not need to.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

