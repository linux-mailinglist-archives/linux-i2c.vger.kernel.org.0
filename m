Return-Path: <linux-i2c+bounces-8944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E49A03DA4
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 12:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 375713A5683
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 11:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A73F1EE7A1;
	Tue,  7 Jan 2025 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QF0olLCY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6D01E9B35
	for <linux-i2c@vger.kernel.org>; Tue,  7 Jan 2025 11:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249123; cv=none; b=pbwj257KcTc+CiaDcar/3W7FPREiEQ9bCNsBmlx+dt7vpxNk+CAG3ETC9P5oY1TUneV7a7oe2BWFLomZYpHbKSsTPluUxPeHxFKhpCA64WgrRFkbA2xXiw1vdLZCinSZotefwQvUBUaepOM1/8ignwGYqWGnFWul/bIeFNfdaIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249123; c=relaxed/simple;
	bh=OfOEkScPJn2s6J2v3K85ULAVMG3MWr1RZT8sX5h4CTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FADD3OgSE77XPx0XLEIFzh9On6tqWZ1qwfKgjjO3Fq3rPiSDO0c8wxcpxdQIPukKceP2rK6le9elwrltbbCkkDOzQc+SG1q7IeiUplVLvD3jQTEzHHibYSP2I1V4250Pl9bWY7fx+/g/AeQrARRBGU7+Y3xdAMyVqyNVfOBWHcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QF0olLCY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d932eac638so5299970a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2025 03:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736249119; x=1736853919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7sn2BG5sdvDbcSzNStcu70GGFUnOPYuQtJHvkvNK9yg=;
        b=QF0olLCYJJt+m6wTpwxV4PhaqOhVWSEn21fKNorrOjE+hY2f5z2+2EdVi3IfvuS9kI
         LhvBq1fOaO+I1DuDdwBe/52d0twX9+2Sfn474wtfi15z5FHRT57HSALEJsKSP6VL8rP5
         fkqdLimbA9yNHle0sJ35aLWWxoN5VVXsYyOooCnOQ2OErq8Q6xPPI9KEyjwgJ2Q9Z0jv
         28oYf4vmcG6BqCuRDEnVE2ItlJ/Osul6bgyKPQvevSPgipd1+nEvNPWLtShE+sLQ34s2
         iHchcQzp/GC/PP2+gBSy3iM9FU1sPiFST5OfcGnc3pQ/TEu/1KBE0SDWCc6B5UsV1fM/
         0T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736249119; x=1736853919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7sn2BG5sdvDbcSzNStcu70GGFUnOPYuQtJHvkvNK9yg=;
        b=mAqlAjvhA2vnQkvp0lMePAt1eAT9kmZGr9nj9CpE7dpTyg8zMX+D93J9wd26WmwxC0
         /SZZj47LBqcufaTqnGkUicnk6QEmgfuVwlxO6vXTyX/+PiChbJYd+3/S9AAS3NWi5cAF
         WC2PI6HguqRp9AkeQImFWYDsfa6IDUwarpIhdwZ8c3VqqfiBOWn1T87Q75XiPnV5z3Zd
         OKmW+usN5CkTavuVqIkvsyZGv4Y7C2gXGtzzD1KAja3unaa5vzZ8LEmcGkWcInOETfwm
         6TGXL6Nm09YanUkydyeePkyp4yOtqZXhXeWPr0GFLWL7eux6WbbQaiIznCa7tsOrMjGM
         QnYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXod5WHKy1swgOaWpR1mXM5gsg3ZvPPP0zhGx9RlYY6DSFQIUCnJIXs9Mz0gU7vOZJ/VhAeK37zMVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4/LZh4jmnP6FksihOBLfyc8h2TM79G9fY2QFZSzxMJZ3igzvl
	J4pTeLXNmh+GW5WnQlWPi3vDWbCzftWzXbyyFS0SAPrVzqn8cRdGxjFSCSBrVJg=
X-Gm-Gg: ASbGncseCaswx3AIDMIri4CqJ7/5PdgoSU99vdbp8elYluxHf4LM1jVrjXeRCmo1NQo
	4r7r/TOdfRf9QqUPwOBDMAYPqOMLP1ZTeiu/Hhw2sJ+TawdJyHU62NjtFSg0s4rWEhHPJbZQz+B
	PBkNpGQwRUkzhzqIR9K9NtSFP+DPCjUx/uK4yZ+o528egJQmr6pihk6L/B6xhp4gj7KcJlLH7L9
	4Bz7801whhQD+sXzxQefz/C6HCglknYFkMVD3d/RL0mSJo8pwt8iJVYj2f8tnFTWmO5T9zdR6DN
	Ij1ZXCGl7Y1ANXyXXsvOp9F6B9EDVC8XyNS/GLI=
