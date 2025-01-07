Return-Path: <linux-i2c+bounces-8938-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F185A03781
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 06:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F8463A4674
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 05:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B00E19D8A7;
	Tue,  7 Jan 2025 05:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ZAd0MKTq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B181817C9E8;
	Tue,  7 Jan 2025 05:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736229218; cv=none; b=bPnNn9YgaNx46rvtE6oCYyXfUzhX9GcRvdPEb0gI14aYLQKo3/vG6bOgJeQLxXqP/WCaJekI6+PvMTap2UqL0l1q6z+6HxlP5V+RKUYwKVrCnvyVDFJz4vWpRuvpTb1eW6Yz25DzorN4UxzOZqW7JVEOpHtVZo19aziUSig6crg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736229218; c=relaxed/simple;
	bh=LtjlwhG9B9G5MFbc8lneU17K4uoWCTM5laZrvJwRNyY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SFUvLygaZBdf2D3UrOAXstHetQB1e2ouyWozCER0SSAbv8VUOs9iyULooqK1NgICKOz3KTU81nssDY14mSjE6PRsSCLGAHf/CgalgKG+0KMaqdvbD1/KDI0uAjtEWNGwmx8gaLXZyfeeFs8Fc+AwH8cQLpImh15xHTQ2lUbZtsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ZAd0MKTq; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736229213;
	bh=d7GzDGEIhCY1GK+byjPJdhkSL4A03CBJlx1sryt4hPo=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=ZAd0MKTqX//BY/sdq4QR1aa6bCpL2f+2d1H7bdthMjEiGRjDZKYXAAaxkbDYkjyIt
	 t/7hbnDF1fryFVB0E0T0Oh3RYRoMdhhul9LVfkOfsuKJLJMqLWkSxGOXtjyPZX6Krs
	 QhsxZ20PtOEB9K3bgkuyWdtOtWdkReA6alRnUwCL2RzQt0NiIxsPTOdVrNC81CZ7Gh
	 cJibHg/zrrw3h+eOs+2mxqYaOe0mjzJQiLJLk4K5p7hTJONu5F6jri3yhJHag8OEPx
	 hHq74gvuPRgJaXlRFSN38Rq6j5qEdvtSvPTpdQHjlbvucGFmFjaVcB9Ymw3FyQAHfR
	 gmbsuyE3ozbMg==
Received: from [127.0.1.1] (203-173-1-122.dyn.iinet.net.au [203.173.1.122])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 33B74706BE;
	Tue,  7 Jan 2025 13:53:31 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 eajames@linux.ibm.com, jdelvare@suse.com, linux@roeck-us.net, 
 corbet@lwn.net, joel@jms.id.au, Delphine_CC_Chiu@Wiwynn.com, 
 broonie@kernel.org, peteryin.openbmc@gmail.com, noahwang.wang@outlook.com, 
 naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com, 
 patrick.rudolph@9elements.com, gregkh@linuxfoundation.org, 
 peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
 Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20241217173537.192331-5-ninad@linux.ibm.com>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
 <20241217173537.192331-5-ninad@linux.ibm.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: aspeed: system1: Use crps PSU driver
Message-Id: <173622921112.97504.9310903819331925081.b4-ty@codeconstruct.com.au>
Date: Tue, 07 Jan 2025 16:23:31 +1030
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 17 Dec 2024 11:35:35 -0600, Ninad Palsule wrote:
> The system1 uses Intel common redundant (crps185) power supplies so move
> to correct new crps driver.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


