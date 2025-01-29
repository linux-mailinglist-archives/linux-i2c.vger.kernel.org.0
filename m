Return-Path: <linux-i2c+bounces-9230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E967FA22176
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2025 17:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C0FC3A8ED1
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2025 16:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7841DF968;
	Wed, 29 Jan 2025 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SB19OVvK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1C1D934D;
	Wed, 29 Jan 2025 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167041; cv=none; b=q7IPFJa6eXS42arLmfYhQe38tQBQszZ2gURw/qLYUKldh+57wIH9IZ1tNyacMdFJUSmSo00uIf/iU9VQH+U5bMEIkPGQbBawKU5/iooB16g/4AZTrAmi5EzawLsy5WAyivi2/81GdkpwQOmTNRDbP7NX/OcIE0ZUZLZcu1Gj5Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167041; c=relaxed/simple;
	bh=HuWWgKdPN3rrbj1Q3/2goTakqmU82azqfPkVIj8rcSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQAK2FkW4+mBvwyTJhPs2o+Pku2sAvQsoaMTtzUJK+Z5BhkHFFGEv7SVTucF99Xy9bjjnF1DCaed15wPx+eiWX+LOv5s6LiVoCqipA5REfPHPm5tg4J6QNiqbtS8XAfHie/qj06vW+cAOGNR4I/xaB0YM5sGrR/xCKgpMjmSv44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SB19OVvK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2161eb94cceso85721785ad.2;
        Wed, 29 Jan 2025 08:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738167040; x=1738771840; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7txV3Z4FmkxdJk6rH/CicdGMAJpO3qzgUBCBB4jROs=;
        b=SB19OVvKhWUbwNjzoFUC6K8GkUb+WfAV1BSca9qW6wVfywNDGwAjyaM2kqQwPu1rao
         XrYOEBH9M3OdXOkmun4yoNSNTXA3TUf50DWRP1DauF+pMg9/dw4I2agY7oqbwVV/q4cK
         sFqsTDFTTosiYNIwnA4dJFAiGRTWiu04kkJKeIAyqDlFtSfv/noiL9hJo1ZEGGEZWKMF
         b1BRcUdukY9rtYJPP5PHhKAqTJGgq8qSnDwt1+tamjvMw1nF1QXuDw3I6UJP7gLmyYy9
         P3IH52sdp+sIUpgS/SnzLS7F3C6Z1ei/UXYxhhJ+bJmqOlHK6L1sFB8eyPBP/vJGvik2
         3CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167040; x=1738771840;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e7txV3Z4FmkxdJk6rH/CicdGMAJpO3qzgUBCBB4jROs=;
        b=pLY/r9UuP+8eFALQGwtSAoPaFIk3R8Wpt4542qLtfQv+T+mxnQauKCfyIAZ7ipU/dZ
         c+IWoQEClHku9JwYWOe6ARKFSv8GRIfmzjDtN/rzazXYXKKdQUt8jPc39iBa9T0fe6hf
         30dvXqcU6rDO40ETDXxsSEpyPxe9SmWzIWV1ZgUS77a/Ur1kYA5vu8NyhyEU+QcAqXQX
         nZt2oscXOl94FSzljSs7IZe+2WCp7uEKxkgirbLfMXRLo8Q7MPRKC5B2VpjH3FGAyT1C
         thVG4klaMRudVpArkAyGBNcm+g7tQjkuWUpfIxNaAQQpKyiPE2LCtgM6WonOXmCsFsI4
         L46A==
X-Forwarded-Encrypted: i=1; AJvYcCVT4u0Yh/9fdi7fbZneEwxh8qB2OyD5tO+7+pHCTxT2KJXkiMEXjeLobfuXR1fV1p4T+9vAxUQGfIkmMlc=@vger.kernel.org, AJvYcCXBM2i/VusjFKO3Ygm95fuHXhrV8TQJmWf0W4sf/zRdAmYVgneaKbXVamFHwVANXsZMIaTzUWD1Fq/dOria@vger.kernel.org, AJvYcCXQR6xbsjwTETujQo3HJmUV59eaMrCoX+NTE5iWZ91ySAizwZndsGC/XTA8SnwbZMPKBf4TD+2q2NyW@vger.kernel.org, AJvYcCXbRuKPtOfzlIQtG17tFXgtxshUCEOVNbllh6bFKMfjFff705M0g+SdiLy6rJzDDRfZyDqxo5OjZElf@vger.kernel.org, AJvYcCXzsUiP8fCC1EgXC59XzigKNIyJwtDNCUr+8wu1ecNzgOGVkHJG3L8jNWPLYQwZqNYHx6TvU/MSgo0u@vger.kernel.org
X-Gm-Message-State: AOJu0YwqtoP/Ra/o1rJtaezDsFPVIDWVHnc6tIwEqtWcUi4448b5Twk9
	szjk9duPNv6MoFOZpepqt/ln9TRo0ONszuYwKy9bCo9bgvIeX4+b
X-Gm-Gg: ASbGnctE7i0+vrvXcUgtFT6V/2jdHAh0eq+88owIJzVk1531AZ0XNE2bVcko/K+fods
	fhPCN6uKtn/TSQxv40lryoAExwb5gvP21R/SWYYzh+wewbt1wsH+yr/mrvqzACaS9XV38AGyHBZ
	CU4giGlJlJsV6uW7KUUpqlO2ttKlNLZB559MdO8QELQJ/flf+WKF7ZW0tUkaLSkSONI/BqhHPrQ
	umITJSTKbK1JBeybnnP5SJWFLhP+nr1wowel/g+HZX5PEnVyWZJBoxM6BV+AkXbvmjl77eLH4x/
	Vhu16OzQgajginLYAP/fWudYdbBO
X-Google-Smtp-Source: AGHT+IG0gETrZQe12EVu2mQr6aQqA/o8vYzdSso4/hdZUmrMFuDIX2TmAUYyW5P/BpL0HLYO5T9bNA==
X-Received: by 2002:a05:6a21:3284:b0:1e8:bd15:6845 with SMTP id adf61e73a8af0-1ed7a5a50eamr5646950637.1.1738167039570;
        Wed, 29 Jan 2025 08:10:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac48fe53bddsm10262564a12.25.2025.01.29.08.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:10:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jan 2025 08:10:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/ltc2978) add support for ltm4673
Message-ID: <31a7f865-b9c4-430b-9bb6-80b4a11ad112@roeck-us.net>
References: <20250124-ltm4673-v1-0-a2c6aa37c903@analog.com>
 <20250124-ltm4673-v1-2-a2c6aa37c903@analog.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250124-ltm4673-v1-2-a2c6aa37c903@analog.com>

On Fri, Jan 24, 2025 at 11:23:06PM +0800, Cedric Encarnacion wrote:
> Add support for LTM4673. The LTM4673 is a quad output, dual 12A and dual
> 5A, switching mode DC/DC step-down μModule regulator integrated with
> 4-channel power system manager.
> 
> This adds only the chip id, the checks for the manufacturer special id,
> and the relevant attributes for the device's pmbus_driver_info.
> The device does not support clear peaks.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

Thanks,
Guenter

