Return-Path: <linux-i2c+bounces-4592-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369D92486A
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 21:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F56E289FE1
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 19:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05891CD5DB;
	Tue,  2 Jul 2024 19:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEuv8T5I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1913F6E5ED;
	Tue,  2 Jul 2024 19:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719948982; cv=none; b=kdCQde/t2shUzuSoB9C4L1QscsWREX25GQHatPhedEVTDDGDOz8/5ENH4RkzZ+gAPIb9/xJtgel0AD4Tpjel9JwPeUQuVJj16GhnV5hpaZUIHihPdwuQ21qACxih5mbQD6qNjcvbimfGvjdDNwvSH5nEqMH6pVvjwhzxC4Xn734=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719948982; c=relaxed/simple;
	bh=4gNcptxj/2rGixSFWTcb684lRGhblEvRPK3Wk9h2sus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxELzXL6/cOobAWUTr1T5fNWQz5k/9vkpeLkj35zNINBCO1fvt9Pu6E/ppmeu7Y5WEnH9NH3Cnoz6SUFFNDHkyFsAWTjslhJPHfCEPBu0J2u6lPIFDBykrwduGG87+WJxf4sKi7XNyCV87cqfJicLzIiL+D6CDHHm6b2S6H4yoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEuv8T5I; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-713fa1aea36so1934979a12.1;
        Tue, 02 Jul 2024 12:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719948980; x=1720553780; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1waVsGt32JK2Dm41Zb3NYQ/x719kWK5aWnQ191Xp6QY=;
        b=nEuv8T5Ipll4lfOxMcanwOdRxwNm0rRX9XYXxW6lW6KgfH5pWqQZDd6FYdT/gKik9G
         DKSRmRLoUr5q6PJq8eAWX3r938YzkJsKVWvi0KU8w51Vxos7UI4Q+khgPQ2MHltPrV21
         PsvaL1VVzu59WtM5lVo6Pl89O2sMkNbz3XeJFOE5+dia7veiBgatNsVCofWPRGZtcu+c
         0AhkUSqJNGpAVaefP8UeZcoyKQBfgaf0vtD10Seae1xSpSvUGYEqIqIg6lTiJGS63ykx
         cKjKytVxPAV/zsByxaugU9xxGFpuJSYbe9DTyqQY5S5GNShA7cG/p35+cvVuaJlIMYkH
         J6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719948980; x=1720553780;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1waVsGt32JK2Dm41Zb3NYQ/x719kWK5aWnQ191Xp6QY=;
        b=HMkgInG7I0fOsp/R46ERlBwbbbiw7/U5GHtpXY5zkOj14ot2ZBfMIk93bNg7TeM+LN
         rsMtkDZBbZEw3ISXAZtZobIV/8pNVFNgXk9mwLRtnErZi+VwVajEE9Nn+A3/jtwOQFPb
         XEBuUNrCnFUhLhQcAmuVn/bG5E9pkdA/spz642sctlRrvq90aT9AFmd2b+UER5qwTjY0
         BFvRRbaeGJYTkCunmcazjazVjPReKrRLYj+5wEgTg7qyus2DxU5lHyGYTUKMICvcchRm
         DIPk8wubWDn1nqrPf1RwjpMAwhUDihqiDR+gaQOhZCOOO1Vn/kfC0gkrZ5aicgeNvPkQ
         rhlw==
X-Forwarded-Encrypted: i=1; AJvYcCXriioAYbI7bGOwjZ6LJXnKedKlGJBcM2pn+/uEjzQqgq0pJABpYkpIzfyvTv1FnlQd/gCaSvN6JrkuqviTbNlbWgFBkWxXN0o06Y3ARcRdCsEcWSdeuYuclQflrXqlc74kc27usAAL/05gpkTxvbZe6oserk1CSl97exfzOrxiy0tJH+eyBx9vXpPftjsaUbFieg5XbHGXWYMUMUEutO+1TAuofkSYfIJdf+FqEuYkGUqO1xffJY/Qn8mC
X-Gm-Message-State: AOJu0Yzwz9Ex65LyS4Ti9U4eSukEmAl6ItLk+Lu+NPwNSG5ToWphaNhj
	IOodUrhr77o47aJyJM6t3aWOPhLPr+XY1C6sWLizr1i9wLzAfHzr
X-Google-Smtp-Source: AGHT+IEdfIeRLn7+PxwkGKVzfoUuvnPU6jw/fcQYursCU+Ex2woxO0j+QhFNDPJnHHfemcVSfTBHZw==
X-Received: by 2002:a05:6a20:a10d:b0:1be:ce69:ca5f with SMTP id adf61e73a8af0-1bef611b7f4mr9586475637.1.1719948980233;
        Tue, 02 Jul 2024 12:36:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce740c2sm9239300a91.33.2024.07.02.12.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 12:36:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 2 Jul 2024 12:36:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alex Vdovydchenko <xzeol@yahoo.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: add MP5920 driver
Message-ID: <7f573771-82fb-4351-b954-4a41ee0b3cd7@roeck-us.net>
References: <20240702115252.981416-1-xzeol@yahoo.com>
 <20240702115252.981416-3-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240702115252.981416-3-xzeol@yahoo.com>

On Tue, Jul 02, 2024 at 02:52:51PM +0300, Alex Vdovydchenko wrote:
> Add support for MPS Hot-Swap controller mp5920. This driver exposes
> telemetry and limit value readings and writings.
> 
> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
> Reviewed-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Guenter

