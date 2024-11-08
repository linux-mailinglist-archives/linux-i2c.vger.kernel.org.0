Return-Path: <linux-i2c+bounces-7891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DE69C207D
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 16:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8474D1C2175A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2024 15:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1B721A703;
	Fri,  8 Nov 2024 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elpK4eCk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5AC1E5708;
	Fri,  8 Nov 2024 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080024; cv=none; b=AP0fTUNwJ5oJgoOzCQ2OacYM3iOeAjhgfkkLIcFbtaL1TvczlAuKoGd/yKeoV1C7Vt5qNVG9A+f9ayapm3TMfGWgHp2+4/Wi6+r1NudqRAGKIWHFuk2nATRafWLzJ5XQr7LOeNbv5IA5qe/7LspPQR4Ie2D+VImJyoOl+CmOCQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080024; c=relaxed/simple;
	bh=jFmMnUeuC+ny2eEdkRs99LX3eAoH4643Yv0UWsCgWwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFD7meYBpUZSYFmMo2CGMdhPStwFbGEGlcOPCoerfHs6sgLlX6UtvxQlXxzpzps5xb4xgJhCESwCJ2uzckNzNPJ4cnYH1LTcdlSU+Hn86tG2xVd9HJ6aXl69XZh3RYYGhZX8XaAdwLD+wkQo9BNCLj140t3R4sfzPsdJFMzDju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elpK4eCk; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so3958691e87.2;
        Fri, 08 Nov 2024 07:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731080021; x=1731684821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tUwRMCHHdqZVRtxZCk5aPJdbR5inXLEUzSQYIspWM0=;
        b=elpK4eCkch8SmK4PW4/rRuK+wzmTeDU8OXEBkbd30Ka6w5WxkkOyynSKYiu9fTPJMg
         Vmt5ftm2sZheMF+efU5SNBnFfUcJC+vDONDlWjoqcXi29a+8NUrSscsyBaFjMPSpk5Ut
         31mm1BzW1CW8/jl4goC3jiUIXVBK97yenSj2mxxTYagQKTiF5NhfAYEL93ugPwxCA6fX
         k65VPKWaMwHJzsOXkVc2VAJdPNnpi82NBhPDZPEhoJawmPAzMRaxHpsU3YdYct72HiJj
         Jzk3CxkatMrCEodX9MBN+fyjPtcrI+t1Sexqu/cIrbpC43FczNwgQFLmgHvLqjQcpZjz
         Lj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731080021; x=1731684821;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tUwRMCHHdqZVRtxZCk5aPJdbR5inXLEUzSQYIspWM0=;
        b=cqi+CXZBvfDQx6ZxAfRFM9QVbKEPmvvnzkB1prsQpxfNOtZLuVfsnNCEouiBeXWChw
         zIEMMPjhXJZmRv/xZQSKmUhfVd0w22z0VnhC+Ye3xgPrPPyz/XaF1f7nOZsLM/MqQMLB
         0Xh5YGZp2jkkLKUQHJ9Z1z21NZn7mO6lSMu+riHkKTQIct0OmdBUWVqfUykOH+hKjcfo
         T/l2Z5jVPzJkMNxldIW2mao55s5SXcZ24zzDyo3mHSwzPMjcMP8atumpDFEDEEK+Ive/
         R6wAdjjj4ZCB87fHmpV/enBDDuT7ig4tGHiJAhhcqc0a1t3nGLUjJYqGZc6pTAVRi8ve
         hHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7FYhqqm4P3W6rYDD5d1g219+HLaAVTRQ518j9LZKxQfoY8NFTBH3zk7M9GVwrQtBAIQ5eaqGBcT+I@vger.kernel.org, AJvYcCWrMsOFORQAylWSmG2EZdFnJgdojjHfOrW9+B9fzdJfqpWXj4/FoNWLLVpX96/TtIETpVZF43LvYSOP@vger.kernel.org, AJvYcCWt6AaXwZCNNRBCh0L5wUGON6FlS1+R53qpCBZ1Csba251gNodVsTCJKLzle8BYaSKJdA2GRf4D7sJ/9U8K@vger.kernel.org
X-Gm-Message-State: AOJu0YzX6HyY2lJEJpjvxODdi5qHbGUNVtvjzTfHpZfpM6gSN5fonerd
	1MZHlULzTBXGHOqQBY+yzWvFvesYRrM67Rt5Xh3vi/47DovpTZaau4vevHvP
X-Google-Smtp-Source: AGHT+IH6QlPf0c6ztccp5zye1I+rJwIhnxrhIVUrE/U2zUAMlS2cVf9rlvp4D1Xd2iX5jOQ4HGOkBw==
X-Received: by 2002:a05:6512:3084:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-53d862f84cdmr2869650e87.57.1731080020655;
        Fri, 08 Nov 2024 07:33:40 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d82678474sm662970e87.42.2024.11.08.07.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 07:33:40 -0800 (PST)
Date: Fri, 8 Nov 2024 18:33:37 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v11 5/7] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <Zy4vUQj26-rkXrgk@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-6-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106093335.1582205-6-wenst@chromium.org>

On 24-11-06 17:33, Chen-Yu Tsai wrote:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> ---
> Changes since v10:
> - Added include of linux/types.h for |bool|

Tested-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

Patches 1-5 from this patchset were successfully tested with hardware
prober for i2c magnetometer on PinePhone on next-20241107. [1]

1. https://github.com/AndreySV/linux-stable/commits/in-kernel-i2c-hwprober-magnetometer/

-- 
Best regards,
Andrey Skvortsov

