Return-Path: <linux-i2c+bounces-14625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A199CC6DE3
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 10:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40A8230CBE99
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 09:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D4A33B95E;
	Wed, 17 Dec 2025 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fov1zlhX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B168338F45
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 09:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765964511; cv=none; b=NYuZuultSOR8ZE6fjGoPkRX0OPdhzMNDU1K7sukQzRU11XxhO9CrU7D5B3zdVYh1BpC7bsNjKYMMDkaMXbtpxhgT0XcqmICp1hq0qgX9Wz6T6U4u9y6xcXAxLnhX6G2MNPXoWbSKCqMb+k9SJXjbs6pLher/WWtMypaNUdQBsNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765964511; c=relaxed/simple;
	bh=WB1FIXZ+ZTDeazxvypntHYbSHS0KL2l6sKZxn9djhTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBDuovkwLflSC66TtRtHtFumsiTjNd7ODXG7W78o6o6eHHALZw0GC14sgu38eFfwkPHVajGOGsMLxEnLIgUJZOEH92lEJRq4+pDjBRewfx7ZdozkowHAHhvs7hhRp4OKAsS/fEjSwqIgmlYIRJBggYP4E7sfyp7Mra32+9oVgRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fov1zlhX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42f9ece6387so2178968f8f.0
        for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 01:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765964505; x=1766569305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lcxqYG6DoWTCtUBGDosjwKS+VJWtzCM2tGuWprBPGSs=;
        b=fov1zlhXM6HCs9RgqT+9cbrPtptQKNmoi2JaVABRmPrPbBeSWpFYnW/YbHyLj1f+e1
         EMsV450QJnTtuOoqJD4Ix/vBj9hhM5d8ApUzha2FqtDY8yFE2qRIGnabH7ZhVPn351Pt
         ZN35P8OJ07lDSGH4XGV6ZAM+Ul7EU5Bcr7gyYfwOTXk9zgtqHFLVXTW5N9uzJtARi9es
         DVj961dZlC9qnpQgQ3bcX101H3FdsoSDp6EKzzPydOsIOVAvH+mKTDyIRlsij2YDl2Sg
         9dcRHTXfMU73zXsnQ/sQLizBNYKVmtqe/5pXwE60BAL9O+4weNl7NQS7X1ZeYKZXKgMS
         Rodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964506; x=1766569306;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcxqYG6DoWTCtUBGDosjwKS+VJWtzCM2tGuWprBPGSs=;
        b=eFPvuXyAP/d04DOwZv5XGonUOERdF7WCabeEKEQj6owNh6kHHtvmxqN4MT+8ro3MAE
         SowfJK2S97V7HIo+jLRibT7pyPWSxM4iR/9BKVWfavRhXOHNoT+8b3jM2G/k3+bJi8SV
         NbnO5yOrUHV4LbxWZvTDDrL/agjaFeNl0Lo+veZSXp2skuK4XKqOUMuDnUntjFMXqxkS
         O3rnbjWKRAxueh9TIy5FoLSxAWJkrx3hyI8ecwWmd0Pih1lwqBXiGpNUs3WvMjSxDHxS
         KE/QyatlOMNGMukRISzjIarmyvj47JlHFDzaxAxhACow9Vq+RHd1f0QixP38t2PGtuUP
         8r6w==
X-Forwarded-Encrypted: i=1; AJvYcCUas5jes/OaKQI10SO95EnN06s4rqNgFvBaQ4ffAw7c6CPfBjhHQlPsK/ZJe6dRt9yBtPiboFwO3+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfj70ct+t6HVn+yygrhRf9IT/8ytGzkk3cP6TqMh3I5oVAZ8l+
	7xdd2LaD/qjSvHXmeajv1oAe1mzwheKAVVhGChn5GMbzoMq0Ol+TCDj/rrS+pHEHzelweYO0fcF
	kpL02
X-Gm-Gg: AY/fxX4kDJ9In99CHUx9EzScCM9THBCx9OzC8uuhx6KEAsRqfeUQ6XNLuN2v6VX88WI
	7ckmfyxn0jnmcfQoD1FNKYc0XmmddTBjYYhrZ/0yrKP8AnbAqolWUUtERVPsvp5l1mPYVJ50bJc
	x2jDhIUM6+EWJTldjCoNrkJTLk4MUWxhhsdgek6YN3pN9LVnEtBSVgtiii/Ip7c7SJU51LMpS2d
	ZXCyLRG1TbCSBimyfPdIpvCaocIhMssa/HEVHSNJQjklXqjOhjCTAQkH6nVIUeyp/N5DCQnruVO
	eFNkqjWOhkIR/WPSkncvFgJJnRviDWmKiowepp7dF7yzTmt/2S5Ud1GJ1SjphbvrHSf52wVtVG9
	aKGM7EvunMlvxhGeHb3Bg5frBXIfz/DIi1ZX8bf1hS7Pnd9nCxHJ88EYWVhbkK6W2M5F3jnb5jG
	JWPvkJ2PsNu5XmSVAK8fHOAgcGujXuWw==
