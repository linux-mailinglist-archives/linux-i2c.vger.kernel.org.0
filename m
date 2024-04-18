Return-Path: <linux-i2c+bounces-3008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 081468A991E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 13:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BDAF1F21C4F
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 11:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CC515EFD8;
	Thu, 18 Apr 2024 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsRpmzMF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EEE15ECE7;
	Thu, 18 Apr 2024 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713441307; cv=none; b=djQHSLHE+5bbskYjvT7AU13DEk6pOLQHr+71Nfl7qT9vr09HDtjx3xethxSqDAF4Vt18w4DMxORlXpEwXq/MYgYgci7BV5lUYS3Yv+RtQT/s3wuNmbg5gRwZsWuXQQaUjLgcFzBAlVPXnvU10FNZWp/SxZX88ps2y5uwywNNETg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713441307; c=relaxed/simple;
	bh=nwsCZ2FN2Cqnl9sETuPAgY8pi31mHoGp8q6cMs4f7aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aJPNvV1a2eM2zsmVKq7m5P+CboPkgDzP3ivw5a10HgNx/co/alC1KcbPlXWxqWgILCYI3ylQGHcd23pe64yDvkIyq36hfSEhRQBI1vS7tatNbQAONIxW9ymjsdjCner3WBL4+6ntFz+I//Ha7SD2LtY5i3tKVB3Ijds0AGar46s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsRpmzMF; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c6fc350ccaso197978b6e.1;
        Thu, 18 Apr 2024 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713441304; x=1714046104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OguDeY70AlTXt9v6PmejPi/uk8wXSgY2DK5KvsrWFU=;
        b=EsRpmzMFIAiHxrubT4I2wI3KDQUlYfMahZR989ekB9hAMUPOpNRo8R4dkptCAiXtTW
         f8W8ho1g2uk0isddl6eAOSDz2UZvNFQlis9VdOIkR11jJmPjdS654ubJUvbvW2cROlNU
         L15IwwKyFcVXeq3YCsHekVNHDZbSh6IZOxqLLEd8TtLal7ZWaYn5pGaHeqyCCaPudYDI
         RAUUObrQiLmy0o32+UosyooMA1HmNuMSDmThlobDWsagk1YmUPNxNkGWgvJLVIg31CiW
         PHXOhf+AxQMsFIowd69VPT2MlXcsBpb702+62tgn1P9hjkhE7gtgrBclVOANR0VAKEZw
         itYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713441304; x=1714046104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OguDeY70AlTXt9v6PmejPi/uk8wXSgY2DK5KvsrWFU=;
        b=a4xMKMaO8FBCGsm5ufOaqqlb0EedA9PO9zU4Yokxs/VsO/BfLc3lICCE0uMIz4+Dt6
         vQss4vX08arP9Fsra+WAtomngd55ANhl08TB90fG7CJQDBQ8318U5aPO9UXObaeb3bxT
         XYa1cDoAlGFTka4vEzsEOHs5/LUSXOdxoc0fX9TDxW8SQswR6YHn+J8F2lB/jZOG92Nk
         +IH5Mf1fq7Ll+I4AuNt+PDSsy9j/gJUkfDLXcuplZEkZ8sEiDsw5e+7LFUPRMJi05SJx
         tRhiOi1ntvLYkS3q+ynsKs7s41o2BiUNe9jYqp8ZxJ+iUbBbgMsfkybYgWBnKTGmd7sV
         xSxA==
X-Forwarded-Encrypted: i=1; AJvYcCXDGPhidqKCGad0KPaNugwlvuJnOmYXDeIg1kntfanr8S9qb7aaAk7kRcavGIZtT3Qsu0zgQuOjzyeapvApg9pJC3iJB+MV3H42a8DTWNc66yrBaJQh229uJW88ppheqtOrs+jPpIDPgffq2XKsIm5vVksEDRNtl/B3EjsWhU7wq0G8wp1FGUEZkNzfGdGbNYAcQ5DOexWTzpn7V8lSgA==
X-Gm-Message-State: AOJu0Yz0k4pz/UbBVwJzVVRiDEMTOYwZy/WDpoc26F2P7lrERjqCFwO0
	awtQVcGfHXGUSDWwFTrLLrNuKfpFasDXQRubjazej51QPTKNm80mNTl9dg==
X-Google-Smtp-Source: AGHT+IHT+hfK54m+5+f/OIe9GoOm1JKFpbKM5/mSCmMUD4TsOWyGkUqNRLHRtxf5j4KI3WtZsBbCYg==
X-Received: by 2002:a05:6808:1820:b0:3c6:942:4dcf with SMTP id bh32-20020a056808182000b003c609424dcfmr3601005oib.37.1713441303699;
        Thu, 18 Apr 2024 04:55:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 16-20020a631350000000b005dcc8a3b26esm1243917pgt.16.2024.04.18.04.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 04:55:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Apr 2024 04:55:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "SanBuenaventura, Jose" <Jose.SanBuenaventura@analog.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Subject: Re: [PATCH 2/2] hwmon: pmbus: adm1275: add adm1281 support
Message-ID: <1221f2fd-758e-4c10-8551-ed571fb1577f@roeck-us.net>
References: <20240417000722.919-1-jose.sanbuenaventura@analog.com>
 <20240417000722.919-3-jose.sanbuenaventura@analog.com>
 <b36db2c0-db31-4304-8e58-aa358ab811c5@roeck-us.net>
 <62f878f4-a4fb-4e3c-8eec-d1be5ba165a4@roeck-us.net>
 <PH0PR03MB66070CAE5E8D99158003D58FEC0E2@PH0PR03MB6607.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR03MB66070CAE5E8D99158003D58FEC0E2@PH0PR03MB6607.namprd03.prod.outlook.com>

On Thu, Apr 18, 2024 at 08:31:42AM +0000, SanBuenaventura, Jose wrote:
> 
> The lines mentioned were added initially because the STATUS_CML read capability
> seems to be only available in the adm1281 and so reading the said register with
> another device shouldn't be permitted.
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Why ? Sure, doing so causes the CML bit to be set, but the PMBus core uses
that method throughout to determine if a command/register is supported.
There are exceptions - some chips react badly if an attempt is made to read
unsupported registers. That is not the case for chips in this series, at
least not for the ones where I have evaluation boards. In such cases,
the chip driver should do nothing and let the PMBus core do its job.

> It seems though that the functionality is redundant and is already handled by 
> the PMBus core and maybe these lines can be removed and CML related errors
> can be checked using the status0 and status0_cml debugfs entries.

This has nothing to do with status0 and status0_cml debugfs entries. The
PMBUs core reads STATUS_CML if the CML status bit is set in the status
byte/word to determine if a command is supported or not. This is as
intended. There is nothing special to be done by a chip driver.

Thanks,
Guenter

