Return-Path: <linux-i2c+bounces-432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807E77F68C0
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 22:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C3D61C20AB7
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 21:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029751803D;
	Thu, 23 Nov 2023 21:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNBBv6f4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDCDD5A;
	Thu, 23 Nov 2023 13:58:54 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a049d19b63bso179057466b.2;
        Thu, 23 Nov 2023 13:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700776733; x=1701381533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=12Q5AnLjxvYR9nCPjSjcaal74McNKCML5m9yOv+zaI4=;
        b=gNBBv6f4J3hCEa4537gb3pqI2OfnzOA30ecWEMGNTrp8OOY6/zBgA/Tvqx4sf+Fscw
         SZTYVDqLVktuyU1axZbzPMWbTUSEqpuR+plv11Efxa7vLbS0i+q2iON/2ZkRXVPWzvjK
         j6Mr0wvPq+BFySKeSz0wtJmtnYIjfYMdzOzSxxjsonA1hfBNKtOxNy5XLFlTkn6PxchX
         RxzwjN1sTEFx8yLFOJxAkEf/mkM1vvNFAd3pRJmq5Gi+7dsQYAHK/8vWVV/k+Sa+8I9l
         glljTfqu0UV4a76YnDSsVga2iEPVkO7/8eYNH8/wSS3zMqP5vL5WvJwNk7MIvueCeCyz
         eouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700776733; x=1701381533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12Q5AnLjxvYR9nCPjSjcaal74McNKCML5m9yOv+zaI4=;
        b=OznQZ/lwLFR1zu91fuprco/xhZMYlmEXaO7jzVzKZySAyFZ4aH9kkMZsvIN/tTTlxM
         ZkfZ3Csd+Yd9StdB9BRd9ASbTRrxVYhwg51sFpD1K3DB2M0E5Q0b48wUcj0Auah0y/yO
         YzrP4NPZoMjEF16i7udyzdAGEUzfaVZS1B7UJ9DmjovbjCz4KfAAfTzVoXR2OTAvO6Bh
         yL9qcYB78tO3TTV2jKiCzKviL+yxngve+8yeHgrJzDoztH63utj85PpSPfEpkn9fJ7zH
         dWD3bPH+Gl/O/l9VUfU/4/N9nYVnSFalgCy2i5B8766DDGwCu/MH6sQ0Qh/iwYlSfysp
         6z9g==
X-Gm-Message-State: AOJu0Yx1eCQGSiKL3vMiGQUP1j0D2PpVYOndjqRn3WemgNkn1IBP+hSF
	Sq8hcrqa9fflHTt6qyJHe00=
X-Google-Smtp-Source: AGHT+IGQDMws8zW/C78iQmSEqbu/kROowyA8NJy4jo3VskBbqEv6a08N1Oxj8KeePaI7NrFxFhIz2Q==
X-Received: by 2002:a17:906:a448:b0:a02:14d6:2854 with SMTP id cb8-20020a170906a44800b00a0214d62854mr400177ejb.59.1700776733171;
        Thu, 23 Nov 2023 13:58:53 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0f2:3200:3595:63df:4916:a21d? (dynamic-2a01-0c23-c0f2-3200-3595-63df-4916-a21d.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:3595:63df:4916:a21d])
        by smtp.googlemail.com with ESMTPSA id hb19-20020a170906b89300b009a1a653770bsm1232801ejb.87.2023.11.23.13.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 13:58:52 -0800 (PST)
Message-ID: <19d86ace-a0ea-41d4-82d7-e77ef79e58f7@gmail.com>
Date: Thu, 23 Nov 2023 22:58:53 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] drivers/i2c/busses: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20231118180504.1785-1-hkallweit1@gmail.com>
 <20231118180504.1785-2-hkallweit1@gmail.com> <ZV+8z7zloE/gn/4p@ninjato>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZV+8z7zloE/gn/4p@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2023 21:57, Wolfram Sang wrote:
> 
>> Series was created supported by Coccinelle and its splitpatch.
> 
> I don't know splitpatch. However, I don't understand its result. Why
> isn't there one patch for all in drivers/i2c/busses? Also, the subject
> prefix should be plain "i2c: <do x for all drivers>" or something.
> 

AFAIK splitpatch uses get_maintainer.pl and creates one patch per
maintainer(s). It's not smart enough to group changes per module.
What I see is that the subject prefix often is based on personal
preference of the subsystem maintainer, so far I don't see a rule.
Therefore splitpatch seems to use the longest common part of file
path's of grouped patches.

I'd appreciate hints on maybe better tools for creating patches for
tree-wide changes. If possible I'd like to avoid having to manually
split and adjust the patches.




