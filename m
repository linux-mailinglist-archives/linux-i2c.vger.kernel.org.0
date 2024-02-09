Return-Path: <linux-i2c+bounces-1675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0DB84F0F6
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 08:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8EB282BC5
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Feb 2024 07:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A686265BAC;
	Fri,  9 Feb 2024 07:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HL/3DDgq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A578464AB0;
	Fri,  9 Feb 2024 07:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707464696; cv=none; b=qqRWTKV++JMM/PqbGIcwP+Oj5BpDTEmsA3QsKF1/H4RdOjuTxqhHm4i4maJzXLr9ST/vLvDlcJN6gs4DAdfZT94pUe56h67WGky6PdOq1u4Dq/Un3oKZje9lbIj5O5X1vKYOV1isSoc4/xH6G9dtqR9zLOUS6ivu9a4j1kssLvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707464696; c=relaxed/simple;
	bh=6/pY/D/QQEUjxYA0ri1gHUZDiS7C10pDYQcPTYirTgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3QMaLpbkORPvp6+bPwo8qOjzZNAJwRMj7Ej3AoxO4bwy1M/imL7PHuTN4anqhfOPsiLZKITtCWrQEh7iu98rcEWRjz/Iji8PjT6EV6q+PLHpYTAGvrvj5M8AabCFPifYq1/72Bh/tuPjlRtjBi272YCuVmkSRuSacISAUkYkf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HL/3DDgq; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E24360005;
	Fri,  9 Feb 2024 07:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707464684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/yGVB4S9XN8g+AahJ4UZsgKIptGOzEicK0dEzXmeqk=;
	b=HL/3DDgqSUW2klhjMqzXqFo7d0LD8T34GKYdq81YEKyfDizBqYpkX52LFNRh01hZJS8Fsf
	lR8gcJtio9GhiFtcV/qaUaiK3gTh7xmD0LzKhHKE/kt58Qj7GXSD5YUzVwkOIGNBT7QfLH
	MipYb28nCPctAC/gwP31mBynW2l4eSaIJz1xOhAeEzQN2H0wP9h4BbnGs0vvVFgbAnNkjQ
	5wEBdtxtaKZ1DDo7jr8AuQ9ogx7G1jLcMQCHkbTi+rRT7cYsoghyxBaUeaOx+R6YL4oUto
	/8h9N1v0LXUuYd2cUb1TCZeJ0iVAFiXXqCNVau0M5jAJm1QI/geiGugZ6mnnoA==
Message-ID: <68d4a1bb-5b40-47fe-a117-647d77009b43@bootlin.com>
Date: Fri, 9 Feb 2024 08:44:39 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] gpio: pca953x: move suspend/resume to
 suspend_noirq/resume_noirq
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andy@kernel.org>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tom Joseph <tjoseph@cadence.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-1-84e55da52400@bootlin.com>
 <20240116074333.GO5185@atomide.com>
 <31c42f08-7d5e-4b91-87e9-bfc7e2cfdefe@bootlin.com>
 <CACRpkdYUVbFoDq91uLbUy8twtG_AiD+CY2+nqzCyHV7ZyBC3sA@mail.gmail.com>
 <95032042-787e-494a-bad9-81b62653de52@bootlin.com>
 <CACRpkdY2wiw1zH8FsEv7S1FW044PBSXpLPqanF5yyH1R4oteEA@mail.gmail.com>
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CACRpkdY2wiw1zH8FsEv7S1FW044PBSXpLPqanF5yyH1R4oteEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 2/8/24 22:29, Linus Walleij wrote:
> On Thu, Feb 8, 2024 at 5:19 PM Thomas Richard
> <thomas.richard@bootlin.com> wrote:
>> On 1/28/24 01:12, Linus Walleij wrote:
> 
>>> I guess you could define both pca953x_suspend() and
>>> pca953x_suspend_noirq() and selectively bail out on one
>>> path on some systems?
>>
>> Yes.
>>
>> What do you think if I use a property like for example "ti,pm-noirq" to
>> select the right path ?
>> Is a property relevant for this use case ?
> 
> That's a Linux-specific property and that's useless for other operating
> systems and not normally allowed. PM noirq is just some Linux thing.
> 
> *FIRST* we should check if putting the callbacks to noirq is fine with
> other systems too, and I don't see why not. Perhaps we need to even
> merge it if we don't get any test results.
> 
> If it doesn't work we can think of other options.

I think all systems using a i2c controller which uses autosuspend should
be impacted.
I guess a patch (like I did in this series for i2c-omap [1]) should be
applied for all i2c controller which use autosuspend.

[1]
https://lore.kernel.org/all/hqnxyffdsiqz5t43bexcqrwmynpjubxbzjchjaagxecso75dc7@y7lznovxg3go/

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


