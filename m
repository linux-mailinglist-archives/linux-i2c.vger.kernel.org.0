Return-Path: <linux-i2c+bounces-9894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EBCA68117
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 01:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 334231729D1
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 00:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D73A29;
	Wed, 19 Mar 2025 00:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HMOU9cIG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D4836B;
	Wed, 19 Mar 2025 00:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742343203; cv=none; b=sV3UXaolymaslqAn3JDN3E1RjsOuML8RNpN6dJ2CXqrAUZ+HKw0wp5MxndyfpBVe5t47mXmDI9D/Uqo65zoDhBzpOZqajuxouu2eE9LEyw3xBAxZA/O0yKBM0HCEEojk6PjaIR3XoeP6zgLmW0Cg8AaV8Fnmqq593ZrCg0jwGjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742343203; c=relaxed/simple;
	bh=Ma6BrXxjAFZEV/Q9w99+EJYNlMqRVNmDnzIFo1qbeio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHSsR2GJn3HLJCKxueJylNClarc7mCD2cJVUtEGLFgIwV2JG9a5Soo4Y+TZFuZwGtVHMN68PeL1LzawhX6HKyZy9h//rui87DM0tTcB/8lhacw9qBqxyvA6iKnldBnqKyTaEehjFtd9b60N1++Xj3C1Qz3AqgmJZHDT6VgNvo9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HMOU9cIG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D93C4CEDD;
	Wed, 19 Mar 2025 00:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742343202;
	bh=Ma6BrXxjAFZEV/Q9w99+EJYNlMqRVNmDnzIFo1qbeio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HMOU9cIGK2p87U2f2U++D4sylsp1v2RsQZY0+aptG1mnVOGISw0+49vHXlDbLV9Cj
	 ODVhod7F3x/5v3AChsP+tBAd1gHPBV3oWmxdzhyCJ0zGGHUHDvO+s/jztlBHuB1p0J
	 2ahOlZIZAK/9/xH7DPlclmEsCXD42mHQ/tEGUXT2nTuxeoe1PnS0vegDqmU9m7Eent
	 juxPgUQBAbYkykco1lA5aiy6RIOVAejD4i95lAh00cOcXZoc5RkUyqc7oxtaQXZLqf
	 BTxoG5FUWeVJPMREQmBXL0bSGvSwlC2m1ihyTCpQqa/Pl58qxWQ2otPvDvcT01w/Hi
	 OW7ilQRa8nycQ==
Date: Wed, 19 Mar 2025 01:13:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v12 1/3] i2c: octeon: fix return commenting
Message-ID: <ka6z6im5tp7lrwfy2h6knd3dqcw2w4qba4blgk3kbx7jvkdos5@4z2o5i3jxi2l>
References: <20250311023435.3962466-1-aryan.srivastava@alliedtelesis.co.nz>
 <20250311023435.3962466-2-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311023435.3962466-2-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

On Tue, Mar 11, 2025 at 03:34:32PM +1300, Aryan Srivastava wrote:
> Kernel-docs require a ':' to signify the return behaviour of a function
> with within the comment. Many functions in this file were missing ':'
> after the "Returns" line, resulting in kernel-doc warnings.
> 
> Add the ':' to satisfy kernel-doc requirements.
> 
> Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>

I merged just this patch in i2c/i2c-host.

Thanks,
Andi

