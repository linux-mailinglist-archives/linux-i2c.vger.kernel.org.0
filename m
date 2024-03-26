Return-Path: <linux-i2c+bounces-2624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABB188D2CE
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 00:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3531C3292E
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 23:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A28A13DDDA;
	Tue, 26 Mar 2024 23:25:06 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446F36FE35;
	Tue, 26 Mar 2024 23:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711495506; cv=none; b=YeuqNi3GEhDPOhm+AChSllaqMckK7D9p+LOxSrCSsBm+Y0giMHL6z6M9gVzh/3+vSTV+2MuNlgE+jWHlFNAzuYjBSZQSRKEHky9imbZrjVKAc027GddxOfTl87XBtdiGCrJ9ajohiyHxZy+BQAfH+QmKDwm6dV0b7Mr2Rj5hav0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711495506; c=relaxed/simple;
	bh=/TwaUWPtbcr32wiCp9VhBHSukSNUm57OfrofMtXGVGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clqgqDdf6qk8KZtm9C8T5e0IwxsRrMtRsIp59Y42dqqVoyjDFk8Ia0R5v+8D4JUtoS7xm5bh6skgsUzuihoAah5zXlnnFkP5MZk6dLm9UIUwWzyyp/PQXF819fXS56Er7F4UpSPC55W2SV2VgOBGgEhieLyPQXpiWg3JD/QWNls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6C022F4;
	Tue, 26 Mar 2024 16:25:35 -0700 (PDT)
Received: from [10.57.81.167] (unknown [10.57.81.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B73133F694;
	Tue, 26 Mar 2024 16:24:58 -0700 (PDT)
Message-ID: <3f61d6d3-a0d6-4c49-b094-6ba62d09ab14@arm.com>
Date: Tue, 26 Mar 2024 23:24:56 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-input@vger.kernel.org, kvm@vger.kernel.org
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof

On 26/03/2024 20:23, Krzysztof Kozlowski wrote:
> Merging
> =======
> All further patches depend on the first amba patch, therefore please ack
> and this should go via one tree.

Are you able to provide a stable branch with these patches once you pull
them in to "one tree" here ? We have changes coming up in the coresight
tree, which would conflict with the changes here (horribly).

FWIW,

For patches 1 to 13 :

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Suzuki

