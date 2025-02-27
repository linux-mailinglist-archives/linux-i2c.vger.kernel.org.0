Return-Path: <linux-i2c+bounces-9631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CBCA48570
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 17:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7AA6173C3E
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 16:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742A31B423E;
	Thu, 27 Feb 2025 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGemtPQv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6BB1A841B;
	Thu, 27 Feb 2025 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673985; cv=none; b=D6PlT0uGrnM2YTd0HUUd6QOpmXd4WcVJ8oNZW+XAuk9iIEgBxmvLMbDJu2d9Xxk8bTZclYqUHgk+HC49M1TmJdQiVC+wQgHfn057vXohCj73B2fVqsxZTHz1GwOnk/GrhVF7rzICG696+HfJZwKGoAdO33+30jXmbIvdI2doBJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673985; c=relaxed/simple;
	bh=htxGHHxhBnqS/PiOOodAxjqduRBO1zsgesj2f6zMYUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asiIWFdOQGEHqW/iF13aID6C1k/6sw9mqe6GaCUARYOU7EdE2NFqR9eltHI4UW6eRIIJF502RJjWxBVhNUeLqUxMWlrdgZohQi5nbeTjUz81G96nj8ckmf74eOecMH1VFE2Wlokj5V7km7Qd5JJ/VYqJx9xUWZeqdeZ3L2fERJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGemtPQv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2234bec7192so31202695ad.2;
        Thu, 27 Feb 2025 08:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740673983; x=1741278783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nwj0laHmdnBpGeTss6hHTN09yzjnmF6JdEEMkifswPE=;
        b=WGemtPQv6x4hHGb+HHO+P2ewjWxT020gARWeO18xI0ZOa4oTS0TTZKgru81ECN2Am+
         UBlTQccuCr/kEkE8VfPUlfLBiLVPUkcyQC9H8fVq8wzJvRZJ26uXBG/sSLUql94PZ4w5
         ta4WKObpHCRbikstN2QZh5z3cqhOKO+ERYjvWtye/E2hr3APaCL5eZ0E7e4m8z5Ss54l
         JQdvvCdyR7DsOLsSWP4D/PeRkAbuP14BNPt6n2u6G3j05RHPF/YJuwJwq7dHHbW5o6sN
         F9lrVLtP9N2TNVLRaga0/zFQlB8MoAi4q3ERVtszZJOU8IANcnvlhSuL09p6docxcTQK
         Ua/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740673983; x=1741278783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nwj0laHmdnBpGeTss6hHTN09yzjnmF6JdEEMkifswPE=;
        b=Jb80ER3tMGWyu4+bqtgpWaTA4ZNKZ0Ovwy+OSIYOQ5UsYJSnaBdh3R9iXNjUKnlDzZ
         sA4Kwte4X/IZRBTIO/JTkq/jDIvE0UZKSY5JPS4IABSoKm8uomkQXvkVaPUEbSjNKEcx
         36Lu6JmemRvJU88Bh8oL0OLYkcH0m0jr2fIUNZ5CfZ6OG4a+6+GIyz/njGmGum0azojg
         aLW71zgeoEkLc1iP/xjSDz8qOa1Scw6NXpRuGm1WSHRjHnIn193Hp4WrKN55CnOsiTW0
         KPxyfE6bm4tn337+qHSzwzhgF7IIbT+HcoMQ9ELxisTIu5PI7J4xPhycQ5iW+HuOvq3Q
         2hCg==
X-Forwarded-Encrypted: i=1; AJvYcCVzEv5hKM5LRa2kA+XOR3S1XfyAa94y/c0p9eK2zyP/G/APRFn6sa2rnclKYZYlLFz8nsGDz76v6F3i@vger.kernel.org, AJvYcCWKXA1zfejB09X8/VfbrnnJ/lxiQS9KETl6yBV74t/2nXGndfGxbwcAcbISFpxwyY8Odk9rWVsuJYW1Nbc=@vger.kernel.org, AJvYcCWRgorViqSEubya2BAQPw5NNeU+qU3iEzXsY+iHx6js9462dEsn6Sdj2iLkt/3KZySv6o/AWNCwhJZPel+T@vger.kernel.org, AJvYcCWrCVDaUYsV/VwAVIR/NFSX8NgC4zCsrBORFD9fBniq0W69d1S3uHvG+2CI4ml14m/o/8/oHTr1dgfi@vger.kernel.org, AJvYcCXswHC2vw6kPaWKamNRlZABicU7EFvXbTc4yevQqSGLqmsnVDmsdPDph9NP85aempkaFxcWQkjTwago@vger.kernel.org
X-Gm-Message-State: AOJu0YwP40mKdSqRpgk6VgDEzVSkHJes0jaDvHzIszXpbs1XlRxUMRvJ
	4fI5CbfqsIitBviKBp/UheNXqQo8pEZUKtvay0m/aQbIuhgY75VI
