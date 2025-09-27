Return-Path: <linux-i2c+bounces-13249-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7084BA627D
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 20:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72F08165808
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 18:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A813022FDE8;
	Sat, 27 Sep 2025 18:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh8CVj6V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2802181CFA
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758997260; cv=none; b=qU+CZ5+huYGLaV1gNNB4TjTg7CNkTF6fIN2Acf/qvYEFJb1JcqPoExvfwI1qYhiwJUugbeyGMgPRKf5hFdljqsG6fVz4bBWIthbD2vA0GmnXVjUrEUUOKfAIj85otQX20BZn29kEB25T+NUeq80nid3ZtnRRseSRs9QTRlxMDfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758997260; c=relaxed/simple;
	bh=ZZsUqsXlT+NxuLRa0wHvGFSehTMZVHpC3xtckn2HDG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVuFzwj6igmakAa1QPpk5Ep4GHiGngMbUR2p9wJ9wZzErUoYlIjZT/U1BktmsrxnJKHiyWmvLVV8DoX121LG3OVQ1aZP0ZlrxDOCzlBjMP0hJGORKe6b+RwSlEaZIA/2kqSUtHWcf1CTMHGuOmtYwtfNtw1GdW+hn2iOkOcmfWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh8CVj6V; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so2509876f8f.3
        for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 11:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758997257; x=1759602057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiTGFZwhz927PRv0PGaGJg7Lawc0Y6HmusWqcFMWBM4=;
        b=jh8CVj6VciDNgdMg7TjOEkX77wode/Z6L/VUCMS9qMBqLQqEqR1MR67B/yEwzE0m4y
         UEmErRoyQH6Eir6z3AW69/0d6/BflBpErrmO5OeF3He5UdKYBc5KJF2rEGcbwudYgjGO
         e07npljPffC59CUgc48OdnPdW0gInNF7XFQ2vgbyV1xvv7TcOOURT0x6aSNHtf9hinXV
         e++HYZqc9S8sMBCUcwU5JpFb2oVwaWIWt77lrUV7V37Dwktnoa61Unlsz0yjNpdYSXd7
         5O6MEBBZaS4MduWYQbuvKs2icRwJ+xwcKCYKHrLKiCqapEnqQAr5c75SPqhFl146xHRM
         2lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758997257; x=1759602057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UiTGFZwhz927PRv0PGaGJg7Lawc0Y6HmusWqcFMWBM4=;
        b=juAALkA7Zqdq8QXMD8voe0XY+t3SXCbYsmT4uMhChc63mz9zIOS1Rdnj73oN55Zzt6
         Gt5eJwifISZanYesZ3uQ7sy72cBFR0Lb5FfVMsfK+xEwlrEDElAWoZsXvVaDshRoVCTm
         UidAHuw4oIqG/hOAvgTrf/YG4LYNDejOZgnCITA7FBx7E9RP7sFQZ/KcLabOz9Qhxr5k
         z73nVpf3ps6kL48jm/IXK6vUQcAi/tN2zL8VllNUNrgbG3pDLRMF6KTiF+vjw+tcI8Tf
         WVIbpcfyQAUIzNkdslVWNEKgex/nHtH3EslFsuV9W1bxxpRYMz5SwRBVaxu6BFcPjCR6
         WKmA==
X-Forwarded-Encrypted: i=1; AJvYcCVXGkuSBOh55ZgmK6aIwhrjt/ltxBzeIziNwKTn9k9dZ5XWtmJhARVRGneEcAlxUiprq3fjbtvrVUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvyE6s8YIeoeAZoX9SFoe17lFJfdNU9cAZx8zp9WZMMeKGBRsc
	rKS61dHlmo1+xilUNMK4I190g1j5K9Lyu8KGrSgGM5PhlQd0nDIrUDW1
X-Gm-Gg: ASbGnctgkSHQ5VXTP6BqILyXFXse79zRwlFTP23P7vv/2v4exIrLVdZatpTJOUQEQM2
	Qsda0+f7pRt0yNQKDppGjxlzPfHQrGTQw6+AvWLcNX3IkVt+3XJP/UzPOoIAMxyOm1OKfXbRnTl
	Pc4myieMW+VzfCW9mz2gpMMjraJvYTlfy8x4cWjVfEmg89TO1nVHSdx6tvrK0LBGm10khf0Ys7k
	8UEcvLiagB/ZOwTBcKrAZxQ73xuTCgcLgKIfJjH9l6QKvR5E6tdZ2EnF1v76jvanVA8wGjCd2TU
	dOBXh+mqWr+SS5eMPEwuGxJTzVLypPxZKe1LLq5HVprKWbpjlTvY9UudYAuJVW78t1T4kJQqK0v
	llW3ukCAHCbhmmvYcfr2nusNCMCQAengIcXR1l85p7xvArtfWR6XA21GqyAVDdP8w9XlhP3HHt2
	Ym7ZQs2Cz7rf/UZi700yQ=
X-Google-Smtp-Source: AGHT+IEtiFdCtMagiN2PlJIlHgX907vHybIZWjwyy/+2hiQWsMBj67930e8VQK2WHaA903g/oabW4w==
X-Received: by 2002:a05:6000:40df:b0:3ea:c893:95a7 with SMTP id ffacd0b85a97d-40e4adce88amr9868281f8f.31.1758997256826;
        Sat, 27 Sep 2025 11:20:56 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:a8dc:c580:efa:e675? ([2a02:c7c:8b21:7400:a8dc:c580:efa:e675])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5603356sm11601993f8f.30.2025.09.27.11.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 11:20:56 -0700 (PDT)
Message-ID: <10637103-7e15-406a-8e9c-0eee3c5c4922@gmail.com>
Date: Sat, 27 Sep 2025 19:20:52 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] samples: rust: add Rust I2C sample driver
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
References: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
 <20250911155048.97364-1-igor.korotin.linux@gmail.com>
 <DCQ9K980YX1W.HZIQI6S5MST9@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DCQ9K980YX1W.HZIQI6S5MST9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Danilo

On 9/11/2025 9:46 PM, Danilo Krummrich wrote:
> On Thu Sep 11, 2025 at 5:50 PM CEST, Igor Korotin wrote:
>> +// NOTE: The code below is expanded macro module_i2c_driver. It is not used here
>> +//       because we need to manually create an I2C client in `init()`. The macro
>> +//       hides `init()`, so to demo client creation on adapter SAMPLE_I2C_ADAPTER_INDEX
>> +//       we expand it by hand.
>> +type Ops<T> = kernel::i2c::Adapter<T>;
> 
> Not a huge fan of this type alias, but up to you. :)

I literally just unwrapped module_driver! macro to get to the init 
function.
This type was part of that macro. I do not see it necessary, so I'll 
remove it
in the next drop.
  >> +
>> +                i2c::Registration::new(adapter.as_ref(), &BOARD_INFO)
> 
> Does i2c_new_client_device() grab a reference count of the adapter? If not, you
> have to store an ARef<I2cAdapter> within your i2c::Registration as well.

Well, as far as I traced the C code, `adapter->dev` is a 
`client->dev->parent`. Inside of the i2c_new_client_device the new 
created client device is being registered and as part of this 
registration device's parent reference count is being incremented.

A big thanks for the review and comments.

Regards
Igor

