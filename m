Return-Path: <linux-i2c+bounces-13247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9518BA61A7
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 18:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 911717A1628
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 16:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A3127703C;
	Sat, 27 Sep 2025 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtRyPe0K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BD4244677
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758991431; cv=none; b=WzFc4SiSKKyCWal1NJ5hilbViKrdJlPsKXuxvlFPE6P0uGqi8ZZHGBV74Wky8FV2QmG/iRSvZ02wwDtRkMFK42EWpMp3XU3r+HNvPPeeEnK79JaeRJQ69y0QcNUZJVTzQbIrazO/IcJU3RRKVJOEyNLNAo9cr57u+gVOXGR7U9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758991431; c=relaxed/simple;
	bh=vKpTRRRmpkwvD+RKQ8Vdg4UWvE2ebw01JOfwjsbS5Qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKzQnUQPtBCMCdje/dbqc5CRkLDH0GOI79DrMpcG4PO19Nl+DPGUpJXB1s9OJlgaQ46yVtVkCjmToAAl7GAoj+9S4Qfl0ag7Vzlvtuq3jYC6YgETOhPc5LBvyPJTs8Q73uHJLqwhsZ5CANpNDsMeKHUp8f5R/1wti3TvSTCBgys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtRyPe0K; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-414f48bd785so1278592f8f.1
        for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758991428; x=1759596228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOF0Bc+2gNxqDcWN5Q3dw7KfEBLw6JtH3pzFUg7pzQA=;
        b=YtRyPe0KtIa0kjup/zwBrbRwDVnHi0WaXzFiFg3Xpcv4wPgKFH0wRWujllvtkPNRdz
         XYtlSv/KbJKF7nb908fZSjIqZAz6KEcXP/XLJf96tITazZooRfdPtIyfQH6QtJqRh9ye
         CuDsmLQrWBcjZdQhw1N7+JsLNsbd0KZVAGxwNlt9QFEqniMapvCxuOG601Wlq890W3ap
         EBF7st/PVk0VSgQjCbhA/XQXhhOrWK+n+vtyZibHAj7lQrM6pqpxBreS1hKc33d1wCu/
         6xeqqB9RzApBQ4FU3cRvinwq950uAvq29uehlLsrocBKWbpWkjbiHAvY5Ei9oOaKAHsm
         SyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758991428; x=1759596228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOF0Bc+2gNxqDcWN5Q3dw7KfEBLw6JtH3pzFUg7pzQA=;
        b=jHubI2u8eHA/8fAowCKuJ2yTKWJ09rKxkLnxmb279uPBmCL6npsFR9kKhWTDoOkzNy
         S56iiHnNO8SmUT42eWujG+rU0j8peGWsRINeFvZoPYJqFzo2kNd5BkqnNSpOlJ2a8aMc
         aiU9Qmo1U4WBsP1eoQnyLcCk92J5iiwSSS9CTmL7O5Nvo+6qeMp9+mKD3NdMw+TNsv4L
         Har/zfKtPNzM9HoXQfXLqsMPCR+GssdB7DBUdt9Vb9sZOw0d3t3HvPbB0IFNa/pRKRAY
         Y7Qdub/pvS2syg8V5fzbodt6hxXtFznpluCJQim/OhV0FK+x79XS/TbUKCpwzf+lQKaQ
         ajKA==
X-Forwarded-Encrypted: i=1; AJvYcCUH8MIKUUQj1eQzqsEPWaBFnNCvbZ6m0cf490YkUpuJ4ZaDKKBtnGFcfXyvmuqUBumdoxNlywEZnQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyW4EM3VQhYh0s/JfDyIUza+oDXdgtvSFeenPiFI0rpXVoP1je
	hmiWgfcqh6kwv8+zTFsKtkJkdYHRCECkPqJ27BA08r7NjYD/rKuWqlFC
X-Gm-Gg: ASbGnctFwWqgjq3GbwA05ZIfyiPg44qFMwdKrKZfMpwU9AclZFsEZXdMd84XyW67+2G
	G3VcQAm/wipyLqtVoi2JwbIVRK4Q6ns3fw7CyGxZhGK+S8dJk72c1oL9CSflCwpzGX8XrBDoIjr
	4aI7ex32uKSW6YWutkhuvOwzElhBERZ/rXUfuFWG/oC/JSI7As1ziWgsF2cY69aUGDNTCgejwZL
	/k1ksyvVC7v68KCmOmBitBVMBYq+N6BUgjLQqWMSfc/Y7BJWBICbdM92c6N7TvIbgSRmBqUrXLX
	DOD1cpqJjmtZTLPuJSoI6rI14fZ+zcMUha/FUDl8LnWCbmaEiEPVZfsesy1E8E3PEguN4HJcVGs
	42otPjT08roMIv/+URcKC8DqZDl10HVieexefwEmjVxEG0Pi2Qcys3mPtwxhX2EO8uNAv4rezO+
	LZxKNkyEHqBjvUGgdtUGsFT+PgWKPBxw==
X-Google-Smtp-Source: AGHT+IFIv5xrxFaIIFhGL3xlayHFyRiak61vxIYfE2UYyGSdIiQTfaA3TXu6JLuem0D6Pr7aB35E1Q==
X-Received: by 2002:a05:6000:400b:b0:3f0:4365:1d36 with SMTP id ffacd0b85a97d-40e4354dfddmr11267608f8f.16.1758991427482;
        Sat, 27 Sep 2025 09:43:47 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:a8dc:c580:efa:e675? ([2a02:c7c:8b21:7400:a8dc:c580:efa:e675])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fbb27sm11247673f8f.4.2025.09.27.09.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 09:43:47 -0700 (PDT)
Message-ID: <f65c9cc0-318a-4c0a-9d0c-9c1a3d58d2b9@gmail.com>
Date: Sat, 27 Sep 2025 17:43:43 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] rust: i2c: add manual I2C device creation
 abstractions
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
 <20250911155015.97250-1-igor.korotin.linux@gmail.com>
 <DCQ9AXZ5APKN.1835AK0PVA3S5@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DCQ9AXZ5APKN.1835AK0PVA3S5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Danilo

On 9/11/2025 9:34 PM, Danilo Krummrich wrote:
> On Thu Sep 11, 2025 at 5:50 PM CEST, Igor Korotin wrote:
>> +impl I2cAdapter {
>> +    /// Gets pointer to an `i2c_adapter` by index.
>> +    pub fn get(index: i32) -> Result<ARef<Self>> {
> 
> Where do we get this index usually from? OF, ACPI, etc. I assume? I feel like it
> could make sense to wrap it into a new type. Even though it is not safety
> relevant it eliminates a source for mistakes.

It usually comes as predefined magic number in a platform driver info.
I'll define a specific type for this number for clearance.

>> +    }
>> +}
>> +
>> +impl<Ctx: device::DeviceContext> AsRef<I2cAdapter<Ctx>> for I2cAdapter<Ctx> {
>> +    fn as_ref(&self) -> &I2cAdapter<Ctx> {
>> +        &self
>> +    }
>> +}
> 
> This AsRef implementation doesn't seem to do anything?

I misunderstood the concept of the ARef<T> a little bit and used this 
as_ref() instead of just getting a reference by &adapter. I'll remove 
this in the next drop

Thanks for the review. All other comments are noted. I'll address them 
in the next drop as well

Cheers
Igor

