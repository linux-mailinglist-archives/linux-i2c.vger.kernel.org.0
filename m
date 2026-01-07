Return-Path: <linux-i2c+bounces-14970-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F01CFDF1B
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 14:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C575C300BDA7
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 13:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B68A33F8CF;
	Wed,  7 Jan 2026 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfLxdgSL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB55B329370
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792512; cv=none; b=jV2H6jWiKR+wFCbiYKnkBdpe287Enq3K71rNjL5W4SdG/wlcYeW4cquY6T8xZqm8AP4caDQsHoWkxvis2F8nG1Af0zndRd0OclEx9EUE2ochaVT2BZcgWSDPT2TrwcphBt+tr7pSYdEAtdwDOzOm9f8w4a7hWfXwgJuf8cEsgR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792512; c=relaxed/simple;
	bh=4043nn6qswbC3R1CDYRZmMZVB+UZoK9L+jeskiyq/IQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q7J8EVEQ5cEWn82OqUmblJPoaT6iBv2PBkg5tw4nvpbWNIFANI+XyszkWGOjXl/r4f6DyMIoln+Bxiw//vnJWDwr39K8TqFDRbtoFpLWc67DajtrsdX9ELykbVU+WoBIPpjwcLO262Tjr3GkdTiPaLdrTMRq+ZqrxFD0EWkihhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfLxdgSL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so21921445e9.2
        for <linux-i2c@vger.kernel.org>; Wed, 07 Jan 2026 05:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767792508; x=1768397308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8DjhrIBjxiw5uwIMKqO1RXHujHZ57yqKGJRAwZxaGU=;
        b=LfLxdgSLHowF9BD93MXtMEea6vhrKlX9yuQ7UjaPTJY+5BoMYyRcbTvNavC3tf4QFN
         0EGaUHQLNyZRcGcZj8u02jtc2WkJDzpoARR1i4ING/6nVvXjztt6KvNlIhjrBWF6MJYL
         7AEDfWrSDewXpwqyd5nFyE/bJpHWxfnIRJyRyZbSvXwBSfKchcI/Q7ASIqEipcAVeFKx
         tiXKqVcpg6eRdeZug4rTz9SagXaYb8le66NjQBq63iYXCP7MHaLMBAhOAD9BnRXkPtu3
         4FU7GZZ5U03d8QJuOsFQWA+AUWOBnZlsRHr7aXuzKDmz9rR8d4mJLTbGTmeVFp+7CryV
         wUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767792508; x=1768397308;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8DjhrIBjxiw5uwIMKqO1RXHujHZ57yqKGJRAwZxaGU=;
        b=G0cC4npKeSLctfWtjPHMsGobsUYaR2cY4TSxSRdrkrcyUJfdqSts+LLh8g4P4qZTvH
         zehJsV2lDfsjlBGtDmP+D7aTsf4uPQCx3e+Dugz4YSYdG8M+BA5oBhuoJe+D0l9jbaQt
         5wqdGMeFlPW4q2XXqddBNSUOdnVUUb87d7UHQebcto+rJ43ptyP/EhsHnVOsoXiWJFaZ
         e0hbiw7rjeLiNZJNsNN1BSwnDAVtuuC8PVBkamypzz8GUghJgZVVxeT2TZYglrmJqPKZ
         Loa+m9vhx/OOC5p4kB6ev75LI5tKeSsF+0oSPGMcwrFw7gB77fj176Bx9GOPtlHaUqg3
         WULw==
X-Gm-Message-State: AOJu0YwhrIzqpDk/zoIlJ8eVzKNUjeYTtni4w5YcWzMODVcTTGz4Ki1S
	PZjiFu4nX2t1SMips0oVttC67/0PN2C82d7wbSfuhplac6qmino69Dals3K+gkTgXtM=
X-Gm-Gg: AY/fxX62cecFqnkUggR0WuRRVcwIzAIDdkhitWkNRfnRXQiATWqSQJDLnsm+PA2+/6u
	HeG3Mnr/J8CLwE/8uNMfkcA/P1BWHhV//7NBN416Uq2QpExJSryh98OGm4QKBAl8bQ4zC2MWJz2
	vozFaJ8Fk0KkOuZhMbmBbGcCJVyUaWApyNnbh3DvSrycQeTYJYFq4QqbAFVf4ktZLod+zWwKBzr
	zTEIjKCugrdeaMouAi7oUpu9EYuqSq3us0ch2TIkvrRsE7JYy5Hv3Fvb/sSs+mu0om1gyYgzeHG
	x5ba+4nsXM6uXSG43m/Y1rfVBuy8BuFQ5moOmLWVdnqsZCS4P5F9whjdgo2lUwhfgFbmYrweCO9
	heoPD4amQyrwldXpYUUIDw/g+8Z21UcKACfXUgm5nVoMsM7eahU+MBmf8CINsEMjhQIObpbSWmJ
	MbxTYfhpNGBlsmZeI70PMlm2xLiFMYpB7XrjAXAOY7FA9GpmiS/DArDnabcdTQzSw=
X-Google-Smtp-Source: AGHT+IF+Nsaoa5Avs43YfgZgEUZD/BpbPQ3IhAdlo4fic+DilL/m+MXb7BEEQIQBujANzszqHLm1rA==
X-Received: by 2002:a05:600c:3b90:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-47d84b3864cmr32189615e9.27.1767792508026;
        Wed, 07 Jan 2026 05:28:28 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f84besm14380385e9.1.2026.01.07.05.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 05:28:27 -0800 (PST)
Message-ID: <87c2ac96-5c30-40e2-8f89-55b7c3417db8@linaro.org>
Date: Wed, 7 Jan 2026 13:28:26 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2026 09:39, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this overlay reflects the possibility of
> attaching an optional camera sensor.
> For this reason, the camera sensor configuration is
> placed in talos-evk-camera.dtso, rather than
> modifying the base talos-evk.dts.
I'm not sure how many headers there are on this board but could you 
include in the commit log which one of those ports the sensor should be 
attached to.

As I look at the RB5 board for example we have CAM1, CAM2 where as it 
happens CAM2 == imx577 for that mezzanine.

---
bod

