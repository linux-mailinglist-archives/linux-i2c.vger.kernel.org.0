Return-Path: <linux-i2c+bounces-8601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD09F6989
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 16:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 380387A17F8
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 15:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124731DF27F;
	Wed, 18 Dec 2024 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="escR9EL3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F451B042C;
	Wed, 18 Dec 2024 15:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534574; cv=none; b=sjkAnwr/pRu6q2GV+DyeCG1bNRAf/lEUwj81IAkLv0i4j91e83qOoyTdhqeTCX3cUyI8bu22rTASGXIN4miB3/dNFND6kcsuzOlhyC+v6+XSFNNtkFufIW/g4XkLJgDQ77Goo6SlsvCugjoN5AMacqtSbTVfQf4sq/mwq235WZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534574; c=relaxed/simple;
	bh=ydy5HU4CGoMJt1uvr2m9ZF+Vo35d2rFYwpjhIV68zvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zm40qElt17b03OGQEWn0wyeYKadFODUvLvif3rq/BEbOUjUVx3yoJIekUT9lzcN7ZsK3UxOg8Qd1U1/Cs23f4rTWICby+E174zalRwVJ+lYr7psLG2kqip//BIqlfVt++XcEt/4CgW0s1w/mjBqaahWNLr8hmA3o5vkojVj4F4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=escR9EL3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21675fd60feso69247515ad.2;
        Wed, 18 Dec 2024 07:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534572; x=1735139372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mDeikeFSe+F1f6WRvocmJwWKAt2yrKKW2tQ+SDhd5c=;
        b=escR9EL3IYyOmNxlPFl3xglOY1xA9nY43KXcus+WzBnSgnDzAZiUDpyGB65cScwyyA
         UwRCUsucLNbtif6sP6Ebf+GN/OFuhW6XlAP7KX2q2R6AVa31f8H9gDrMlFSlYz1SqTUI
         LExtniuePzyB331Eq5zWQc2rhIG96RR7FUOSJZdLhtKF9Ok5ctzdcis8mIVnXW2hrHev
         V8XZoK1eABu6gsHkFhJPvsKC/SG0VRYWeXRHp9KrXfJUcjBZfM1+PQZdSdCanjyo/krB
         hmZlfKyTmn1SYjphDkqEecy0/RskbDHkQVuYeN0HilcNZIFQdDZkI1aJOxZT2uEzv5p+
         FWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534572; x=1735139372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mDeikeFSe+F1f6WRvocmJwWKAt2yrKKW2tQ+SDhd5c=;
        b=P3ST2gnKOdc2iHHbat3R46E/ISeIbSmniyQbXOrRm/2EQ9GiwF8Cnl2Pv9Zuqxvdba
         7Z97l5ztT+jtn390DDETkG/M6G2n3YQ87zL3WaWnfB8U4gZuZdwvTB95etAc/XDPeGlV
         yOqPZXLRUmwRq/uw4bN8izcUQUxKZ6uIhIf+/HaespoTnHh+uyKV/ya9Rv456oBTGPRA
         QxgDcXfON/GfijSkSTRms+PckLC8IXfyUP8utJoGEGgP+zjK+1aDDHInmYP/xII+jxxP
         ArSXMLq21uo1zjo2cr3G/SG/Kg+oUgwOPOZmWxiyCFD9axSz1E2xHq+t/WnWYP7m/RNJ
         qEOg==
X-Forwarded-Encrypted: i=1; AJvYcCU3lsJ6/IQ5kqQBI/in7d9BebTOGsn66pyZHBUOthqKWt0n6Y/FaROVropcAYvSlxIVrAWiCYceQTZU@vger.kernel.org, AJvYcCW5K5gJ/7vPsvyN6eloejm1AMPgo4BdA/Fuf7Qe8nliS0GhvbaGNDltKyztlkbv/qJeMqsbz91dgrVhTRqG@vger.kernel.org, AJvYcCW5hvJyPYIEvA0p2ZfNbY6t14MAqP7W3gG3QAWm3bUFFG4nLKKfg7O3UOJzWnkkveDBvXOTXpptNGDxSTY=@vger.kernel.org, AJvYcCXV7SPfIYQQzOnfAkyWuPyO0NWrcfp6Nv6FOKkTGiHr+D3pK6cowStA8RHlg73BL25MgHmUuJqQA0Nq@vger.kernel.org, AJvYcCXWmVthIi574gfte5QYPW/dDjN3T3qN2v/dBaMHOLOAOkNCi/uY0BZoEZ1gMoyOHbHmWX98O6CHEhs0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoh5RZu15EKM7biSqNHCXAztt015Hlv0YdXj/xIPnYqc3NMx5H
	Um7/o6ug2dEIJvZEFYFuf3S1Aa7S4ZtNSAgqFA0yr/+4Ti3x1klw
X-Gm-Gg: ASbGncsQLA5XT850OuiXwCVRq1hN6cIIe9Q1rjbyTND/tG/Jqp1KJXEzVhpdB4LSO2R
	gZQEOzzuTRBXrysBRL6gBrNFZgN4ku1ebv+Skm51SQTc/TalEn6nP9KTKZwag3dT8Em3hXg0LAq
	99WN4jErVgtBXpnusyRP8fcvSY48tA19zX9I3BwDKiLaKXi2RxFo4+40fiyZrqYE0FMCC0Tm/QW
	ak0zJh39aZk4qgPZR2uZYGwRhfPlynH6AebcvSCYMF6zIXnLl+4MohphXNOCdKJnM8bXg==
X-Google-Smtp-Source: AGHT+IEewReQwgk+5Ua6YOOIYy2d2/wQCgEBDZk3bKIj2d8jpP3GFkNNyFGtuZW0MM3ArXC6dPDOAw==
X-Received: by 2002:a17:902:f68e:b0:216:4b5a:998b with SMTP id d9443c01a7336-218d7252a1cmr34156515ad.45.1734534572373;
        Wed, 18 Dec 2024 07:09:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e728a8sm75452185ad.280.2024.12.18.07.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:09:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 18 Dec 2024 07:09:30 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
	peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 1/4] hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
Message-ID: <89ff7229-2e86-4d36-9349-50af109b0085@roeck-us.net>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
 <20241217173537.192331-2-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217173537.192331-2-ninad@linux.ibm.com>

On Tue, Dec 17, 2024 at 11:35:32AM -0600, Ninad Palsule wrote:
> Add debugfs file for the PMBUS_REVISION command. This command provides
> information about PMBus protocol revision number.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

I already applied this patch, so there is no need to re-send it.
If it turns out to have a bug, please send an update on top of it.

Thanks,
Guenter

