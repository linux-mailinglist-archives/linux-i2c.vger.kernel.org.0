Return-Path: <linux-i2c+bounces-9424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7617A33F0D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 13:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D0DD3A2967
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 12:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB80C22155B;
	Thu, 13 Feb 2025 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kMP1GvgS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F2221D3F9
	for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 12:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739449494; cv=none; b=Z7HNQZr5Qlu30w+JeskWXgjboZROYfaYmRfZCmlFBOZaXL98Hf+nm7uRvQna9SXesEZYqKK757UvzLmQtK44pNbPt3o30eHt/geXm8Nfd96o6ElDYAtPdp/gCFWwT2q2Pz7AKQB3Ko04X23WURR1Flv16yOQvA8+9Sxh4FgGYg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739449494; c=relaxed/simple;
	bh=ZDgifnO2eXQLO+3FjCdjysEvK77aW7cAL9ZpjrzvDXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyLZHf6lTadk/5nKjXbakn3RZ+nPB04sRQtPf7s2HsygvTcj3gkmuEEswZFWYyBb/5fDl1Ykkhnzf9h2wRQcWXdvyrB1quyd0ViLIK854BFECaYTrYI3GaN9k1uFyfPinLG0yw6ZP5n0S43eZa5Fyo9aG6qN19FPsHpO/W/mBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kMP1GvgS; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5440ff3314aso69351e87.1
        for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 04:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739449491; x=1740054291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5GCfGb+lf3aOIwd+RY6NCgd8Twa0/XMsahXFwWYyqjk=;
        b=kMP1GvgSPYe4qzneEhYLHbfaV3B5c5p/WxWm09rpN8J2zrDONAWsjvvkZ/xY54DNc1
         KHpgkvLdHTGJy8YavBRrhsqsDAW6i25OK/BCAdbgHZO1YAW8Laq+f30mnrz7pu0sPZS/
         0CTlwl4QE4ZoK7U9biWPu94EdqcQ4OwmUYLL7ZY1cEqsxUhh1vbVwY6QZING1d9nBIDO
         5ld5PQc277jGFwMPEHPxSP28qhIxaERB4OJ7ejtS4gLPRREFeWEI7fXezqrR7k3VOmYj
         +/didzFi3x0+K16Hv/getXcXguskXpeBq6KUtFVOWBofiM1NRJp3z8kN2nAgbZMbGNDh
         ED1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739449491; x=1740054291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5GCfGb+lf3aOIwd+RY6NCgd8Twa0/XMsahXFwWYyqjk=;
        b=LXMTwXxBCwAF1ginlSwGIpEQ9gaSfarZ4Lf/Z0hQ1yeiuqZsCdq0dEz6ElYg7hbKI5
         702onxe1rRxe8BHjzpqy+3fRwg6yCu64a7sIJ5SaSCiMPTi504n7DgbJ/HAP4U8iSNOg
         WumAnrMOajrUkSCFeFEbSleIQBuLTfPy1lQAg5zqoJyxBZSUG1PANTYdaqhEXPESBXK8
         TWhkd1qqunnZdDmpK16IXZ++sPRxEJXzbw09qG9+wvgaV9mMrqRtw6CZ4L7SBW2Cz7Ym
         oIz8ch+0OiUfsqEU3mVcwKRCrUK5LuWT1VL+k3hHpfAKwCPt16IOVcBUYgiLP9IAEbym
         f8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoF0BiP+5yUqi8gSoL1uoDQkd0ZCOVXQy1qxTNQ0frW4aENVQb8ype2LpWO3/U7alZIG9uUgXbZt8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0rFJBQAyY6MvYaiMDLKrYcES538wli8R468OBETYOUPPK/1uX
	UQi0AFjolGgCPZI+Mol5dyN0ef4APTYQE6Qh0z37GUnFWpMdQ9/fFDh6L9mqoCw=
X-Gm-Gg: ASbGnctQWS4ii2fcMfCAZbedHQF39/5k0UYIbGYV+RAsVyJhJkEbZ3ZJZ6PVoXKJuYE
	OfqiB90aubC6T0MRVmaIIDaXATiqVJ8UnOqBsXvuM3KJXqvmbo6A7UfXt/rvi5wGtYdTYk/3ZTL
	g8B6zX8qaRsFyPPF52y3LVDAGg67X4Y4OniW3U/P8gHZeFKNjjnYDXHx0C3RtD4DzgJXE0aHwAc
	SrM9dv2IkVMhT/CzNH/nlszNl8gnKxTOVXusIRF6tVNPwOSWbliI2O4tF2xfj66x8uQNsrJ1uQj
	mO5w7x97VEzhb8TOLQBsLRmdJLguhpK75kCl8dWH5mebkejT2NaiXkbEyqyiG7EtrlKovg==
X-Google-Smtp-Source: AGHT+IGGGD1LnQRTjzKIMu7P71jbpTMS7skHZBVLY6dWl3mmG7KfIeCOfXaf1YVcbcnJypSEi1k+cQ==
X-Received: by 2002:a05:6512:234e:b0:545:576:9e07 with SMTP id 2adb3069b0e04-545180ddc06mr822493e87.2.1739449490594;
        Thu, 13 Feb 2025 04:24:50 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f09ab7dsm162311e87.61.2025.02.13.04.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 04:24:50 -0800 (PST)
Message-ID: <85a9eda7-a6f5-401e-90b6-0353182b8deb@linaro.org>
Date: Thu, 13 Feb 2025 14:24:49 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] power: ip5xxx_power: Make use of
 i2c_get_match_data()
Content-Language: ru-RU
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Samuel Holland <samuel@sholland.org>, Sebastian Reichel <sre@kernel.org>
References: <20250213114613.2646933-1-andriy.shevchenko@linux.intel.com>
 <20250213114613.2646933-2-andriy.shevchenko@linux.intel.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250213114613.2646933-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/13/25 13:45, Andy Shevchenko wrote:
> Get matching data in one step by switching to use i2c_get_match_data().
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Now sending the tag from my different email address for the sake of consistency.

Thank you for the change.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

