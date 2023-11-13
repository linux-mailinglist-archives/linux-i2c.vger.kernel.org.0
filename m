Return-Path: <linux-i2c+bounces-139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3B57EA2DC
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 19:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C73ED1F22344
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Nov 2023 18:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D4F23751;
	Mon, 13 Nov 2023 18:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5azsGxI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D632374D
	for <linux-i2c@vger.kernel.org>; Mon, 13 Nov 2023 18:32:37 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46374D68;
	Mon, 13 Nov 2023 10:32:36 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32fe1a29010so2776773f8f.0;
        Mon, 13 Nov 2023 10:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900354; x=1700505154; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L0wxdL/i8QqbWOI4oHziGSktf3E2yrNaekZPZMrm2H0=;
        b=T5azsGxIkYNeB33CRNPEy4dr4ssZ7pATM+wGeRxmjWWSpJ+0EIy3TaUICkd5EssCXT
         tiptBNN+h8/l1fbeyA5sCWbi0OplTEcVpXVC2HE/8bT9U4/TpdcEK3uDIRLrL8SeEdmy
         qj9H1lAd0t6K+RSudWWTkETpz3N1rShqyWM6x2KrLcWaRHAe6Ev83QVp9svNablTvXmK
         7PlqfHKYD402S8QgKhyj+oV/nl8vKCI30XB7B+ysfi4Ne4xqucosal0Ea0bWgFQgf4wI
         c3/fTuglevp7LsRzcOvMp62E6qhmN2Z0mIMexkloK9VUzMmM0VPjsMQZbXPGzCvCSkvF
         NIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900354; x=1700505154;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L0wxdL/i8QqbWOI4oHziGSktf3E2yrNaekZPZMrm2H0=;
        b=RjNCwkdzpDC/20n+6RMJoigCLYfqF/sT9llPaBjNhL6d0+vE47zUoqHj2HJn5b6QDo
         i4xiMwcgE+kgqL7zM+qq9llTEnmYV6O4+1eK3bRmTP4t1Nxk7mEPnw2M6VGQCHsjSEsd
         gCSKAZaBgB7BUVuyfGp1g7N3rvQKru+rwHEl6gJYR5CFNK2ucThIRlyipNz3oByNjdZ/
         5VMMcygpLPq2RrndZFNwWwaHoIZBfJUDHwiL4Qsffoovz3AR8H05UWT/y4N7RFHQ+49k
         no52Os5LR85ifAQpLl8Dr4OyHVllbCD1SpkbApO0aCJUjygsbMhrAmyfq88+1MLKGyOM
         VziA==
X-Gm-Message-State: AOJu0YwXKLXQD/SLeO+FazxrfDhRFbRsv7ojM+ZFHMLG9U7k1VoGTF06
	5+pvDshx5FMZ6QdMAFCBv+o=
X-Google-Smtp-Source: AGHT+IEvX7xzuRggU3xZGMBbDMlEfJbaFPogaFwEGoMGfRqe8yk1ROAXGyKMspm4ePkQhUnieenyyg==
X-Received: by 2002:a05:6000:1846:b0:32d:b2e0:ed79 with SMTP id c6-20020a056000184600b0032db2e0ed79mr5054539wri.67.1699900354494;
        Mon, 13 Nov 2023 10:32:34 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e16:fe00:c172:813e:6561:e5e7? (dynamic-2a01-0c22-6e16-fe00-c172-813e-6561-e5e7.c22.pool.telefonica.de. [2a01:c22:6e16:fe00:c172:813e:6561:e5e7])
        by smtp.googlemail.com with ESMTPSA id w10-20020a5d680a000000b0032d893d8dc8sm5997872wru.2.2023.11.13.10.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:32:33 -0800 (PST)
Message-ID: <0aa0c4c6-8afb-4605-bb21-5704b922bd34@gmail.com>
Date: Mon, 13 Nov 2023 19:32:33 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/20] drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:
 remove I2C_CLASS_DDC support
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <20231113112344.719-4-hkallweit1@gmail.com>
 <e4ee224f-8f18-4922-ac1c-4612b8e021d8@amd.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <e4ee224f-8f18-4922-ac1c-4612b8e021d8@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2023 18:50, Harry Wentland wrote:
> Please just use "drm/amd/display:" as tag in the commit subject.
> 
Thanks, noted. Tags have been automatically created by Coccinelle's splitpatch.

> With that fixed, this is
> Acked-by: Harry Wentland <harry.wentland@amd.com>
> 
> Harry
> 
> On 2023-11-13 06:23, Heiner Kallweit wrote:
>> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
>> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
>> Class-based device auto-detection is a legacy mechanism and shouldn't
>> be used in new code. So we can remove this class completely now.
>>
>> Preferably this series should be applied via the i2c tree.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 6f99f6754..ae1edc6ab 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -7529,7 +7529,6 @@ create_i2c(struct ddc_service *ddc_service,
>>  	if (!i2c)
>>  		return NULL;
>>  	i2c->base.owner = THIS_MODULE;
>> -	i2c->base.class = I2C_CLASS_DDC;
>>  	i2c->base.dev.parent = &adev->pdev->dev;
>>  	i2c->base.algo = &amdgpu_dm_i2c_algo;
>>  	snprintf(i2c->base.name, sizeof(i2c->base.name), "AMDGPU DM i2c hw bus %d", link_index);
>>
> 


