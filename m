Return-Path: <linux-i2c+bounces-4359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8D9178AE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 08:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B40531C229EB
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 06:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C53A14D71E;
	Wed, 26 Jun 2024 06:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l2KHR/DW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD9B14A4C1
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719382432; cv=none; b=u7rS4CxmD2y3Lrp8ErPOv3wuZoO9R3AH5WZZwVLTAG5V5ZWHlHtfQItYI/yjs7SZwE8fOearBqQX82Ia8InEhwvDZKP3aXHkACXd82xUs59/soK8Ih7PUNx977+wY2imEHCkSZLSfEiLd5ONTLx3wmExsf3RKNRYoBzmNL1dFq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719382432; c=relaxed/simple;
	bh=BJtQ9l+V2WAR5BzRXmZ0v9xaywUqO0Ckllr4TBtCJU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaMuSE2Xo/bKSGYkBG88DpE8fB87ewzVOZE6lF+cEffAbZIbjjempUTmTv28+mefdu5ja5LDCDTGv+TzWk3vGjbgySWbbdi6iUWJv8112/diQKDbtjjhIBwepjG0CVn5AzI6+l0iRIc80cgI5k3rAZYWo8wGTIv8A9m/dYLa4JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l2KHR/DW; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3651ee582cfso3460056f8f.2
        for <linux-i2c@vger.kernel.org>; Tue, 25 Jun 2024 23:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719382425; x=1719987225; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MYj1syjPNYZBySDVupnxlkb67gyc3eu/jDgMDAJ8cA=;
        b=l2KHR/DWvmu3ZJJm7LyULj0+2SWeZjDRcYCUdV3x0MuunR04zGf+UCeZzW6HDqtRXc
         Nllno76v51jDC5wMjhCKeJss/d3gD5Z7lrZCuN4vlzT9F9K4qBd3cyw3aF64KlTNUYj5
         wXPRrBstOB7vhRaOHG3uMotE05PY4XTXgHBr6LSd4jP8Wm4Jz6pVlz74A7YZ1Aa37gCG
         GihMrtUDHAoa8J/Shutxe22fgPe+Mr7kr9NWqQ8D8Se94s9I2HBbjWtdoH8ZmwIpxEa1
         WeIA3U+hi/10hvmZLrxbxS1YHcMW4PcjRimqxbr/1NW/g9sg7WyfZbA7cxu7kO93wGt5
         PSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719382425; x=1719987225;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MYj1syjPNYZBySDVupnxlkb67gyc3eu/jDgMDAJ8cA=;
        b=q8wxN+X+QkGPweQP8UgcZ9zcds5O4vHIxipOPc4dG0ogJhiwhi9tkwNS+PxtgfGGfC
         rtdb3FhOF342OrxDl/azBykT7Cy9ypfYkMIGwaI+lpYFyDxR2D1i+YU+W7/s/PP2LcRR
         /PuLE2ChCsGz4nnaL5Qen8HGHS3bPCOjOYucTEit6r/Xm1J19fQfCaN8GhGDEOHlbYg9
         pBjbiAzZuxQy1sA1mqMC59YO7n/sn0k87x13N+xU3sQ8tdnRei8dx5pQuAzzWLylFN9O
         xncqhimfPiGWVTpAgLNtfRGaNcNoJJ+6EE86sQXNL+YLTgjl+yQrqvRHL4sFXE03v584
         WpRw==
X-Forwarded-Encrypted: i=1; AJvYcCVhHPfaIQNevJB0w2foMUQEvnfum7zuK6558dhaXyaFgU3UzWG/1K2aE+BRVAwLvzep+VBvj4matGx2YvMDqAUj8giYjiFtynTv
X-Gm-Message-State: AOJu0Yy5yuVycSF9CWTk9HjoBb7oEZQXt6+F3Ags3WZAfllxppF6dM9/
	/zdsMsT8PGLrUqNcQ39yHdyIr1wpm6zozHdE1IHwiQIf300x1raEWP1S821TGdQ=
