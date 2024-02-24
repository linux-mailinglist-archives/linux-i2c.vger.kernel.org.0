Return-Path: <linux-i2c+bounces-1963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65301862650
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 18:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EBC81C214C4
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 17:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB1C47A6A;
	Sat, 24 Feb 2024 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRChGv6D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3AB3E493;
	Sat, 24 Feb 2024 17:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708795691; cv=none; b=F0DfIt656o1RuJJSFUjuhyNvYUJ230Rn6mqYh9pCXFzNcX4sLu0Cs+MbIvHL5oyx4rm77jFCf/eRTouWPyo2SPxvEdlOQ8dFxjOVQzp8kvvtkWYBTgs02R25QIda92So5xGovBdOZi8yadQZPzEVLzkuT6Fvd0V426iqXdtYkaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708795691; c=relaxed/simple;
	bh=lZLFoN2o/7Bh5V2P/MDZ6DXG/68LWwm2sR0wXwBlbDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3E2mA6ABkDa4hNZ3nM4k+ZKryJrqZj3e8peisK9X8GEkDAdp52q+uYjh/u4DrON09CuScUPGORrWRF5kpVfSmPFnmfzWmU8HwBAHRweJ6KEQ4s5w8Z7Jby1riKTTIKCI88DqOtHaGhYUkG9IObF0pvuviPlhksOUdxsGpoQ6gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRChGv6D; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so1633887b3a.1;
        Sat, 24 Feb 2024 09:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708795689; x=1709400489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBTVttVDeRWNKwSDXEonmoNtCTsLj/ECLXtjLB5/OKM=;
        b=KRChGv6DB+x9hNVfCfCvizEGULXOLhysHB/IFlaGysm8pIJNlM8Xg9F5eBqtPLOCvW
         1nRGrwy5hxBW/LYeHf0LnX0K++UM7+7P/ma2KYA5hQ8OuCy0/rQMZootxQdzqACLEGxR
         rolFHFQ3E8S6fumeFdsGyjInVr8CPhBpCd/LVrCHqb/bnZpeOzVgkob/QIEDPUkDMnsn
         8slQwsyEiC1XTCGHQ1+tNk2rwBf5Mnjjh0Bgi4cZzhwRk55SMjnsZa1SlnFQ8pFvJwFB
         sfir0tIAx/BkPvyh6js9/L0J0rWS5f39yxpCw155fROej+HsmiXIxZOYfTyy7JlspUMw
         8MJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708795689; x=1709400489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBTVttVDeRWNKwSDXEonmoNtCTsLj/ECLXtjLB5/OKM=;
        b=m+yPK8Frg7xGvJY0MUY5UEkViCA+debDG0sNE7COqZ8VkYmVV6x/R+DYTo3Vx92pHW
         hsimKTqgaInKHu+f99WLFZOO/tmz0RCG9+3F13WNAHxwurXmXpj7HusekQtEPnzFD9IR
         UUEsyNRHZ77OFeKlT9jJzxEg5YhdNwhH3/3DgREh+3Y//Uqt7J0foIYmWqV+/i74diyi
         wAX+w6ynReC43CbQYOG5ojJdto5iDZtlYlL5UKY14viWSrNh/sBn0Ho2cDHV6nHwQjHR
         3BlEqB7enEJIxJffZujR5ltZzBEqBv1d41eZZSnI0o0iKd/UXcgjA67T0jcxAy0W0te3
         mUYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSPy6m5F7Jgbjz5D2XLrZx2NreMwQ0FVbU0t1r/aAjuTUaf7sZHFvQ7krAEn4/3RJ1Aoa6+z+msgmKVgiYfkvtbw44NwQ2xVYSteFvei5k6suNZiS72gHGYd7W4Hs4NNNwGzHkwSLyLY12BdF/8nJ9Fmn6Y/4S2IU0XDNKbMnxpB2CBlc+JU/DvMwdfWGMETHNtqoIqCy2X3pjKjOIwYMq
X-Gm-Message-State: AOJu0YyvtZnFdusxwEBN6gDeeeUp6hTxnJwJDqr+Hs4uuL6q9p5wo75t
	9CP0AcaqPl02pG/IDzJw2eJArp6r8lWidHsrGVEvmFdH7sGorfcw6GYYdB+w
X-Google-Smtp-Source: AGHT+IH0qYSphUifbMcUGlkzty63pSCh1lZeRlZ/UGkSGkBvcHXyzlTtoVG/f9snsZ+nT7aZVvRShg==
X-Received: by 2002:a05:6a20:d04b:b0:1a0:dfcc:ca95 with SMTP id hv11-20020a056a20d04b00b001a0dfccca95mr3250898pzb.18.1708795688952;
        Sat, 24 Feb 2024 09:28:08 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b10-20020a170902ed0a00b001d91d515dffsm1242719pld.156.2024.02.24.09.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 09:28:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 24 Feb 2024 09:28:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Zev Weiss <zev@bewilderbeest.net>,
	Eric Tremblay <etremblay@distech-controls.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 0/5] dt-bindings: hwmon: common schema
Message-ID: <41d6821c-74a0-4bee-9be1-8ddef729a9fe@roeck-us.net>
References: <20240224-dt-bindings-hwmon-common-v2-0-b446eecf5480@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-dt-bindings-hwmon-common-v2-0-b446eecf5480@linaro.org>

On Sat, Feb 24, 2024 at 11:14:49AM +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Add acks.
> - Patch #1: add also shunt-resistor-micro-ohms.
> - New patches #3, #4 and #5.
> - Link to v1: https://lore.kernel.org/r/20240216-dt-bindings-hwmon-common-v1-0-3c2c24ff1260@linaro.org
> 
> All device bindings could soon get a label like:
> https://lore.kernel.org/all/20240215-mbly-i2c-v1-3-19a336e91dca@bootlin.com/
> 

Series applied to hwmon-next.

Thanks,
Guenter

