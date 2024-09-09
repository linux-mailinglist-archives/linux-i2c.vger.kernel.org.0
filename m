Return-Path: <linux-i2c+bounces-6421-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A82971FBF
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBEB71F2401E
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 17:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400AA16DEAA;
	Mon,  9 Sep 2024 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldcV8uks"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A631581EA;
	Mon,  9 Sep 2024 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901210; cv=none; b=K3e1xtovhZxy4zrCqFwcL8OrhOQaLiC3o1ts/lL8efFAqdBoISUa1EKU2HrcRkJD4wg6Z1HmPpkxncKaDqngrd18HJbfsILXkLKipP2kleTt1Rmwjh7VYBzDCb7I6cn7jMb+RKG202iq02bx/nxPQ0qzvzzQIuw22qnRwozinhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901210; c=relaxed/simple;
	bh=N03+95cTpVsgue2F4maTnrzxhEu6Aq2SDitQT4owEUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TY9j5JgwOxlG4UJedZsnTaehnK1KI4MOyqmRq8JtLGta/6ag8lxRb1a9wlmmgjP3oe39gdE3T4o3XOUgxkfUGoRAngaYyw9m83Qqpw+Geosn4zsP89z/dNuMuTgYJjSXBqdppYNpe8rFXrURqPoDJSDHaR2norvwlFaGEo2UoL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldcV8uks; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-718d91eef2eso2089469b3a.1;
        Mon, 09 Sep 2024 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725901208; x=1726506008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8YyK580kB8PC9JtiaYtSAzWfa3JDlQNPzchdbMy0tU=;
        b=ldcV8uks+dSiWYcfcK5k/trY8R0FplqA9kxl9DyBIIU6iG+xoY0iPupdSZ2y6XBid0
         99TOmT9fW0Is8bbSTUgJAjVjf3jAfP0HuEaBMQ+4FFSRuun1Ay6R+5q2xkBmF8DD2YKb
         HYyJ8nf0d1UgmhA7XR+9kO57LTOmIyFzVZl/OLjHIVxuL77su+C2pzkERig2/XZOTtBB
         S29LxuUKV0v/kWTQ68l6ALLKsu9aNIMSs5kT4mK9PigF2V1teqxWkpfs4LjfNMr0UVZh
         By8UFpZT3xpZpxAovHcvMLBe/WpHncKf0afG8vob/xdLGVWqqwcIk2OuOyvhR3ntrbeN
         xwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725901208; x=1726506008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8YyK580kB8PC9JtiaYtSAzWfa3JDlQNPzchdbMy0tU=;
        b=K4PCyrQpB7D8JSJVq2IyA90vGNncvb4MAd7VmB+H1UXWRWgpdT8bjRcGAEVUL+G838
         0l/SnO31LOemhatL3cP73Ij5TYj44d5TLZT+0rF7T/tYOEDJ0s4gsTGF2PkgYwcgCsL4
         wqTOkS6M6t6ZMrnGlxBYPeoNUg0HC+x5lkyWlACw6XGhU7o0HZ/fZYBGy8HGTmpEZXpY
         0Wur5evWyO7/fcrgNMiubx2Chan/VzuSFRRLNtCa/wuq+G2VGpvJlWOtWWn8dacX7fB7
         zRaEdqeQ/WXWRduYHzuwaKHYTVECQlmtCzGmdSZb16UohkpWoeCPd+1yLB5/0WTmrdv8
         1/ug==
X-Forwarded-Encrypted: i=1; AJvYcCVHjXRFQVg5+AAUFuyPDM8To/bMsICX4oODVUqFif72SwHkGcpqnIRQvFgt06b/3L3cUFbmIxVQRF71FA==@vger.kernel.org, AJvYcCVgQK7ztXEDQXhj09ak04B7X3Z2WKQ7raS/E09Z0EcPDNHjt4N0+9SoyFCoqZkUsBweRzQEX+5eQ1ZW@vger.kernel.org, AJvYcCW3/LRTWGeCgVeFsTKKxxrdLNy6RrVCw8dvU0hbNMtcwJ+aCS9bfvuZqBmNyNWXxeJeDf8/RkK+uqbHJG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNn1wQLGfSr35SC+biTAanBfRPVkJqSgR96d63gcdcSkv58390
	ZkHQuZ9FyE1qspBGJGCh/LxJfyJil7Oy/KHe5zMmpY240zLw1G3S
X-Google-Smtp-Source: AGHT+IGfgfxbZoezdTIOodzwxSE9lLsr7FxeThO6zMkUBoWbfjXusePP4NF87BsZEomLShoLZ7QSTA==
X-Received: by 2002:a05:6a00:2f9b:b0:718:d4e4:a10a with SMTP id d2e1a72fcca58-71907ea941emr382532b3a.4.1725901207606;
        Mon, 09 Sep 2024 10:00:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e58cd628sm3729498b3a.83.2024.09.09.10.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 10:00:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 9 Sep 2024 10:00:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Li Zetao <lizetao1@huawei.com>
Cc: jikos@kernel.org, bentiss@kernel.org, michael.zaidman@gmail.com,
	gupt21@gmail.com, djogorchock@gmail.com,
	roderick.colenbrander@sony.com, savicaleksa83@gmail.com,
	me@jackdoan.com, jdelvare@suse.com, mail@mariuszachmann.de,
	wilken.gottwalt@posteo.net, jonas@protocubo.io,
	mezin.alexander@gmail.com, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH -next v2 11/15] hwmon: (corsair-psu) Use
 devm_hid_hw_start_and_open in corsairpsu_probe()
Message-ID: <9a9c743e-b6b2-4b54-8651-26ae39cefe67@roeck-us.net>
References: <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-12-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909012313.500341-12-lizetao1@huawei.com>

On Mon, Sep 09, 2024 at 09:23:09AM +0800, Li Zetao wrote:
> Currently, the corsair-psu module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the fail_and_close and fail_and_stop
> lables, and directly return the error code when an error occurs.
> 
> Reviewed-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

