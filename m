Return-Path: <linux-i2c+bounces-14235-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA30C7D215
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 15:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 826FC3AA2C1
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 14:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C526B23C4FA;
	Sat, 22 Nov 2025 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDFCY4pI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D538520DD51
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763820046; cv=none; b=hxX7hWelwevgWAZuw8SujWh3H8ugnrWiBqzLHgc1avUMpz15AdI76rdJcq6VPTyQEJVIuAq8fZS+QVNYayeyd1H15lcqMEXHELZjvwYO7rAiEPGUhR6aOZr7miea9rTBkD41+CHYoJ10mCV2KUB3OHbaf2o5t9YiIP4Iv/zXr7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763820046; c=relaxed/simple;
	bh=quy70Ek/g6qrhcqWBI6EKf77vs+SuiqG7tLVTxxmDl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTOTIu+GmS2NmHDistWbq4TqiAyamqbYjFoqmW63AoXua1kZzyoByRfr9e2R3QbHVr2/VW8REPgajsWUWEy2IznodNdIomvyLwFp0vpgo20DDVTLARLiDXWHkpfQaorIq2Ev16RMPKXAVDkEsGMWTC49yrCAyK/dF7Fmn/sWI64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDFCY4pI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b32900c8bso1714524f8f.0
        for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 06:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763820043; x=1764424843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfwrkbhLrbte3ifsqNDH76QA6U3FeJoA58L19HPvYEo=;
        b=FDFCY4pIZsO1DFTetcZ/L+iNMWBXtxKVGUWJzcfguUVlqLKXUo7L+J/977cfNysgD+
         IPssJevSWzwg/7gVqtgtyn6rCjlTSfDfxamIBnBa2CGY5yGJ0QPos35RBAmahiJbMsa4
         TbmcV5JFCTxNpgy5ETNMuAZDZviiorJPcIxCDiW865IvX/nM2sdKWSRvFI9vWftN4p0Q
         pgfTFizgiml+HXMnd2LivcDhQNEmofJjjqii7itHUzuiznvOl0VWHfkN5a3x+lJ26/T7
         QWbY1t0yBQcFBZ32+4KeIsCC0MT+QfzMzTzu6IiK83yuESOtkitcJQ9WoMpPn2rHH9K8
         Ndiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763820043; x=1764424843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfwrkbhLrbte3ifsqNDH76QA6U3FeJoA58L19HPvYEo=;
        b=g1L2BXTnkqVWNj/8EPHvQbDa9YR6ke1Clgl6m70U7LXH+N7KNGZl5hZCJkdlTIqSz2
         y3A6VBm0HXCzDW5rbDeh1KC2UGUcZT+RoTBRH7Uu078A++x23mrtrYj4i3qHYKOa64Sr
         6UqzIstJ/dLZQk5kp1Hc4D8Ou8e7gG6NaFHBqq1V5w2dLI503kkLbc4XNARUeijIj4Dr
         zWLOki+NmBgTryxZ7YmyGct3HjnH1tiJt1zczJa+F4I3be6UwkTPCYyyEjFLSUwliZ2s
         BV15ZRkznp1NGBmZYFu4LacN9z86kL22RmzbkG+hnZIBwTBmIpe3xjoQqEAoITFN9M1U
         r7RA==
X-Forwarded-Encrypted: i=1; AJvYcCUTtuVgtJRoVOCTqyFy4/Ah3zD5aJZxbo+JuLsZsUW5UyK7LbOfXF7dbuPXIUTLKE0Dh7H/jxfqLKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJxQsvBQjdFfF6XkEyMaZ2BdgoUxpsU51wHiGT6/I2lwqrnsN
	2XMyOGjMaCVrDTX19P7/KqOTJoslS+/G+Xd3cr9Vr9gk+PVxne4/O8+o
X-Gm-Gg: ASbGnctiS/Jxqm0fYV6zTmUesMyciOBjvvfe28R2QFog7dImMBMUtgoQ5fOMDac96G/
	xZXPUwmkTf/JzCqI6zyAgptg0DpXP1EjwIDdFd9GDvFjmE6SdUZd7QBaX9MBNr6FZ+HaUZE13Ah
	RvkI9OzWHGwvCyuzJLfPBe6VMwp6a8E2NGUaARs/jbk8fPxeQ7Q0ditON5BybWtg/ImVVAiKJIQ
	fIKv/XNlNwMu5m07NFhQqPhRgtUzq5lw3wHnNKTR76EJzRxm57+qeKCSzSUel3cbjlbNxBemg/D
	UzJYbhuGkDz32Iw5OgChKdr91X9jm2HjUKs6oFtg9LlwRgx0Yolh9c817qQrDYdIaoexGFCX0yP
	WSbjMnf9jMGAcl5iT48HRa1Ae8HCtfDYM+G8r+VO0zZwCjQOoLvRZSJLyTXto/FgjTHAAArGqyP
	i5wUOJr63lILN+ZgFtyVQQ9soc4QYBaiP6KONG/f7xbDME5P/VqTQCTUWjhHJtr7ASipR6RwaG+
	XrPdg==
X-Google-Smtp-Source: AGHT+IGCTRKOT74K0saRhZjnA8SssUcOet/loygSO0mcvZW4qeg4K5sLv0R2XFKB1yMWmNn38c4hpg==
X-Received: by 2002:a05:6000:22c9:b0:42b:2eb3:c910 with SMTP id ffacd0b85a97d-42cc1cd9466mr5763465f8f.3.1763820042951;
        Sat, 22 Nov 2025 06:00:42 -0800 (PST)
Received: from ?IPV6:2a06:5906:2618:cb00:9815:cfad:3c92:4b87? ([2a06:5906:2618:cb00:9815:cfad:3c92:4b87])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm16995503f8f.32.2025.11.22.06.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 06:00:42 -0800 (PST)
Message-ID: <2adb1d9e-9891-4318-bbd2-c6537af538c2@gmail.com>
Date: Sat, 22 Nov 2025 14:00:41 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] rust: i2c: Add basic I2C driver abstractions
To: Markus Probst <markus.probst@posteo.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
 <25c70010f67e9f0760840e35cc722d3bb89fd703.camel@posteo.de>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <25c70010f67e9f0760840e35cc722d3bb89fd703.camel@posteo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Markus

On 11/17/2025 4:15 PM, Markus Probst wrote:
> add me to cc please.
> 
> My led driver currently relies on the i2c bindings.
> 
> Thanks
> - Markus Probst

Sure, no problem

Thanks
Igor



