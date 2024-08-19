Return-Path: <linux-i2c+bounces-5553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C8A9575A9
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3333C283396
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5CF158858;
	Mon, 19 Aug 2024 20:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sx7OahjE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC0C158216;
	Mon, 19 Aug 2024 20:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724099479; cv=none; b=s3ZWv6DiYaU/mO1fyeuyt8CVj0pZyVLtQsHZzGpNSwz0JIsBDhs1CZA51xr+jzCTgsrnmhNwypziuI2Us2elZrj6M2vsyCqRnNidwsa1Y3DXMphXDNWp810fR9oClEs/uDDbpP7Xk+NBzK6JdWM2KXx9IVDa+pgXfi7mxk7FHrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724099479; c=relaxed/simple;
	bh=oCmoOhqRG/UpSE5QjX5/1IwargPDbVoT9EUID1D0lWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvsN3zhrwKBBG2trWW6FcOKF4g0NOG8rU/6AaBkkzp+bCQDgw6jJ0aG5xtBHRhoHlDmNHabLZ55YMH9HokpcgWhtQ5Cdjj33TFNCjFcrF3fFdOVVlOVLFHwLFo3bGfMS+7H4AhNMbjXcfUoJbHvp4V1V8CrSQQiH5kAjpvujgWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sx7OahjE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DBDC32782;
	Mon, 19 Aug 2024 20:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724099479;
	bh=oCmoOhqRG/UpSE5QjX5/1IwargPDbVoT9EUID1D0lWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sx7OahjEZRYeFtscL5dOL0uE3/HonQZNwiM44+7j+7dggpd33gkgF79JiOxExWJ16
	 GBxYjjTJ4rPajfaFaWLqmYqVXOnnphLqtVAHChdlOYQWS8o2UxpToOOqHi+Dmtqtn/
	 IFVABjfXFyjHC8WQHBIBENXJAn7n7mDH196o3hLxmbVMsF7L9m3ikTk7laEZNFmZB7
	 DRSv8ZRIukDKzGCGUrHwwWIU64K5Hxp8xFr6UvhD48ua8/wcejln/hKX64pmaOWgUC
	 /FYSduFUy38kgzaPLuzyxikBBGtdMTfiNe4Bivh1Hpan3zUc25tr2Dqd6CQHfU5Qdd
	 77s8xMLxE3j3g==
Date: Mon, 19 Aug 2024 22:31:13 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Yuntao Liu <liuyuntao12@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH -next 0/9] drivers: fix some module autoloading
Message-ID: <cqvebznbtkryilyd3z6m3lgppwrollf2klyi67mrf4y3mzdq4l@cz2v6efhq2bd>
References: <20240819113855.787149-1-liuyuntao12@huawei.com>
 <dabde7bf-dcff-47c6-a68d-f5018ab00282@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dabde7bf-dcff-47c6-a68d-f5018ab00282@app.fastmail.com>

Hi,

On Mon, Aug 19, 2024 at 02:09:49PM GMT, Arnd Bergmann wrote:
> On Mon, Aug 19, 2024, at 13:38, Yuntao Liu wrote:
> > Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> > based on the alias from platform_device_id table.
> >
> > Yuntao Liu (9):
> >   usb: ehci-mv: fix module autoloading
> >   soc: pxa: ssp: fix module autoloading
> >   misc: atmel-ssc: fix module autoloading
> >   i2c: at91: fix module autoloading
> >   mpc85xx_edac: fix module autoloading
> >   dmaengine: pxa: fix module autoloading
> >   dmaengine: mmp_pdma: fix module autoloading
> >   dmaengine: at_hdmac: fix module autoloading
> >   ipmi: ipmi_ssif: fix module autoloading
> 
> I looked at all the patches and found that most of them do not
> use the table any more, or will stop using it in the near future.
> 
> I think your work to validate the correctness of the entries
> is useful, but it may be more helpful to focus on removing
> all the unused tables, including those that have a
> MODULE_DEVICE_TABLE() tag.
> 
> If you are planning to do more such cleanups, maybe you can
> go through them one subsystem at a time and look for drivers
> that have both of_device_id and i2c_device_id/platform_device_id/
> spi_device_id tables. If nothing in the kernel creates a device
> with the legacy string, you can then send a patch that removes
> the old device ID list and at the same time makes the DT support
> unconditional in case there is an #ifdef CONFIG_OF check.
> 
> If the probe() function accesses platform_data, this would also
> be unused, allowing an even nicer cleanup of removing the
> platofrm_data path in favor of OF properties.

Thanks for looking into these patches, Arnd!

Andi

