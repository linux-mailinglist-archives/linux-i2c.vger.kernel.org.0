Return-Path: <linux-i2c+bounces-1437-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D798B838B00
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 10:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90A46283E45
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 09:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743A45A10B;
	Tue, 23 Jan 2024 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oXq/KorH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721245A0E6
	for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003701; cv=none; b=sQBlNwQKO+fkJL/ApJd/XB7zKHGtCkbPribzYvBo8VVaVpblyBJOTn3LCimViQPg8V7tgKwuyTounnm4uLlFcAdpRTQT0T28mKqG34nYgNiJaZxygONAK27Mb206c1iagfT5RebvoWkFzRftkXhOGUI19CS8pzV7qkRSEKfCb8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003701; c=relaxed/simple;
	bh=I5rKpbA+8hjyl+3hxQMNJU0Xh+HiF+Fmry3TD/yOkrM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s7kj6nc/w/l+hOX1XOqgsHbO9C65wemqFP4zAZNjCC8RYmGgOkGiEp8zq+WnHNpFMsVNvL4GJrTN4FlIXsdAYBTJ6LC+b/qvu4EKCJo+9RNLMKA+p+2SmlI71VR1k4iJ1jqkWCwxgthqPM/4vh2nV8YuAntXa9tcYOGUJaCkxs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oXq/KorH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so4149880f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 01:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706003697; x=1706608497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoLG5ThaITIuQTuE88TjvpqONTJDsDXluckj8OEjQik=;
        b=oXq/KorHHM5/CNSSmeYFxqb2PRjt1YouxEwR9wbsnaephyPlfVjX3cXQL4YVifgcjy
         fHGcRan1WQ09VC+rnN5vD/eXGYPzjLZ9heWqDSyExGPobKnJUNHfoDwdlkeG2yxjnEiw
         voWtTnKgwOrbSl7li5zJ8uRvdC1s8UkSSzzaDiCigd610pfxhlaa+I6Oj1AE6+GaQ3xP
         mN2tjyRTJAoTndbo9upyNl6EbMt8CiN4uGxTDau+7H6oqyB18punYoLfeBaREsjJyc5/
         aozOiddBBalZZPEGHPtyB2jyfr1cHB+TePD73MzKtgEM8mu1C4rnh/d31pvJ0w2zfrmr
         3ePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003697; x=1706608497;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoLG5ThaITIuQTuE88TjvpqONTJDsDXluckj8OEjQik=;
        b=FmFlN01Pad2ABK+nQSa+N5Xn5XMwTQ3p2oEBZGc2HsVBDuRusgXsVzvzsRvUrj1kiV
         ziDdicN8mXepoFGKsvZXrOpWQ2Qfvzww9MsAWSL02EvO2xBnEC5WEWSJZrNLlnn4QEFl
         g0FKkEibfP812QmgK2zmZSFczQWphBYnbGBHFxgNlvRXMop37cxztuJhYPSZLtAKgMhz
         7H2O+WGZFI7KqZCIAm2zDh/oC7gWsg0xF2PQeXP8IkQ5HF8G7WexJVLngtG2d3xvN20j
         MC2gJsbkV8R/7cKWzEVb8IUvoezyOYu8w+NPUoT+hrMRm2h+IYAcWBBAdN9cSyLgZCJW
         ADOg==
X-Gm-Message-State: AOJu0Yy53heMvblNSy6WZtVgGBrG5PyyvEOs3wbC/6CyhyFOK9FlfiGh
	lE4zt8Z+nMdhau7Gh0WkAdxmyG59m9uLQ/h5XkCchFLAdhzlueT4ulD+Z1UEkVE=
X-Google-Smtp-Source: AGHT+IEJVRwPuxvvel5yUN0Sywt2Dy32RMZMrNDCu21RRIGzZUgJtQEe8wP6icAzi7VcLkDMRPcHrA==
X-Received: by 2002:a05:600c:1d9e:b0:40e:8d2f:bc74 with SMTP id p30-20020a05600c1d9e00b0040e8d2fbc74mr401760wms.89.1706003697818;
        Tue, 23 Jan 2024 01:54:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id l34-20020a05600c1d2200b0040e89ade84bsm21649964wms.4.2024.01.23.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 01:54:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: andi.shyti@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 andre.draszik@linaro.org, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20240119111132.1290455-7-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
 <20240119111132.1290455-7-tudor.ambarus@linaro.org>
Subject: Re: (subset) [PATCH v4 6/8] arm64: dts: exynos: gs101: update USI
 UART to use peric0 clocks
Message-Id: <170600369547.35728.17579224603287095841.b4-ty@linaro.org>
Date: Tue, 23 Jan 2024 10:54:55 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 11:11:30 +0000, Tudor Ambarus wrote:
> Get rid of the dummy clock and start using the cmu_peric0 clocks
> for the usi_uart and serial_0 nodes.
> 
> Tested the serial at 115200, 1000000 and 3000000 baudrates,
> everthing went fine.
> 
> 
> [...]

Applied, thanks!

[6/8] arm64: dts: exynos: gs101: update USI UART to use peric0 clocks
      https://git.kernel.org/krzk/linux/c/3dfbd155b2e397f677f18fd3eccb8691443fb280

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


