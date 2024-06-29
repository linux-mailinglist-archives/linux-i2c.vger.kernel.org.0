Return-Path: <linux-i2c+bounces-4498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E5F91CC4A
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 13:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39C4E282805
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 11:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3585544C93;
	Sat, 29 Jun 2024 11:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qEpszVVv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E6442A98
	for <linux-i2c@vger.kernel.org>; Sat, 29 Jun 2024 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719659592; cv=none; b=T+7XkDpitF7HA4Jhgo6qZFrQyVWY04wFmXyY5svy1s5tcQeVJP/dqeoqN07Iegx3UMecEbgv0/eLOEvMFZbf9vStV8DKqY2P2+3SfufJf0Kv9qIavClDcWnQRfWAGuYdxRxI6BILCzkCTUZAw7uioQ44wsuSRDP1bY7hZrCy1HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719659592; c=relaxed/simple;
	bh=/dp17x5002ikclb97825w7caZSX3GVvSUransIBMOtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnhw9WXmCgkhbj/0DZl2+VqBTQk74jTv4zoYdSCb33/WlZ3342tOXCAzS3A9wsYDs3YL1hbo0SModd2uawb9VQYbkTs18AhGi7INvYDd8DoLXV/d2mBHg8yVUDRvaQJ595Rn0zN5xjlWII7id+V5kez6AC+xajwGxknAPFv1cEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qEpszVVv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42562a984d3so11078405e9.3
        for <linux-i2c@vger.kernel.org>; Sat, 29 Jun 2024 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719659588; x=1720264388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/67vxFTB/Tf7zkDCTNnAYduxcKlutFylo1YUBym3r4=;
        b=qEpszVVv1INNXgDt14jlgde3GcbXNdJMf6jropF6FzqxitPPcc3hrXNp9vUWgO0fdw
         n4z+8+MVH8uqu6UrcK+8UGqU+3n+fIitZsB5CQcMqEgsU0Hj/HiQcpKEG5lZTpsp25Px
         CfLVPjGQE89xS45VFqMGuTEhqt2n4PKoIPejBWP2U/DWLEZoLdoCAL+U19nwXIsRkrOW
         AHbCcWVpwKimqpo/wYzarH7/wZRokoA/Ckj/bNU9O/ezvC555Q/7G+wKV9FK7r5EvPB3
         fZWL7mAI9xzSslUtj/vsBxogFikbmCQsrHnD9DWyLrdYkyKU+uLggODkTHNXfkiE6tM1
         iMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719659588; x=1720264388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/67vxFTB/Tf7zkDCTNnAYduxcKlutFylo1YUBym3r4=;
        b=uEn1iInrXiretHdkJ7y9tLfA+r3lriP8BHnFi7K3VwqGZeucSSdFMr0YOyc6oTUj6n
         mxZ8F3xCcC75UBs3tmq0cng/5v+6RSS1Z3ZDCsYpO0U3JdbvlQ6MyHN1syRXRYP1Dl/w
         gJlDOCPMvkUB+5U9YoRVXe2olnlOlyhDETN6SO/VgERtrBvNjtB4TD4NWaSb/dqSybZ2
         SmvqDxNy1Tla3QKAh52OibGv7NbrxFRORuth+vVVtDXkurGJiSWArZrdsOu54IK8KQAI
         /4qAzFs86YNOfT9ivOtnEI/JJfYjmdFFTtaVJWFBfbeqrGfdDldPKsK8XElIseYxpq4e
         RWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/tdfz3VIEVVD0y60bHzzUnmdg1ikN5mtrkibckVka1IL/l9WOZ6ZQKFMEu1ymqUZZVS4BQlxlf6+P7XsYWEOsiJ3A/juELSBF
X-Gm-Message-State: AOJu0YySpEWoWdHOm0xxhk3W4V0838EisQTABztnV/ES8febsp7x07NI
	5R4BVKu1BKGdIBPCb4OY60QVVNBWvljsTic5lhl4zzn3OXuti94maE7ZYqFbIzI=
X-Google-Smtp-Source: AGHT+IHLIjqMJEiyHVN+CTfuUSwTaj/zjdcMyGfcReaCyCRO87H0bgYYtZ52eeEV4ihXBZh4WcElXQ==
X-Received: by 2002:a05:600c:1550:b0:425:7a6b:4e82 with SMTP id 5b1f17b1804b1-4257a6b5129mr3985625e9.27.1719659588371;
        Sat, 29 Jun 2024 04:13:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af5ba51sm71224295e9.12.2024.06.29.04.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 04:13:07 -0700 (PDT)
Message-ID: <37b5839c-696a-4d82-a6f9-dc37733e03e0@tuxon.dev>
Date: Sat, 29 Jun 2024 14:13:06 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] i2c: riic: Add support for fast mode plus
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
 <20240625121358.590547-10-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB113465270C36ED9A2F2C8DFEE86D12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113465270C36ED9A2F2C8DFEE86D12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 29.06.2024 08:38, Biju Das wrote:
