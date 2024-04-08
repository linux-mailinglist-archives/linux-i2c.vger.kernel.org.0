Return-Path: <linux-i2c+bounces-2830-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC7689BC23
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 11:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CEB9B20D6F
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 09:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BF148792;
	Mon,  8 Apr 2024 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZOisKwd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B54B219E9
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 09:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712569395; cv=none; b=Yxmp1l+H2QPwzEklnh7X/u6qo6XbSK61vz4Mq/uEo6zMu6z42yDbRo2y5j6alg/HhfXct+gm4SFRV5NZJpH51eYF5OD06YO/9eoa0fMDauEANmQAonKGJHbkt0QIB/XpTGEKisMnlP+HWnFchMUxdGX5hyVbO9T/Q6fpTzhEmS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712569395; c=relaxed/simple;
	bh=HTKSfFjQRdHs9Hk+av2doBOhqJjqCnqFsOQFm3t+iU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GVPfmJPqQtHTNkTVaaY0hT48EMz6rvc4PqoMJiJKeXmN3IBBG3oYBayRSTyPu8WqFjwo32ZORbUVsUm4A7V3s1YAfsO5NGEuMb3KkLApOUzk/OK0Kv76lzyhDmEBxsROnSrFOsomSvOfHi7uiWfgZA0Aj9kOXr5LlMvSaO1unI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZOisKwd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-416664dbee1so4641585e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 08 Apr 2024 02:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712569392; x=1713174192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w5oK09GALYJqfOYl7Q/0Yv1+SbW+wxMhouLNLEm4Fps=;
        b=YZOisKwdrGFMibN+oJO8W9io0nnnSWXyVVXppSPMH99f72MLtV8B0sWjMfp6xMa4DZ
         Jj64MSgB8jN6klNPHG/AvGt9PGNVqc0efOWorFZDViCrn+9QWz0UQbQGuOt9j6nIAq1D
         YxUohsAMwPqFk1AE4ws7YWnQS12MsYLmml8YhXbsP/2AXF1/XET3ZPrFGS1uB1oiENQV
         DMoCxejDk3TJoYgTAmQH0ykVBT4y449SpOJTGHmKZoJ+keABjxPBpFSqFItiFrz/n9cI
         vevYTtvCkksy/3LnEHRnl9AgR4L9MHDW282YXlCpOimgVJibPBnGQw4hPmM6RfCJnBaw
         6k6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712569392; x=1713174192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5oK09GALYJqfOYl7Q/0Yv1+SbW+wxMhouLNLEm4Fps=;
        b=vPa+qaamQRO9J8jdd33IqlBlGhyl19AJi6avImPs7gOxSxcUvi6SgHZQrWu0abWCxF
         3ITWCh4Vr6Meiewyb5hQK5UZb9wV/xeaQtAnVyJpj/NGZHO5S9Z+qsa5NMyCTjHiENeJ
         AajQnldICP4q00ir6GBlFEO+V1J6HUMa520F4Lu+XKB+qIQaMgHHgri08bXV4Aug4btQ
         SSvwAvqZym/qs0TLlQZrKLRLOtFO7myjxr0PLcLZDQJ8dr9BA0+veiT70Gg/wcwAeyd4
         cUOCLpStutcPaeUUVq0V23enTgX7oXpQLjmh8O5lyRwpted2HQeO5YM/OuduL+oSC7fe
         BOKA==
X-Forwarded-Encrypted: i=1; AJvYcCVK021qsvUZS5qG3Y1jYNo3Wiiy4ZOVNq6yDpZ/RZOLAYf5wU4DLvXymVIN0311013st1dOhuLTP7+W1lYg8Hr0fazRXBarReiX
X-Gm-Message-State: AOJu0YxybuTaB3xvEv5FSuTBuH/1d5281Rs4XnCBBL73HdTjsb/wNzyE
	ETOvfZ02YCb9+6Adc1sBSAyB+rdCKZqWSCJNE+lWpsLHRnd/5D6FOUBlwzVg
X-Google-Smtp-Source: AGHT+IEt+s8Ocf8ydmu3R8K5XoFJb4wuE9AtX8xh2SczyE+z6nxd3/95iHv/lZlO9vn8ybCg+3VJiQ==
X-Received: by 2002:a05:600c:1c1f:b0:416:3a07:43b3 with SMTP id j31-20020a05600c1c1f00b004163a0743b3mr4611469wms.3.1712569391459;
        Mon, 08 Apr 2024 02:43:11 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c089:d500:6c43:326:a829:dead? (dynamic-2a01-0c23-c089-d500-6c43-0326-a829-dead.c23.pool.telefonica.de. [2a01:c23:c089:d500:6c43:326:a829:dead])
        by smtp.googlemail.com with ESMTPSA id l10-20020adfe58a000000b003434f526cb5sm8447825wrm.95.2024.04.08.02.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 02:43:11 -0700 (PDT)
Message-ID: <61cbe2cc-d334-4a2c-8cae-8cdaf8ad70f7@gmail.com>
Date: Mon, 8 Apr 2024 11:43:11 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: i801: Fix missing Kconfig dependency
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>
 <4dhfyaefnw2rtx5q7aaum6pfwha5o3vs65iqcrj2ghps34ubtw@b3bw3gggudjs>
 <b31f445a-6f9b-47ed-94eb-b80360846625@gmail.com>
 <ilxot5cgzlivhmxpuiifpnyx3jxymlxy2avnkqjgfzcgmmk3wd@glnv7nlydz56>
 <a4092c9c-372f-4020-9a47-72941b8690b1@gmail.com>
 <ixtm7tq4lpnaq64lesbgefphk2f7mmfnzarx7bgd4ydxl6ehma@ukzbhugjspvl>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ixtm7tq4lpnaq64lesbgefphk2f7mmfnzarx7bgd4ydxl6ehma@ukzbhugjspvl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2024 09:42, Wolfram Sang wrote:
> 
>> Another simple solution would be to move the implementation of
>> i2c_root_adapter() from i2c mux to i2c core. It just uses
>> i2c_parent_is_i2c_adapter() which is an inline function of
>> i2c core. What do you think?
> 
> I have no objections putting i2c_root_adapter() into the core. I think,
> however, that this patch makes the code a tad more readable. What is the
> downside of the symbol (despite we have way too many of those in
> general)?
> 
I have no strong preference here, Andi mention that a new config symbol
wouldn't be his preferred approach. Therefore I brought up moving the
function to i2c core as an alternative.
Maybe he can elaborate on the reasoning.


