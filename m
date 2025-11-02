Return-Path: <linux-i2c+bounces-13943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B474EC2943F
	for <lists+linux-i2c@lfdr.de>; Sun, 02 Nov 2025 18:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1FCB4E907F
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Nov 2025 17:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9645A2E2840;
	Sun,  2 Nov 2025 17:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5VQ/8OZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C32E1C7C
	for <linux-i2c@vger.kernel.org>; Sun,  2 Nov 2025 17:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762105505; cv=none; b=dIYxjGF9tM2KAzAXy/XEkOiyUxkU+D6fF0F8Qz1qStn+tOtNcqD6ZJLq0j3dBN1p6cLuq/j/OQ2hIO1+DTDM2DsJkQXnX2kjEIguz/KC5hA01bOuG3H8s0HUWoxB39qnV0yn5P7U2w4pYPf/d2Zu4PT0HJ1DMHx+Y8JagYqh3Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762105505; c=relaxed/simple;
	bh=o9ZD8/0+MNSNnySRJ1Ytjlqlsx1KrHFyL8lKNHU8ONw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLZWpbi3E6oQrzBtQ4Iy8CmQPcyW9QxJwJezScdU6jGukx13fD6sNCj7uFG/nFMdQvxoNPKVeu5G/wajj9+Yz/JVgjtNcS5Kev3Tq5VlmF8bzK2FW5r5MLfCfA3xg2x2P8sYfuiG4O8KoF4cxd9/QcSdCQ7m6SOJBFqS/FMrnV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5VQ/8OZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42421b1514fso2151830f8f.2
        for <linux-i2c@vger.kernel.org>; Sun, 02 Nov 2025 09:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762105502; x=1762710302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgXNe1/+3M9Bc49A4LAFjn6WrLPZekbbW0gWa65pTsU=;
        b=S5VQ/8OZGba4174yvUpzYgCZ8/AZjilFCQ6SCzf2FidTErAU06Ount11/05QwHc8mm
         GW7zWZ3/ITbJsskG2H1V3+9wXrkeNEegt1hSUzlUlWzZrKLyaLGzaXYWB7DEF1ldZtYc
         7Ulk6hqhzmtGfjY+a+Bxqn8xbccWFjE57cEHmBOZI4axzIODw1k6crTx3Bd0xDrQlp5y
         Rf2G00UESlMAKaYZ4M2X+Opdc8Ju3YWQd8NAzwUe+o/GF+6xoDmdmSlLaHQK4dco4uc7
         uUkfunWtBLAz5FlXs4Z7PSRPiFMoQy8ICAj570jUeQ8UF2K3vpcRi0P2yn9CmDuMbAcT
         /pWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762105502; x=1762710302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgXNe1/+3M9Bc49A4LAFjn6WrLPZekbbW0gWa65pTsU=;
        b=NaqAhoEq22ME2EWxqgyBtKpbzL25o+u/ppDnxlpvS0pDE1VRVfLlj9ejnQA2YUMbS9
         ylXl41tfeT5HWQSAQZQfJlK3D0S0UbXuR+fwzTN1jpN6QJvQhRxTNtFzdfC1SJiasUnO
         aq5ETNg5NVOFxKPsfUm+ggEEJ8vkZ5i+KoltViJGeXLyeIz9/pyWqPJO2xwtttexx0/t
         224tIVxSMo1BpWB5ctlIciF+fudo0hFnxp9vaP2n3ZW7eRwN9d6KfL1U5a3l8BlS8qGa
         OTQV16QeIz5lCBCK6L6tv5mFqO3WSLNHWGYeEaKPi4EZfDpaIzH74WFJXMDS6bby2jqQ
         /NWw==
X-Forwarded-Encrypted: i=1; AJvYcCWlXdaglUCQqk3YxVevbPUajnuwIPjeD5vM0GKRC8yX9QwzVtPbpm5eYKkrZpuSU6GEPXIRU5GVRKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPzj6/p77OXvBJTEZjy+PVwMcxWoWj8mLZ2qFNd4O6EbbkojN8
	fUSKOlLFvKqred6lWlEOyzGIUhfvIdCDf63vHsUcza2dSbcOXjn7BLFF
