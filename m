Return-Path: <linux-i2c+bounces-3989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFCC9057F5
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 18:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CFC6289958
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2024 16:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C31186E21;
	Wed, 12 Jun 2024 15:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWIBCf6+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC57181317;
	Wed, 12 Jun 2024 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718207973; cv=none; b=myTOKZyQky4ZJEsW/yHFZkHbsrggNOL22yH4tLNaKqPqcIELZIJ+qqumcogOtDCipBAJqr/c1BDjBgySN7o6vcGTyWFlV00HmKOz4z7yxQsHXMZueZuiTXIHwI/2nEVg24auQ90M/apEiiAEoOAr6QxKFCMOHmNSIhximMq2AV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718207973; c=relaxed/simple;
	bh=oMcGDrE4Mw8QgCqo3A7gqxfHme1uE+j+aY8hmT0NHzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxoWmSR07PEy+6JtTGnmiIaHltxiMFpriA5qR/fzvL7ATtxSpm2XvXCjRIjLmorW5zVaib7t9eaYuI20Y7fI9YqNbh7EYEd963b1WBZQvoNiBOgVwk1DJt7X6jBq7kBnZiLXLZ4BbgYtJFAoWfRMknUtjNdklK8Ugm59iaV4KFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWIBCf6+; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6c53a315c6eso5279656a12.3;
        Wed, 12 Jun 2024 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718207970; x=1718812770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtQXgpv7/Oooaz+G4TiUO97dolMQhKitRb9zDqW9N0A=;
        b=iWIBCf6+2cps6XrbjpgD2pW/xhEiqgVinYF7lffM3ri6KVlWjjC16drK2OjeAo44M3
         8nrdiM/Bs5VmEuH4pwdkbTOewoZ7wA5d47qLw3R/FF9+BoaRJqKQzEKBUEWx86HALBPp
         yi78HExA9/IAs/ZkOyT++3VVdAOjhvvjQNuZ1vXPqtYUnuawX/eCclvOBdWq7Q6ti3LZ
         umxW0CB2/n/Qaq4te9BDClF/dlfC9Z2MZkZzW9UKNq5UvTXpIW4VktWythyIPTD8Nl1O
         zt9dZG9VrhfxARPBKZH4iKVRrJWbQEHO3yStQCZOdpiCL36YevGZ+xr3/7yOrrTjJi3Z
         tjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718207970; x=1718812770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtQXgpv7/Oooaz+G4TiUO97dolMQhKitRb9zDqW9N0A=;
        b=RmsjlohLmjm9kkWXQYEwx2gewplMBzk/VCvILeeRekYhqZwaf/pX4236IlDwaWLks6
         uFv9f21qW8bkVhWafE6KNR3bAqX8GMJbKRKfLu2Wawm+g3qu/vkQsmcDrv/sdlaP0dCj
         qHTtSXZ7+BtgsVBtzmQBYDjiO+wUYqQI0UYsJ+SISfIl4swIR8t7ou6vZEkM1KqNmc+d
         HddAnXBnXp7wInrhRwr9P0QinyBtr8JC4K/pvRlq+kULLXTxjHt9pJ75iA1jX7S4Q/kw
         fmSdkPCpUrMm9AhnRFmTPStLsLfpGTv/TnKnAU9muCp6BShdZW4W1stb9idrh+46KJPZ
         Bhew==
X-Forwarded-Encrypted: i=1; AJvYcCU+aZ/nERaZoeQoaD+vNx+kQRGLDvsuGSmIvv1l2Hmrpmrz7K40okZ8Dz+DvO2HXS1B53vOiVeO3qJjNvDlMjMhKJumx9Kcpy1g+WB36tV8qKKHxuf2ct1ekx1d1bM3Z/9mq1i7ntsc8EOpQkE2zutTl2iJp4AUiclJcNfGbj+Ug5yY3QZ9Qc2ILSF49OH5HbHe8RT0H1GTII3HTdzQJTJ2kOWh2MHyTDcg9QDvBGitB2JpGFD0ipbqhUuN
X-Gm-Message-State: AOJu0Yzp/Pj/zb/8vtDjjKV9fqKpAkWQwsCbLkVT0SphXIhweYJr0kLm
	eJkBvnyKMpN6hLVl2LE7La3pXd4SFpKdlFvONE3TIHAFiGBfcmL9
X-Google-Smtp-Source: AGHT+IHbTM6oooBQgQWM1YhIXDNGXV/+otzNg0UQ5enijvCEmV4lK+FoI9FGnmRQbpPc7Qo2uv63wQ==
X-Received: by 2002:a17:902:e847:b0:1f7:ed3:65cc with SMTP id d9443c01a7336-1f83b5c8336mr26696915ad.27.1718207970516;
        Wed, 12 Jun 2024 08:59:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f84064dadbsm14837475ad.292.2024.06.12.08.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:59:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Jun 2024 08:59:28 -0700
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
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: Add MPS mp2993
Message-ID: <5c1c7d9d-5404-4ce3-8247-ff554c97e521@roeck-us.net>
References: <SEYPR04MB6482721F71C0527767A149DEFAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
 <SEYPR04MB6482EE5CA0C9A3F14863B999FAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR04MB6482EE5CA0C9A3F14863B999FAC72@SEYPR04MB6482.apcprd04.prod.outlook.com>

On Tue, Jun 11, 2024 at 06:14:14PM +0800, Noah Wang wrote:
> Add support for MPS mp2993 controller
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>

Applied.

Thanks,
Guenter

