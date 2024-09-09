Return-Path: <linux-i2c+bounces-6434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6277E97220B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 20:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 870B91C238D2
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 18:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E703178CF6;
	Mon,  9 Sep 2024 18:46:28 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from ms-10.1blu.de (ms-10.1blu.de [178.254.4.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAD22135B;
	Mon,  9 Sep 2024 18:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.254.4.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725907588; cv=none; b=cjHe6ISPV6J8+XCOOEehPmWeq15EoTtW0EJfasK1dNIsw7ueAjOTkxo/X+8EwVHNI7/iEFjqcM8TMDPM2zBlY7M3sP5uoTEQNzWTL/ankEYDebalKd+NYiEDfU/semDKhC9q3Elix5L2aVCI6WLRRNnjZyihkorZGbbuQcOkJwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725907588; c=relaxed/simple;
	bh=Wx7AIK2ZioMus69lkj3Mo6k06EKuG6YDmvn4P6xQqx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZuA5DP6NleIAoVp5kPGfFtbz4bKwl46B2X47hWKgOqlN7bGj4f+oaWz7eHe+wViLx4jrIDi44s3OOVShjLYy0MOAWtIKpOlUXFMkylUJn3bHNbLYlf3k0KX7aY0J+wFPkn41gLm1Z5yd76UFinpGjijGHzOG/kl2jIWvJPe+gDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mariuszachmann.de; spf=pass smtp.mailfrom=mariuszachmann.de; arc=none smtp.client-ip=178.254.4.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mariuszachmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mariuszachmann.de
Received: from [2.211.118.198] (helo=marius.localnet)
	by ms-10.1blu.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mail@mariuszachmann.de>)
	id 1snilt-00FCAO-CC;
	Mon, 09 Sep 2024 20:05:53 +0200
From: Marius Zachmann <mail@mariuszachmann.de>
To: jikos@kernel.org, bentiss@kernel.org, michael.zaidman@gmail.com,
 gupt21@gmail.com, djogorchock@gmail.com, roderick.colenbrander@sony.com,
 savicaleksa83@gmail.com, me@jackdoan.com, jdelvare@suse.com,
 linux@roeck-us.net, wilken.gottwalt@posteo.net, jonas@protocubo.io,
 mezin.alexander@gmail.com, Li Zetao <lizetao1@huawei.com>
Cc: lizetao1@huawei.com, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject:
 Re: [PATCH -next v2 10/15] hwmon: (corsair-cpro) Use
 devm_hid_hw_start_and_open in ccp_probe()
Date: Mon, 09 Sep 2024 20:05:52 +0200
Message-ID: <4919773.GXAFRqVoOG@marius>
In-Reply-To: <20240909012313.500341-11-lizetao1@huawei.com>
References:
 <20240909012313.500341-1-lizetao1@huawei.com>
 <20240909012313.500341-11-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Con-Id: 241080
X-Con-U: 0-mail

On 09.09.24 at 03:23:08 MESZ, Li Zetao wrote
> Currently, the corsair-cpro module needs to maintain hid resources
> by itself. Use devm_hid_hw_start_and_open helper to ensure that hid
> resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the out_hw_close and hid_hw_stop
> lables, and directly return the error code when an error occurs.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Acked-by: Marius Zachmann <mail@mariuszachmann.de>





