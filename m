Return-Path: <linux-i2c+bounces-9866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 509F6A64E4D
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 13:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E88B8188A3A6
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 12:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15BC23F285;
	Mon, 17 Mar 2025 12:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZMkp7ltS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03819239595
	for <linux-i2c@vger.kernel.org>; Mon, 17 Mar 2025 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213342; cv=none; b=XQ0IUHdC6WdKNuW0U5rdipVNk80XdT4hM3hHknyCXurAOVPtuAox/FMPHQRidU/jG4GbuAg6RKaNz1Aqi/J9jnHJ0jNKDRi19uhYeREiSdrjJcVr8525vlOMGFfie7S+J9+dFp6u21IWNfIluKSthDiGMPi8XTSfUxb2Gazw8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213342; c=relaxed/simple;
	bh=fgKkev5GNis8u+sBMd7UBvRwmZ3uweOhIS9C30idRKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7E1sAgeRRKYH7cQpbtEa9NWjIH0DMMGL3grNburYG7iGAJLDQFCr0e2LcPWu09I0Q2LNItrXz6kVfITQJphmvNI3GlXPB54Omn/pLKNclkQcPrROQna2tXkbPZaD2ao9tx9+vCB3VMw/RQEBKsS+KlnGs5lZEi7BsgzoCaP7pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZMkp7ltS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742213340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJPQeSME8GvdRg4e0/QcxZw7No+3gHVhzWB0lS12ve8=;
	b=ZMkp7ltSBsmhPdpsAUhquEh2Kp6njV65jlx/8i2MtY83JsTghRaQh7qaQPhYO/PS6eRZjS
	MI1vTKh5mk0CW7k47NHOwm33/nKJUim3tuyBJIvmd2fLHxY8Vrp7rFIZvX5d6Ip6jjCSn7
	iR98mEV11leD4FZdC8unTrcIPHpfWnA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-AKerZNtnMC2IhRUNOxpseA-1; Mon, 17 Mar 2025 08:08:56 -0400
X-MC-Unique: AKerZNtnMC2IhRUNOxpseA-1
X-Mimecast-MFC-AGG-ID: AKerZNtnMC2IhRUNOxpseA_1742213336
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e82ed0f826so2198974a12.0
        for <linux-i2c@vger.kernel.org>; Mon, 17 Mar 2025 05:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213335; x=1742818135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJPQeSME8GvdRg4e0/QcxZw7No+3gHVhzWB0lS12ve8=;
        b=NOHSrcg311LvJItjf1vD5StbtIJE/Jfnc5XzTQ3SGvQFJfqGj1JbyHUbDKCpkxPk3T
         dVpaWyX3LBWkKM178tTij9/XSo0LlfeUiIKwT9tPRwf770DoQkprq2XFmubXFFc4EBtj
         RVDMCoSk+HekT25AH0Xu5cvdP4ikaDwH8EAIGrvrlOLtwZ33jDWAwebjfyYz7KIODZ0/
         IWC0NM/2EbzQ9A87g2eCbLHVBc2e8TH0g6Fr/LBOqkOkZw0wtY38/pktL+InPsiSI81e
         9g9hKzeJFDIpdXC6SAWoFImL2Wv+2zcZk6ZehWGeoYyhTilrW0xA1V49EIcmQ+s9GRvC
         tPLw==
X-Forwarded-Encrypted: i=1; AJvYcCUfHBlHd1HlVkHmxc4ZqWjdjTocpXMixi1ndDx9zRFI6H/nwqU7DYZYbzUihrBZXnry+Yh1NraILc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMTbfrzYT9QpIMdtl5Guk5oAg9DzLOgMMq5u6KYhhf7/5akHIJ
	NJ5SMBoSJzme8R3nb2zPy/flJqigcp5vFlIDD5TbeVrev+9putdxptGKi9aevOw5IdXaChaThSy
	TeVU6xd99DiLQ+vkhEC7V4e262qBcJxlID0Cy23ydkJRWQQ/LkVp9TfSmUg==
X-Gm-Gg: ASbGncslT5dqp9zWXEyKmfke3TmR++tusIvRtYcRRQXkCO+cvADogB/PnBy0QkvwLOJ
	r1p01Aqmp29WADlnWPxZGBqbGRo6fMe0TNk9k+TvYK1LUtKjI1RUBnXQcdDPEwet0CmG/6EYvKr
	iijQsSqnPjM/NJZmk6SWtonFRPr4zo/87rvbAL6RIMdB1trnk6z0kMJ9mz7l/mt79A8hjRvQSIT
	20JDn/ymMoW8XhlWNzjsdyTA4cVIyqjTXSx7XqDKcHhjZlW9nhIkXBqRys2g/s/UJa4B7jUSZzG
	BMZTgSJSbTyU+74U+Tk=
X-Received: by 2002:a17:907:7251:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-ac330301e93mr1164667866b.29.1742213335652;
        Mon, 17 Mar 2025 05:08:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEASQHm2+bhVpahCDmGzllaOZY//NhzMkpnMVSSXwheT0L/ool1AlnploYIuxInxifydvQX+Q==
X-Received: by 2002:a17:907:7251:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-ac330301e93mr1164664766b.29.1742213335224;
        Mon, 17 Mar 2025 05:08:55 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeaa1sm652245866b.2.2025.03.17.05.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:08:54 -0700 (PDT)
Message-ID: <b59d649d-4354-4fab-91aa-865af5d747de@redhat.com>
Date: Mon, 17 Mar 2025 13:08:54 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
To: Andy Shevchenko <andy@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <4596db59-51fc-4497-9e94-670e9533e7aa@redhat.com>
 <20250317100856.GC17428@francesco-nb>
 <bc3144b7-23c8-4b47-bdd8-c482b1a6d81d@redhat.com>
 <Z9gQMPjjCt9Rn4lH@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z9gQMPjjCt9Rn4lH@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-25 13:06, Andy Shevchenko wrote:
> On Mon, Mar 17, 2025 at 11:39:14AM +0100, Hans de Goede wrote:
>> On 17-Mar-25 11:08, Francesco Dolcini wrote:
> 
> ...
> 
>> But if Andy and Ilpo are happy to take this as a more monolithic
>> driver under drivers/platform/aarch64 I'm not going to nack that
>> approach.
> 
> I'm okay with the choice as long as it's suffice the purpose.
> I agree that aarch64 maybe not a good choice after all, but
> we should start from somewhere. Later on we can move to agnostic
> folder if needed. The question here is more about MFD/not-MFD.
> If the former becomes the case, it would need to be under drivers/mfd
> as Lee asked for that (or even required).

Right if we go with MFD (which IMHO would be the cleaner approach)
then the base driver registering the regmap + cells / child devices
would live under drivers/mfd, there reboot/shutdown driver under
drivers/power/reset/ , gpio under drivers/gpio and any new
functionalities in the correct places for those functionalities.

Regards,

Hans



