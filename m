Return-Path: <linux-i2c+bounces-6422-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ACD971FC1
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4AA81C2258C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672CC16726E;
	Mon,  9 Sep 2024 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUPqzDAr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE39818C31;
	Mon,  9 Sep 2024 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901225; cv=none; b=ezeiTM9otUlAioXvZxvIJPcfTuVc88XNltMfcbGwh92NxtOgraPgZ63RdhNzM3hZ4syH/ygyWdPERTF+/cAqcpSQ6mvLJKwLNTKEbBgd5jfgoxegFq6fEv3gRdgzzMIDQTaolafOoDo7OT6kI1Zs1a4/+D+k6n8mjJ4Cv2/7v8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901225; c=relaxed/simple;
	bh=xPZcAlU5BUo3h3tHHniQZcyiscGKT8p/xH6tfv2FZ2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGtDBglriIvHdQa8PBZnFHm8BlnZdasOJPayHewjkaAKv1pMZmgJe4ks5O+vsXhxsnCgzHPXVrxgLgx43WFS9Op/TYNK7oBF1Ii2QEvcoM3EtlR/9IeZrzB6f1ARV3vTxeA52BrZirlTdzcsBUhToiPHDn5EznPQGErrQC2fxzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUPqzDAr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2055136b612so54716925ad.0;
        Mon, 09 Sep 2024 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725901223; x=1726506023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ef2CShHrdb63nVA09nN/x81e7anosXxLsfEMa4X9wUo=;
        b=cUPqzDArm/ad2yHEPPmQQvy0TES1uERAd5WJMBz48NvMOp2CAPag4bqO++suxObMz6
         KydU8D89y8xNQMP8ZbSpz0cfOUvyYz64fg6ikLp3cWrBDBMQwWtyyYYhd7vHfsVCWdkm
         vXhUUxYIKImC3gBibKwpx4oxHq8PEoZq4hl1wgswRH9+8faRRUZAJd7WXABl9fA/fCwv
         NdSIKNKfPkMCWQkI5qQbEoJh1n+eIp5HY8ZNdtL361QOpIwGOjxlSbKuvLsHHojThMsA
         lErHd4/+rCoXnZkU4U/+37uQc9ybnLADAEVHcFLiVmX97L7bIvKSmvlrOtmYNKvDCZxj
         TMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725901223; x=1726506023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ef2CShHrdb63nVA09nN/x81e7anosXxLsfEMa4X9wUo=;
        b=wefnZ3IsBIP10Qy4pCG+5mF30MJBR+f9TacRGoQktMaMlsz1C/T7YP9z4hf9uM4qCZ
         y9TVNRaXrbAp43OGSdV/1K/6HVZzR5AhDJN6OT3sRZ4s0275W4JwZyznsJAkHcJPWswx
         cyKraXQEHuHYE5toFPoT2Ac6otveMcpAFiPz8JeJzPzkyUVUWqZBiO3FUVZjcjHJlghN
         i1Depxz4UoRUnnBrojThi1tovnSZzwU2AgWx8W4mn8k5+xaXyDnaoiWrTdgDj/NCRZ1w
         rMmjRctv+y4rO9WoDPRDqconrVQcn3ersPtK+g2sSbcJhMdRXMTJ5P3aKAypHuoa18/+
         T4YA==
X-Forwarded-Encrypted: i=1; AJvYcCUiBbRstPO7TcK4LLaVldZ17WxuTfolPZ71KFKikoZWfaDSVJ6JWQ2wP+hTsmeO9Ez3vvQz5p+5kmxp@vger.kernel.org, AJvYcCVBTyp4DFtP1XgFMfCI3DzKgWEtqPh5gSwF6pVD0XVSviGYXi3Etg0HK4PYkTHiUuRqAJn6t3spve3m6BY=@vger.kernel.org, AJvYcCW8a14Do6FfesKh0FoaexmqWvWMUzpzrR0blBlDW7va2Xu8HCs/cY8EpjH74B9gVEyNm9JJkTIPqDYAzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyycrbi5sjr3cDdrMEcpOtb/NA5u6WDwwngxliuyrqcOk6Mo004
	dcgptCmMA0Cetaii3weTf98bwT03Z479UzYyaq1+IWV/+d/aCUKV
X-Google-Smtp-Source: AGHT+IGtYZSkf4zm+ly9Mw7S0zsj+paxizKsdmPxeYCfIRN0fPaquT+UwpDtTeExwgZSJpLgHLl7nA==
X-Received: by 2002:a17:903:22d1:b0:205:4273:7d65 with SMTP id d9443c01a7336-206f0525895mr173167315ad.21.1725901223017;
        Mon, 09 Sep 2024 10:00:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc31sm36224445ad.185.2024.09.09.10.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 10:00:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Sep 2024 10:00:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, bentiss@kernel.org, michael.zaidman@gmail.com,
	gupt21@gmail.com, djogorchock@gmail.com,
	roderick.colenbrander@sony.com, savicaleksa83@gmail.com,
	me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
	wilken.gottwalt@posteo.net, jonas@protocubo.io,
	mezin.alexander@gmail.com, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 12/15] hwmon: (gigabyte_waterforce) Use
 devm_hid_hw_start_and_open in waterforce_probe()
Message-ID: <787b6b74-35d9-4b5b-a54e-7209873dc888@roeck-us.net>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-13-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909012313.500341-13-lizetao1@huawei.com>

On Mon, Sep 09, 2024 at 09:23:10AM +0800, Li Zetao wrote:
> Currently, the waterforce module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

