Return-Path: <linux-i2c+bounces-3031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBA98ABAE6
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Apr 2024 12:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3509F1F21C8D
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Apr 2024 10:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB1617BBE;
	Sat, 20 Apr 2024 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i168r3qq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68491118A;
	Sat, 20 Apr 2024 10:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713607455; cv=none; b=uUOjz+YW9jJnHBnpgOgBlN9Y8H/qIs/eu/JkWYaHfRykB1LLF/0jogP0cNXImdoD3rClpQTpiFW4T7ZARbleAIVwPI2Uw4+F+bs/2IW5WfVuof3uPVnmLzLSgAJ7TpUjGfg+k6bi7exWsnVVrSl2ZKcS6ej3fXyL+DDdlS5HI5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713607455; c=relaxed/simple;
	bh=gQ3vuVn4istjWpdMlnw4Q4aBTLHGWO/MOkIZnCPASgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A6/OCaGmXmRoRUPVmZ0oKKP8y6T+0uK3w0lGsEbtxh03w+ovOQ9dulga0zxSLpDat1LqZZggaz0CKwjIHRPxSO7ibqWnbtqBD8wEMGexPeTyNeTbHh13JQHnwHox/txkfXPi5+qw/OubGAcZ8jOLjaWwxoLHUsUb8w9nTzyKje0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i168r3qq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A29C072AA;
	Sat, 20 Apr 2024 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713607454;
	bh=gQ3vuVn4istjWpdMlnw4Q4aBTLHGWO/MOkIZnCPASgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i168r3qqiWPRHTcg2K8sOxa+4ZgdV6FP4PkwdiFNJF8JFqUDJHOh3qvRIQF5P+Cjk
	 +p13JMih2Bn0zIiiqm4b6QSyB9sgX9ubMLJj+pOR/6nfCNRaaSVBCaGk4G9BYD4mca
	 ZoMTrL4ej3J1Bo1prXXP1paK3+nNFovglUHaUD9Q=
Date: Sat, 20 Apr 2024 12:04:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Daniel Okazaki <dtokazaki@google.com>, kernel-team@android.com,
	linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] eeprom: at24: fix memory corruption race condition
Message-ID: <2024042055-bucked-dosage-2a8d@gregkh>
References: <20240419191200.219548-1-dtokazaki@google.com>
 <939095cb-b9c0-4214-9429-7b45f9a31f36@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <939095cb-b9c0-4214-9429-7b45f9a31f36@web.de>

On Sat, Apr 20, 2024 at 11:11:05AM +0200, Markus Elfring wrote:
> > If the eeprom is not accessible, an nvmem device will be registered, the
> > read will fail, and the device will be torn down.
> …
> 
> Can it be nicer to present the introduction for failure conditions as an enumeration?
> 
> 
> > Move the failure point before registering the nvmem device.
> …
> 
> I would interpret the diff data more in the way that a devm_nvmem_register() call
> should be performed a bit later in the implementation of the function “at24_probe”.
> How do you think about to mention the affected function also in the summary phrase?
> 

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

