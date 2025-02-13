Return-Path: <linux-i2c+bounces-9423-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE38A33EF4
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 13:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 910B23A9377
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 12:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F214C21D3C0;
	Thu, 13 Feb 2025 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="R2+1Ezj7";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="R2+1Ezj7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA7915383A;
	Thu, 13 Feb 2025 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739449081; cv=none; b=NhW7JXrU9jaExuDARKBlXSh9lnAEgOm1q2NInEeHtmkFptMNazt7156OWjxQ6p5GLWb5Sa3R7Gwkqa2/C7QLXI9B6Nl0WuBykVztpwA89D2emiLnS85IT2AbNKLv/DjUgGXQ8WwxYvaaD3l/h3tF5FEeq0i1ydc1I0HfLFmtChc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739449081; c=relaxed/simple;
	bh=Js2J+We0EvBUaLzVdJbyTpliD1eqko9gYiN/kW/jRHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CnP2pm+e0hrr0pXG3wpDEjKQU6Un8QHi/FYuvCpdAnKEhD58jeLYd9gRqOk5NDQKHhneioG9qW5pQpXzpozhWjl/CCyedvJS1PIzx+4pYC2TjydDXtkdAGsAqaZdpnGjf2pxZtiU8mdd7hfO3ATr6HQ7stFYS035sGyVZsZlH5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=R2+1Ezj7; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=R2+1Ezj7; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1739448574; bh=Js2J+We0EvBUaLzVdJbyTpliD1eqko9gYiN/kW/jRHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2+1Ezj7XnIiH/8+SKrh/QoEozYuaKzC9/SB4PMu89COfc4wa1PmY7Os7YHyHTBfR
	 7XjsRnxi0+eMp7NCl8Zz+2xtnWKbusOwLUdfXz0CGS4SQqrNFdM607UR2Dac5LGf1q
	 oLHJLqEyvUe/rujc9Hms16Uz9nhyfrRrudNhL5vEIYGo/NofSWQhouO5CU7VgVZgy/
	 67k7UZHBalgvUy6wlq6FE7tHGdr8BoqNs8WxfvREQn+s3eV8eth1FpobAzZCGHeSGK
	 cgpDItUtfoOO+raAMHf6rTzAOzNHpAK4ud26pt3FH1xWi9wxa1P0DwT4dqghu1DKnp
	 7DIBxFWFE6CGg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 601253A2376;
	Thu, 13 Feb 2025 12:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1739448574; bh=Js2J+We0EvBUaLzVdJbyTpliD1eqko9gYiN/kW/jRHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2+1Ezj7XnIiH/8+SKrh/QoEozYuaKzC9/SB4PMu89COfc4wa1PmY7Os7YHyHTBfR
	 7XjsRnxi0+eMp7NCl8Zz+2xtnWKbusOwLUdfXz0CGS4SQqrNFdM607UR2Dac5LGf1q
	 oLHJLqEyvUe/rujc9Hms16Uz9nhyfrRrudNhL5vEIYGo/NofSWQhouO5CU7VgVZgy/
	 67k7UZHBalgvUy6wlq6FE7tHGdr8BoqNs8WxfvREQn+s3eV8eth1FpobAzZCGHeSGK
	 cgpDItUtfoOO+raAMHf6rTzAOzNHpAK4ud26pt3FH1xWi9wxa1P0DwT4dqghu1DKnp
	 7DIBxFWFE6CGg==
Message-ID: <9e2b9e70-454d-4573-b1d3-b77fe9dc9a46@mleia.com>
Date: Thu, 13 Feb 2025 14:09:32 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] power: ip5xxx_power: Make use of
 i2c_get_match_data()
Content-Language: ru-RU
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Samuel Holland <samuel@sholland.org>, Sebastian Reichel <sre@kernel.org>
References: <20250213114613.2646933-1-andriy.shevchenko@linux.intel.com>
 <20250213114613.2646933-2-andriy.shevchenko@linux.intel.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250213114613.2646933-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250213_120934_411596_C50C303C 
X-CRM114-Status: UNSURE (   4.62  )
X-CRM114-Notice: Please train this message. 

On 2/13/25 13:45, Andy Shevchenko wrote:
> Get matching data in one step by switching to use i2c_get_match_data().
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

