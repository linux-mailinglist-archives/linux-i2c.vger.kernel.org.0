Return-Path: <linux-i2c+bounces-2257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5844875152
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 15:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0534F1C2437D
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 14:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CFC12DDB9;
	Thu,  7 Mar 2024 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0BjtU4z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4762812D750
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820356; cv=none; b=Z/5zzaHYHR912tQI64DJJwxOVDSOi3QPLK3my7HcQYx3BIfnrnq+l5CbRwttOJ7mzcVfMOcLZa/tbtEZezKTC2rRakXf0vyFSghl0tVH1d/8bY8Fc/0TGMHZh/ezx6rlhls0TyZ8whMNNlFCdfU/Pn0TM4G486EolaoDQ0+96EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820356; c=relaxed/simple;
	bh=J8emwiQbymAoEd2gpq20JoW4WMzx4O743KJzU1D0aXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhtKCSJ509NvFxr1TIvYf1K4bPK4brnHquSAmhZjJVLznwkAdtlsB1wO4muTWjmvciTzcVlTxIi/K0ljSVSvhdnIK3UyfMA6hci78+BIi8QyYJXBySFK7hDa52+rHr8XP4OvxkxHtuOQMeZ5ggHGquTcF5jHndt9sdFw7TDZp0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M0BjtU4z; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56647babfe6so1324816a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 07 Mar 2024 06:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709820352; x=1710425152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pN3fhFvYecV3ssgIvzqYL2IweCRfAURy/ibBdnYSj+Y=;
        b=M0BjtU4z4gg7p8WiEVp5ErES/A4897shVaD+Vri4/NsSjVmYSI7K+efT8mNJ+7pm3q
         VGGiADB6pLY3NAO2IT7+FafJn425E1lMIJUR7AGNb3Iy3LR2Y+P37clEcC3S8QBAzcIh
         SBTQS5rJC5ZvNhwMxkB46/sOp62wja9oshkPRoEbxHgXVcvPYk6iiqgB05M2l5Y7Cz/k
         R3DYSAOI6DxL2Or/D/YMu/V4mCLDKXtmyTLNas3Gwp+NM1qdKexFJ/70nb5xWnYDrf+/
         ygYk3CRTYMqfATW4cXdKPlfj2WBiNAGA0ClwN1yjB6IPdAG+Q4T/IBq/WPE9A9GUD8qq
         NGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820352; x=1710425152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pN3fhFvYecV3ssgIvzqYL2IweCRfAURy/ibBdnYSj+Y=;
        b=IC7FuGXFHxWBO19vkiCwmARzeJQOT3LPERLrIsw2qPaW4rQI6HYv1sB5rgYkWXbvDF
         8zBS8DdWZXMiFi4ZLMX88awOTh8kmHLfsfYlTpkzqz4kTZfaRqrWhOwNMut68dme8hz7
         YyH7u5E7d1WWBAW58iv/wrRXWGq0TDrmFjcUErtOLXJmBXMjkPgT23dBMKl8wYS6cVqC
         mc5ju7Sgr/7R0+lbKBq1XDBiiglbrMvt0wNpPxbp/91OVgw+F0UytIRPhplKpdy8OkUA
         1iiGW0gsThIG5cCmnugCbAU+JOpt6Atxd5ALDBLSV44X67i4sLveYbA7pvrPZ0f5cK0j
         iseg==
X-Forwarded-Encrypted: i=1; AJvYcCXiXewF9/t/DFPHhIwJ5nyqlzbT8dQ1TYHP2bxI9jFL4MGXmqdmf853C6xJBOoewiOiUbqAyzbaADMPzko4iM0IvZcVcu5GP0+H
X-Gm-Message-State: AOJu0YylquGu89L49rKINiu+oOkbAkOeorIV/cMsTj5X2zezWA6ixDuz
	Qm12kYAk7T9tRMAZKjwU/dc2+PUJzHtY40MlVrX8NT9JDRfwEbKjwKcdMyOx94A=
X-Google-Smtp-Source: AGHT+IFA9We5Y2sUMetQjvf8IytYhafPzA4WLhxvqY8WrXQ+07kvgmn53JZiCJSWREj9RGKQrd31HA==
X-Received: by 2002:a05:6402:222b:b0:565:76b6:920c with SMTP id cr11-20020a056402222b00b0056576b6920cmr11046019edb.9.1709820352342;
        Thu, 07 Mar 2024 06:05:52 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id d18-20020a056402001200b00566d43ed4dasm6969687edu.68.2024.03.07.06.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Mar 2024 06:05:51 -0800 (PST)
Message-ID: <3bd4acd3-630a-4315-bdaf-9ce0bc5eb6b4@linaro.org>
Date: Thu, 7 Mar 2024 15:05:50 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: exynos5: Revert "i2c: exynos5: Init data before
 registering interrupt handler"
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>
References: <20240307140427.1942235-1-andi.shyti@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240307140427.1942235-1-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/03/2024 15:04, Andi Shyti wrote:
> Marek hs reported that commit 51130d52b84c ("i2c: exynos5: Init
> data before registering interrupt handler") is breaking things.
> 
> This is a regression and until we find out what happens this
> should be reverted.

We know exactly what's wrong. This should have never been applied.

Best regards,
Krzysztof