X-Google-Smtp-Source: AGHT+IF42TMTZgmmYQk4G4FzEmAK1kBBZ8FqBRaaQX5i9kN2bMEeNbgZxuBI29NZ+Nw7ntqssvwEoA==
X-Received: by 2002:a05:6000:18a6:b0:430:fd84:3179 with SMTP id ffacd0b85a97d-430fd8434b3mr9106013f8f.33.1765964505423;
        Wed, 17 Dec 2025 01:41:45 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ade7c4asm3757054f8f.28.2025.12.17.01.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 01:41:44 -0800 (PST)
Message-ID: <74a801d3-8653-404f-8531-cb99108eac33@tuxon.dev>
Date: Wed, 17 Dec 2025 11:41:43 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: riic: Move suspend handling to NOIRQ phase
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <05a31af3d6caba51e8237a49853281aa49bed916.1765540678.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Tommaso,

On 12/12/25 13:58, Tommaso Merciai wrote:
> Commit 53326135d0e0 ("i2c: riic: Add suspend/resume support") added
> suspend support for the Renesas I2C driver and following this change
> on RZ/G3E the following WARNING is seen on entering suspend ...
> 
> [  134.275704] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> [  134.285536] ------------[ cut here ]------------
> [  134.290298] i2c i2c-2: Transfer while suspended
> [  134.295174] WARNING: drivers/i2c/i2c-core.h:56 at __i2c_smbus_xfer+0x1e4/0x214, CPU#0: systemd-sleep/388
> [  134.365507] Tainted: [W]=WARN
> [  134.368485] Hardware name: Renesas SMARC EVK version 2 based on r9a09g047e57 (DT)
> [  134.375961] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  134.382935] pc : __i2c_smbus_xfer+0x1e4/0x214
> [  134.387329] lr : __i2c_smbus_xfer+0x1e4/0x214
> [  134.391717] sp : ffff800083f23860
> [  134.395040] x29: ffff800083f23860 x28: 0000000000000000 x27: ffff800082ed5d60
> [  134.402226] x26: 0000001f4395fd74 x25: 0000000000000007 x24: 0000000000000001
> [  134.409408] x23: 0000000000000000 x22: 000000000000006f x21: ffff800083f23936
> [  134.416589] x20: ffff0000c090e140 x19: ffff0000c090e0d0 x18: 0000000000000006
> [  134.423771] x17: 6f63657320313030 x16: 2e30206465737061 x15: ffff800083f23280
> [  134.430953] x14: 0000000000000000 x13: ffff800082b16ce8 x12: 0000000000000f09
> [  134.438134] x11: 0000000000000503 x10: ffff800082b6ece8 x9 : ffff800082b16ce8
> [  134.445315] x8 : 00000000ffffefff x7 : ffff800082b6ece8 x6 : 80000000fffff000
> [  134.452495] x5 : 0000000000000504 x4 : 0000000000000000 x3 : 0000000000000000
> [  134.459672] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c9ee9e80
> [  134.466851] Call trace:
> [  134.469311]  __i2c_smbus_xfer+0x1e4/0x214 (P)
> [  134.473715]  i2c_smbus_xfer+0xbc/0x120
> [  134.477507]  i2c_smbus_read_byte_data+0x4c/0x84
> [  134.482077]  isl1208_i2c_read_time+0x44/0x178 [rtc_isl1208]
> [  134.487703]  isl1208_rtc_read_time+0x14/0x20 [rtc_isl1208]
> [  134.493226]  __rtc_read_time+0x44/0x88
> [  134.497012]  rtc_read_time+0x3c/0x68
> [  134.500622]  rtc_suspend+0x9c/0x170
> 
> The warning is triggered because I2C transfers can still be attempted
> while the controller is already suspended, due to inappropriate ordering
> of the system sleep callbacks.
> 
> Fix this by moving the system sleep suspend/resume callbacks to the NOIRQ
> phase, ensuring the adapter is fully quiesced after late suspend and
> properly resumed before the early resume phase.
> 
> To support NOIRQ resume, the hardware initialization path must not invoke
> runtime PM APIs. Split the init code so that the low-level hardware setup
> can be executed without pm_runtime_get/put(). This avoids violating the
> constraint introduced by commit 1e2ef05bb8cf ("PM: Limit race conditions
> between runtime PM and system sleep (v2)"), which forbids runtime PM
> calls during early resume.
> 
> Cc: stable@vger.kernel.org
> Fixes: 53326135d0e0 ("i2c: riic: Add suspend/resume support")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/i2c/busses/i2c-riic.c | 65 ++++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index 3e8f126cb7f7..9acc8936cdf7 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -349,9 +349,8 @@ static const struct i2c_algorithm riic_algo = {
>  	.functionality = riic_func,
>  };
>  
> -static int riic_init_hw(struct riic_dev *riic)
> +static int __riic_init_hw(struct riic_dev *riic)
>  {
> -	int ret;
>  	unsigned long rate;
>  	unsigned long ns_per_tick;
>  	int total_ticks, cks, brl, brh;
> @@ -431,10 +430,6 @@ static int riic_init_hw(struct riic_dev *riic)
>  		 rate / total_ticks, ((brl + 3) * 100) / (brl + brh + 6),
>  		 t->scl_fall_ns / ns_per_tick, t->scl_rise_ns / ns_per_tick, cks, brl, brh);
>  
> -	ret = pm_runtime_resume_and_get(dev);
> -	if (ret)
> -		return ret;
> -
>  	/* Changing the order of accessing IICRST and ICE may break things! */
>  	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
>  	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1);
> @@ -451,10 +446,25 @@ static int riic_init_hw(struct riic_dev *riic)
>  
>  	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
>  
> -	pm_runtime_put_autosuspend(dev);
>  	return 0;
>  }
>  
> +static int riic_init_hw(struct riic_dev *riic)
> +{
> +	struct device *dev = riic->adapter.dev.parent;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = __riic_init_hw(riic);
> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return ret;
> +}
> +
>  static int riic_get_scl(struct i2c_adapter *adap)
>  {
>  	struct riic_dev *riic = i2c_get_adapdata(adap);
> @@ -572,6 +582,8 @@ static int riic_i2c_probe(struct platform_device *pdev)
>  
>  	i2c_parse_fw_timings(dev, &riic->i2c_t, true);
>  
> +	platform_set_drvdata(pdev, riic);
> +
>  	/* Default 0 to save power. Can be overridden via sysfs for lower latency. */
>  	pm_runtime_set_autosuspend_delay(dev, 0);
>  	pm_runtime_use_autosuspend(dev);
> @@ -585,8 +597,6 @@ static int riic_i2c_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto out;
>  
> -	platform_set_drvdata(pdev, riic);
> -
>  	dev_info(dev, "registered with %dHz bus speed\n", riic->i2c_t.bus_freq_hz);
>  	return 0;
>  
> @@ -668,27 +678,17 @@ static const struct riic_of_data riic_rz_t2h_info = {
>  	.num_irqs = ARRAY_SIZE(riic_rzt2h_irqs),
>  };
>  
> -static int riic_i2c_suspend(struct device *dev)
> +static int riic_i2c_runtime_suspend(struct device *dev)
>  {
>  	struct riic_dev *riic = dev_get_drvdata(dev);
> -	int ret;
> -
> -	ret = pm_runtime_resume_and_get(dev);
> -	if (ret)
> -		return ret;
> -
> -	i2c_mark_adapter_suspended(&riic->adapter);
>  
>  	/* Disable output on SDA, SCL pins. */
>  	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
>  
> -	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_put_sync(dev);
> -
>  	return reset_control_assert(riic->rstc);

Reset assert/de-assert was moved to the RPM callbacks. Is this intended?
You may want to at least mention it in the commit description.

>  }
>  
> -static int riic_i2c_resume(struct device *dev)
> +static int riic_i2c_runtime_resume(struct device *dev)
>  {
>  	struct riic_dev *riic = dev_get_drvdata(dev);
>  	int ret;
> @@ -697,7 +697,7 @@ static int riic_i2c_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = riic_init_hw(riic);
> +	ret = __riic_init_hw(riic);

Moving reset assert/de-assert and controller deinit/re-initialization on
runtime suspend/resume may increase the runtime suspend/resume latency. In
case of consecutive requests this may translate into controller performance
downgrade. If you keep it like this, you may want to increase the default
autosuspend delay, at least, to avoid controller reconfiguration after each
individual struct i2c_algorithm::xfer() call.

>  	if (ret) {
>  		/*
>  		 * In case this happens there is no way to recover from this
> @@ -708,13 +708,30 @@ static int riic_i2c_resume(struct device *dev)
>  		return ret;

This one could be dropped

>  	}
>  
> +	return 0;

And use here directly, like:

	return ret;

Thank you,
Claudiu