X-Google-Smtp-Source: AGHT+IGh9M3EnIPRVcMQNI989EcvZxMCNMXogDiQ3BV0jMzT1VyZYyESdCgc7jwCzo0D83CZJZ/lXg==
X-Received: by 2002:a17:907:9722:b0:aa6:6fa5:65b3 with SMTP id a640c23a62f3a-aac3352c204mr5521668866b.47.1736249119218;
        Tue, 07 Jan 2025 03:25:19 -0800 (PST)
Received: from ?IPV6:2a02:8109:888d:ff00:ca7f:54ff:fe52:4519? ([2a02:8109:888d:ff00:ca7f:54ff:fe52:4519])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895502sm2397516066b.63.2025.01.07.03.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 03:25:18 -0800 (PST)
Message-ID: <66fb0c6d-472c-4131-bd25-83266cf497e4@linaro.org>
Date: Tue, 7 Jan 2025 12:25:17 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Add support to load QUP SE firmware from
Content-Language: en-US
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
 andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
 dianders@chromium.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org
Cc: =quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Viken,

On 04/12/2024 16:03, Viken Dadhaniya wrote:
> In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
> hardware has traditionally been managed by TrustZone (TZ). This setup
> handled Serial Engines(SE) assignments and access control permissions,
> ensuring a high level of security but limiting flexibility and
> accessibility.
>  
> This limitation poses a significant challenge for developers who need more
> flexibility to enable any protocol on any of the SEs within the QUP
> hardware.
>  
> To address this, we are introducing a change that opens the firmware
> loading mechanism to the Linux environment. This enhancement increases
> flexibility and allows for more streamlined and efficient management. We
> can now handle SE assignments and access control permissions directly
> within Linux, eliminating the dependency on TZ.
>  
> We propose an alternative method for firmware loading and SE
> ownership/transfer mode configuration based on device tree configuration.
> This method does not rely on other execution environments, making it
> accessible to all developers.
>  
> For SEs used prior to the kernel, their firmware will be loaded by the
> respective image drivers (e.g., Debug UART, Secure or trusted SE).
> Additionally, the GSI firmware, which is common to all SEs per QUPV3 core,
> will not be loaded by Linux driver but TZ only. At the kernel level, only
> the SE protocol driver should load the respective protocol firmware.

I gave this series a spin on the RB3 Gen 2 with U-Boot.

After fixing the compilation errors, it seems like there is a consistent
hard crash (the board freezes and resets) at some point during i2c
controller init with this series.

I noticed a similar issue with this same logic implemented in U-Boot.

Could you clarify which xfer mode is appropriate for the i2c controllers
on the RB3 Gen 2 and maybe give this a try yourself, or let me know what
other info you'd need to debug this.

Thanks and kind regards,
> 
> Viken Dadhaniya (7):
>   dt-bindings: i2c: qcom,i2c-geni: Document DT properties for QUP
>     firmware loading
>   spi: dt-bindings: Document DT properties for QUP firmware loading
>   dt-bindings: serial: Document DT properties for QUP firmware loading
>   soc: qcom: geni-se:: Add support to load QUP SE Firmware via Linux
>     subsystem
>   i2c: qcom-geni: Load i2c qup Firmware from linux side
>   spi: geni-qcom: Load spi qup Firmware from linux side
>   serial: qcom-geni: Load UART qup Firmware from linux side
> 
>  .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  11 +
>  .../serial/qcom,serial-geni-qcom.yaml         |  12 +
>  .../bindings/spi/qcom,spi-geni-qcom.yaml      |  11 +
>  drivers/i2c/busses/i2c-qcom-geni.c            |  11 +-
>  drivers/soc/qcom/qcom-geni-se.c               | 445 ++++++++++++++++++
>  drivers/spi/spi-geni-qcom.c                   |   7 +-
>  drivers/tty/serial/qcom_geni_serial.c         |   7 +-
>  include/linux/soc/qcom/geni-se.h              |  17 +
>  include/linux/soc/qcom/qup-fw-load.h          | 179 +++++++
>  9 files changed, 692 insertions(+), 8 deletions(-)
>  create mode 100644 include/linux/soc/qcom/qup-fw-load.h
> 

-- 
// Caleb (they/them)


