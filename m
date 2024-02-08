Return-Path: <linux-i2c+bounces-1664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3184E5FB
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 18:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2B841C25E99
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 17:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E64A823A0;
	Thu,  8 Feb 2024 17:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iO7CbOOQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBC8823A7
	for <linux-i2c@vger.kernel.org>; Thu,  8 Feb 2024 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411784; cv=none; b=iczZrffecXmUDOQqMLnRzhczOsPf0cNsIkbrlDGdrYDUEcqfL5yzu6hGvJk6Us4cAYqNVZK5srlZMMo/KyFiV6NdPEPB6d9lbsde381kFi/qRNry+YL2fOS3UIdcS+gRtA8jmxXXv62aDD7sKxTHc0zyN3/WiKLQKaElPtdN1j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411784; c=relaxed/simple;
	bh=k9dyZNdwG/xu96Yo6cbmqlB40UzfxIYAGsRMM5xJO+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZPV2RAHuWxXU6Jvj0bqLgfaRZOy+wW2S64GFhnFf45JWxXR/HSBYeN2NvxD6Bp7B7XzAnwGFi9dIkiqJlMtzLHIwxF7zI3+IuOHknAq65XQa8fvDpC16O256fh4JUf7c2kxAotK1DaH+O0ReApK7B4nwQ7cZyG3BXUWoX0l+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iO7CbOOQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B750EC43390;
	Thu,  8 Feb 2024 17:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707411784;
	bh=k9dyZNdwG/xu96Yo6cbmqlB40UzfxIYAGsRMM5xJO+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iO7CbOOQNrSkWoKASmw3qv5h+xVhgv/MhOMd4B3CGw9Z3mj5iVhkXk9Ld+bY0xdzr
	 XhGzGaNxKk+5DyJ1YiiBWPQWuR1MJCatarcTYTW/ZC1i6GpMjlZQBtsQ4nfeTSZwU2
	 fCgPgrkvREU9v68nLrrA74QLXWFpHUldOt8HsH4rX6+4IPrXUTLKvJBwX2/nb5S282
	 xdqCnXKSFb5IIYfNoJoog03lLaeTwoqehGrBRNKsgw7/sVNXcrZgSYde6+LAJRKsVY
	 ZlzYYbnMEvP65OL3r2nYvEsYqE1cDC03vspCKsYByRHjhlw9ErpIS7VtWDeYKonwLI
	 kfpAZYuNToPIw==
Date: Thu, 8 Feb 2024 18:03:00 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 3/5] i2c: i801: Split i801_block_transaction
Message-ID: <7o7kxgm7mnfy2ouddeqfjpaqqhvhwvwlvcdfo6obr674yltve4@ulqmfnyjmewt>
References: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
 <7dab4b92-c8b1-4e2e-b057-af4e8e1d7631@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dab4b92-c8b1-4e2e-b057-af4e8e1d7631@gmail.com>

Hi Heiner,

On Fri, Feb 02, 2024 at 08:02:55AM +0100, Heiner Kallweit wrote:
> i2c and smbus block transaction handling have little in common,
> therefore split this function to improve code readability.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

I checked it again and looks good. Don't know why I got confused
last time.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

