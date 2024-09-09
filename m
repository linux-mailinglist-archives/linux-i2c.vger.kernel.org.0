Return-Path: <linux-i2c+bounces-6425-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AFD971FCE
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93357284A5E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455D416DC36;
	Mon,  9 Sep 2024 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzYiN1oO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B910518C31;
	Mon,  9 Sep 2024 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901293; cv=none; b=cmcTO2YgjHYnXgCtWWyy1V8lisn1M2Pt86OCwYK65t4oeAdyURcS7zSXlJUMb5yqmb62adfpQUAmn/Gi8OYutL7HKwXqqEpb9s3sYbiBUP68V5HKyGdiVqPPuNrNdfXkQfTk/3ihB/4W6XiSi/g6wrK3A7Sn5ezy9DuSsAIDtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901293; c=relaxed/simple;
	bh=XIg24sbEs73hzfTMQRdcVN0MWn8L1QpegvxT2SpoNrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vjevn/EVW7m41Is+GnCGCVRWX8pOOts3uwf57WsL8RDDQMJvsH8/DEEYOpvZfUK9JStEtOKZPmLAM7a5yRpVijUeze8wAdUa/Jy68cD7fR8wyEN9oHR7X8uVi6p/4MptiHQNpZWp2LhVfNd+ZbKtFD/R/LUc+c/Orrx7m1olnPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzYiN1oO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-205909afad3so45289485ad.2;
        Mon, 09 Sep 2024 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725901291; x=1726506091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLIg+5L5gv3/bdzSEY1QSKFKrcZjtNmVPHeNiLTYSSg=;
        b=DzYiN1oOu5uud4dQNy4IqkWgC2oqMFX4SWmRpz1oWNg4t++dHdk2q6yLz/L2YJYupu
         HnSNHnp7y4qCzo+SVbmK5c97EyFf29JOrvWtwWVavmcCqqSYyyCSdwEKPoo9GGRO7S1V
         ByW9zih9QiqBeS1GMoMiYroC4fRD+9ki/HGFwknCVKPVc8Eg4J1cJzjiZ+6kVAC8Wd3n
         lUO+rwQQH7KDWbkGIE4zWW8wKonE4Gafe81lbXJ7nKmHBIkfldYVEm78kanD+j4h0hrG
         lNiLdYxBoXqXYOjAccGiE9JGwkkuyRrVjA/RugqIy50SpKMDMvV1A6tWGYSIy6BbD47k
         GZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725901291; x=1726506091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLIg+5L5gv3/bdzSEY1QSKFKrcZjtNmVPHeNiLTYSSg=;
        b=hvHsne3QeX8+p9aCxLRJVkj2wcdehqilFrGSpeRbJACLT+79TULg35XjV8pd8j5aQx
         8Owv20U3e5lRZFXvDRA99gKd4KsE9lt37qS0xnt2pG0ngw2j2lFpoeIAtXZN2G0sStEM
         xj8gObUTZ5g4XEzDzSN4LlCLWj51jprspE8WaMd3HHAQx7/UZM8N9ec+txVh23Od/Bz8
         DTXop+pwcxbwKARRygtCl7aYUuFwAj4R+NATFR+vCwBdd/fOfBQLa1GDfdVp15A96lbD
         XqkE43ZVxlp+8e/sAiM3qKSVs6zWL/v2Su3ewYvd34HQPIZtc7Ov8Vj2bM+fk4f7gq98
         +Whw==
X-Forwarded-Encrypted: i=1; AJvYcCWSayvXirCWZN2exisYOzJCFcKS5po1zAQjvSgr0hA7Yb6DPcnFelJ8JsBc9XbjECcSXbzIqBZPyy4n@vger.kernel.org, AJvYcCXWLJ8tHQrz7U/hpMgQEc04UdF84tw4ywyHQXtc+uT9u+7S7frw1PtNN2bONg4lp0FiGRyLJnm1yTxrDxQ=@vger.kernel.org, AJvYcCXqRPMvR7TQfS7JHNpiX8rWSiHMwzLHXB0kex3XeHb90oQ69fLp6lYkiJTaBbQsaNWHHsILlRgCc9uzvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6HGb/F+EeDao0kRTiyHSzLSSxVywxznJQgD20WCXKUORAjBYR
	mmsABqEqTHZcCv4yndwPfTKsCrduhpSv/aa5PBhl/J32cjiI9Y+7bq8Fyw==
X-Google-Smtp-Source: AGHT+IGKooD4YIcuSg5wGY0spBF2POYtw89PH2z4I0O/zG+w6FozrnpjzvsgLgtZs+1JCbcVtoLahA==
X-Received: by 2002:a17:903:41ca:b0:205:36dc:c3d9 with SMTP id d9443c01a7336-2070a56c953mr96972505ad.33.1725901291035;
        Mon, 09 Sep 2024 10:01:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e11f1dsm36049625ad.61.2024.09.09.10.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 10:01:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Sep 2024 10:01:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, bentiss@kernel.org, michael.zaidman@gmail.com,
	gupt21@gmail.com, djogorchock@gmail.com,
	roderick.colenbrander@sony.com, savicaleksa83@gmail.com,
	me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
	wilken.gottwalt@posteo.net, jonas@protocubo.io,
	mezin.alexander@gmail.com, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 15/15] hwmon: (nzxt-smart2) Use
 devm_hid_hw_start_and_open in nzxt_smart2_hid_probe()
Message-ID: <c0804473-97cb-4404-9a5c-fab933f31747@roeck-us.net>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-16-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909012313.500341-16-lizetao1@huawei.com>

On Mon, Sep 09, 2024 at 09:23:13AM +0800, Li Zetao wrote:
> Currently, the nzxt-smart2 module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the out_hw_close and out_hw_stop
> lables, and directly return the error code when an error occurs.
> 
> Further optimization, use devm_hwmon_device_register_with_info to replace
> hwmon_device_register_with_info, the remote operation can be completely
> deleted, and the drvdata no longer needs to hold hwmon device
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

