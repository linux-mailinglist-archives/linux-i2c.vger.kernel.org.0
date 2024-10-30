Return-Path: <linux-i2c+bounces-7668-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A399B608B
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 11:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0F8AB21053
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 10:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C7D1E3793;
	Wed, 30 Oct 2024 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fKzAJtl6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867B4194151
	for <linux-i2c@vger.kernel.org>; Wed, 30 Oct 2024 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730285632; cv=none; b=SqmOXDmrk85emMk0bZQGqc8fljpXGo7Eh717S1EI8g3lFSFuRvs1TATJHacK6g52xUIPtXVZvj3IgSqHF4udLWlN9uEQ9uLZSx+x+nTQ2tA26Qe80PdqwoaAyPwp/uA5lnOlqoGxkFSrJNV4IWNZCtu30EvcQRCU7Y4fpBW6ysE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730285632; c=relaxed/simple;
	bh=KDU1+7ZnVtYCy9gRBggHWB94leu6oxv4QpxSzLT4cLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USN2kzGB2GwtpVtjvrs+GnsZ0rK+wtrH4AFHsNGJrAR7DpCir6v48/BvagXH6VX/CjV6ESnghfzDsJCmfKUJygj423y7tJLM6KG23ameuFeLMzNUtP/DOwIlSTW0JhS11avLOu2wCMlXIFc4IuBerd5ElkAZgiBhfjnZHcjgjm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fKzAJtl6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e58878f2so748146e87.2
        for <linux-i2c@vger.kernel.org>; Wed, 30 Oct 2024 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730285629; x=1730890429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r90YpozeaoCUvndH8AD2U9m1kd09qNk8K+E3W0sjRsI=;
        b=fKzAJtl6J7foWoUIsIvQiEkAdmIXIYogNITdAOzsdKRalaKg8QcSEofbFgZTF4gDz1
         DaULU6TiYEOp8X8ymFBtmw5tuZTMg+AMRtCSJaux0CvJ0lHQQWSOzvKANluusK7Pk1or
         h7Sqm8KbINxsUuMbBmGkO8AUNq0NuhAuuElsBFTLcF7p6vT93IE4fbF4OG/PYDyVJzcR
         55CClvIw5RREEI+6dLW3zj/0g7+/QwW0CwNOW13VoyDENZcXoYJ15wRIyXmf8kcHlYBK
         cGq0kKomn0BrnJQu/OpgKIhoTl8pSZowD6rTEEb9PkjTpdsRa0X7XqhnvIBEcmoyOfKk
         4bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730285629; x=1730890429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r90YpozeaoCUvndH8AD2U9m1kd09qNk8K+E3W0sjRsI=;
        b=Uiv+iUZEUXcsM+tsB/C/ikWT8OHkkhVXiHNjNfAbczA1AIdyFnWiI2DDZ+aem0gvZ9
         bWED4pYHrTHQKWBGERE9J2/j8Yrtedb4Qtfb1q3BjC0mSx6NIUlN1BboFA1NGsNIxOzb
         kOJ8369vzo3Fjg2vpkjnoyDCWLO9PJWvZ+vNdDHySNcavn/6kAtLUs3o74rpA5ARRosl
         1DDbXG/OaTfonQdr0mgpQwNY0qYkWOUByNTKNKcGKEuvltUWUfaCIed30rXnQh539X28
         lxFZWiwK5dGXc2qadYA1/rfbZksiLgjP7zqc5ygHdBKsgDlhpAwsvnNqVSuIwdmlqwTO
         p1sg==
X-Forwarded-Encrypted: i=1; AJvYcCU/m2ReRMEevAngUOdoEHHKyTH8uA2bPsNqqHn18C3LMgz5G6kbdgCGoa0RP1W4Xhm3yaNMOSR+rgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSFaQQDvoX3sPZOLp7JcOR55edDNHAGZrPc3n+UxemC37eTxj
	eazNNPV3bTSNQX1atAn3SPNeU1DXmEHw31C+OjRR6B5Vqxk5b9gVc7cix1KpomA=
X-Google-Smtp-Source: AGHT+IGYv8fqW9j0td8pyKJ/XV0vhPCxGKBeN/I4HT71o3DsyGkxaEPZa0NHC4ebYcOXKS9xLYt3Bw==
X-Received: by 2002:a05:6512:104e:b0:536:9efb:bb19 with SMTP id 2adb3069b0e04-53b348c8a1emr2185606e87.3.1730285628678;
        Wed, 30 Oct 2024 03:53:48 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bc0d7024asm215292e87.293.2024.10.30.03.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 03:53:47 -0700 (PDT)
Message-ID: <f5003f25-6a00-42f8-a130-5ce3c8761674@linaro.org>
Date: Wed, 30 Oct 2024 12:53:40 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 -next] i2c: qcom-cci: Remove the unused variable
 cci_clk_rate
Content-Language: en-US
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, loic.poulain@linaro.org
Cc: rfoss@kernel.org, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/29/24 04:09, Jiapeng Chong wrote:
> Variable ret is not effectively used, so delete it.

Variable ret is not deleted, the commit message is misleading.

> drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

With the needed change to the commit message:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

