Return-Path: <linux-i2c+bounces-9869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B44A654FC
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 16:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60385188EE55
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 15:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77B72459E0;
	Mon, 17 Mar 2025 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2G8y7K2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642123FC7A;
	Mon, 17 Mar 2025 15:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223930; cv=none; b=I8nH69zP9f2rq2qMhT4b2karANO1GSQMpasbD1ye9+bUqjj/Gpe7841ON1iO2WLuvYA/hZ0t9rBf/d11Nk/pHUhfXAA+k/6A9Q2IVcMYqIJy809Eci0N0ilqoCBISiGH8/ILeB80usFaJiR2hrGQBQ++MrEIM7WcDnYltDPMu+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223930; c=relaxed/simple;
	bh=Yb2rEiiLCMrp1AvW+QcvmBctaAMK/aZmU/So0WMJY9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbWNA5JKzO9Vio03QN8bC7OzVGqXRdUEf3+uU2ETGVjRkmHElTStlc8nfxacuiUqmS1zRBPk3dxbBWyJrosxebP7YDWR5gwZhHx4Z0QAPm0u33DIsUuZNUNTL9+vS4SrC7gMEwVm76dMmdhDA+9mSgeZJs2vvLcsFHXrTPwI7Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2G8y7K2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2239c066347so91932995ad.2;
        Mon, 17 Mar 2025 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742223928; x=1742828728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bkIrTL7TVQbHt2INgK5+tPrCVj4mZD+1zxl667P8yZ8=;
        b=A2G8y7K2xfKyqu4K2CMSVNW0Y497Db0cqIzwqTBPq5u0BzjIEuatpILgPF8dF2n6xA
         +VX8TZwr79G18N5RsBbp47mTtVheNZ8JfajvwKkn4Wf8BpQwPaOtVbi+NuOUxcrxMoki
         CF0I5JNiI2dmjln4sS28i3bCXf087H7t0OwP5PECwks9b7KtCvfB4SETaHvchJdysNsO
         kpdxIcCZiiSx3DZ6ztrlvT/iVQoOD4CUfOzeHd5BVGZc+jOrNAerOSwkfc651xJ1zzHn
         waK+nyo67S7y2dR/bw36LTg6bOz5baIoBjqEBvwaRGQqTZ8hmh5ZsMGMWEvHKBYo8omY
         X9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742223928; x=1742828728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkIrTL7TVQbHt2INgK5+tPrCVj4mZD+1zxl667P8yZ8=;
        b=QTBbPeLbrqopoes+vrVo2ZHNjLTeRCyzEX+91P5PCDI409d7XlcsTA/JpNiEhE7tmk
         9hA7J/Dh3kRgHI50P4IANpBmti+avvgBpvT4oRWBg2DKWz4mKG07Swbb+8BVFxLaX046
         VwCqC+7j2dJsx+Gn3CqgC+34voZQsSJ3ptPKI9k3+NrSvVmUEzzlNgygjccPHDUVrFC+
         pA3DtQPhG4vaHh1h9fWvkKXSs5dOhnOOB0YlNvY5GkaPO7t8IBW52ES+Nn4slUy9ujur
         X0UYNp+V/NlZ53FpxorBPvvYZQ4qZiYa9zTLV6ORHOtaMe5INmNcpcaS82St/IJFhXOi
         HyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEe8IaVOkY3+iM1uzzZKcfIyyXKjI33an5ZxBVOnACb3Xpk855sIERV3mvHfz/Fl8FmqNE8kO1UBNS@vger.kernel.org, AJvYcCVcSqskk3DPm4Ut/SNrWJIU9bEgxwGjcoO258Ob5qerzR/dZinVo0oEv0bGAXqgpz3ch7l2ME/6qfoWxutd@vger.kernel.org, AJvYcCVfoSJpq1QxADc/J4b8WjG9zf95+RiEk7+YQrOrfzA7oag5Vh8WTZNlPNnz0CsnnhrV8F5fkDgRKXCZ@vger.kernel.org, AJvYcCXMaYy1yIcSvNMt/TdCa2PFNVROY2LiNAmXLMDct+OLWrTg6FT1NbIznkj7kWZixijUVlFVGZ58XbeqE6o=@vger.kernel.org, AJvYcCXyRFMkOqK7qg0+NR6At2KLlCDQKx5ZHkcRP/epiJZtQJ+SaRpGnOglKcak7QeJ+AWDYGEOGzmdWTcz@vger.kernel.org
X-Gm-Message-State: AOJu0YzLEZonI71z8THAoHqsQ1WooxD3pO5275YImqBIMTmMR/e1QCJf
	WbTTe39lr35w5Nx9H/rqOyd8f2jWKIoU3wqHDrbtbmiruP+Xevho
X-Gm-Gg: ASbGncs3vwG9w8eJHpzIGEssVMmuEdxvwJKhCGtWtju3JA0u49yrqSWStE1vZqEkqIt
	FsoTfwo+T2OpLen7u86Mx21G7xNoXtjKuz/xsFk+UWTjH3p9LK8ddKMOtIO7bwNZEKE9LgGY668
	/Hsb9qzt3SWEjNjARm4eZ0H0fhyGYKYs0uST37xiqnfkbuB/lJawa0F7x2XPvNvYjE7VX5054r0
	V1tC0H0FiGQ1kRrDpoZoBBLmmB1iwaNygm7JWzqAuPLZetBCzwuY6k/o7fVpHuzy8TRQrKbgqvM
	jT1U5IFK1KuJp/79efiOWbupYhBxDq62P65nZfGvj7XaglWBtrDCWMkbEA==
X-Google-Smtp-Source: AGHT+IGyxNKKtFE4O+xxB83SVTRJD3lGny3wW+HlvIlr6xI+6KGUddtnLki5b6MFt2u4apwGnKOT6g==
X-Received: by 2002:a17:903:283:b0:224:584:6eef with SMTP id d9443c01a7336-225e0af9d34mr175921725ad.41.1742223928358;
        Mon, 17 Mar 2025 08:05:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6888486sm75800075ad.11.2025.03.17.08.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:05:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Mar 2025 08:05:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Cherrence Sarip <cherrence.sarip@analog.com>
Subject: Re: [PATCH 3/3] hwmon: (pmbus/ltc2978) add support for lt717x
Message-ID: <fceea72e-2b11-4a84-82c3-4c1caa5f981b@roeck-us.net>
References: <20250317-hwmon-next-v1-0-da0218c38197@analog.com>
 <20250317-hwmon-next-v1-3-da0218c38197@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-hwmon-next-v1-3-da0218c38197@analog.com>

On Mon, Mar 17, 2025 at 01:02:27PM +0800, Kim Seer Paller wrote:
> Add support for LT7170 and LT7171. The LT7170 and LT7171 are 20 A, 16 V,
> Single- or Dual-Phase, Silent Switcher Step-Down Regulators with Digital
> Power System Management.
> 
> The relevant registers in the LT7170 and LT7171 are similar to those in
> the LTC3887, but with fewer channels. This adds the chip ID and
> identification of ASCII to differentiate between the LT7170 and LT7171.
> These devices support polling for status updates and clearing peak
> values. The data format for voltage, current, and temperature is set to
> IEEE754 for precision and compatibility.
> 
> Co-developed-by: Cherrence Sarip <cherrence.sarip@analog.com>
> Signed-off-by: Cherrence Sarip <cherrence.sarip@analog.com>
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>

Applied.

Thanks,
Guenter

