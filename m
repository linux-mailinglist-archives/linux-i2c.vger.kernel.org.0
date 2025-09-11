Return-Path: <linux-i2c+bounces-12870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A22DB5337D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EB2E1CC0FBB
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADE5324B38;
	Thu, 11 Sep 2025 13:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="c8jmXGwL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCCC31D722
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596772; cv=none; b=Hprj5JLpia1rP0TQDNC0q/rau3XyvGepdcEKr343YMxChRxU/Ev0AoVHFzmFu82JsxlUJIa3z4GRV7uAzsFZ1oRyrAsW+woezt6Ifq95SvVVQwO3tqqayJuTBcC/FFMpAwE/hyrmveXExpfdOCO4B7CoHYRlmrvNQf9GybXApCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596772; c=relaxed/simple;
	bh=0bqSOryJEQ/X3+/vSnEr3yI4I9N6P79OuHfoWbsAg2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fjXMf/RwmqJdiD0QChuESFIPqKU/qwmmGmDmCxPAqK1veaYTyTKcEFVCSL0IsNuqUQg3Yb/VJXLI2siXfrOq7jxE6hA/N81wgpixSR2K2qgrX0U8tw4XD93Xusms+D00q/J7JwMDS9tjcCQpQxcZuWsLOV7pyzmKxVzGdESMDXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=c8jmXGwL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so3920665e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757596768; x=1758201568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoTjGjEf5o3PoFa4Kwu5lnAnxIVCW5Ws6ti5lef2kWA=;
        b=c8jmXGwL0xzs8zb1abu5BzxzKey4ymBXTIgFJY6lILtF7HJoSnsCppAwVXMQzT1Rgf
         q5h+RWO7Js5D5A00RsievlHEpipbAxWilWlz2EwZjwvlmNUzd4fTYgHfLZN1dirubq4T
         s29hz5+7yMIWoFkZ1ODYKMTvXdzzxP5xZTwMCFEjl2Axguux2v/t/Xaql41wm9e7blvh
         XyGIWXvWtmP1rHuc3eJ44TF7YT89LLPJy2l/BOiDdrcJBRtpsiDF5gQOLOgUNQ6q2lcT
         HPTz57/oWzzwG1sAhtm6ZV5mMYVg0Vyk1yFu199Gkkc51wnrc5ZDvwsUI5lAbLruS8wJ
         luow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757596768; x=1758201568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoTjGjEf5o3PoFa4Kwu5lnAnxIVCW5Ws6ti5lef2kWA=;
        b=WgCGN51W7fX7OWhkv/1KFzBT++Nz148jGW+HeILNcmNQqNCmW989bYWD19bcbTVBUE
         ls2wkR6AaudZPbaMBvSy5SEfhUxUwH3tmBkNtsqGZgZWt01g9dk/tQ+Uw2z5paXFatB5
         +OEXR0Mwau8W/xaVK0cza5uIamqNkqmV73wLKwum26M5KRAt5ExOokQdol7T9sigf2/U
         SaZKl+TXrEf4kOT6IEv3A9ayq28tfj8vO0JuiNq7Glk/gZnnmxdmYiNrHcCbmQS3WPjn
         VxqUlJbz573SYxKzxaSUcnAlqSlkpPzgwIbK+HnjJ+bpFudDdX938E34YBPtqVwNS0e5
         2J2w==
X-Forwarded-Encrypted: i=1; AJvYcCUxnxXVGNayES5EhAqPjlA5Fq/WUw1jqzm7ueZLBelT2LhuU5PrloQdN45FpsP6Gz7wsI0Jg1B0Euw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc2+x67l9KDg3sh5v8icKsZagPO6LBp8XtRTGsvBc/61QKPYiz
	qX2bwDcR1PArcDc2fefJT/cQ+B6jE3ubbDjTstt/0+i3dA6qfAKXS6u7jkRcChLxuA8=
X-Gm-Gg: ASbGncuSHEIjoev0JxOe8IEUapgIBboB0Sa0LXiDXPNRZFfmvtE9jWnzTDIE6AbXDje
	MYfrfacuLcwuWJi4KRujbNqwljP+Ne1z4NRyjJ/nZIdGS82063lns+QE3wcdWkJ8HXv2B7pZ9le
	MT1nJHdh9Xdq1mVVw2pfF/3XJDrExseBEBPeUKoo+1a74na8FM7BOHP7cblVoXo+odGZQaG+4h7
	gQ3HL8OeN9wAlOZlQPTy4oI3qAKuT4tOFUgHJKD6jRWwH2fqjrFBb2tl8On0w2JOu9y9MXUO+PH
	WS4XmmeXCtO0LFez4/EQm/Ggju7UliDzPDgsnRbj+sUAnHaHmGy3APwJ6MC6kwzqofmWzePSgwK
	PFc5UU2f8PJEoAiEErxFExJY=
X-Google-Smtp-Source: AGHT+IH8nHuk3NSLqjFY2vj/PBH77XKaFOpHdcKlyadMrh/8ELLpleuBiAgM8Qj5GJ3//zqteimh3g==
X-Received: by 2002:a05:6000:2886:b0:3e2:e079:ab32 with SMTP id ffacd0b85a97d-3e642309dc7mr17268671f8f.7.1757596767963;
        Thu, 11 Sep 2025 06:19:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3e84:ca5d:e1de:73b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607870c4sm2483656f8f.22.2025.09.11.06.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:19:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel@oss.qualcomm.com,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Monish Chunara <quic_mchunara@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
	Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 00/14] arm64: dts: qcom: lemans-evk: Extend board support for additional peripherals
Date: Thu, 11 Sep 2025 15:19:25 +0200
Message-ID: <175759676089.37240.12221834042390731955.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 08 Sep 2025 13:49:50 +0530, Wasim Nazir wrote:
> This series extend support for additional peripherals on the Qualcomm
> Lemans EVK board to enhance overall hardware functionality.
> 
> It includes:
>   - New peripherals like:
>     - I2C based devices like GPIO I/O expander and EEPROM.
>     - GPI (Generic Peripheral Interface) DMA controllers and QUPv3 controllers
>       for peripheral communication.
>     - PCIe HW with required regulators and PHYs.
>     - Remoteproc subsystems for supported DSPs.
>     - Iris video codec.
>     - First USB controller in device mode.
>     - SD card support on SDHC v5.
>     - Qca8081 2.5G Ethernet PHY.
>   - Audio change [1] to support capture and playback on I2S.
> 
> [...]

Applied, thanks!

[05/14] dt-bindings: eeprom: at24: Add compatible for Giantec GT24C256C
        https://git.kernel.org/brgl/linux/c/c7ec58c39b0252e6635dde55e5c708132ab25cfc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

