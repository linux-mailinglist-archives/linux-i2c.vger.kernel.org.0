Return-Path: <linux-i2c+bounces-3203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9583A8B314E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 09:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50BE72849DB
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 07:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8047613BC3E;
	Fri, 26 Apr 2024 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h09wgEO5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E8C13AD20;
	Fri, 26 Apr 2024 07:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714116527; cv=none; b=W0TFeEJ8JbD7mP5KdE9B8t6lsspTnJQ4Woz1a9vX+Hg9TIO/NYX5gaiw5JOuXdm8USwVHDsevLaTyTbgfSoMVbCXccGUt/R0nfprxTL6rwXkMZouB/HV2kDjbvbA5LFRdREYc1qXwsBCrayE5Nd93mdeRRXBjVnOsJh2c0o9Cgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714116527; c=relaxed/simple;
	bh=hMaa9mJBlVjfoxXwH3hpkBbgPedgrK1uBwW7hRR6b7U=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sp14+jZsPGA0r0pBRjt1l0isp3hFc0ZmZZD1+Ni4+wIcUqDYFxJV7K/0aHV4D1QHbyo31Riev3XlG/Xi5MwXVMqm9/yYTREmqzhMrUFEoqvxtT/ohB8ZHJpjXroQkPlHjLeVbB4SJqZwlYCfBoPrRjFNv1StWPOTkS68Xv9+b9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h09wgEO5; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2dd041acff1so20731311fa.1;
        Fri, 26 Apr 2024 00:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714116523; x=1714721323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQN8/UbBy3MmM39EDkYS+s0OQ1C/BvZXG41UzO/WguE=;
        b=h09wgEO5B8Lnm2Vz7UhwXvLjgO+BYIsf9kypUbtDsaUpEHIRLwOxFJrOebVNmA68E4
         yySsOfwNNbOr32SK1SZkh9RQnQ+nDirEjVVH5opu826jzwzVeWYxsmXfrpy+Pdekef8A
         xE5JZ804FIgUM+JDHiMvD1q2VB5vYSDwU7MXVXhl4b+6f+kdE+mXV9e3anZs+hnk5CAE
         LVtfdc80UeLVC3/gS/6pP/ai/WHL1Ov8Sus8HTx1hVrTXzj+c9VK+yQvkgjGHFBbscHd
         Vmwo49dr/BRmHYzsTtxNxvCMvtuTxt6bTxYqW6894D4rB+IEvlGqFtuHfDJ38jkgP2P9
         7Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714116523; x=1714721323;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bQN8/UbBy3MmM39EDkYS+s0OQ1C/BvZXG41UzO/WguE=;
        b=GCWAg0g8NIhpk2blxhUjBaGLPnP7C/VEacIjwJIToorR3jnOAF7iWDAGD4Oy/m5AiN
         z/GFaZWRUPqLzPApxlRhxr+wmcYTmmbhjikHLaZnjWAW7xynIWx1sU6Buka5Vl1S/IVU
         8uhSq+SPXhdNtIT3LJn0KTeKVfl8vGC4ZkkwZ0pza2kM15vqDz07Sp5p/GLVHcUadFhb
         IT/EiGM/e5rsS4eVkl160ZYjAJzE8OEV8z6WCpt/nK65XsaQnhpyeogJJMH2i+ykEjbP
         LE+R6ea5IF2ru3LwVyaSjhKgPxIeHJJMezX0LGUEZmb9tWvZWRiWS5ABAXj0aDkKM3SO
         qgTw==
X-Forwarded-Encrypted: i=1; AJvYcCUXqFtiAWPAYGhtejVRuZauU5u+9ty6R2KccY/uAhZxZtNkj4uDdl4q1lg4nOZJHgIf1WCkDk2MGJFx2DokjShe+7T/UWucUX8rF2SsuS7gavfwciLqyCjLhgIsnBp5e/D0YKy/JC5dYAaG9T1IrzUDpgrg7hBttZ74cHZCPZBo8/H+sKOebmJlf64=
X-Gm-Message-State: AOJu0YxqxySzKnNyKZ+Lt6MKW0pMGpg/caKmW7UeH5lCKzuDSRgLAv8S
	/4MA0zQJdiY0XkTGth1wQzy7UjKQp/bEJgS4mrOijTW9xpMArZenMaeK/g==
X-Google-Smtp-Source: AGHT+IGXonUFOPFh5I2gbId12buogfqlKNkXzpuocg1v+uin6zNh1oqwp54qZtY7Dkp8fhr6cmMG9g==
X-Received: by 2002:a05:6512:340d:b0:519:796a:26d2 with SMTP id i13-20020a056512340d00b00519796a26d2mr1195502lfr.35.1714116522573;
        Fri, 26 Apr 2024 00:28:42 -0700 (PDT)
Received: from [192.168.1.105] ([178.176.74.23])
        by smtp.gmail.com with ESMTPSA id c7-20020a197607000000b00516c51b3e29sm3061211lff.143.2024.04.26.00.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 00:28:42 -0700 (PDT)
Subject: Re: [PATCH] i2c: smbus: fix NULL function pointer dereference
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Baruch Siach <baruch@tkos.co.il>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <e46f56f4-f28f-4fb6-4249-554059f9fc2f@gmail.com>
Date: Fri, 26 Apr 2024 10:28:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240426064408.7372-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/26/24 9:44 AM, Wolfram Sang wrote:

> Brauch reported an OOPS when using the designware controller as target

   He's Baruch... :-)

> only. Target-only modes break the assumption of one transfer function
> always being available. Fix this by always checking the pointer in
> __i2c_transfer.
> 
> Reported-by: Baruch Siach <baruch@tkos.co.il>
> Closes: https://lore.kernel.org/r/4269631780e5ba789cf1ae391eec1b959def7d99.1712761976.git.baruch@tkos.co.il
> Fixes: 4b1acc43331d ("i2c: core changes for slave support")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

[...]

MBR, Sergey