X-Gm-Gg: ASbGncuCr8rgKVQ47EyWeMKPJZXf2h2WJYpVf/BmshzfxAoNnrYolzydaRqWhKM66pU
	XKMyBW0AFbQ8xkESGKsG/rR3gsVtjkYLWalWlyetMv9q7/LXjIMt9OwPRdQyR39e0E84dP2zhCh
	YAyNjLejMczVyPAxBQI/gMcM2MXnbv6//ZIdAasM9ezrzBqCbZG7ghRT4diMXw2t7r2YSYTCzFY
	WghF4PdmIMXvPnGj7P6PPUXVoeqO7+f46vS0//d5+iAi6jVh+TBbcOe6BRohZxiiHO6u+04mqJ/
	LcT+XP56/QfCL2HvO/5JTswS2fq4IiM6ZCy73OYRybDkTs+rcOR/X811IvNUPWz0kFDhYabY3M7
	clvTISV6dGdBWVz9uSxHQpzMjgmOga6zlN/6kSPNwAcax8YbcvP+4yqlCNRTdBoisQCtoAi8eIW
	Hpo119dsxxWjwiqZfCHJgaHX6d+FJ5yjrtKLhlhIY8T5Zec/Q1AaTyBqgg3VdXg2KkPAo=
X-Google-Smtp-Source: AGHT+IGJIyppinbjIILKIjccATlkCPrJ0q577PUGOu2JV97yZWmt6GEkEXdoKObKy9tk43kyVh5tjA==
X-Received: by 2002:a05:600c:1f91:b0:477:e70:592b with SMTP id 5b1f17b1804b1-477305a7cddmr97387645e9.2.1762105501554;
        Sun, 02 Nov 2025 09:45:01 -0800 (PST)
Received: from ?IPV6:2a06:5906:2618:cb00:c4d0:5845:9b7e:9d36? ([2a06:5906:2618:cb00:c4d0:5845:9b7e:9d36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c11182e3sm15792428f8f.11.2025.11.02.09.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 09:45:01 -0800 (PST)
Message-ID: <860306dd-b3b1-4eeb-b8b1-d09f2f7e028d@gmail.com>
Date: Sun, 2 Nov 2025 17:45:02 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] rust: i2c: Add basic I2C driver abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
References: <508bd9a1-c75a-4d1d-bed7-ee759ac5a701@kernel.org>
 <20251026184143.280797-1-igor.korotin.linux@gmail.com>
 <4568187f-ab63-4c86-b327-90720ad20ac9@kernel.org>
 <30fbb191-5300-45e9-93d3-8b2ef5cf18ef@gmail.com>
 <DDTFXY5VJCS2.1ZB9EPNLDTPAC@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DDTFXY5VJCS2.1ZB9EPNLDTPAC@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Danilo

On 10/27/2025 10:00 PM, Danilo Krummrich wrote:
> It's called from other drivers (e.g. DRM drivers [1] or network drivers [2])
> that are bound to some bus device themselves, e.g. a platform device or a PCI
> device.
> 
> This is the device that we can give to i2c:Registration::new() and use for the
> internal call to devres.

After the recent change where i2c::Registration::new() returns impl 
PinInit<Devres<Self>, Error> instead of Result<Self>, I’m unsure how to 
adapt the Rust I2C sample driver. The sample doesn’t have a parent 
device available — previously it just used the returned I2cClient.

The current patch series includes a Rust I2C sample driver that creates 
a new i2c_client using i2c::Registration::new() and then attaches an I2C 
driver to it. Since this is no longer possible, I’m evaluating how the 
sample should be structured.

The only option I see is to split it into two parts:
1. A minimal I2C driver sample demonstrating only driver code.
2. A separate I2C client registration sample based on an existing PCI or 
platform sample driver, using its device as the parent for Devres::new() 
inside `i2c::Registration::new()`.

Does this approach make sense, or is there a better way to handle it?

Thanks,
Igor




