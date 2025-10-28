Return-Path: <linux-i2c+bounces-13870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CFFC16646
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 19:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10E4B4F0655
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 18:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B9434BA5B;
	Tue, 28 Oct 2025 18:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NE7tR6e6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E2B33FE10
	for <linux-i2c@vger.kernel.org>; Tue, 28 Oct 2025 18:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761674657; cv=none; b=LiCebVYDZ/9q+ZJGCHU+isn0ZeLt5P6mlXt2bpHH276TdOduzYOXrRzESo5Rvk/r+E8PZWjbFxWJViwTFTC+hy/8e5MtkubK/lS67GbMy8+uOkRedlIzIykOJYpuPutbh5o1jPaIXNJx+XfoSW4ZkY/jE9eS+ZKGqbVn9HyDmcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761674657; c=relaxed/simple;
	bh=GPqVRSwK7Cb0EGl4qLDDoA6wGA8VJOrufFDjF3BKEeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/NKnqNDavTvG69ga45B1GUc5eLeO7C0qPYBOP8f2adBK2/svmf2ZWJ1G2RxnebQWfsdC81euYljMy+g5NC+B7m4chnNM+EQ77ImL/E+BWB9hdt1NEBtM7eEpQxbyJEbqYhzYTqQO05zS99jQqadP2L11sI2hber01NfKg9xT2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NE7tR6e6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C026C4CEE7;
	Tue, 28 Oct 2025 18:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761674654;
	bh=GPqVRSwK7Cb0EGl4qLDDoA6wGA8VJOrufFDjF3BKEeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NE7tR6e6kSdoJahl1f9XKj+oJG+6jh19wxnJz276+wlaCs89rbOOxwp8I1RWPEbnX
	 Lk4TrmturHR3AclK6ToIgTjJ92UQcjX8PS8gr0Uu+mRzWOPr1a3MahKjCXjJ0JzwH/
	 Lz2fS3SC5es7yrEqKUyOFtmlH0iENOZXevcMIBhprgVYo163r48O/8qa61wIK19nZG
	 d0MWmekEjXJe6xk6/5/8x19zZppL/L8ayeZ2FyklpQUT4XoxKvPDOVXMSibSbRDtIl
	 JS6cYIg7IoRa51KE2f+R1UuRJ1B2l4kAugpIQeBm5hVNNIXzXbEOW3vxOB6rJkgRKA
	 jV0bcd+Ky7tCQ==
Date: Tue, 28 Oct 2025 19:04:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Fix the Intel Diamond Rapids features
Message-ID: <75fc4rp53hnz2ohh4umqssa7dkhtpnffx55esu7japduiqqwwv@w6wcsadvkkqp>
References: <20251028105342.2281687-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028105342.2281687-1-heikki.krogerus@linux.intel.com>

Hi Heikki,

On Tue, Oct 28, 2025 at 11:53:42AM +0100, Heikki Krogerus wrote:
> Diamond Rapids does not support the iTCO feature.
> Adding also the missing comment describing Diamond
> Rapids while at it.
> 
> Fixes: 084cbc58e720 ("i2c: i801: Add support for Intel Diamond Rapids")
> Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

merged to i2c/i2c-host.

Thanks,
Andi

