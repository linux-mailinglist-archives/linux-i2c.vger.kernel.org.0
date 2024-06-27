Return-Path: <linux-i2c+bounces-4397-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9406491A939
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 16:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9688B23742
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 14:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E535195FE6;
	Thu, 27 Jun 2024 14:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/7KwSK6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891001E51D;
	Thu, 27 Jun 2024 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719498655; cv=none; b=AEbXFApiXTQ9SgT+i2GleALz31NgmiDnkp5gTLvC0AE9j+tGSXYlM5+hT0Hxr9CTNbY6hHoV11ZTQmV55ZgfcmQ67GFhyjXF8CydF34ZkZ9nD7N8pBgKBuaFwb31Es3sMBfU2DK+ki+pA25KG2/iBHYJmTNwMRC66lBUdr1DlpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719498655; c=relaxed/simple;
	bh=KIobNT3FVqIbEuBkRXfA/d4XzamYSNXUXEShI192cu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pLNRqqX1grUsnWxWzmDIcOFoQtiB1pTmrUySIgWilZThPo+p8RI5hPfO36AvkXV4LBnAauKRHmAYUA5/+RBngtPVaUlZgJPbm4NyWbCbBd3bkbVV3LkNAGSURUlOZfmoQLHvDb2hacubc1rXIq3Nai/3efbOwfXx2SPymAfGTe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/7KwSK6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f9c6e59d34so65055665ad.2;
        Thu, 27 Jun 2024 07:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719498653; x=1720103453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=prOX6eOKEHEmVNHglh0d/kTFjpassowhtDmDJYgcELU=;
        b=Z/7KwSK6O4iyxuNxmTHU2wW0gGPl1P5LE/GnZask6P2i756KLNJWV5MQomG4d6tb3F
         BEyFw+wgFl05KpMBS9dg0iI3E2jIOkV5ZrksDq3/7WDIK2iaFtarWlTf6v5k520uLGpb
         Q+++Gm28YWWw9pJsCPc8qxGz1e8EzkqZjvmbxg2DITDyuwrszo8ApMOnIhLaFWrjq1Is
         TKte98HYWpue4jLBhZIIVk6nPt9Uqb9gPJB4b2X/03MrHXI+jR2L5DRLyraGhbw6yIhA
         aEKENC/nB+DM6p9cRiEEQf/tEjsNALMp6LtB3BzNeSAtDLKk40KG9BW4XnJZpKPdY9K5
         sAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719498653; x=1720103453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prOX6eOKEHEmVNHglh0d/kTFjpassowhtDmDJYgcELU=;
        b=UrdMdZAxGWg1O2ksmshepJRfKz1ZNV6NFPvcenU2p2Mz29SZs+wb1PFcU+zDeY2+ld
         8uUk62ols1LL5wduOEdkuKJWm/YyY3RC6cUDNYbA9pgElG6yNb/ECvOfzN+6HVbUB8xn
         8mnYFK6ndDp9MI8QgK6VINXN/9axx8j9l0pMlGUJbaIupOe4NXSR3FQ3PFze99vi89ld
         eq3EZCnCg2j8QrCBEHaG1ymiBQaThTfMQDRj9o/KgWI4tsVqO67dGqR5GunN/PvzlKRa
         3o59MRyzgEnhMxUzSFc4XVR0aQidee9oTFEoLNYrbyBjbRBiGrfoOUsVA9UdE61xLB6p
         PHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe4Y5Dqa8mlxTiY4n9qpNaS7b611E6ZJJ+DyuOPZzD+lByX3nxRdBJj7MpM9uUX4LonuNyRkaUemMFJI48gpdAgg+mbhk685z4i2GiLHCEYIDQ+2HWc4qw4E8D4z357TM0dO3lbJbe4/V4RwIFWEz4zOQBsy8/KxdCQBoXFcvvNJAYeK2fpAHIDI464Mn/nDyQvQTCz0Vv2uvF7CyFUlo=
X-Gm-Message-State: AOJu0Yy3gfKqzadEL6G5mOByQblazDzunmJJdyjBxLY+LPiaOk58R+SZ
	7ooaZdTi4oz9N31DEmDJMKxBrpLeQ5VbL3RSZzgXJAck23K9HHSt
X-Google-Smtp-Source: AGHT+IGb6LRH5tSL0zxSz7eX5YcdjjvCFbgea762hMw2TlPtap0H5lu0zMnM2ToKTYoB42SKt9dD+Q==
X-Received: by 2002:a17:903:22c6:b0:1f6:f814:d542 with SMTP id d9443c01a7336-1fa1d6acf16mr156972075ad.68.1719498652545;
        Thu, 27 Jun 2024 07:30:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac995113sm13885535ad.188.2024.06.27.07.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 07:30:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d788697e-dad5-46b9-b61a-1016c55c4e83@roeck-us.net>
Date: Thu, 27 Jun 2024 07:30:48 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add MPS MP5920 Host-Swap controller
To: Alex Vdovydchenko <keromvp@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Anderson <sean.anderson@linux.dev>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org, Alex Vdovydchenko <xzeol@yahoo.com>
References: <20240627090113.391730-1-xzeol@yahoo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240627090113.391730-1-xzeol@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/24 02:01, Alex Vdovydchenko wrote:
> This series of patches adds the MP5920 Host-swap controller, which is used
> as a protection and control IC for devices that are being inserted into a live
> backplane. MP5920 acts as a voltage regulator (MP5911 etc) supervisor. IC
> utilizes pmbus and provides monitoring, statistics and limits to electrical and
> thermal characteristics such as:
> - input and output voltage
> - output current
> - output power
> - IC temperature
> 
> One must take into account the nonlinear character of readings, so there will be
> a statistical error in the range 5–10 percents, depending on current passing
> through. In order to use the IC, make sure to specify a valid I2C address
> (consult to datasheet and dts-bindings)
> MP5920 datasheet: https://www.monolithicpower.com/en/mp5920.html
> 
> Changes in v2:
>    -  fixed typos

... and ignored all other feedback without explaining the reasons.

I am not even going to review this version.

Guenter


