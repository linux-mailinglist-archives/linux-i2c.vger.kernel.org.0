Return-Path: <linux-i2c+bounces-12874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5339FB533DC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C42258644C
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDD632CF7E;
	Thu, 11 Sep 2025 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DJJVXlpG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FE6324B25
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597702; cv=none; b=Xhg+El9e/AYKVvlpnBb36r+nacNNNBK+ZcZT1pC24o/1Q+IIqVQ64L0tRBu0M1L9sLimSxzm6Cy383noUAfLwSK6kS1ZIyAllg0QDcxYEf07eTSsMu8P8icYmhzqrmjfJlr06OqfFMk2oqlYBcUuN9CxseZxOjznMhlYnI/LieM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597702; c=relaxed/simple;
	bh=dKD8GMOoG+4Yyag3B2X/sjwh1L9UvQheZXr6rel0Y0I=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7VAzJMMD94wIDrQIObsXm0gDV/uRmmqgPwT4bnH317c6uzl+dWaXA25GhTVlvycnMlQ0/A+1jYeAhejPtLBW2f3LMKFVgUh7gNo3qKYXsJVEvN0BDXOWIuLA/0rQJa5ClGRmvkGQrJhi4PZQOvOuWUkypW3bjMzZheXN9tH8TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DJJVXlpG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f720ffe34so903637e87.1
        for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 06:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757597698; x=1758202498; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuU7uzJ803t+7G/jlS9fqoPlRvJYw9o9k9ZjizAu5JE=;
        b=DJJVXlpGtzC+xDmqltEFTTxXxDcfvZnVnMmnpNhysBeDurHm9H61+W61i/22Hd2FOt
         RSpCHxsw+mv2hrtqsQdwknz47rmGSlI0HHfJDRpF/pBQ9PlQzACqFbkUIVh/BQg1hIPz
         wxfhlCr8jmZom0t2ArdnNBTKvFhG6WyZpFREKxsBByHImUjPVZVmjVgRIIuD2msZ4Nqi
         +Q2vGMMx4DInfzGlDwa+SA3jhK86a9+rlPxSdyhnc84YrH3W5yxUDjzShbxzlaTv/LBf
         qPH83HkrT1M5A0/fONxifhSRHaDcTFNwrDWY0H+4abT1rPTu2qH6mAS0wLeJM2n5K65Q
         RgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597698; x=1758202498;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuU7uzJ803t+7G/jlS9fqoPlRvJYw9o9k9ZjizAu5JE=;
        b=XJPz1puLIZMDuG/wxyEqcMDJ4Eo2ZGCPcIFCAR0gzjF88Yh9H33iXHdo1JZkISx/xu
         xyxSgc0PxfAmoJNFZ5bLA9RrDURA/DMSHq/RcVTesO1QSMUdKUWT+6zaL30QteTg0sZe
         hz39S7q/OhzgCBlfOsFw/TqOBVNblqX+kYuqXUeZFAlcfGqaN8UGIHivlkPqWUkUyxNj
         0MrfBHeelKPAxlrPrWSrfXi9jSEY3drW9gqBDXy3RhOh2awkyaAncTu4Xipzytc5H76A
         P5GjAEk3eowXflHASJKW+k6gSZbHsMB+nNL8t209EeDIM6XDJj8Z8DOYy3gHDBGihTWe
         oFuw==
X-Forwarded-Encrypted: i=1; AJvYcCWRMUMHvkj7mPCK3F0PwfxOlzuj256FKLJRZtgeo7Hqzu6bY5ZSCDbGsHRujyelrqK0SFRJ9xjMPyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgdW0flhwkmrSmOxjHuMUlehaRR/ufmKtFa8DPLqw3NqlJv73B
	HxARxu9O2w4bbUKew1EvN7V6mDX5xYHhYpsWm0jM0Wq+4HfdfSK6QhC3tBZYabSvQUzi5yg9G3l
	kvLZLZnNT6eIzfQZX/T1POfRmdLr/529FV5a14ZpegA==
X-Gm-Gg: ASbGncuE80jIujw+ahwYro3VqBLV6R373Dk2ws/9tqOgDajSjSqWgnOlAwN4S3uXPAO
	WVXmxYCprlDbq/sPRvOG99vyhjvAunFUS/1ke6JJP3Q6xLyXGiKTYfpDikvzg4Cfdi7dim5x5qS
	HXbk1YRI7M51nE4LvVNHS4ZQwu6cKvcPtlKM3dn+AcjK3q0h9aGPg+CZ3iNAJb4ZL7buCQHkVa7
	TLOn2uHZF94SIsxH6VM9/IGgpVlEIuWoMqxEUzVm03lqa7SYA==
X-Google-Smtp-Source: AGHT+IGZyVuFS0SWwhsW0GkXG7C2O7hdvLrhWa2ouKXjUmaKEWGKB5rOyUWCPW4ZDky63sjUjVaIfTVqhhGY31to38o=
X-Received: by 2002:a05:6512:3b13:b0:560:87c4:e0ed with SMTP id
 2adb3069b0e04-56d789b0dc9mr1285479e87.18.1757597697646; Thu, 11 Sep 2025
 06:34:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 08:34:54 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 08:34:54 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250908-lemans-evk-bu-v4-6-5c319c696a7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com> <20250908-lemans-evk-bu-v4-6-5c319c696a7d@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 08:34:54 -0500
X-Gm-Features: Ac12FXwwEtmXKsTJF1Zy2OvzYXGdM0No2024s7j2f5LD4-m8j7oBYTl11y-yDd8
Message-ID: <CAMRc=MegZ4Xe8zc0U=ruACUMA4KpP=aw6jrKCN+=KRfUKTuLkA@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] arm64: dts: qcom: lemans-evk: Add EEPROM and
 nvmem layout
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sep 2025 10:19:56 +0200, Wasim Nazir
<wasim.nazir@oss.qualcomm.com> said:
> From: Monish Chunara <quic_mchunara@quicinc.com>
>
> Integrate the GT24C256C EEPROM via I2C to enable access to
> board-specific non-volatile data.
>
> Also, define an nvmem-layout to expose structured regions within the
> EEPROM, allowing consumers to retrieve configuration data such as
> Ethernet MAC addresses via the nvmem subsystem.
>
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

