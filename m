Return-Path: <linux-i2c+bounces-1712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2368551D2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 19:14:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51F7F1C217C2
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 18:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155FD129A64;
	Wed, 14 Feb 2024 18:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWJh+YOY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3260C1292F8
	for <linux-i2c@vger.kernel.org>; Wed, 14 Feb 2024 18:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707934298; cv=none; b=Dxar2xz/Bo5q+x+NPKq8ltc/Cog6v0wFKL8xrtYo5QASRa62rPohuRcDIGRRpMpjjKTt/GJJbBZO1ErRIyifG7Dof4tXLPHO3zwQ19gdBRlDr1zGWfEmNMrNyhe5ygjgT0m/H/EKW8bf1DAm5Z1hOsfwCTYu4oeXuoOhyQjsK6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707934298; c=relaxed/simple;
	bh=HAfgCBC4WM1+2riNfAPOKMxv8iTs+r1dJAFi7H3a/B8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cSsk/apHxMp4wZ8584tGEWmIDRcqxbWx8zdPmyOPF9NicC2NT5k0iXajLcbxsxUvnw5HQ1+HKbsEKy8lNdgj+EUv9p26/Shvvh/8lAvut6XUXhwRGRAep2W+JzJYZ/+sVIMhXKXiweTlG2Y8ttO05y37cFhOA93kfRA+dXVMTkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWJh+YOY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-411d231ea71so37315e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 14 Feb 2024 10:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707934295; x=1708539095; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HAfgCBC4WM1+2riNfAPOKMxv8iTs+r1dJAFi7H3a/B8=;
        b=CWJh+YOYqJ55D6AWISHTK7OeB3cVcawU5kagyMsUhyT1D9jg0rIjGrTXswNv6DNQku
         kNtFJCo2mM5dEEnoAmAyL8qddBt6leMhkGECiJXwlZxv+wsGXZI6nF+F63MEmNf+FmlT
         g2oG7+sLgYgeoikUDMMPbPY8YzClXKRpR4Ml61UTicjY9heqk2EQyuGYiL8gc2qQlPpc
         65bxO3SLq5/mafpQJu/5xNBO+YIVBAUQNpwAIVURgCV6dZ402LYFseBL/R4AJ8LatDdd
         dOvVTbQmo9eFhd/ZIrZv21vWDQHrp0bo9pJCw1+dEe2VqunKwLBSuX0m+2aFSQ+M5liX
         Vegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707934295; x=1708539095;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAfgCBC4WM1+2riNfAPOKMxv8iTs+r1dJAFi7H3a/B8=;
        b=jgMiS3Vlox5JRgeUxhvDR5O5yiaFEzegOy2nv9gWswvYCvGfl9l+VvRsl5BqADfP8J
         AM3Ipqk0QVD/HTXFYdQtN+QBCYmGnXhMurvv8GWZ5DtytIrrirIFbukUe5vvhvK3BAjx
         FMn0wQ7RKqQs/rE0P0la1GF1og4yrzWeqsGtn3RTF66aRYj2ILU7MZkwxMDueFefXham
         ulq8dmOwv3R5jrR4c1+TYzVbGZRwuhVYTaDS2a2rYJqPAYItAJfdxZABny/sBzclfGGM
         U+mjCpb+/s5Sw7h8AsDwxvhTF96agWuSnuhezQMpKaKc6nDvZ0I/mGPvtxJjcesCLLrU
         3Dlw==
X-Forwarded-Encrypted: i=1; AJvYcCWPjVebSUir+0DK15T6c28cnWWLswf8RtBs3SQZO/1DobGq6ZeUW5ajONiZPnIPzHMeAoL0XEHXJKRwMggE1+XibH/HEG7oJz2m
X-Gm-Message-State: AOJu0Yyh+IdbL2ZQeZvsU22ivwh9couZZz7Kt8a4yCSTUW45SWLMRax7
	sLueIf1isWqWrd6WcHkDLKeU/cjRkk5G2fmbFP3afzMilQaPlWXy
X-Google-Smtp-Source: AGHT+IH+C1pnqd5EAvI21TshQoSEgcj9ihgcx/XRZDSTG1zX8AAza7YOSJLBtA3tHe0pwaQoprWRIw==
X-Received: by 2002:a05:600c:4806:b0:410:deab:96bf with SMTP id i6-20020a05600c480600b00410deab96bfmr3179475wmo.22.1707934295222;
        Wed, 14 Feb 2024 10:11:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZvGcLxkRF0Q8uCdkEM/4MkimgVZVCh5GOnfQ73pY9pYxutBQZaR7ZztrXPK4ASsxv8T6JxXcPDQ5EZptw2pNv1gJVD1wFtViTbW+GD1Bn5awXvUpzS65knflsCh9e/mru9f5zYjgHUA9LETv/bv8mT19u3q6W7kY5tvmxpNOBjKb83VZKt2NCk1j0n3fA8fkuC0cr9T8YWUH/uetOvBagzf3U3XmHbX94hGaiaJiHls4HK2QcKBE1yOtSD2TbzAw7SqhHsjviucqx
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600003c500b0033cf7eb4a85sm135735wrg.65.2024.02.14.10.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:11:34 -0800 (PST)
Message-ID: <91f119a088b8cb54bb43382900bac566a2467f3f.camel@gmail.com>
Subject: Re: Potential bug in SMBus kernel module
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Jean Delvare <jdelvare@suse.de>, "Zakowski, Piotr"
	 <piotr.zakowski@intel.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, "Shepon, Oren"
 <oren.shepon@intel.com>, "Kozlowski, Pawel" <pawel.kozlowski@intel.com>, 
 "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Radtke, Jakub"
 <jakub.radtke@intel.com>
Date: Wed, 14 Feb 2024 19:11:34 +0100
In-Reply-To: <20240213120553.7b0ab120@endymion.delvare>
References: 
	<SJ0PR11MB5133C098821363F292316A0088482@SJ0PR11MB5133.namprd11.prod.outlook.com>
	 <20240213120553.7b0ab120@endymion.delvare>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jean,

On Tue, 2024-02-13 at 12:05 +0100, Jean Delvare wrote:
> Alexander, back when you contributed the code, you said the new command
> was long-time tested, so it's hard to believe it includes the bug
> reported by Piotr. Do you remember which Intel chipset you were using?
> Is the code you submitted exactly what you were using on the hardware,
> or is there a chance that you forgot one change when preparing the
> upstream submission?

from what I can tell, back than it was
"Intel=C2=AE Xeon=C2=AE D-1500 product family Integrated PCH Logic".

I'm not sure if it was WILDCATPOINT_SMBUS or LYNXPOINT_SMBUS,
it's nevertheless FEATURES_ICH5, means FEATURE_BLOCK_BUFFER.

Unfortunately, I cannot tell you the details of the tests, but the reason
is that I had to rely on a colleague for this, so I cannot explain
how this went unnoticed back than. Maybe the (incorrect) returned data
was irrelevant for his tests, I can only speculate.

I don't think there was a non-published downstream patch in play.

--=20
Alexander Sverdlin.


