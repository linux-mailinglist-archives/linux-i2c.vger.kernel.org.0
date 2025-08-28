Return-Path: <linux-i2c+bounces-12503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06923B3A5CC
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 18:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C35123BE6D2
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638A52D24A3;
	Thu, 28 Aug 2025 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpncEeF/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFCD286D60;
	Thu, 28 Aug 2025 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397518; cv=none; b=mwEIsvBByabDGVxmGIblkbmPzyXDNimHMfXYyFIBnuKL5v5D/YhAfGuQghklgb6AKJi9Im1QD84YOIadY8KO9t9t1tzPAR5thxmDJAEXzAG9WwjFt5fmLDVOIMNmEkiWSIccQmPNrDvN3eucdDP2tdrrEwXt8D9KrZTRCMkGFD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397518; c=relaxed/simple;
	bh=VCgz87AQbD+NIqYtaGv4MfNGpvxEv3mxEjPpigap2YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmtFtc1kTCtss3jaqxFIX7Imgm5J9FJgLBSNS7f6U3M2FIA4k9rnx+Qg2r1mZ4ADElIK5SSIyGNYBms9OSZ7K8tHTpPLRT1NTk4i3G6UVTk6AS3prNonWz6/XpAq3r3O9QqxLVY6QBpg9zDF+IS5p6VlHaeL5uds9FsD7ewtREI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpncEeF/; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b47175d02dcso971172a12.3;
        Thu, 28 Aug 2025 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756397516; x=1757002316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCgz87AQbD+NIqYtaGv4MfNGpvxEv3mxEjPpigap2YI=;
        b=JpncEeF/iBww32epG/SJZsoKDJkTQmeSDtnB1nMwAxhRecyBMNR465HQXKKnIbbMA6
         LRYEAwcJ2f76K7bG3K1qeJ50dNQcC1ugQ+iq5HFmVTWJIm8yOlTvfBrxiB04mCPPI3Lk
         LAdYISZJI8XTm7Dexcovssm0j/WqHyYN8C0UX+BpW6cqSxX8VVV4iCFvpcN8D8xXuktc
         n5UIo9vUL3Sv3PhIQhyzqSBvH6CnDmawIDCb2cYWFY74lkzqAe8DfNJ9BjHx4bTrNDRK
         5T0yrwOSmrCYfyiaGpho51gXBlT5W+7IZgYBhM7oT1RWWrikQsp27AWVu599IZh1jZxb
         TYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756397516; x=1757002316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCgz87AQbD+NIqYtaGv4MfNGpvxEv3mxEjPpigap2YI=;
        b=WdaLDsvVheCAGGdPTtplIDQhr6FJfzZIsT1bkaLhXruNtOrbFdH38hCALAB/MSU+2y
         4lI9UNjAnzVY1hfoAAjNiyHmBdNSPkDtqqOKypwhg2+3a6LmzDrWCptBahV0478KEclY
         Yz2FFz1Yr1nPao7+CRcE4EXD/cL3O5Fl8JFIznxcYbBNnNlw+UtMACZF20/PyDA36P0/
         JwSOYVG7GmUecTwab5AYG30UJIuLrNAQrA7HmrPVx2bpUcFFBzyAounwWpc+IhpFd/L3
         ioGPmeUPQOLRpvZv56I097nJD2XPlytPMLUEfuS+M7FtRVzsU7s6znGQBftt3/5rsa+R
         0iHw==
