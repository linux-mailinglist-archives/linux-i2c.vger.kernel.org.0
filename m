Return-Path: <linux-i2c+bounces-3088-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2138AFD32
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 02:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673EA1F22EC9
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 00:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9194B803;
	Wed, 24 Apr 2024 00:11:09 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26307EF
	for <linux-i2c@vger.kernel.org>; Wed, 24 Apr 2024 00:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713917469; cv=none; b=g/A1WLrmuhVAPTqxaLyCMMuUhPwTK92sh21ZvT2oX+LlJew5V1FGGWVfMgPqxe++YSsviM2dRsn6YHIzx69jBKqZQlL5qH0luatD5+eyQGps5BkDDThFzHMqAudTfhPE2NenxI/lHhIBKA/Aog//Ld2S8Hao5ciyomsXjutgvDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713917469; c=relaxed/simple;
	bh=v97JnFigdJQ9lbLuqbnZwJGG1k8S71/PRqmW3bvb2LY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYWhfn3rD7GESAXeLLdbRjlYuUid3f+wvUOvbVVD8nOLSifGy/O05th1zXqz+Ve9ZjkrrQyCpBLaZJVEXhGIuV9KutyFAM3xZXtpLsN1JyH2394eN8u/8GQj/7PTIaAtmrzde/tF6awtlfQgzM2+58FyJvGvktmuQrJ73bFxjlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 247e3573-01cf-11ef-abf4-005056bdd08f;
	Wed, 24 Apr 2024 03:11:05 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 03:11:05 +0300
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/18] i2c: i801: remove printout on handled timeouts
Message-ID: <ZihOGZ3ldzWRb7y7@surfacebook.localdomain>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-26-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410112418.6400-26-wsa+renesas@sang-engineering.com>

Wed, Apr 10, 2024 at 01:24:20PM +0200, Wolfram Sang kirjoitti:
> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The controller
> should just pass this information upwards. Turn all timeout related
> printouts to debug level.

As I mentioned in reply to cover letter this change does not seem to me right.
If you provide an equivalent dev_err() in the core, I'll be totally fine with
it.

-- 
With Best Regards,
Andy Shevchenko



