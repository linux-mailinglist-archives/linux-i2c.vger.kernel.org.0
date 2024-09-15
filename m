Return-Path: <linux-i2c+bounces-6751-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E026979633
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Sep 2024 11:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 739CDB21D57
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Sep 2024 09:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0120E1C3F1E;
	Sun, 15 Sep 2024 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0Cf0rVm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7ED946C;
	Sun, 15 Sep 2024 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726393618; cv=none; b=bllQKBjwjRISqqN8Y+Q08I3akHZH6anrUtquz67hN9VXiCzsiVmsXfoIBTeoTC2ex8qAyQVc5NFz+NSi6hegL1GQnpP+hGr9pt/2xODaabVFbTtz4Fhpa/i2hieU15OaXt0bs418nIeoqXSS2cgr3FwVaVdhqxWTz55UyA6Qitk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726393618; c=relaxed/simple;
	bh=2zO6QidvNsxqVUMyd2vfM3SZsN4IHGWxXREhRe7GB2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nM4wQzKouuPD/1PYhfkAY/cDdROH5UMcyMoty9YXXoX3oKBLU3q1TEk8qoTc/SGHNjQte3WDh9KlAKsh8s98FEuRW/ClYWnUc88olbuUj65XD5xTa2i/whqY38LOBnOEQMDUDHTKypVpiLzx0bCGvmy8bxFd9ssmt330JRvVAPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0Cf0rVm; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f75c0b78fbso37451861fa.1;
        Sun, 15 Sep 2024 02:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726393615; x=1726998415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEy2s6mdbEvETGfBs4ih+7MAVHb2th2MzF/jMUC7wo8=;
        b=J0Cf0rVmNK0OYzM1VYsZAEsjFNpL9dWZUD/FpTWjz33kM9wJjivJByW8EIOoFpq6JD
         nbceD33GGgrqfqPXsTIbsrFEthKaEHbljLa4hPvv8OeUq5x2lJEPd9gTC+PYuebZdo5h
         8W2uaTflvKR8uUY4rsCNvFNDst1+06txTN16cVBUGoJalAoHG0R/+wsrZBCvmOfjBj+z
         f+fxgY0ZKqZMVV7XxebYgI3oIgEFzmlU1sVL9BTaOPyUcMACtP4e+KYHrMsUPlrPaDDF
         AmvnuAyJ5SUhs0c+er3Dyt8xXAMlqg130jWUPqn6pxds060/AVN/PqCTdWO2mDrMJ/sL
         KvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726393615; x=1726998415;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SEy2s6mdbEvETGfBs4ih+7MAVHb2th2MzF/jMUC7wo8=;
        b=kiKC64S3+mWZEg7PO7kOcGV4M8fCQjYCbSTcePeiK7Hn9cT5PtFxBSteESJnFjLvuE
         B7Drwwfmsj+YxwpwIJW8vkwYPsYTgZw7Bdwvb+1qhzTKPdfmH1lVPvDa+Z2FkCEaT6Y3
         rt6zPMXc0QU/HujkiE2lfPHAYEb68RXvBJyW4pRwLOhlbSEsdyyHNHeD305g3SG2IpbD
         XlFea0BWvzQ6efSnTWpVKKN3Zq6zdn2stSfvMhSOo1bOW5Oedp3q8+oxroMSBbhoZvwH
         I4sLnFoeAW+dlnKlNdV8Yqm0lWFYgPP0sA69QNnN2n1CRpOSOgysAKqtpEYS5dKP1ex6
         xOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV81Zkbtve2VC5+tznxEiozCCQPU14CsqBDfd/9Siop9lxQbDxc9okLmABSBF4yxjIMNaN5r8NDbD8c@vger.kernel.org, AJvYcCVc1K39w6FHXEJIO52ki1yzADgI8hoa5GVeYmKENhL3ZWGVFa1LFfJgyST7wm+yQqxvF/97pVdT2fSttLOl@vger.kernel.org, AJvYcCWGk9JSTDfAI1lUruIeXaqvnvWNYKaPoiWlDQSlmPJGCc5E9ojfrskx6DNs0A+JI7REk92ATFmkpZO7@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyOXvo99AAwHHd0rKoifkQN9cvjtA5S2L58Bu170cft6B0efU
	pD9qg53A0qhx/HwbgLTEiTIfT+8ZqwYZMMDlRn1VuCI3D9ARTDH1
X-Google-Smtp-Source: AGHT+IEEqRu62KpQRhPXfLbt6VDlSqGvXS4SEhyoRi7eANQzGYsSen3MDKGTeAvoXvpSJFNvO09jJA==
X-Received: by 2002:a2e:9003:0:b0:2f5:806:5d00 with SMTP id 38308e7fff4ca-2f787f3b98bmr48952041fa.32.1726393613881;
        Sun, 15 Sep 2024 02:46:53 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d300851sm4873921fa.47.2024.09.15.02.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 02:46:53 -0700 (PDT)
Date: Sun, 15 Sep 2024 12:46:52 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <ZuatDOocfDumBzE_@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-9-wenst@chromium.org>

Hi,

On 24-09-11 15:27, Chen-Yu Tsai wrote:
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

> diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
> index 541451fbf58d..c5e241163c94 100644
> --- a/include/linux/i2c-of-prober.h
> +++ b/include/linux/i2c-of-prober.h
> @@ -83,6 +83,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   *
>   * The following helpers are provided:
>   * * i2c_of_probe_simple_get_res()
> + * * i2c_of_probe_simple_free_res_early()
>   * * i2c_of_probe_simple_free_res_late()
>   * * i2c_of_probe_simple_enable()
>   * * i2c_of_probe_simple_cleanup()
> @@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
>   * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
>   * @res_node_compatible: Compatible string of device node to retrieve resources from.
>   * @supply_name: Name of regulator supply.
> + * @gpio_name: Name of GPIO.
>   * @post_power_on_delay_ms: Delay in ms after regulators are powered on. Passed to msleep().
> + * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Passed to msleep().
> + * @gpio_high_to_enable: %true if GPIO should be set to electrical high to enable component.
>   */
>  struct i2c_of_probe_simple_opts {
>  	const char *res_node_compatible;
>  	const char *supply_name;
> +	const char *gpio_name;
>  	unsigned int post_power_on_delay_ms;
> +	unsigned int post_reset_deassert_delay_ms;
> +	bool gpio_high_to_enable;

Missing '#include <linux/types.h>', otherwise compiler complains
about unknown bool type, when 'i2c-of-prober.h' included without any
previous includes.

-- 
Best regards,
Andrey Skvortsov

