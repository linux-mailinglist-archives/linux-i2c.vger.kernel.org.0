Return-Path: <linux-i2c+bounces-8794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 216169FDC5C
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 23:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D621A161B35
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 22:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E01193077;
	Sat, 28 Dec 2024 22:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tp4cuecK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E5B198A08
	for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 22:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735423912; cv=none; b=cwYi+VqvGVh5S9ttz74JOpPgvPt4q99SPcGI9BTP6b/g4DydiorUmJ4Fa37Gq0daf809ZYnEpr4HT5LdY8uoVIfTPFI1GwEjjpXByrdTtL4QpnXI03+AbD+e3vM7EdnBLxORJGLOYJ54iL0D1Ypywmg6RuPAi0MPsNW9SEB9hHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735423912; c=relaxed/simple;
	bh=dsumvKcsY6ZUPbUCkKvNLbAtCIW/62UblHiMJ6YMLwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eezqdI9Xoe1NECqLy5wld2cS9nXeQdRHiq4NOEt9qc0Pg8pW4vSHH/TdAQdXwvgVsYL3Wg6NJsImpVQYKx/Lmz0jYa+raL6YLvL/gy+h5Tc1VYzBmx3pbAqYN73FsCLk6f+TeduxYkoeRPtufsVQLRJah0tr6IepL9BZ9mlKU7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tp4cuecK; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa67bc91f88so96894766b.0
        for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 14:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735423909; x=1736028709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37sW265JYbkPT5Cnsf6QtI0/jWmrH8Gz4iZapa/U1c8=;
        b=tp4cuecKrJnjh2Qyk0nfZD1MC1nPAyh8mg2WHybfGLV00SYumT0DcBWwSaWCtxGoZO
         0/oesgas941nXYRTBgAWCsEAeTd7XjHa2TE9DOk39ZFKGCfi/h9ku4ptwWrFG6AQ+gS3
         NraG9qB27/Ka5LHaxGT1pq7sCu1+xj3GvqUObbz5nNzAjHOwjRxDcrSJYCLPgajw9xyD
         iG9smbtlYGWr/40R3hpog8Ps8plF/krxyXuDDLMR8N0iCxWGDQ2SvKffNtpGPLxcup0a
         4iQn7T4UqcFMObyRdAkWTnnQJLb1azQ8hJZ83Qc/cYDjzsKgpv8PhoxhFxIfYppFpDCX
         oVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735423909; x=1736028709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37sW265JYbkPT5Cnsf6QtI0/jWmrH8Gz4iZapa/U1c8=;
        b=PZBLuOpeAjXSbN3Pt7dJ5/S8VaMNO8azxIs5GdH9tUc5iu3Kw2STouxu6RURiji53a
         xXeqhzutcnThGQKgrOMYk8Jy4ffi9ni3kGVf+9pUMROygPSzvwjEZR4YoIY/hUrJCPqi
         6K5tCSJeUpaOJhu1IIoooFwtn+IxVIl3jd43nTlWjKVep9zrJuES5t9DLi5Fmi/PIt79
         Z0ilhcMJgLmCXiH+8bLr7326I+p0AKbWbo02shCTGKSFWP3KZqJF+4JrXH2mtWae216b
         ndlVMfTcKrhnf5MIkEBX+GdXqGBk/cC8YB52wqmiimxApCrtkPLk1jswD0rf2nEhvoK7
         K6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV84FJlj5g2Sglf6K2ufzUsubKOZb3cZwaTmH9YH6mqXPPIbaxU1BakPuv+XY4mEnm7gAcgW5tGTOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YydVOs/LWB1LB4Q6g1XWJx4GH4eGEkZuhpf6RAINeOtC9uWUd9f
	NDn2kLdlnlUdi6A7Jtyn0xxYDBfqEsxNhjkbQ3TkE2ZyNSlZa87zHIZ98p5oWtg=
X-Gm-Gg: ASbGncs9r4UiZ2mNARSDehy88sRrmZYRy1DyyYCXs+BJabhnYkml86nf4shzcTDB8qD
	JJwuCyLMjQj5wBNKiv0eykb4wL2XNmjrSj3Opue7wMDuurRQtPMorH1EzDV7ZEwrxaUeF5budTg
	5SJq5MhwqRZgfC+UlFHPCBArJzRQ3Ms1n83K8SQtZiISU1EuGF+YvaNsQKH+s2wyGCB9B52qq3E
	pK2egOU2ea1ERD2jttCFJra+UEEbATLY4RP+iGSHu6wwSFfsieJqfJbAZLK/VDIzGBxB7aZ9hnt
	1zHdnyN6KmZv2zG02FYd
X-Google-Smtp-Source: AGHT+IHGgsGw0OIyu/rgchiAV643jX8oLg9LUPYWje5ei4l+vnrFmsOwbdTEMbxpvbrkHNX5puRFmA==
X-Received: by 2002:a17:906:7951:b0:aa5:a36c:88f0 with SMTP id a640c23a62f3a-aac3378e312mr895034866b.12.1735423909344;
        Sat, 28 Dec 2024 14:11:49 -0800 (PST)
Received: from [192.168.178.85] (i5E866BC4.versanet.de. [94.134.107.196])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f01608fsm1290606266b.150.2024.12.28.14.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Dec 2024 14:11:48 -0800 (PST)
Message-ID: <a8a8b1d7-e895-498e-835d-8ec9eeb5068e@linaro.org>
Date: Sun, 29 Dec 2024 00:11:42 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: qcom-geni: Simplify error handling in probe
 function
Content-Language: ru-RU
To: Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
References: <20241227223230.462395-1-andi.shyti@kernel.org>
 <20241227223230.462395-3-andi.shyti@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241227223230.462395-3-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/24 00:32, Andi Shyti wrote:
> Avoid repeating the error handling pattern:
> 
>          geni_se_resources_off(&gi2c->se);
>          clk_disable_unprepare(gi2c->core_clk);
>          return;
> 
> Introduce a single 'goto' exit label for cleanup in case of
> errors. While there are currently two distinct exit points, there
> is no overlap in their handling, allowing both branches to
> coexist cleanly.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

