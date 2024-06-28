Return-Path: <linux-i2c+bounces-4477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDE891C4CA
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 19:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 256921F23636
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 17:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2861CCCA6;
	Fri, 28 Jun 2024 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bssi4Vb6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BF81CB306;
	Fri, 28 Jun 2024 17:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719595548; cv=none; b=LywiJQ2+L2SQqsroL2OWbrmaZ4jMCTsBXWEs4NSsdFQ28VPD5Nl+b5b0NXt9pOofMY+vgRiuu9I9hP+sDU37ElOyDdMocZdv3H6q0dgfkZZjzeXFFNs3ExVG0nu7xbKwmVgt3ps1FA+HYoISRnC4IoBgf5lWZzVCetcydxTI2HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719595548; c=relaxed/simple;
	bh=Ka1TJNVLbhH+PgynFj/tZxJjME7coKvKnwCbbyM3MrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SK4TwtfvbCibFXf0zGgjbl9HO8roVBQLseNf5Y+9g5+fTOqsjCepTAE7YO/UAKlo2+xZY2b6NVyB78NhS/b5tU04pGyYJGWHjkt6X1uWQm3ITcHt0lkuh6boe59s0D641Hay6EdzPAV7psWwIAdcXMK9uTPpC2uPK5VsTF/4fy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bssi4Vb6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fa2ea1c443so6579105ad.0;
        Fri, 28 Jun 2024 10:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719595546; x=1720200346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXxHt+NjVKoiybQ7NTFTQy5xGBJFko4J6pQhKbbNlUk=;
        b=bssi4Vb6d0R/ndLnoAwGjkuIOaiaV+aHPXgIckzxHwyNPZADSXtoLJF8EDHsJeq8e9
         sKH+mSCUDcF+xEXqaMd5lxN793N3vCIEqy4eFbGMcMRtLv9cC+358Iuz7lyyaHSl0xTn
         GxzAy1VpWHCwXbhyU+get/siRVWeb3Bwpj8PBRmzLB64JqBPlTJx0wVoUnIaHlpB0Qft
         GQMGF4SmH5wruPz7ttRJtSngnVhc7enHlU7jOuhY0sv30wrN50DUXFJHSySoCiA468Zk
         pUDlgYFJjFlq0f2R9RiKra1x8pIgN276mRQ0NXQtkJG6J0jDKZ4fdRtjx3a8Iue9zG9T
         1RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719595546; x=1720200346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXxHt+NjVKoiybQ7NTFTQy5xGBJFko4J6pQhKbbNlUk=;
        b=segaTJu5MLNyqPo6bcPWJZeBOPQuhO7/yNDnxbB9nJYsL3o9aXxFN2mPJ42zPuaBj1
         LpBlRiMvd/DG+KwTKQdHG8JCEUWK/wXLtLoAZ50/O/Mx9PR9NBPY8faeAeOxFJo1aeUo
         CpnziD3fPQBbb5tWALYLpQzVoZAGORyiCpisZtpmYm11ZYI9429kUfjUJiKO99neJZXv
         fz0JrnWpmvMV5LtpkIUrmbk3gVeCJptNzSz6MXUBWs+DwN10aKgkNeUzuPa+HAHmevbC
         kniusy7fJG+XRB16xT0K3cbNODcWgD8uXOvQS7slrJog+m39e46xGPPLs3YzCRmANbGi
         6G1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUniJeeyrMPUADy8TSbtXP3i29ve4n73BNQl/vbVnq7IWTHMR0g3jox549FpGts1S8a76WSwOuAv/ShAt8+trccODgFztxy3qOlZsAm7/S2rjwf1hYu3h2cxMTyzWRd6woWjDjp0t+JjeTLWrCt66cFoAZH9+QDKoWAzK7C0MrYTzG/FTyuBjyUoSi+fHsejUTh6u1QxXZ2DGPDRJaKALoc6dlqR6ZVV1l5A4i33Tu3IgmBh6FCeGc+PadH
X-Gm-Message-State: AOJu0YwSdS6UpgdL1a4EwxEtoHAC7HYIxL3Ixi9kF1eqegs0YFwjVHFG
	PnSJpRsNA8fQOoX4KW75NvIu217ojM54QmYjg+U9+rBQzDLvhClO
X-Google-Smtp-Source: AGHT+IFcasRnsbhhq7yD+4DSD1/IEFOT7vexlWQsQmNhyaHSO6Dm8AlD9UHNt9ec/oCAhgVoY0nX9A==
X-Received: by 2002:a17:902:6f08:b0:1fa:2001:d8f5 with SMTP id d9443c01a7336-1fa23f02bbemr123904115ad.62.1719595546239;
        Fri, 28 Jun 2024 10:25:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11d8cbbsm17943285ad.106.2024.06.28.10.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 10:25:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Jun 2024 10:25:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com,
	peteryin.openbmc@gmail.com, javier.carrasco.cruz@gmail.com,
	patrick.rudolph@9elements.com, bhelgaas@google.com, lukas@wunner.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add MPS mp2891
Message-ID: <b11cca9b-f956-42d1-93f6-505081bd45c8@roeck-us.net>
References: <SEYPR04MB6482EE353C207DA6977C974DFAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>
 <SEYPR04MB6482BC95D1242A5675FF9DAEFAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR04MB6482BC95D1242A5675FF9DAEFAD62@SEYPR04MB6482.apcprd04.prod.outlook.com>

On Wed, Jun 26, 2024 at 05:46:00PM +0800, Noah Wang wrote:
> Add support for MPS mp2891 controller
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>

Applied.

Thanks,
Guenter

