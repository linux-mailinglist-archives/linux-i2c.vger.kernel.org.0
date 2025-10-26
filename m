Return-Path: <linux-i2c+bounces-13811-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E14C0A8F0
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 15:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 185D94E6B40
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Oct 2025 14:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FC71FFC6D;
	Sun, 26 Oct 2025 14:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aonuQDI0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF221C32FF
	for <linux-i2c@vger.kernel.org>; Sun, 26 Oct 2025 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761487662; cv=none; b=cI4/sFan+30IW4s2UITXuPBP4a5qqeiGpbw0+rtSxLtqsnnRyCvrzpeBn2jgFqKS3V8ySfQX7S/FNCrJPLiqIUfaT2Gln2gwoyNIhGvMkoKjzUaGw6P+GnjW9+lZc+otJl/HGuSPS/zTDqAfqzMn8OlCFDtLKXp57ZGrW/K2WSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761487662; c=relaxed/simple;
	bh=xV+XpmnZgH8yNaL91zacwH06Flk8Wj030SwiGCT4dKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1IyT5KfijRJS9K3SCVZGrtso+09/x8kwqJTuE5I07jPGXN43hCoej9yLofUn7TaQAkHArXqqcdE/NikruiXL4I2NHmcm3ijmbidQCCADAQs4F2QsCQ6H0QJi44bGhjG/m/aKEhRRzRqM5PVyrVkmVYOWSef7wgMCVW0B5guZRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aonuQDI0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42966ce6dbdso2735419f8f.0
        for <linux-i2c@vger.kernel.org>; Sun, 26 Oct 2025 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761487659; x=1762092459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8pCXYGSUFQt2/UInKtJObjyURuskXIyH1nb5zEIddY=;
        b=aonuQDI0TgZQwhfKrL7e50L5mjOvZfbPAND5KyAE5OEUeVJzEsm0w6JGdZpureIOof
         k9nAwovrwHQqXF/TBq5aKs0VJe/pZrIOSvWA8LfU1diXpmluyfVhiaCcncdLiaMkkevh
         Uq8OBu8/XTkbtHZidAQUh/XNEIGFn2tl8iWjnphqcnFy0JWLT3afucNGdbaOAOOFkjnW
         ZNXz8pGDM7rrYBwqKwPIi6UueTcVEML0Y2GdvJJZfKX6o7afw5KQSxisSPLWmVsHlwTD
         yHPdXhmeqdwDn83m3P0Uos47txevkvAQQSQ8o54a74J7lyBul8R+TNO5N38HBawKGsso
         azLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761487659; x=1762092459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8pCXYGSUFQt2/UInKtJObjyURuskXIyH1nb5zEIddY=;
        b=RgsenQw719kDBq3LFC61ZDMBb+QpoG0ekv5OchCErf/Qpjm38lLm192i+TRsMH4aeG
         xo2EqRf4wTSqEq9XxvCVi2nIs5ZA/zgRqHTv1xelxH9aerhOfdNrNDQg8bOoYh5asiHG
         SodD8sXIs8Isjj8FwM6ie8fEv1bgX3Dr9SzS4sWWQleK6qWPa0+oRcemX/V9a4JuB080
         ey0PwIxuMnVMbzC2kOMoZtrKT9pzBDG8J3ol9e0YtxeoSazrWbIMFZ1+0pd0I72y0Kb3
         pyHVvMVxpzHuCpHd79RIZ69Rm8LL/tfmBpqCv8x0DxEGql735l2J7Xw/tD4AIwYdWNMO
         lCTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh36PBvUO0gDu+sDZposN1y92od2Out3WKslGMYghUAi5EoRdQrweJh/ck6iGb0PiWt5l5YeRP0mo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5yiZQZj2/7cVZ1qHWopzIe3ozjepnEBlHJ9LP1N/yB5HAKxTp
	B8syTaaMctS3AJqwCO4hG0kO6KU3ctJ8wRQBzL3R5m6jIw+Zvdt3NQWj
X-Gm-Gg: ASbGncvlTVIv3gav45q2u6pP+6KX9x7ndxlU8OT3tppkwhs6IAVPs1gk79judcgmDQF
	uhcAC0zloTl68Rfkgl4H4DmvpPI0KIttcfI+/bumzil0CU3DYim2LGnbG1h+k9vICRPAaeh2yO+
	RdgsWw+5w11krTf3HK3EstkP4LCWQP6Sj1pmQy4RRUw9I5iiB7HIZL04LKjeSq4WtoB631soOba
	mHyFWKaCIukmd+MyqxlZ0CY8eK1DgQQA2rz0HVYpyK3oeYiYdK8sjG0blRx3ME9ASHSxcvNXftx
	NWkjOSY0dGys7g150EJF4wwsdw0llK778SEuLG2Kmh3/i4h6MTAatFM553kjOupvnc/UIjQLpp6
	4QtXVp8dV3hX0ckUpg4ko+DquW3F5LnJPS6+Nfh6vPVPPT/qmJ+uxv3kGSxe9m/3HU2+QSPm+Vu
	aiHIRn9aaLhYWkx1nI3tP1c72+NGqT+Y438/IREidiY50bkoz4XHZgKZ1cFm/r2UyuUa1dMlykC
	1o4B/GQi4g=
X-Google-Smtp-Source: AGHT+IFSKeLMco2N3/sQiKLLR53sAgo1iuWmLMfoyaprsHJcZcPb9bsUpnpcl40HUr99KJOpcP8P7A==
X-Received: by 2002:a5d:588c:0:b0:427:83d:34b6 with SMTP id ffacd0b85a97d-427083d3c88mr27387967f8f.42.1761487658641;
        Sun, 26 Oct 2025 07:07:38 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7? ([2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb7dcsm9141661f8f.11.2025.10.26.07.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 07:07:38 -0700 (PDT)
Message-ID: <1b4070f8-a629-4487-8255-297918401723@gmail.com>
Date: Sun, 26 Oct 2025 14:07:36 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] rust: i2c: Add basic I2C driver abstractions
To: Danilo Krummrich <dakr@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
 <4d6d737e-6e9d-4d33-8402-940947170872@gmail.com>
 <8b0718a3-bf3f-4037-be2e-540ba1879405@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <8b0718a3-bf3f-4037-be2e-540ba1879405@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/26/2025 10:52 AM, Danilo Krummrich wrote:
> On 10/26/25 10:38 AM, Igor Korotin wrote:
>> Just checking if there’s any feedback or if it’s still pending review.
>> Thanks!
> 
> One note, if taken through the I2C tree, this patch series will have a conflict
> with [1] from the driver-core tree.
> 
> Igor, Wolfram: If you rather want to avoid the conflict, I can also take this
> initial series through the driver-core tree.

I'm fine with either option. I can rebase and update the series based on 
[1] if needed.
> Thanks,
> Danilo
> 
> [1] https://lore.kernel.org/all/20251016125544.15559-1-dakr@kernel.org/
Thanks
Igor

