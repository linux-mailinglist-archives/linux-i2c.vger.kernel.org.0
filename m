Return-Path: <linux-i2c+bounces-7369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36D99D93C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 23:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 855641C21C0D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 21:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC8F1D2B34;
	Mon, 14 Oct 2024 21:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r2tK3ENy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CA913BC02
	for <linux-i2c@vger.kernel.org>; Mon, 14 Oct 2024 21:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728941816; cv=none; b=YR216N0mUEZ8AcDHaYTiEHyE43ehjzjJdNqW1NAxH9HDovslNBJXwZJUuKgTx1WZgjyhiIbWw1AbCIR9ZpnFO8MSACakgWCEEaRmEv4LeIritiNZoFYkJvvmvjiprEFCOLRCFzJgBdiiyr1bKr8spJNg2h+Vb/cnMewTHKThd5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728941816; c=relaxed/simple;
	bh=k4SFlVjh+uR65uwdgKDRqHhs8xqLl0Ct7TG7dQW52lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LbztxwnBsqKv0j6hgzI8XLxFXFo/zAXjc0fVdD3mDq6ocl/7EQXYTTfB6pp7+WqVo6FPWRlSVC0VBS8qVVmljWIfkfRHaUpmZY946TwiAGNaQMfsBG6zACY5K7SPQId9k7wkh4Zmrf+hm3ttTLgJLl64ndtiaoNyN77VRzv/udk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r2tK3ENy; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c9693dc739so3002083a12.3
        for <linux-i2c@vger.kernel.org>; Mon, 14 Oct 2024 14:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728941812; x=1729546612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aS5oHRHtEas82fi6dLQvcPoGTT6ij1fnB8J0TcYqkvo=;
        b=r2tK3ENyMKvhrCAi7B1+Nfz/vQgmfUumEGaeN64F7XDwtJdB1HlrbmkFbY55dup8lE
         E2dSqcbaVhJkNM5X8aJdgcQzUn3MST+uryw3S/Cqsh59egA1iVcGYsLH2ftMPsKYHELY
         f77S1/zYmf/Bkfet+eQuvx5FDvh1/mCy+kzXWlnIb8RKQqnlSoLjIC0Nz9UBkMHCX8eb
         BFDDBzQ6EMldAAzRYnJC5ylqzonKLkQHYbPlLBntZE3RBFiu4mzFglwJtlm9XCMb0kuN
         hNK15wK+5GoyUPXByKgdGyRBQ7SD/TqrSFeaAX7EeLI78LzVnFnqo2R4cMX57VdopjBO
         uhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728941812; x=1729546612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aS5oHRHtEas82fi6dLQvcPoGTT6ij1fnB8J0TcYqkvo=;
        b=J3oPGvqMfxha2rkltHmJr+GaUOLGl9Bvd78wNEGYdSSbY/0IgaG76cWt6Z4jri7qyH
         JYs6akK7GXwcIpLPpEcH3W3Ph/N5GPxf9pBA36vg4IIJBpsVxB20uWfL52LyaL99LSag
         IYh+2Ayode+aDJKNV/+Hi64Xdf22XOXtURe+6IQCL/QaEK+tML5yF8Q1obzf828z0/SB
         oLOIwx+k59keUrUv0zMG/x9bg3FqgBlGSY+NDT1pGVyH4jP/HF5BE61onMDc/OVhe+b7
         dTAVEYfxjflslRDILNWlyFdA/wqWBM4RLS2rNrxIt5z7CaBQRiMs3K+lW0jzcAhmgEy8
         NB5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOUuRrjtbSOmv3LtDAUFed0U0YuzUyOA5fTOCw/kbaLURZo3zYYIyWpwIWgqZhPBquP+CC2WqJ/gU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgRZFCzu4fnD5IrhU72QpXtW9JV5SQ8uac4bySqVcj4RMJQfeq
	go41yA5fwgv6CqkiieelgirIBpwIjOjwLVMzOSvmHbWT5iLGwhT4Qyq+0ZMYxSk=
X-Google-Smtp-Source: AGHT+IGMbzqVMCN4nXkCJp0ZbA/DVg+/3LgMvva+vLk+OtvbPDG71diTtg6++8GyVXSdB/0w22sZkw==
X-Received: by 2002:a17:907:e2d0:b0:a7a:aa35:408c with SMTP id a640c23a62f3a-a99e39e4fbbmr856093066b.8.1728941811683;
        Mon, 14 Oct 2024 14:36:51 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a06169946sm260451066b.204.2024.10.14.14.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 14:36:51 -0700 (PDT)
Message-ID: <6a060f86-82af-4d39-9ab8-a377650e6bf3@linaro.org>
Date: Mon, 14 Oct 2024 22:36:50 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
 vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
 Frank.Li@nxp.com, konradybcio@kernel.org, krzk+dt@kernel.org, robh@kernel.org
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
 <20240927063108.2773304-5-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240927063108.2773304-5-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2024 07:31, Mukesh Kumar Savaliya wrote:
> Add support to share I2C SE by two Subsystems in a mutually exclusive way.

As I read this the question jumps out "what is a subsystem" - in Linux 
speak subsystem is say a bus or a memory management method but, here 
what you really mean if I've understood the intent of this series is to 
share the serial engine between two different bus-masters or perhaps a 
better description is "system agent".

Please make that delination clear - its not two Linux subsystems but two 
different Qcom SoC bus masters right ?

For example the APSS - Application Specific Sub Subsystem - where Linux 
runs and say cDSP - the compute DSP on qcom SoCs.

I'd rename this patch to make that clear - because "between two 
subsystems" if you aren't intimately versed in qcom's architecture 
suggests that a Linux i2c and spi driver are somehow muxing pins ..

Really this is a type of AMP - asymmetric multi processing.

"i2c: i2c-qcom-geni: Enable i2c controller sharing between two different 
bus masters"

And I'd mention in the commit log specific examples - APSS yes we get 
but what is the other system agent in your use-case ?

A DSP ? Some other processor in the SoC ?

Anyway highlight one use-case for this AMP case, please.

---
bod