X-Forwarded-Encrypted: i=1; AJvYcCUmzG1aFV79RmgWKw+HEVngdYNtFDi8NGMN1oSg9gJdC/HULIMpNwXXz13tJOp82zmzAYSSz0GNZ12+@vger.kernel.org, AJvYcCUxz5rqptzuKmbhOYRzHPHKYjVd50XJUMpL8H9ewn3xOwQoyx4YQ223WWrRHLV8dgFKJ558P/ckKA0AY+Q=@vger.kernel.org, AJvYcCV7qMOCA+a9vtiieFbd25qA8Mq0QuicYy+5fkq1d/czS7pU8QPTFIf/q/dRRlp9wthIbCxEuferDFTmMOv4wxx9@vger.kernel.org, AJvYcCVG2eTElNfwN6eQ4Teq3bOdlIYSSxm5LmA5RToOFbymPIDWh7hO6x519ReWc8HcUi0oAdbOPfUjX/f3aZ/F9ZI=@vger.kernel.org, AJvYcCVUTpOPqYKamM0fXt6ZKEPLugy+q0DzwaSbZYlhiSGysWCwaPdclV0QCFVqDCQvTDCGfV47UbPq1fA2@vger.kernel.org, AJvYcCX+/s2sePoWMUtlXeybqw/INOdHV8M4gTcqoM0Cs+2YJDuSV32o4HrnRE/azyrSCsCvnDSsIKsibEjz@vger.kernel.org, AJvYcCXDMrkOUvX6axMMcuMSupcwOnnYR2qp6cAVChVaP04R6Fq7cYex5MSXBQCsum9hAb5gqBjhNlzd9As=@vger.kernel.org, AJvYcCXH22lIKaCe86U5NgeRoorBb4aEABl+eTLLtCFFeJYJxCjkHQVatvNvLxnyj9ARPy8fkOXxdjXHN12T@vger.kernel.org, AJvYcCXIfzmzhsg2ch/UVk7Lc0yez/iV3GWzfxPH9GTL/h8GIudq3LglRpTqz6e1vs/q/R3myoSCC4FCDHr5Rnx9@vger.kernel.org, AJvYcCXjuj6DlZnilC5tnoFteVS7
 4h5dQBvCedYWSoNdmmmEmLDMjiantSTKMtyHs7Kb4U+YilO5Y/nygvmdgUzPfQI=@vger.kernel.org, AJvYcCXkKZqBh/XqPgYc6e1+jn0W1jtFftIqk3Skjb7dwMbNnPNXC7l8be9SQ6lrtLHRODr3wKLw9+Xx5AnG5w==@vger.kernel.org, AJvYcCXqOjhIx9oxvgsLpSHeOyu0sJb0f5sA59bq300R9/4kE4bcVjXRuP4DecFeazImEbFPzD03wLgRc0Be@vger.kernel.org, AJvYcCXuBxupmB/mzZQ2If2rWTX6qbRM2M6p8aZHLQN6B2A8iBbfG8SjpN107zXjgdgbsvdBaeZ9Hhhy8k9M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ooFcZMn5Qg/2WSwiFbOXpMEGYa6DB62Urc52Th9LDnKuJGHt
	NLu81jkM90MAgD0qPvkGVOTWhsWPWnu4hhqcValiQw27SPyxmfdHXU+q
X-Gm-Gg: ASbGncuhVr+9O7iPPiQqxUXuNPeevfWdsrFCOO+2n1iyQPF1ho3KXcVEV1lVhYPT9KP
	AEVamihwDxHRtaSvj54/+Zvarcxwn6Sr7XAOQcS+Ebn2LemBo8TfW7MmpN7oYfX82714+r3U95h
	ffJUZgxkbnf/7XR1+n1lAYPHG+7WgONSckPT+jaBfy9hVy912Vd9HpSMobqaYSPpXZ7D/hMSIRu
	vLs7vcGUlwQ5ZXSBeUXTp6gyrKW84HrCCeFN4tQcbDwbjtAxli6J6k5IjEEu84Yp8zt2YmZbGEd
	j7w4v9mgJt5IJV2hG765i3USeobsbwOWrcjHCk1gLtbXvIqQ5/ZkoHVm6wnhpWw9BebiIVYLXCH
	ijjqJFU+4QYHY5fbioRgO+AYd6av3dckDnh1PUJ4V7BP4zIXiGPCW1b+a8hS4vt0M
X-Google-Smtp-Source: AGHT+IEelSOuEo8Npbahj3GwLi0XEymTTpHMsSHpMsvQzhvD7rxDhVw5w3VB77ZuaLmwNpmmTqLyYw==
X-Received: by 2002:a17:903:19ec:b0:248:9e56:e806 with SMTP id d9443c01a7336-2489e56ea30mr87843455ad.12.1756397515676;
        Thu, 28 Aug 2025 09:11:55 -0700 (PDT)
Received: from [192.168.1.111] ([59.188.211.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248a63b5916sm45971445ad.52.2025.08.28.09.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 09:11:55 -0700 (PDT)
Message-ID: <932e0085-c901-40f8-b0d5-67f8f0b934e6@gmail.com>
Date: Fri, 29 Aug 2025 00:11:40 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/37] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>,
 Lee Jones <lee@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Janne Grunau 於 2025/8/28 晚上10:01 寫道:
> This series adds device trees for Apple's M2 Pro, Max and Ultra based
> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> follow design of the t600x family so copy the structure of SoC *.dtsi
> files.
[...]
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatibles anymore [1]. Instead either the first
> compatible SoC or t8103 is used as fallback compatible supported by the
> drivers. t8103 is used as default since most drivers and bindings were
> initially written for M1 based devices.
>
> The series adds those fallback compatibles to drivers where necessary,
> annotates the SoC lists for generic compatibles as "do not extend" and
> adds t6020 per-SoC compatibles.

The series is inconsistent about the use of generic fallback compatibles.

"apple,aic2", "apple,s5l-fpwm", "apple,asc-mailbox-v4" is still used.


[...]

Best regards,
Nick Chan

