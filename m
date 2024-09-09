Return-Path: <linux-i2c+bounces-6426-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6A97210F
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF0C21C23164
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FE3180A6A;
	Mon,  9 Sep 2024 17:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiP3Jhlm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AEA179202;
	Mon,  9 Sep 2024 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725902970; cv=none; b=j73JiL7XGF3KfD+zEd96lobw4avOM1ZhmkjqfP0pH3zELVG+jQf2c55nl3JkmNOPoaFUUAiHoogYNZWDr4FypZ0dRZg5M9i5D97l2NOfF+zEG32Z0Gr8TaYXlaencCw31SFZ0stAsocNVhhN06jFeSM/Od6AtGQaFXFwfaSCy5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725902970; c=relaxed/simple;
	bh=9toFg1zeGAsWIxmlIR3roMyezXX5dLsIU0TFJOYYri8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DFY3LVJKho1U8EiRT7M1qnysj7IFLzIps+SxMANvofrNtA0uemsqRcnJTnAzWvRJy93ig8ZxCz7m8XgDIfvyrpaYvZeBxUsIZBmCc21LYrEtdTJz2bNXSpK7G2PM14zqL8T7GpGOTvio27cUD/jKqkQl6awyP6hZX+LGh82vb8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiP3Jhlm; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f759b87f83so25673131fa.2;
        Mon, 09 Sep 2024 10:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725902967; x=1726507767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T2tvR7upIV7+T5XfvAMzuTJRP/ZMwUWF9M601s7MVqs=;
        b=aiP3JhlmB5qlsQWTaHSTjH+r3zFUAzDcwVToXO8oCnhwXbul03LrSJIccZAcbivKjx
         NWk0acfXW7B+/yEzIAxPt2BZNvj5+gilbIsWt1BX63GYcyAIl7i9/W24DOY9wD5pc2E8
         nXewVYoArocDqfGgjBpVEtIU0eMMHIlOLtkqLIkmVh0UrrZ0LelDLSrfJ81LF9XqE79y
         Lh9rTMYiRRYWI3a43IbgfhxODFjPm2xQu5iNwKKMhPWBNm+S1K3IvokvRKxlrjpXiKRn
         zbhtfZTx0gS30ZWNNv76mWL5+Jm9zNtSGGwH7Isla0+VJI25Dz6wyXD5ox9TyVD2oDfP
         J1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725902967; x=1726507767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2tvR7upIV7+T5XfvAMzuTJRP/ZMwUWF9M601s7MVqs=;
        b=cLAJodLXaAemxREj0Hww1Xf6g0NQ0DLENZnORWZY4lITNJMA3TbR3ZK00YSqGFubyn
         R4Uzcw7Clf7fgv0bvWv2XubuHSCvSD6L/3Uy+PpR4szV+h+8sZStR+x0mormU/nYnaV4
         GtaCKNEgpenf82cAMOqe9ieA/DTQg5/L/Sij77kaj50zmJ3Qm6Vcvsb8UoEVKOBWdZDJ
         XHq+HmX6KCvQxsviocHfWSmsF0qykmspPi61jSmCx8pmlZWBhNZZLRRSovkpm+vz+dFs
         fVuLejbXwVSEMziPj/42i8iKKnAdXWH3nrgMR4AxgD6cB+fADCmJnTmCJDMAaT0pffUf
         XF4A==
X-Forwarded-Encrypted: i=1; AJvYcCVgYkK5cDaMEvtiAu+A20zigqfyRnRKz565IWUS6730Dwri+Kaxs73KYvwhZSQ9djoxzxJ62qXuohdA@vger.kernel.org, AJvYcCVo26oaeTxPOqq9zNE+DvgQQS0pdpC9vE2Ro24LPuuDHPS73NqpvHr/Fz7xgcKImTipm25B+FYlTelaIA==@vger.kernel.org, AJvYcCW2HQ7r58cd1EgbyKJ7L8P5wF7ZXL+5WuWVBxZseMm9vMH57pWvn9yLG1mLOKN+HsCuvSwIDpLlNPEKd8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/yvPXGgf7BWOMnsRvKD3pPGr+TGYQCgBlhaTiw3XnoPM42OJ6
	sEwxmRm7WtD7chocj9HpoY+FN7bDys+Oq1D5p4+IVemhCCBgelFF+szIhy8V
X-Google-Smtp-Source: AGHT+IEq7mKEEjiRCi6RADDe14/7e4Gyembx/paqBwruQT0DAt6HCIU8QHp989KQLekwgu0n4g04/g==
X-Received: by 2002:a05:6512:3b0a:b0:536:14a1:d660 with SMTP id 2adb3069b0e04-536587a54b0mr6434852e87.6.1725902966263;
        Mon, 09 Sep 2024 10:29:26 -0700 (PDT)
Received: from [192.168.0.17] (cable-178-148-235-7.dynamic.sbb.rs. [178.148.235.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c624efsm367675866b.114.2024.09.09.10.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 10:29:25 -0700 (PDT)
Message-ID: <91ad763f-4cbe-4aff-839f-fb8b0c5b4ac8@gmail.com>
Date: Mon, 9 Sep 2024 19:29:24 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: savicaleksa83@gmail.com, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 08/15] hwmon: (aquacomputer_d5next) Use
 devm_hid_hw_start_and_open in aqc_probe()
To: Li Zetao <lizetao1@huawei.com>, jikos@kernel.org, bentiss@kernel.org,
 michael.zaidman@gmail.com, gupt21@gmail.com, djogorchock@gmail.com,
 roderick.colenbrander@sony.com, me@jackdoan.com, jdelvare@suse.com,
 linux@roeck-us.net, mail@mariuszachmann.de, wilken.gottwalt@posteo.net,
 jonas@protocubo.io, mezin.alexander@gmail.com
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-9-lizetao1@huawei.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20240909012313.500341-9-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-09-09 03:23:06 GMT+02:00, Li Zetao wrote:
> Currently, the aquacomputer_d5next module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

