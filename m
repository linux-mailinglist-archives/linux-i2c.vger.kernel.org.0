Return-Path: <linux-i2c+bounces-3991-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2830905808
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 18:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5E171C2313F
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 16:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B4F181D09;
	Wed, 12 Jun 2024 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdQPz8yy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C89217DE2B;
	Wed, 12 Jun 2024 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208038; cv=none; b=ADyX3EEWUlq+i7/iu74uteX9SNwoWoVV9NVDEg1l1fmVdEKBqa16YYbvS4AA0U9QKHaZz/+zwx2Kznrx6vuCiLzm40gq9Rxx2zu+dPIkVCPhaL5DZVaD8VEaE/4AtHNEnblJgtm164XekZiimwO6OusMqjDr+MAiPNpZt6gCzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208038; c=relaxed/simple;
	bh=V7eXJ+J39yQHmJxnsiVwsBgDCrLIjD5xMG6UMy7OBR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGJombHXbZjNXQrPNNjG6MoAfxRlX2J6lnOMGYSotC9IA+jeh0A2VxkvA3gjcJkQn7Kegp9Uws4IHnl7eFwhgjnRPDPVSNGzNDgQvwTA7z8qq1oy4b3Mtg5A67AkxrwUpCQSdQo5sNCqyT26iXHDiAZmg3AjVoQRjax8MYo5X2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdQPz8yy; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2c3274d5cc7so2443982a91.0;
        Wed, 12 Jun 2024 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718208037; x=1718812837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rt/WOHHj6QuLrbLVOFgwT/LIoUUamcZv2+0KcZkXCHs=;
        b=FdQPz8yyJhl9dBczNDJG1RG9cEsgjyQL+RUuuX57dwdiCw4leiZbiMn2qO+cB7wOWx
         3iNHl+lCloLI5wI6z3asFeNX23y0efnSehd2kdrTa9ZVcPwkzyfoo10izkoyAJlcKOCR
         1ndLNPVeigJC3iRbPGrs0QepdDBIBDg23HS/XqpSMa0TcHrXIYYELAhYohVnmiSbynQP
         4VuvJyVzAGvFNQGBlbDw/6BdVbPLcudJxLWprbmn8vdhKiNu7++ToGof0m97KK6mWoVO
         M4TZO1KCwCqzPuB1hhTiKn5ZGo9d1VhcOV+NFCo744Vp4Wgny+8VqaEEqiCVLAiVLF+N
         pOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208037; x=1718812837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rt/WOHHj6QuLrbLVOFgwT/LIoUUamcZv2+0KcZkXCHs=;
        b=gfy8tdPKiVLdjzsgjFyGTb4k1R12VMwQ0UyEHDivZaa5oxj096OdztSuknCqEH9qSp
         btqEU3pO1oBAi+PTba56KwqrlaoGjWvJxUvpsJ40IS8+xI6vl8NGNUfuNVm+qRHrRsJ+
         rP7Oi34zEC2IQFV8zR5m0EDARF8/EKevplnpq4rg88tjIFB7XZDiECSU/bTRx2E8tKuA
         vOVrClZVxiei4QrUmOO5s7thnm2J0HJYiD/SjHvj+SOQRADzMtLMUauFQxWtn7q8rlIE
         A6to6jjuGd4ZRR57PkQQ2Fkp75pRvb4P/7nPOfa3djazY0PAz1Yp4H87pocxbojetUQa
         bzeA==
X-Forwarded-Encrypted: i=1; AJvYcCVgy937AITjs3FqeyIwwsNLMoWObGUK8Ku6xSx4yxpCr0gR/pnVKDbAdT7Aw/oqPbSLViwszJvbpdQw88IBCGkpoqLd60OGZWNqF5gmEma3oxMpdv1qQDzJYFRIRsRTx9lVcS9mSpZB2TK4CFYG00LOGWVG62iKafeQKqRGeI9bj/5yW+wZH6F/y+6IdX0v3E6bjXs9dCz7E1fJmw3LUFyavJw2HLfO0byQ8W/iKuqFDS8wUS+bSmHIivm0
X-Gm-Message-State: AOJu0YwuQKtwC8/Kinj+qrElSa00Y+u8xvmXu/8ZJUobPBfCJyQ0ws0L
	wHl0fu5+QK4p44y6y9A1q8RDnckzY9tHXU6WB1c/ytGDtgT48Sca
X-Google-Smtp-Source: AGHT+IHGnwYZXLySZRh2XtNwCdHNuSI7C0Cj+L3UZn3AofKM7AF1eg89C9ZtFtleZsANtvBkzjhpyQ==
X-Received: by 2002:a17:90a:cc05:b0:2c1:a9e1:c7a0 with SMTP id 98e67ed59e1d1-2c4a761b85dmr2328664a91.4.1718208035121;
        Wed, 12 Jun 2024 09:00:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a75cdf99sm1949109a91.6.2024.06.12.09.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:00:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Jun 2024 09:00:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com,
	peteryin.openbmc@gmail.com, javier.carrasco.cruz@gmail.com,
	patrick.rudolph@9elements.com, bhelgaas@google.com, lukas@wunner.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon: Add MPS mp9941
Message-ID: <07188f66-15c5-4460-a1a8-d1a1acff6e74@roeck-us.net>
References: <SEYPR04MB6482721F71C0527767A149DEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
 <20240611101417.76911-1-noahwang.wang@outlook.com>
 <SEYPR04MB6482612BBD0421F5428092AEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR04MB6482612BBD0421F5428092AEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>

On Tue, Jun 11, 2024 at 06:14:16PM +0800, Noah Wang wrote:
> Add support for MPS mp9941 controller
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>

Applied.

Thanks,
Guenter