X-Google-Smtp-Source: AGHT+IHbF71gbIghJoYKFbrg4W+yIrq0Ui8qDFkKVSeUFQObkIKWpiU0iUTb4PgiFnvihuycMlGCFw==
X-Received: by 2002:a5d:4689:0:b0:35f:275c:fb63 with SMTP id ffacd0b85a97d-366e948fa5emr7116687f8f.25.1719382424899;
        Tue, 25 Jun 2024 23:13:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366f466979dsm7064166f8f.7.2024.06.25.23.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 23:13:44 -0700 (PDT)
Message-ID: <14167607-e67b-4627-99f0-6e99acc7f880@tuxon.dev>
Date: Wed, 26 Jun 2024 09:13:42 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-5-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346F03386D05D608041DE8D86D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346F03386D05D608041DE8D86D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 25.06.2024 18:53, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Tuesday, June 25, 2024 1:14 PM
>> Subject: [PATCH v2 04/12] i2c: riic: Use pm_runtime_resume_and_get()
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> pm_runtime_get_sync() may return with error. In case it returns with error
>> dev->power.usage_count needs to be decremented.
>> dev->pm_runtime_resume_and_get()
>> takes care of this. Thus use it.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - delete i2c adapter all the time in remove
>>
>>  drivers/i2c/busses/i2c-riic.c | 30 ++++++++++++++++++++++++------
>>  1 file changed, 24 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c index
>> 83e4d5e14ab6..002b11b020fa 100644
>> --- a/drivers/i2c/busses/i2c-riic.c
>> +++ b/drivers/i2c/busses/i2c-riic.c
>> @@ -113,6 +113,8 @@ struct riic_irq_desc {
>>  	char *name;
>>  };
>>
>> +static const char * const riic_rpm_err_msg = "Failed to runtime
>> +resume";
>> +
>>  static inline void riic_writeb(struct riic_dev *riic, u8 val, u8 offset)  {
>>  	writeb(val, riic->base + riic->info->regs[offset]); @@ -133,10 +135,14 @@ static int
>> riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>>  	struct riic_dev *riic = i2c_get_adapdata(adap);
>>  	struct device *dev = adap->dev.parent;
>>  	unsigned long time_left;
>> -	int i;
>> +	int i, ret;
>>  	u8 start_bit;
>>
>> -	pm_runtime_get_sync(dev);
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret) {
>> +		dev_err(dev, riic_rpm_err_msg);
> 
> As at the moment we don't know how to reproduce this error condition
> Can we use WARN_ON_ONCE() instead to catch detailed error condition here??

[1] states "So, naturally, use of WARN_ON() is also now discouraged much of
the time". I've go with dev_err() or something similar.

Thank you,
Claudiu Beznea

[1] https://lwn.net/Articles/969923/

> 
> Cheers,
> Biju
> 
>> +		return ret;
>> +	}
>>
>>  	if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
>>  		riic->err = -EBUSY;
>> @@ -301,6 +307,7 @@ static const struct i2c_algorithm riic_algo = {
>>
>>  static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)  {
>> +	int ret;
>>  	unsigned long rate;
>>  	int total_ticks, cks, brl, brh;
>>  	struct device *dev = riic->adapter.dev.parent; @@ -379,7 +386,11 @@ static int
>> riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>>  		 t->scl_fall_ns / (1000000000 / rate),
>>  		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
>>
>> -	pm_runtime_get_sync(dev);
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret) {
>> +		dev_err(dev, riic_rpm_err_msg);
>> +		return ret;
>> +	}
>>
>>  	/* Changing the order of accessing IICRST and ICE may break things! */
>>  	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1); @@ -498,11 +509,18 @@ static void
>> riic_i2c_remove(struct platform_device *pdev)  {
>>  	struct riic_dev *riic = platform_get_drvdata(pdev);
>>  	struct device *dev = &pdev->dev;
>> +	int ret;
>>
>> -	pm_runtime_get_sync(dev);
>> -	riic_writeb(riic, 0, RIIC_ICIER);
>> -	pm_runtime_put(dev);
>>  	i2c_del_adapter(&riic->adapter);
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret) {
>> +		dev_err(dev, riic_rpm_err_msg);
>> +	} else {
>> +		riic_writeb(riic, 0, RIIC_ICIER);
>> +		pm_runtime_put(dev);
>> +	}
>> +
>>  	pm_runtime_disable(dev);
>>  }
>>
>> --
>> 2.39.2
>>
> 

