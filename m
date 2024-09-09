Return-Path: <linux-i2c+bounces-6445-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FAE9724A7
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 23:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9051F1C21385
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 21:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8964C1891C0;
	Mon,  9 Sep 2024 21:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obFd8540"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492C68F5A
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 21:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725918563; cv=none; b=FMsS0+lDhJfZ0Rvf4dG4ZzU4oTQYSm2yVfblhrJIWU6JL/tU31994CYfwSI9QAY0GcvTsqiuVxl+2rsa84gI4URo4rbwmkWKNHRgYnQQOaQRGtPSFAb3SPpSor+KXiilYtwQ5HyWNLkFc+Yz/zWhEC2C8UMEh3p0ixrjeBwMyCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725918563; c=relaxed/simple;
	bh=Saq5AAeHP+EwLqf+7mH+/hlPJfM9S48r4QA65WT6jZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPlP9QeGbqWUlQgpFL9iE2XtFcHnRQRxLuFJNcp4i6opghmkK3oFGExpPG9eM8eKuMlGL5fuqhvcmef5ZVm9zjhmzocRE8J2cYG6ksfPhebTEosA98keZfKAMki6A5LpYTnNtaIZiJ8Zo/3NIDttKj1htTos09ip6R77xCV5NM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obFd8540; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59EFEC4CEC5;
	Mon,  9 Sep 2024 21:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725918562;
	bh=Saq5AAeHP+EwLqf+7mH+/hlPJfM9S48r4QA65WT6jZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obFd8540m1w6j4JH0/xBT/wLm+DJcrVTH6uAmas6sJqV71Iqqi585K4vYdJN0JxM4
	 lKv360GU9S+mGJ4THWdejMmDfxthsy6/OKu7qlZ0uYH4v5Se5OUQhWLbhMah1UHBue
	 omyQBwhwW9/y8fMok6rxm+w3I+csk0cxuw4hWXchty3NYUnWABDkQmAK5V/PleeFsm
	 IPejEk/QaVDM3RHW0RaVn2SuFNthyi7SAZtDbxc7iBmSWCo0pPtJUydkVvmBVP2Cqz
	 LtLxqbTyvbbY+2qIhec3+496BHAV/8IWa/VpphCgZrav9BQNByTp9W8jyBj29/EDTS
	 YA2wndUhD2Mdw==
Date: Mon, 9 Sep 2024 23:49:18 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Wojciech Siudy (Nokia)" <wojciech.siudy@nokia.com>
Cc: Peter Rosin <peda@axentia.se>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] pca954x: Reset if channel select fails
Message-ID: <3tpj6ohcx3hrnlhwzu32xbzeob7yhtlf5cs4itm7obiwevdpz4@4m6ycn2wkmqq>
References: <DB6PR07MB35090E8350CC105E00E0462C9D812@DB6PR07MB3509.eurprd07.prod.outlook.com>
 <7c2ca9a7-c328-6d88-eb16-9c940114ceb0@axentia.se>
 <DB6PR07MB3509CF232310CBFEEAB0A3639D8E2@DB6PR07MB3509.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR07MB3509CF232310CBFEEAB0A3639D8E2@DB6PR07MB3509.eurprd07.prod.outlook.com>

Hi Wojciech,

On Wed, Aug 21, 2024 at 07:42:33AM GMT, Wojciech Siudy (Nokia) wrote:
> Hi Peter!
> 
> > But when you have more things (likely sibling pca954x chips?)
> > connected to the same reset line
> This is very good point, thank you for that. Let's make this procedure
> enabled by appropriate property in device tree.
> 
> > Also, if this timeout needs to be handled, it is likely needed if deselect
> > times out too
> Timeout of deselect is the symptom of hang mux as well, so It is even better
> to reset it inside this function as well, because if we have
> i2c-mux-idle-disconnect set we will be able to recover without failing any
> transaction on the bus.

Are you working on a new version here?

Andi