> Hi Claudiu,
> 
> Thanks for the patch.
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Tuesday, June 25, 2024 1:14 PM
>> Subject: [PATCH v2 09/12] i2c: riic: Add support for fast mode plus
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Fast mode plus is available on most of the IP variants that RIIC driver is working with. The
>> exception is (according to HW manuals of the SoCs where this IP is available) the Renesas RZ/A1H.
>> For this, patch introduces the struct riic_of_data::fast_mode_plus.
>>
>> Fast mode plus was tested on RZ/G3S, RZ/G2{L,UL,LC}, RZ/Five by instantiating the RIIC frequency to
>> 1MHz and issuing i2c reads on the fast mode plus capable devices (and the i2c clock frequency was
>> checked on RZ/G3S).
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - dropped code that handles the renesas,riic-no-fast-mode-plus
>> - updated commit description
>>
>>  drivers/i2c/busses/i2c-riic.c | 28 ++++++++++++++++++++++++----
>>  1 file changed, 24 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c index
>> 8ffbead95492..c07317f95e82 100644
>> --- a/drivers/i2c/busses/i2c-riic.c
>> +++ b/drivers/i2c/busses/i2c-riic.c
>> @@ -63,6 +63,8 @@
>>  #define ICMR3_ACKWP	0x10
>>  #define ICMR3_ACKBT	0x08
>>
>> +#define ICFER_FMPE	0x80
>> +
>>  #define ICIER_TIE	0x80
>>  #define ICIER_TEIE	0x40
>>  #define ICIER_RIE	0x20
>> @@ -80,6 +82,7 @@ enum riic_reg_list {
>>  	RIIC_ICCR2,
>>  	RIIC_ICMR1,
>>  	RIIC_ICMR3,
>> +	RIIC_ICFER,
>>  	RIIC_ICSER,
>>  	RIIC_ICIER,
>>  	RIIC_ICSR2,
>> @@ -92,6 +95,7 @@ enum riic_reg_list {
>>
>>  struct riic_of_data {
>>  	const u8 *regs;
>> +	bool fast_mode_plus;
>>  };
>>
>>  struct riic_dev {
>> @@ -315,11 +319,13 @@ static int riic_init_hw(struct riic_dev *riic)
>>  	int total_ticks, cks, brl, brh;
>>  	struct i2c_timings *t = &riic->i2c_t;
>>  	struct device *dev = riic->adapter.dev.parent;
>> +	const struct riic_of_data *info = riic->info;
>>
>> -	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
>> -		dev_err(dev,
>> -			"unsupported bus speed (%dHz). %d max\n",
>> -			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
>> +	if ((!info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
>> +	    (info->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
>> +		dev_err(dev, "unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,
>> +			info->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
>> +			I2C_MAX_FAST_MODE_FREQ);
>>  		return -EINVAL;
>>  	}
>>
>> @@ -407,6 +413,9 @@ static int riic_init_hw(struct riic_dev *riic)
>>  	riic_writeb(riic, 0, RIIC_ICSER);
>>  	riic_writeb(riic, ICMR3_ACKWP | ICMR3_RDRFS, RIIC_ICMR3);
>>
>> +	if (info->fast_mode_plus && t->bus_freq_hz == I2C_MAX_FAST_MODE_PLUS_FREQ)
>> +		riic_clear_set_bit(riic, 0, ICFER_FMPE, RIIC_ICFER);
>> +
>>  	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
>>
>>  	pm_runtime_mark_last_busy(dev);
>> @@ -536,6 +545,7 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] = {
>>  	[RIIC_ICCR2] = 0x04,
>>  	[RIIC_ICMR1] = 0x08,
>>  	[RIIC_ICMR3] = 0x10,
>> +	[RIIC_ICFER] = 0x14,
>>  	[RIIC_ICSER] = 0x18,
>>  	[RIIC_ICIER] = 0x1c,
>>  	[RIIC_ICSR2] = 0x24,
>> @@ -549,11 +559,17 @@ static const struct riic_of_data riic_rz_a_info = {
>>  	.regs = riic_rz_a_regs,
>>  };
>>
>> +static const struct riic_of_data riic_rz_g2_info = {
>> +	.regs = riic_rz_a_regs,
>> +	.fast_mode_plus = true,
>> +};
>> +
>>  static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
>>  	[RIIC_ICCR1] = 0x00,
>>  	[RIIC_ICCR2] = 0x01,
>>  	[RIIC_ICMR1] = 0x02,
>>  	[RIIC_ICMR3] = 0x04,
>> +	[RIIC_ICFER] = 0x05,
>>  	[RIIC_ICSER] = 0x06,
>>  	[RIIC_ICIER] = 0x07,
>>  	[RIIC_ICSR2] = 0x09,
>> @@ -565,6 +581,7 @@ static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
>>
>>  static const struct riic_of_data riic_rz_v2h_info = {
>>  	.regs = riic_rz_v2h_regs,
>> +	.fast_mode_plus = true,
>>  };
>>
>>  static int riic_i2c_suspend(struct device *dev) @@ -613,6 +630,9 @@ static const struct dev_pm_ops
>> riic_i2c_pm_ops = {
>>
>>  static const struct of_device_id riic_i2c_dt_ids[] = {
>>  	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
>> +	{ .compatible = "renesas,riic-r9a07g043", .data =  &riic_rz_g2_info, },
>> +	{ .compatible = "renesas,riic-r9a07g044", .data =  &riic_rz_g2_info, },
>> +	{ .compatible = "renesas,riic-r9a07g054", .data =  &riic_rz_g2_info,
>> +},
> 
> I feel, the better way is 
> 
> { .compatible = "renesas, renesas,r7s72100", .data = &riic_rz_a_info },--> As this SoC does not support FMP
> { .compatible = "renesas,riic-rz", .data =  &riic_rz_g2_info, },--> As this SoCs has FMP+ support
> { .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },--> As this SoCs has different register layout and FMP+

This is the natural way going forward if we enable it for all platforms
supporting FM+ (not only for those that could be currently tested).

If there are no comments against it I'll go with this compatible list.

Thank you,
Claudiu Beznea

> 
> With this the number of compatible entries in the device tables reduced from 5 to 3.
> 
> Cheers,
> Biju
> 

