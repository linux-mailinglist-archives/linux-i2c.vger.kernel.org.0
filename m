Return-Path: <linux-i2c+bounces-4291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC37914245
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 07:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE0E81F23FCA
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 05:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F6418AF9;
	Mon, 24 Jun 2024 05:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H7+oP0C2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDC417BCC;
	Mon, 24 Jun 2024 05:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207837; cv=none; b=QnSzvuz0dQYFZo3qpjQgwHIpVwVZMdfbqMRSMo9brXNQV+/9jVV9R/GqiuQZS1XF02EKimcrFnvHAqhWfS6u22G34UuT4VV6AmA5VCbNjW3cJgBm/XAWJYlstvQT9OUwLVjxcHwQBlNZpF3zAGds4PWG1T2nAxYidRok679+C3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207837; c=relaxed/simple;
	bh=v0l6EL4R60u2j8fdedrN1MycsDZlxEJ0pdW2Bbc1hcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scLcwnCmaj/QHnSnv8MHyJYS34e+oQR0JwZsCIE2F2DMvLAgcpL+ajKSMG2RSKWDqxEeKvvdkzA659eUCsKDt4VLwCpmRqH+sUlkZvaNSOCvUwH6MCDMhJBemY2x8vHfyrlYdtzkyw88XE6jW/nQdUDhYceUsHEEtfpltFRA9G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H7+oP0C2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B312C2BBFC;
	Mon, 24 Jun 2024 05:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719207836;
	bh=v0l6EL4R60u2j8fdedrN1MycsDZlxEJ0pdW2Bbc1hcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7+oP0C2FjkfvoXyxekTiiWFbUVe0HVnU/CWsWr0kEXiZLa5zu0Ys4K9KCJin7wBH
	 8uZTEujY/QiELIA/AXD+ezyme3mjLaHBZw9jZCqkEIgplQVydjlY+Wa+E4IDPHMzRE
	 CoDizf7Y1J22CEPJ8R97Ux2SrjLQW9I+R5SK2/ag=
Date: Mon, 24 Jun 2024 07:43:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof =?utf-8?Q?Ol=C4=99dzki?= <ole@ans.pl>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>, stable@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal
 sensor in the SPD case" - "sysfs: cannot create duplicate filename"
Message-ID: <2024062438-patriarch-spendable-96b9@gregkh>
References: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>

On Sun, Jun 23, 2024 at 11:47:39AM -0700, Krzysztof Olędzki wrote:
> Hi,
> 
> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
> 
> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.

So is this also an issue in 6.9?

thanks,

greg k-h

