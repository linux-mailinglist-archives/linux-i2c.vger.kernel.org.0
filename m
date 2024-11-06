Return-Path: <linux-i2c+bounces-7847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEDD9BF2B7
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 17:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24A8AB25F01
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 16:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723CA205AB7;
	Wed,  6 Nov 2024 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWX8h2xO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AE31DE8AE;
	Wed,  6 Nov 2024 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909124; cv=none; b=rLSnmxsr74hiCzJfpFj5MuLX4/LJTU5VmP7DBZZqhb0EXX4zPvm7XzgEk0pmJMODhjSnbrlhA19AkQhqgQcixJpHs0w9TWjGuvo1ySN/2LtGjsLFB6+scomqB1os0dpKD3ZbYOgxTljWt1w1MCoUBiAySMOmMGVgaO2QsAwyZLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909124; c=relaxed/simple;
	bh=SuGuSheuI08iICd2YRupGe9J6gSR7uvopUoPsQ79pvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZLrhCxulH65KEFGwx/Z/q6b4Qcv2Gqh/gcejk+lhI+6QFfJyaer0onOGcoSIqe02bPj2ePYvZLPVSgaaMmWUKBkU7ZPqHs1dgS0VVbbfW2+CzlOUNVuxBUMKCcU+pklJM2ZBfGNlj/kzLzyTXg4n0KLHlqEM6t3ZbjNhiQB3f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWX8h2xO; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso5427027b3a.3;
        Wed, 06 Nov 2024 08:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730909122; x=1731513922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9hh0Dyre/6OcliMKrPmVWCYWdORO1fnrFHP9Hk2a5A=;
        b=WWX8h2xOjxSDu9T4nkM8iHs7Aldjltc6QdpEA0jq1WEZDv5mGOtV+d1WkDsbCVxtEq
         fqsFNep5XuSCPtaTVYWFKixXT4+4IHW4tuA/Iv4NwAXy82wr0bpKkfcOGlJyirWP2R+P
         w7evmIEJ3Q+8W4cgpmg/fEwqTeUHBB4a0sGEWd5IH171pdc6mXnoElOUDj1ZE4bCHmlP
         nJuDgnoAHDz/xJqkbv65DKYGEy/fpgVO39iS++PX1t1kdPmPHse/YDsxpCu21tTkqsXJ
         yUbr3ELZRk1mlYZJIS3mFSqsNQLJO9iNQ27vA4hG2P3DcIT08EXi3m1wBpqJH80EAhvX
         Ty4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730909122; x=1731513922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9hh0Dyre/6OcliMKrPmVWCYWdORO1fnrFHP9Hk2a5A=;
        b=Ybu1qZ98K94kvOIS1T2P2/zNzOzGQGVQJX35QBC0U/yY5pziK9tWJWdCwGIoBOo9ag
         vcwQd9vF0Tp2WpUgd2n1xeVNJY8rFFJUYOBXBju5rnY7X5DqRTc8RU4hB7/b1+WVYhx+
         ljJts8jpaMWpzsv97Ez6HUj5cWZPYSwwPlIJn3b1o9slwVFBlH3z0AD6KY3A8tNJcsEA
         Vs+qDf452uFyK6TJYYRJB7iNJzLBp9wdDs32RzOBhWuvOfcfB74HLj1GADdjOChPnjr1
         zY2qqaIRK9MVMwOfH8jrcp+7tPvlfhpXvvjhmgwzy90ZVVFTYsNrCPTq9OdfHv/E3TPM
         RJUw==
X-Forwarded-Encrypted: i=1; AJvYcCUhyqM3A0j3PyXeaMrY0N4D/XtqUDMeavWuk9DFkocxYSy0ZlMM5Zjcnme5D+11TV4bz9D6w44+6SBH@vger.kernel.org, AJvYcCVXC7cshCNT5jASooJ2Fce1A1AeCDDGPMcqyPsKI/E9F8CseNvIq20YNBLtO5jUxred03zwohRTiGgg@vger.kernel.org, AJvYcCWiNgY6HPpiSBPkDhIUYpbRXauyUtSaQNC2DgQsRXycjAQtJhe4yEftx/Yfz+heGJstn9DszwJoIX/4Popq@vger.kernel.org, AJvYcCX+bUVxPukM6aZWnX3nfKHPKxkp0h+9tT6vDdElNwA+DPakZFboUjkGEwDyFduZ5fpdQs7LWKAM5nFlukU=@vger.kernel.org, AJvYcCXQ12hFvrbXYZQcsCogkbeQIx2mJDdTktt1caHet9DghSwZWDYVwNkgkM2zG0R4h5kW4yIXYFNxHxI4@vger.kernel.org
X-Gm-Message-State: AOJu0YwUr5nNp0rSFC8FL9ZbNgYDjccLrsiK7mZzNqJ1XCJkGDeMUvgb
	2vk10yoRWIfQCIbN0ps4omrOaeMeXpzFOz3JfgukdxOlbvvgKB7E
X-Google-Smtp-Source: AGHT+IF1jct8OyG/Z5cfXNHGMCNw7qbVenSFYhbxJkZEVBq3kbHXTrvCB9AijCFQ6arovvx4YJyoLA==
X-Received: by 2002:a05:6a00:cc9:b0:71e:6eb:786e with SMTP id d2e1a72fcca58-720c990b6ccmr27962762b3a.13.1730909122058;
        Wed, 06 Nov 2024 08:05:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ba033sm11801376b3a.34.2024.11.06.08.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 08:05:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 6 Nov 2024 08:05:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 6/7] dt-bindings: hwmon: pmbus: add ti tps25990 support
Message-ID: <d083ef2b-28b8-4fdd-b023-096a0ce7ee4f@roeck-us.net>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
 <20241105-tps25990-v4-6-0e312ac70b62@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-tps25990-v4-6-0e312ac70b62@baylibre.com>

On Tue, Nov 05, 2024 at 06:58:43PM +0100, Jerome Brunet wrote:
> Add DT binding for the Texas Instruments TPS25990 eFuse
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied.

Thanks,
Guenter

