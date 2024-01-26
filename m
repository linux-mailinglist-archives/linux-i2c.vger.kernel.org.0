Return-Path: <linux-i2c+bounces-1453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDB783D52B
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 10:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C347B22DBB
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Jan 2024 09:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0AE12E4E;
	Fri, 26 Jan 2024 07:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="zLo4dWgC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF67C11700;
	Fri, 26 Jan 2024 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706254775; cv=none; b=N1SCIEMGlq4JhFSzOc0l2MAxSNQbFnJlvze4QOv08YHEXa23XUzeIGLrTALXKIGQ9UZySWJj7pzOFIDkpk/SdW0k6qLPfu1qoLKDtOY2qXr92NXsrtJZYT7Lm3wIXZAeduvn+5UU8JX0H/OI2RWINEiHfdcP+JHvSHRrkkL1Rvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706254775; c=relaxed/simple;
	bh=y0iGSnvyjhTRSIeQajhDHn3zQJ55cRwhkmfcVDXPfZY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=krh4zRxKCzmKDt3/6jB+5IU4pEdcVn+qjC65cQFZGgJ+XDEise4cIr83rQH1Jr8wwv5PazyZ1EbyOtZzRHY1qjr8NgDGR9YyDvv68ErOQLTPT3GDLRRShvh6E+s7cwR8+bJZOGzIWUpaStp2vRgKZgfofpYusewuyxv7bxRs2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=zLo4dWgC; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=twh0SmkJpVHTiPqxYhT2V5fgzxZvyCL2qrzAwbznik0=; b=zLo4dWgCzNQPAt2B9C1CXkQPpA
	mmToX2NNjs2i2gs5AgHScZVeGZHase5YhlcA1itUVn5DdGbw/G84Grw3j+XSmJZrVqtY1dV5enM8G
	YURjru8FDnib+K+N1YKmUzLZzvxJvk0+xWNl4ldOvoqItTT+y31EuPOlmb0ghbD1j0xZ2Pg9yomkV
	Lu/VclOy2I4ang4w97q6C2MGbZYLVMu3po7Svq5ATRKuYapa1ZFE/WEQ3yYZydZwEQvIB7k8i69JZ
	3YHvMeStvdajqJkPPBmJ2vAtR9jWVSbIyWpqJGlexaoojm9ZDznXYwKxo8gM5Zv6avjCHn1tMY8mZ
	pn3TgfUg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1rTGmv-0001xk-TZ; Fri, 26 Jan 2024 08:38:09 +0100
Received: from [87.49.42.9] (helo=localhost)
	by sslproxy04.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <esben@geanix.com>)
	id 1rTGmu-000L87-Uk; Fri, 26 Jan 2024 08:38:09 +0100
From: Esben Haabendal <esben@geanix.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-i2c@vger.kernel.org,  Gregor Herburger
 <gregor.herburger@ew.tq-group.com>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Andi Shyti <andi.shyti@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,  Fabio
 Estevam <festevam@gmail.com>,  NXP Linux Team <linux-imx@nxp.com>,
  linux-kernel@vger.kernel.org,  Jinjie Ruan <ruanjinjie@huawei.com>,
  Alexander Stein <alexander.stein@ew.tq-group.com>,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i2c: imx: move to generic GPIO recovery
In-Reply-To: <20240126060719.GD381737@pengutronix.de> (Oleksij Rempel's
	message of "Fri, 26 Jan 2024 07:07:19 +0100")
References: <01abf8ccc0af74b4fb0124977ed6bdfb9d7107b6.1706190706.git.esben@geanix.com>
	<20240126060719.GD381737@pengutronix.de>
Date: Fri, 26 Jan 2024 08:38:08 +0100
Message-ID: <875xzgh7dr.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27165/Thu Jan 25 10:51:15 2024)

Oleksij Rempel <o.rempel@pengutronix.de> writes:

> ....
>> +	struct i2c_bus_recovery_info *bri = &i2c_imx->rinfo;
>>  
>> -	dev_dbg(&pdev->dev, "using scl%s for recovery\n",
>> -		rinfo->sda_gpiod ? ",sda" : "");
>> +	bri->pinctrl = devm_pinctrl_get(&pdev->dev);
>> +	if (IS_ERR(bri->pinctrl))
>> +		return PTR_ERR(bri->pinctrl);
>
> According to the commit message - "pinctrl becomes optional", but this
> code stops probe if pinctrl will fail for one or another reason. I do
> not see any place returning NULL on fail. Do I'm missing something?

The caller, i2c_imx_probe(), does only check for -EPROBE_DEFER, and
simply ignores any other error codes.

I assume it is on purpose, so any problems with initializing i2c
recovery does not cause complete failure of the i2c controller, which
seems sane to me.

/Esben

