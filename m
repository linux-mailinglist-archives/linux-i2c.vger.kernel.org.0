Return-Path: <linux-i2c+bounces-7866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8D9BFBE7
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 02:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BBC71C21EB5
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 01:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB0028684;
	Thu,  7 Nov 2024 01:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2Ls9NQf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5724117C79;
	Thu,  7 Nov 2024 01:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730943928; cv=none; b=tQsDWAnKhZNDVgXVvnAso4+JiMJfo1qfuvLzl8VGVvU0WScaAhXgPAl70GN6dtEJGAxro65HayoUcPhoLIPkfSdTD+lF110UwOTtaqg3VIleFx5IZxSRetqqpTKx6/rYbSxhchgjHR3WyhfsVTuMI/0m2pQCoCARGTZksd+zN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730943928; c=relaxed/simple;
	bh=RP9Kl3tnmn4fuc7dablnD70S71aiWfXucgn/B4KquYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VF00vQJ52AQINbVGpw3nuSo3ADGGxlLzjDmrAtuWEppnSv7WWjgGZB9uIZLv2FdDcWPV1QBX1uZshhvhsblsMjHk127AliSJma7Xp1JPFRokYWEwFFV9CCRhmDSzhoLYMgc7bkSkU4H37HzevrTK/awDM3JNRQC8jVcYb5bTxQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2Ls9NQf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20ca388d242so4861885ad.2;
        Wed, 06 Nov 2024 17:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730943926; x=1731548726; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+p00YxKOs0bInMvcyB+P7dOZL1X8Zq2IMwA0EcrWBUw=;
        b=D2Ls9NQfFPK/gmgBoUB4wmYzTV209xgr5TfgKu1n8zcuB/PoNqrUfznuPlRDqjSYba
         BS3CWkgyVIC4dCRS+lJ0E7E4tHV1lMXSRAg9fMl0Jv4Q0ow7/IkEur08X0oF8yWNsedp
         QuD3nGKyUAEI0Zq1/UVYcpymNpt8TZeQC8QoMmoulDK0Vxbm9ip9a1RIVhYeywVufR52
         rEh4uOMIsaxXsF/A6vcnfn5Ee7MlERLS9fOlSAL40Ix1pyaUrlzUg9xv4jm4wMxPh0un
         ENLAVdYNVqAO5Uj9QOM8RbCfynpW98raFd/d8+EvvQhvXBwUnsGIK8JIdeytZDBD1jnL
         gz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730943926; x=1731548726;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+p00YxKOs0bInMvcyB+P7dOZL1X8Zq2IMwA0EcrWBUw=;
        b=Egov6rYMIb+hsCs0gMkOqk4Ke9W9Lh2ctg8SIcwhPI7Aw5cXcbKDcEhv37KNrXRs1w
         hBxLBHvj0Cny0MZT9rhrZ1tiYCVqdqkm/Hb7DxtxJCv+YEVTEdaRVpMkFyjtepizUhyM
         dyvK97Z9bWLF3lXvhFRdMbCYkrsVFy4u4ctH5khFUrXI62hL5Gk+cI6dB8DW2zBBSHOc
         qVI2eYB3U31rZZEI5uumMI+FIE5MiyrJtzIdTtWXMwgpHXaK9zky0R0bZyiaXu4gmQBG
         Lg35GqYSX0hwXWcWQE8j6bj6RL0E4pWuV7qz6FwZBcDZeZuX/h7LFJtf7zWxwnFePhU0
         Xl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLhAVtNYruiWNeNmSTvEXtg7nSEUxdSrQNfFmSGBw+zUOxbduIolmLIywBLNfGy9bkqnuPi2PJcxVF@vger.kernel.org, AJvYcCVh/AfbzVCx/BwVLu4flqnDmp5FhBSZ3GBzopvGL4cXfPFy/55VpcZRPOHVgtQ6M4yM8UNKhABcE+ZU@vger.kernel.org, AJvYcCWn2L6Qsvw8NswlcKJL0d9pp+OXM6dhIFOdMdQyWUN81AiTSYQWTVQDZA4j19lyOWQbjXqwVmgMCi44@vger.kernel.org, AJvYcCXLSYPw7//TtZWzV5ju+LP1v9KHCu1z9uZUacia8wWdOksxY1LCF0nnOTblN4l9XKpOMXm+AIUXAb9EMKc=@vger.kernel.org, AJvYcCXTENGoesEpvRM25XnwPf1hFb/PHD+y6ChKV7a6A2GrynQIzIF7V0ANVV6Qn7isdZg+1PnsXrgErNsw1Olx@vger.kernel.org
X-Gm-Message-State: AOJu0YwRJk8S/Px3lKTIIH4I8up2in4Bl+2YllxJr0KWUVBUuwiPXVRG
	zJpozxUSPZrp4hkfv6PSb8twGINuD82qT6q47hxCE+pBHb/dcgHX
X-Google-Smtp-Source: AGHT+IEYsIsrudryW9corBVyjAfoScGcO7wDmyEzHbL19yWzgOxw+c5e+cTjPS3eA4eTkgUaLwDIlA==
X-Received: by 2002:a17:902:ea0a:b0:206:96bf:b0cf with SMTP id d9443c01a7336-2111ae27bddmr319831195ad.0.1730943925641;
        Wed, 06 Nov 2024 17:45:25 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dde241sm1274895ad.81.2024.11.06.17.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 17:45:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <697a9596-f5aa-48d0-ad26-ebe06b831ee8@roeck-us.net>
Date: Wed, 6 Nov 2024 17:45:22 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: add driver for ltp8800-1a,
 ltp8800-4a, and ltp8800-2
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Yin <peteryin.openbmc@gmail.com>,
 Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
 Lukas Wunner <lukas@wunner.de>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-3-cedricjustine.encarnacion@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241106030918.24849-3-cedricjustine.encarnacion@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/24 19:09, Cedric Encarnacion wrote:
> LTP8800-1A 54V, 150A DC/DC µModule Regulator with PMBus Interface
> LTP8800-4A 54V, 200A DC/DC µModule Regulator with PMBus Interface
> LTP8800-2 54V, 135A DC/DC μModule Regulator with PMBus Interface
> 
> The LTP8800 is a family of step-down μModule regulators that provides
> microprocessor core voltage from 54V power distribution architecture. It
> features telemetry monitoring of input/output voltage, input current,
> output power, and temperature over PMBus.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>

Looking closer into the datasheets, I found that the PMBus commands are identical
to those of ADP1055, and an extension of the ADP1050 driver to support ADP1055
has been submitted.

With this in mind, please explain why this series warrants a new driver instead
of just extending the existing driver to support LTP8800.

Thanks,
Guenter