X-Gm-Gg: ASbGncv/R2WcF1gKHIqdUKwxyrerMmbr/OS88+MDK+/7au6sZ0WbsCDbfbKeo5uW2ab
	pFNYSw3kQSdbrEfSzQjsUBbxkrp2ONO2LrS1QAeQElyH+cNnXYMZmDf61Kh6BrlV30QtgyVQ/uJ
	qSPirCRwOkiUEl2/+56SSt7tb6NA60vA/G+IJc0pCxvfTfB7fVSwvpHwaQSsfyctBOJcM7eePiZ
	S4IjHdT7pqh4C2De06t8pwMLg9T6AIrYOVR99wtQcG8rJGRVVYj4KUMNr1oagyvvEZGgUN44aZo
	ZzTpqHIqFApCrvWf9PAjDl+syxVcy4CmMUx+A1c=
X-Google-Smtp-Source: AGHT+IHHq3zVV18mec1i1Yu/d1DvzKyXvMhaq+OgPUS3dyBp1OnowQQMhu7Ma17jRECN4fjMyC7XBQ==
X-Received: by 2002:a05:6a00:cce:b0:732:1bad:e245 with SMTP id d2e1a72fcca58-734ac34dc5emr117245b3a.7.1740673982747;
        Thu, 27 Feb 2025 08:33:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe487c1sm1819453b3a.45.2025.02.27.08.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 08:33:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 27 Feb 2025 08:32:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
Message-ID: <dbd9cc84-a0b6-4323-b343-6e80aaaf2d14@roeck-us.net>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
 <20250226145931.GA2314060-robh@kernel.org>
 <3f7b031d-7b83-4a00-996d-aabb26278b67@roeck-us.net>
 <20250227-sceptical-phenomenal-wolverine-56e3cf@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227-sceptical-phenomenal-wolverine-56e3cf@krzk-bin>

On Thu, Feb 27, 2025 at 09:50:23AM +0100, Krzysztof Kozlowski wrote:
> > > > 
> > > > hwmon code might need some changes, but that's not really relevant for
> > > > proper hardware description.
> > > 
> > > Normally, I would agree, but it seems generic pmbus code expects this
> > > structure. This just came up with changing another binding maintained by
> > > 'Not Me' to follow this structure. We're stuck with the existing way, so
> > > I don't know that it is worth supporting 2 ways forever. OTOH, is it
> > > guaranteed that these devices will only ever be pmbus devices or that
> > > other regulator devices which are not handled as pmbus devices currently
> > > will be in the future. If so, more flexibility in the bindings will be
> > > needed.
> > > 
> > 
> > I would appreciate if someone would explain to me what the problems with
> > the current PMBus code actually are. I have seen several comments claiming
> 
> Not exactly a problem but missing feature. pmbus code (at least one of
> macros I looked at) expects regulator node and some sort of child of it
> (vout), while such simple devices should be:
> 
> regulator {
> 	compatible = "adi,lt3074";
> 	regulator-name = "vout";
> 	regulator-min-microvolt = "100000";
> 	regulator-max-microvolt = "100000";
> };
> 
> so without any of regulators and regulators/vout subnodes.
> 
> > that the code should be changed, but I have no idea what the expected changes
> > actually are or, in other words, what the PMBus code should be doing
> > differently.
> 
> I did not investigate much into pmbus code, but this might be as simple
> as accepting arguments for .of_match and .regulators_node and then
> accepting NULLs as them as well. Or a new macro which assigns NULLs
> there.
> 

Unless I am missing something, the following should do the trick.

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index ddb19c9726d6..289767e5d599 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -512,7 +512,6 @@ int pmbus_regulator_init_cb(struct regulator_dev *rdev,
 	{							\
 		.name = (_name),				\
 		.of_match = of_match_ptr(_name),		\
-		.regulators_node = of_match_ptr("regulators"),	\
 		.ops = &pmbus_regulator_ops,			\
 		.type = REGULATOR_VOLTAGE,			\
 		.owner = THIS_MODULE,				\

Maybe someone can check if that works.

Thanks,
Guenter

