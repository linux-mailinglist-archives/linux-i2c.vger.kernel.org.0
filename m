Return-Path: <linux-i2c+bounces-13118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF719B96756
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 16:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 150A318857EC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 14:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C470243371;
	Tue, 23 Sep 2025 14:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O34B/IPD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17311F5846;
	Tue, 23 Sep 2025 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758639365; cv=none; b=rO0rCMl0UKegw8XFVYcpnC/yhN/IM9fjCqpUAp/Zgl0yCM4kV4VA9z933Y4v94Zcg5gC9ffGmLkXALLl3/Gy2FczMnzBN5Cr/kEsDEr2Ckbl3oyWBfmBDeNa0G/vUPEXi4icVpaZdEW2eWODA2N242NvTiVM2D90rwhvcnsEIEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758639365; c=relaxed/simple;
	bh=MoXjVlt0WBE7xSK96L7q8KbIH1mstZG6HLYfNKt3okI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0pd3F6xn9dKZ4KeWJ9P3lds/5qR4h8jAup5s0EJ0GXVtIlEJcn8p5ev8gbfZrgp86dotw+p0uaYgoLqAgSKreijM7lUAR3fhlDlH/BNp1vz1btHiydfuMUS6uYgb/oFkLdKRL6KA0D+NIlPW1uc+VsMzWuwVlPEvCOOz2AJB60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O34B/IPD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04ACDC4CEF5;
	Tue, 23 Sep 2025 14:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758639364;
	bh=MoXjVlt0WBE7xSK96L7q8KbIH1mstZG6HLYfNKt3okI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O34B/IPDGXBNo6VC+/5HZGXD0po1bpFY3PFcPBoBy6TWjjJzy1oO7VY7zh1NLDP3C
	 XyJAYr8Vj6/XBSGtXpe6mIK7huO7z99GT0UhMJtxhlu9Ke053Alx/cOMAPwvCqN/GD
	 NrIYVbFwyhYD92AJf7iKE7XUHTgYier+I1QyQE2w=
Date: Tue, 23 Sep 2025 16:56:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: Michael Zaidman <michael.zaidman@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] HID: ft260: Use sysfs_emit to write formatted data to
 user buffer in sysfs show function.
Message-ID: <2025092316-pasta-parachute-737e@gregkh>
References: <20250923144926.307315-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923144926.307315-1-bhanuseshukumar@gmail.com>

On Tue, Sep 23, 2025 at 08:19:26PM +0530, Bhanu Seshu Kumar Valluri wrote:
> Inline with sysfs documentation, sysfs_emit is used in show function
> to write formatted data into user buffer. sysfs_emit is already PAGE_SIZE
> aware.
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Note: Patch is compile tested and verified with checkpatch.
> 
>  drivers/hid/hid-ft260.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
> index 333341e80b0e..8677bea46bea 100644
> --- a/drivers/hid/hid-ft260.c
> +++ b/drivers/hid/hid-ft260.c
> @@ -826,7 +826,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>  	if (ret < 0)
>  		return ret;
>  
> -	return scnprintf(buf, PAGE_SIZE, "%d\n", *field);
> +	return sysfs_emit(buf, "%d\n", *field);
>  }
>  
>  static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
> @@ -838,7 +838,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
>  	if (ret < 0)
>  		return ret;
>  
> -	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
> +	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));

There's no need to change existing users in the kernel for stuff like
this, only try to do this for new sysfs files.  We've had too many bugs
where "simple" changes like this cause problems (recently in the USB
core for example.)

thanks,

greg k-h

