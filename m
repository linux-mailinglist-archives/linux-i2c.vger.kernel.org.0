Return-Path: <linux-i2c+bounces-1811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AC5857732
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 09:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25C0C1C20BE6
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Feb 2024 08:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BE71AAB1;
	Fri, 16 Feb 2024 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lo+p/qBQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3117A182AE;
	Fri, 16 Feb 2024 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708070410; cv=none; b=X2xiMyEw/ugFBIvE8yL8FsrrP62fSVE0bt5R55p9b2vHmFL/YA+aIuJaYGGdk2oSqkI6wLChe8wryODy8on3bWJT7OW6Qro/b5Q+z7cHGsFN9mdrUrzdWuEg+IF2AJ2nUqxkkmqITv4PIQ4+nfzROqShsHqJNC9mno7+TAtimMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708070410; c=relaxed/simple;
	bh=tKUNylC32zArc0JFh4DUwtl2sZsdK9U9bsqxjAHmfTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oeLXMYm8U850jxsQAZ2nRuixig0PbRm130ZeXWDJmUd1Zw5xdc4/MaX2jQseNw5J0aC2U/ZSLke70M6D1GbRskQyG2CWPMKdRFd8xTSmfBQNNzarisuWBtnfVoZdHWizcmcp3GWQ6nmKAA+PD4kIotBXovdN4EChnIMbFI9fHxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lo+p/qBQ; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F28A5C0006;
	Fri, 16 Feb 2024 07:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708070391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1hUYFR1qvUKlxyuPUPNfEnuK9T+rqDJlWXvdCBwvEVg=;
	b=lo+p/qBQMhPwepXZCYApgvlfDkOGsNpT+Pg8es5xwAOU+wWyXLhmUg5dZfc6wF7Q6H/ek8
	aAGXOM2eE2CfgBAWb5ap2l6fvCLgUgAqH+OkpY3GFhgJWqXAbBgLeZsj2YVNU8tVzeuweY
	wcNY+uaQu3esHlFqNhwVcl8RzO/E9LGl6WVA6d/I7NwXnITuv3757IoMjcUsatikA7D2kD
	WnmVYAnPXvem+lm5GHe3eQS549Bx1IOzsk/CXIfyt1xl5Hu3NzoFQQxHzLRuw9PHIsZqzE
	UCy2/ADPKQj9DTCvWyq7WDQGOQSkABK4Q18akdWYKrZirdqYJoyCA+KC+p47lg==
Message-ID: <78add459-a96a-46c6-83ff-e2657d4d3db4@bootlin.com>
Date: Fri, 16 Feb 2024 08:59:47 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/18] pinctrl: pinctrl-single: remove dead code in
 suspend() and resume() callbacks
To: Andy Shevchenko <andy@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti
 <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v3-0-5c2e4a3fac1f@bootlin.com>
 <20240102-j7200-pcie-s2r-v3-2-5c2e4a3fac1f@bootlin.com>
 <Zc4tedAhqYX3bQcw@smile.fi.intel.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <Zc4tedAhqYX3bQcw@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.richard@bootlin.com

On 2/15/24 16:27, Andy Shevchenko wrote:
> On Thu, Feb 15, 2024 at 04:17:47PM +0100, Thomas Richard wrote:
>> No need to check the pointer returned by platform_get_drvdata(), as
>> platform_set_drvdata() is called during the probe.
> 
> This patch should go _after_ the next one, otherwise the commit message doesn't
> tell full story and the code change bring a potential regression.
> 

Hello Andy,

I'm ok to move this patch after the next one.
But for my understanding, could you explain me why changing the order is
important in this case ?

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


