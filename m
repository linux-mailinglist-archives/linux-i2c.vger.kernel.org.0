Return-Path: <linux-i2c+bounces-8057-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2097C9D2F1D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 20:51:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA396282ED3
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 19:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A371D1E63;
	Tue, 19 Nov 2024 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcCYWmSa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38081CF2BD;
	Tue, 19 Nov 2024 19:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732045882; cv=none; b=A0BGSHjG2/u7s142L4WtiZZaLvv+3mrnYp/cHwHkCbQ6LZSLzwVotWWt3M6EuQmioajv/uaDuZejnTfydfrLj6lhtc+8kP3tqXDoJcu85Jxrws4kqFL+1m3TmmygxZ+V4P4V3wMej0lx1cDQj6ZZCDRkoW88JOGEFbkQw5/KsS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732045882; c=relaxed/simple;
	bh=CP7GeHYh1tm06iAkA9ey3zTxerSkSP4ApCcyvAC8PCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izXn2eRATkel1SfuGfRu559YeHkGwyrKqJyito7zojaO68xHu8oczuTZXAWDcS76fNmkOjZM2Hl1LBk9hgtt4bErOmhu78mlBR5s8pSvp6xRrTHMW7FdJbvcZGhzUw2Yc273/JOCDGG1aMtslZORUDQURpbe9bDQ+6JjnqlCt2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcCYWmSa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2688DC4CECF;
	Tue, 19 Nov 2024 19:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732045881;
	bh=CP7GeHYh1tm06iAkA9ey3zTxerSkSP4ApCcyvAC8PCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcCYWmSadOhqVH+fZSKCtOfmAXfQq232RTsZcb3YU8hrHZVpj45QhItsNvAgsV+sH
	 iSsHiljax6l9/qxDRjiqQrccusSekQHmZHVcErkWH22xMf+XawgjAzVJZ+JILdob2M
	 URn8Lu1GubAYbSm6+oLv8/12JZHRCzXqynyPqNN2QjskM1h21PmJ4mCtR7In10yypA
	 8CbIXqXPMlWeHEJ65MmTjuNt7dKU2lhY2TkdbhYNtBqe4QII4jV3QmUVdm0VPzv8vU
	 LRMny11xvw0C8e5FzuAf2O83dqusy4c1UHA6VtUs/RKoyaxXd3NjOD4VOQMpdfG9RB
	 zdkamKH8hontA==
Date: Tue, 19 Nov 2024 20:51:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Liam Zuiderhoek <zuiderhoekl@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i2c-core-smbus: fixed a whitespace style issue
Message-ID: <jqidbstpdrn7k7w55rwkg6e243d7r373qfjvz2ujzstcr5oda5@v2vxvsithtb5>
References: <2494788d943ed75741e6671e615f9e3c31cdc2ea.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2494788d943ed75741e6671e615f9e3c31cdc2ea.camel@gmail.com>

Hi Liam,

your patch is almost correct, just a few things need to be fixed.

On Thu, Nov 14, 2024 at 05:50:06PM +0100, Liam Zuiderhoek wrote:
> From 214adebf7cf37be941f208124fac9ea6bec0f1d2 Mon Sep 17 00:00:00 2001
> From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
> Date: Tue, 22 Oct 2024 20:46:59 +0200
> Subject: [PATCH] i2c: i2c-core-smbus: fixed a whitespace style issue

Why the header file is in the commit log?

The title needs to be written in imperative form:

  "Fix whitespace style issue"

instead of

  "fixed a whitespace..."

> Fixing a coding style issue.

We have plenty of space in the commit log and you can be more
specific on the coding style you are fixing; e.g. "use tabs
instead of white spaces for alignment".

Please read Documentation/process/submitting-patches.rst.

> Signed-off-by: Liam Zuiderhoek <zuiderhoekl@gmail.com>
> ---
>  drivers/i2c/i2c-core-smbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index e3b96fc53b5c..6829def15933 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -122,7 +122,7 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
>  s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
>  {
>  	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
> -	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
> +				I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);

Please align everything under the "(":

	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
			      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);

That means, use as many tabs as you can, until you need to use
spaces to align under the "(".

Thanks,
Andi

