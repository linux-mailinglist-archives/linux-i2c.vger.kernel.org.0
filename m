Return-Path: <linux-i2c+bounces-11520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DBCADFCFC
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 07:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1BD517D724
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 05:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6C3242D65;
	Thu, 19 Jun 2025 05:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbljeIXg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B49F221FB2
	for <linux-i2c@vger.kernel.org>; Thu, 19 Jun 2025 05:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750311357; cv=none; b=HrOPjVsfHjKkf7i41LLYjgexA7EfNMJED1fZtQ2VfT7D5m7hV5EerPwJa3GU3o86x3XO+MEkbynNCUQvk3viPgNVWdiKhpKr7jABdXSDZ8ROacuWYhT70gdmfvQekwcrEpzOLDT8vurGFO2LXRgx7wUCS6xrzyAHcTr4fLahh9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750311357; c=relaxed/simple;
	bh=3T6kJuyoKBc2nft91aab5hLZW+0/3OZRvkSZlEz+xsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2ymqBuChjksM8nhx2+Fr1Dht01tGXltLNJrGmAz8I/MQnBDdCb/IWNWDxuLRJtkspmfRySey6krJZvN9qcqRUZ3Q3KJGlB2R82I4AdqwRFiKBbVcTqoGHkMxJ3myznYPOEBajKBWUe054d2GhBLj5KaP1iqxhI+LCxLiujFg2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbljeIXg; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so526482a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jun 2025 22:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750311353; x=1750916153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MbKgKaSzJXcq3MoycGVCSzlp40V4lZ1OfWmFaWrV5lE=;
        b=AbljeIXgWzc5HyaqF0LJ6zpYffGY9+wpulok//kNaTbZc6/TkJKAKfbrmMzw8rS/f+
         haPbdNy/VGgCmafJheFGqvyz7DxHbQxAi/+Ot3I76MYlZv2D48CHQBT+Av6dm7TbY1TE
         w9ZOnR8rxJkOnB3UidGtNObmm31bntqXMkp+2WZF9cqc8VdQrESEHPPM+O+7qegW1oED
         to7A9v6pZ8169cDLSIADe7i0rBCa8cjYXWYZDwMskHPiwYly6NhB4oPimrYJJRmI3rAW
         IJWFhjKFxKzLPibGNhMNTnH2uShn2AlAwSVeDEqQj/po+cpsEeC3VQfJ9R0YAWDegqah
         xD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750311353; x=1750916153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbKgKaSzJXcq3MoycGVCSzlp40V4lZ1OfWmFaWrV5lE=;
        b=lSMMx7rF+IfK4U9PG1YQO17hlnlCk6kP+tgVLvd00uGqw2Un0am7XmYTPGzjWpkURS
         D+XR+a4IKqdRVOFxYUaT3IVZLThYiCyamUG7jTmPGMm1PSq0Gg/SOpmBVZ0yLRPU6lpy
         kIqL0tD8DRMaz+hCdUCPtNG/AC7uqWLw493OUjVoUKLZIPXTNnKvV1kFbg8NLPPqjd6c
         lPaDaO1LfWatAufAsCUF0geC/lnAoSW1UpBbW3WkMFcOUNdsehj+NHhDWk+o+A3cn1o/
         7q/XpoeCpn7jhFR8XFvMH0q5bhSXzWi9gRLn2CW/1cmK0GBDb+MqYFgqyxEimIXdZQq5
         VqGg==
X-Forwarded-Encrypted: i=1; AJvYcCUm0alNalvzK630xhct6DKhZhzTeobfIRy5kxZCHFtVuc7bFqvuR4q6lAZs9JXNAMCJ2sYCqwo+52g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya2+ptgnayaH3rAUupoDgIagCbN/pxOKGaSmLmJVJEJFpGx6qs
	6hjdnpvMri0+WLtp76SCZ/iFksMfOkMrmJgUJvPW2aL+I+j0Yd0rarK07am+/2W/DUw=
X-Gm-Gg: ASbGncuhjYjRJoxwdlAJw67J7NQZj9SGD8ZE1sO13lSRoRXA7/KwkIpMFcL3mT2FcIc
	XkLmOuPLHTjgnl6Dg+3uMthyQeV7a/Vtx3HKgHcZGWTB1gvtvQuPtAfaS3iYLyqlCNBxh/9A9Tv
	VLgTmyKbWOtqmIKlPYZfTe4iYX8TH6B6XsPgMpObRoJwyLqu2gyNMb+AZy73x6R4qoKOVtmo2hd
	5iFBymIL8vF0HHGwJDW2lAfX5EukJMak9HiShQSfIH4gjHk2NTw3NOEdcFU+qmwXb4m4PWspBX1
	jEKVLtx+Wf8A1AoMI6lqENWYTEY5IqrPOIx0H621GKgUc4RliFom7ZRRo1V4JIO+OkkSa7E+2Q=
	=
X-Google-Smtp-Source: AGHT+IF1Brl2Ml/RhPp1ZISh/ybbgy1I/Aosv1oeoYbA3EE1IVQw9sjB8PhoTnTOzWYQtjW2ZHuZqQ==
X-Received: by 2002:a17:903:32c9:b0:235:a9b:21e7 with SMTP id d9443c01a7336-2366b3df793mr286985355ad.48.1750311353385;
        Wed, 18 Jun 2025 22:35:53 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c0c9sm112008655ad.20.2025.06.18.22.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:35:52 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:05:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-input@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/11] cpufreq: apple: drop default ARCH_APPLE in Kconfig
Message-ID: <20250619053550.hogoo7ic5igvex3c@vireshk-i7>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-6-0e6f9cb512c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-6-0e6f9cb512c1@kernel.org>

On 12-06-25, 21:11, Sven Peter wrote:
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/cpufreq/Kconfig.arm | 1 -
>  1 file changed, 1 deletion(-)

Applied. Thanks.

-- 
viresh

