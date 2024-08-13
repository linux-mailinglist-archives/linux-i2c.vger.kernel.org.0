Return-Path: <linux-i2c+bounces-5331-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2765095015D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 11:40:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930CAB26B84
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 09:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F5617E47A;
	Tue, 13 Aug 2024 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FH2Pyurl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B541917CA1B
	for <linux-i2c@vger.kernel.org>; Tue, 13 Aug 2024 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723541996; cv=none; b=a4Ywq69vFAiAPHd8RV6EWfsrBo0NiSLbsSx30OiuspXTE7GgpWQl83j/lTGPgj4eeCXlxbNzgef8QQWN2tBxGeCXgF/4SVcnqorsxp8bgfnC3IweEHpz9JAfpqkiDbvBxdiszlKZOvYa09t06wId9P4zAUHEHPux3Dj104mE+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723541996; c=relaxed/simple;
	bh=LjVvlBmH2PZZhEuwxNDRuxBaEsv4VzFmKw4zvPORo78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4SLWwdLkK/8mfWi6SB9CG2ULh1sCFkXrWdn0/5LKFe0F9H1PnJvsSmgai9xTTLzq6+k7URwo9mzwNgrwnKZaOKTjm6iiKfDPflM+HVETU59L6RJFP7cbkRJ4YFCtwvhCvdrF/86NFPUcBhyqwgor38ABVz/TkQV0irRwuGdf1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FH2Pyurl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E73C4AF0B;
	Tue, 13 Aug 2024 09:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723541996;
	bh=LjVvlBmH2PZZhEuwxNDRuxBaEsv4VzFmKw4zvPORo78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FH2PyurlbR6y5hQ/BEjZ4nJC8YNkQqCcenjhBk1CjB1FsjdJ16BhwbZ0SxDMZOunI
	 nWRchrh80GistTDXe6D1gW9jmCTHQTPplpf/CyNDf/cq5PCoHYmpEMlOJX1Wetbjr/
	 l+A44Ew0MyyjTQEdLtJFwxUtz6k03/866PuZTITE=
Date: Tue, 13 Aug 2024 11:39:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-i2c@vger.kernel.org, andi.shyti@kernel.org, arnd@arndb.de,
	Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH v3 1/2] misc: keba: Add basic KEBA CP500 system FPGA
 support
Message-ID: <2024081316-deafness-flagstick-15e9@gregkh>
References: <20240710175702.22344-1-gerhard@engleder-embedded.com>
 <20240710175702.22344-2-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710175702.22344-2-gerhard@engleder-embedded.com>

On Wed, Jul 10, 2024 at 07:57:01PM +0200, Gerhard Engleder wrote:
> +	ret = sysfs_create_group(&pci_dev->dev.kobj, &attrs_group);

You just raced with userspace and lost :(

Please use the default groups for your driver instead, that way the
driver core will handle all of the creation/cleanup properly for you
without having to worry you about it.

thanks,

greg k-h

