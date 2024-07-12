Return-Path: <linux-i2c+bounces-4956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D141892F65C
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 09:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87F431F237DA
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 07:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7559713E02A;
	Fri, 12 Jul 2024 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CA8kS6KN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45385374CB
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720770048; cv=none; b=Piy+SZRQ7z/L3nOh+Iw6eoQbW7O9GV25fndbWBs6XuKDhJuBhMtdAJE5As1lz5OzQmqT6DTr664BUAQpwJwIDTqNbpbSHr592CY0Mk9xwgwBctZKfLZSUx8vwb9KZhNSfvRg3ET8wbJ/bJOjLXRkAq+lRCYLP4B0uoplVr+IAlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720770048; c=relaxed/simple;
	bh=Vn9rZrE5J1S4y+ZxLtFjsyzCQW1T6boIalR1+6/ziwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UukpTk0+D4J18sMSv9BlqTyR85UkoWY1IvESv9BKgkcY2h2WtDiP+O6jbZVPn5qKdqMRvfftjKuF/Vd1AO/g6fX61atprt1tviqCM5SVOXZbpxbwU7rWjonZK28Cl3PdQLxviGvIFJnPKE+G4LlDRG45NnGlzHSXKproDXeQVmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=CA8kS6KN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36798779d75so1492620f8f.3
        for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 00:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720770043; x=1721374843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YxsV1DaB2BAXUJ0b+LkR7z83J/LwRf5oTyArBzhpxsY=;
        b=CA8kS6KNeGT8wiIZJ/aGevrfX/lzwoykMagV3eWqwxD6RZor9jvN6l4wjLIRnfo1kP
         1TYTTIAkV2SbSgxaeQw78fmbkXYlXTDstZ2qNlh2Wmrm0l8NxzY3idtR5kIcvnaOjnC/
         huJC25tG9ntdvL7zEmCSCTUDHHC+aLyhuNvFXdheCxPjrrG9YPiomHe4uNFtBq4/27K+
         Dhy/IgqRT6CeK/gphxxjtASJzkGeaS9ZGocNbG5QUqPp5vd2bIzsqJYDXzezLrAxlhs+
         YYGxOW8NVrr+6G94Krh0J41bCuvsnl+SF22oJ+fCWKAEvUk4d8ajSrS5FvwR5Au04BU5
         zMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720770043; x=1721374843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxsV1DaB2BAXUJ0b+LkR7z83J/LwRf5oTyArBzhpxsY=;
        b=cLOxES/SIks3RzjhdAFWzHYowozvFe/dZwHY1kBSgXoAinj+J/EDxanH1EzaolgFQ9
         N6pciVK2wmbCIoNThU5+5pjPR/ZZbOyaDH5/uSs87K981eDKzqkIKU+/j3fNybwH1wsx
         Kw4LFspCLrs9wjuGQjD8EiJEM2OW5jyl51a0ZElAVWfbyU6Ut6PiBUxjQMmV4220F4bp
         UdXc16ThttZYmHJ2814kQG8m4SQcA4dhE8O6UaExGpCTqBFVxKboE2fBahkCHeICgnk9
         zvmmpmFpTbUBUUY+vk9Ng02YOGa92dCLqg4CxcSUP8u1rWAW8TFZMXA6+6duJhyYf2tp
         Avpw==
X-Forwarded-Encrypted: i=1; AJvYcCVif1eXNICUnqO5F1GeQs46xdAD9V5vCzFmRMEjFkkcd+Ryfw57OMHsOgJh1M9D1VPZihYn/MDOZ8HTm7064HLOhHYgm4Y1pFbq
X-Gm-Message-State: AOJu0YwdQkJj6ho0P171ydW5rQ9cA8G++5vkx9G8VDzNdx7JNBTFM4F2
	g3Y0hc14evjiZ4jLMfZloA0VP1fpYChYA30WTRFtFN2/ELuQFTljzKrFShAdXUg=
X-Google-Smtp-Source: AGHT+IG93jdF7q7AZWkRfB3ZttA3BD/SA6SEXg5pMIx+vsqPMnxKsTYuiuOYUd9DxSpDGuOVVC8ZhA==
X-Received: by 2002:a5d:45c9:0:b0:367:99fc:238a with SMTP id ffacd0b85a97d-367cea91efbmr8985482f8f.32.1720770043433;
        Fri, 12 Jul 2024 00:40:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367fba1b15esm3065787f8f.22.2024.07.12.00.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 00:40:43 -0700 (PDT)
Message-ID: <e574e2a6-b231-4737-9501-342445923542@tuxon.dev>
Date: Fri, 12 Jul 2024 10:40:40 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend support
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-5-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB1134615117603F62796558D1486A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB1134615117603F62796558D1486A62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Biju,

On 12.07.2024 10:15, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Claudiu <claudiu.beznea@tuxon.dev>
>> Sent: Thursday, July 11, 2024 12:52 PM
>> Subject: [PATCH v3 04/11] i2c: riic: Enable runtime PM autosuspend support
>>
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Enable runtime PM autosuspend support for the RIIC driver. With this, in case there are consecutive
>> xfer requests the device wouldn't be runtime enabled/disabled after each consecutive xfer but after
>> the the delay configured by user. With this, we can avoid touching hardware registers involved in
>> runtime PM suspend/resume saving in this way some cycles. The default chosen autosuspend delay is
>> zero to keep the previous driver behavior.
> 
> On the other hand, you are saving power. Currently the driver is highly optimized for 
> Power usage.
> 
> Before transfer turn on the clock
> After transfer turn off the clock, this is the optimal power usage correspond to suspend delay.
> 
> By adding suspend delay, you are consuming power corresponding to
> that delay.

The default delay is zero, see the following diff in this patch:

@@ -479,6 +481,8 @@ static int riic_i2c_probe(struct platform_device *pdev)

 	i2c_parse_fw_timings(dev, &i2c_t, true);

+	pm_runtime_set_autosuspend_delay(dev, 0);

With this, the previous behavior of the driver is preserved, nothing is
changed.

Having it this way preserves the previous behavior and give the the user
the possibility to adjust the autosuspend delay (e.g., though sysfs) to
avoid enable/disable the power to this IP in scenarios where this might be
a bottleneck.

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju

