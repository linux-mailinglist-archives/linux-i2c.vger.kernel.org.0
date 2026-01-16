Return-Path: <linux-i2c+bounces-15205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0197D29674
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 01:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 333533032961
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 00:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369D22F4A18;
	Fri, 16 Jan 2026 00:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEK90QXs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F01155757;
	Fri, 16 Jan 2026 00:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768523025; cv=none; b=llgCqkonW3ao8ogf1Oo+EwGwcbfj2dEshmaUYalgGteDJMUjj5dXFHW9WUILQGl5DmNVjbDBtpNk+onRiLdSWHzULcx2GBxn34bjWvYfwuJjFff2LtqQG3qZs3S6IjXPzyHrFlKGYIeOlkMPgYFyPcx+IJIITC5vfVS6n4LJQms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768523025; c=relaxed/simple;
	bh=gRr6r85Dw9DNmNU3LbuuzoPVN962amU36uxrHqZxdOY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ac5Qxs4/TnB+x3//gBzHmbNlBAVNXx08WsqUSDY+kLFIk41XkiWDN3Qjkr192cWM/+dRcEpCRjQprIXNeIVGv5l+A7v0WN3vHIuLSg1vUHTIJNmtu9Jl1L1CkTEgtMOuupXQWs9rzI1f2hPwY/4YmW8tAMSRz2nVG0kngdaNZoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEK90QXs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0EFC116D0;
	Fri, 16 Jan 2026 00:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768523024;
	bh=gRr6r85Dw9DNmNU3LbuuzoPVN962amU36uxrHqZxdOY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=VEK90QXsVwStggroWyCYy8XdGKFUHHY29zS8oNRAxJENn9j+ejZ4RlCE7hAnC8UoR
	 oKgQ1Atuphj+b4YiaH1xpHALuyP4DF7W9hEgWLfaMDw/GQAYGGJTzx7VH061l2Z8Hd
	 jLBTo/Wuaxz3KQDFPWLibZWKvK8YZR9flUMLnScmMSg2aZFRMNbc/daoWYywZOX4wc
	 3LWuw+UI+fmk+8GfkUHe8Fx23hHvB9cfsK/zDhOFnFfRGQSYk7JPaLPg0a+u9ON9K3
	 UUJ36nX9LE4F2dhxovyOP29Ayq9kF+LOd82L2za8nqC7A3bbOU4m6SMnFaJYsnDmC+
	 qpVlF8lSO9gcA==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 01:23:38 +0100
Message-Id: <DFPL36VGXC4U.2VIGN6HU8DQDJ@kernel.org>
Subject: Re: [PATCH 0/6] Address race condition with Device::drvdata()
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <igor.korotin.linux@gmail.com>, <ojeda@kernel.org>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <david.m.ertman@intel.com>, <ira.weiny@intel.com>, <leon@kernel.org>,
 <bhelgaas@google.com>, <kwilczynski@kernel.org>,
 <wsa+renesas@sang-engineering.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107103511.570525-1-dakr@kernel.org>
In-Reply-To: <20260107103511.570525-1-dakr@kernel.org>

On Wed Jan 7, 2026 at 11:34 AM CET, Danilo Krummrich wrote:
> Danilo Krummrich (6):
>   rust: i2c: do not drop device private data on shutdown()
>   rust: auxiliary: add Driver::unbind() callback
>   rust: driver: introduce a common Driver trait

    [ Rename driver::Driver to driver::DriverLayout, as it represents the
      layout of a driver structure rather than the driver structure itself.
      - Danilo ]

>   rust: driver: add DEVICE_DRIVER_OFFSET to the Driver trait
>   rust: driver: add DriverData type to the generic Driver trait
>   rust: driver: drop device private data post unbind

    [ Remove #ifdef CONFIG_RUST, rename post_unbind() to post_unbind_rust()=
.
     - Danilo]

Applied to driver-core-linus, thanks!

