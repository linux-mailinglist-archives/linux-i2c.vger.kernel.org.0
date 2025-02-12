Return-Path: <linux-i2c+bounces-9409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DFBA32EEE
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 19:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA6213A6339
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 18:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F27C25E47E;
	Wed, 12 Feb 2025 18:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXalS4pN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F316025E452
	for <linux-i2c@vger.kernel.org>; Wed, 12 Feb 2025 18:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739386402; cv=none; b=f7ALCDyHPOXsT9AJWe8Xyco69My4/+zn4DvCESktoSpV+3Mb8BWvnbi2oWuiCPr1sZZvOTq6bmf/weLj9kWX9cZZJgpDafRabJPvHdyAfZnJACxhUKSHU58w6NGzBPam1EXNbGQc48awmhIweNuYKDyY3eQM9KU555oWSZpeQLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739386402; c=relaxed/simple;
	bh=KX75Hdg2bL50h4Y+z0x/QCvz8TQtzvvfh5qvSPi+l24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBXzLcggOE5JXX1EL3a9X7SV5IVhqNI2x4KWSHePnVbmRJ1OrcuUWIxv4ZTCqxGjgy65gNk/t+ydBAF6mxDwWgk4axKRpmZ3kWSYcjMK70n7nH0zqu2g2+9C32QKsAF+FufXMvHZ9jPvFY8eyXOp5TW6wfZcbynVWMKauoUzg64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXalS4pN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01D7C4CEDF;
	Wed, 12 Feb 2025 18:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739386401;
	bh=KX75Hdg2bL50h4Y+z0x/QCvz8TQtzvvfh5qvSPi+l24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXalS4pNd4fLr3/quOYzwOqI7+WZIuu6wJENVFPttCcYzM+OZuEyOX5maDs2XIxUb
	 gj6TGoqz/fkFKKIZM+o+2LM7SODQPLLOnLcBKnO1EPc5vE1fuN4Y3ZwPgiyYvRy1g3
	 5nSBbaQJxv4TeVCYQYaOALcB1UsyBziwFvUMyVPcvjqfoH4iFzNaqopAg8Rst+Tlaz
	 NjoI1hcOQJ5HbZ5tA3m4c4+i3fvbT2bU1kmpdIKSttuZn4PsGtwXN+U8n3zo0bwndo
	 WN4qvgUqOq5oreu/CM9NsT2TJaXYFWCxVm4rT5ugvrbhr63NapPCWVkdLUnK9A8gYj
	 /r+HNqr0JK0/g==
Date: Wed, 12 Feb 2025 19:53:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 0/3] i2c: i801: Avoid potential issue in i801_check_post
 and cosmetic improvements
Message-ID: <uwog3625dcjgb643nmk2jygw5e7ggq56ma3agwixny35dgcy4v@ij2qhjbypu77>
References: <d761a722-d400-4d6b-8866-4bb25d349184@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d761a722-d400-4d6b-8866-4bb25d349184@gmail.com>

Hi Heiner,

On Sat, Feb 10, 2024 at 04:25:30PM +0100, Heiner Kallweit wrote:
> This series avoids a potential issue in i801_check_post () and
> includes smaller, more cosmetic improvements.
> 
> Heiner Kallweit (3):
>   i2c: i801: Cosmetic improvements
>   i2c: i801: Move i801_wait_intr and i801_wait_byte_done in the code
>   i2c: i801: Improve too small kill wait time in i801_check_post

this series went forgotten. As I'm browing through the forgotten
patches, I want to know if this is still necessary (it looks OK
to me to bring it forward).

If so, may I ask you to please rebase it on top of the latest
i2c/host as it currently doesn't apply?

Thanks,
Andi

