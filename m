Return-Path: <linux-i2c+bounces-8957-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4BEA04D64
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 00:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15FC7166507
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 23:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED471E8837;
	Tue,  7 Jan 2025 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMljQaOk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982171E570B;
	Tue,  7 Jan 2025 23:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292092; cv=none; b=EZPD6B6vYc+WEuDkpSEms5qkJFPVeUDV3q8UegDOXwiX3/S+DPwGRLnQxljZV74xPY7+nkCmmAikXeR5mxhZ55L8NvgOqMbXVDzWzVQKkuOjdn6g7dLbwdbYYWqf/IqRTce0c8fpmB8S9+A5tMAzuMsI1f997IkI/tgVn/8EqWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292092; c=relaxed/simple;
	bh=/1LOyZMlv1B2fL4VwwpbUjJPWCQXqG5BhAuu7Wl2DrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3rKVKk7U/82FL7e6zQvtmGQQ9YyZtjmfjyrxr44V+h7bCWpahx2vSAo047TBHZdsxNX4OCpEj3CUyXItwo87O/viA4mh9osEdQyW4zU9cirjgr+hFHmbhd7HzmGD/dPwl1VBK0+MwuaXekvXhyYldwmOE4l35Qk4dtHv9k5/eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMljQaOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD8FC4CED6;
	Tue,  7 Jan 2025 23:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736292092;
	bh=/1LOyZMlv1B2fL4VwwpbUjJPWCQXqG5BhAuu7Wl2DrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMljQaOkIWwSw02QbPPi5VMVP5spEVkc4EO9Jx0R9Q69sXrJmWyoQg+4EDQv4vQjE
	 2B4uRDdSetXtdzr+neGZnd6SfpOkBaVflyJGoex9Gvj3oJ3hfdozEyg7xwxm35rxgB
	 D65gYtCLZx0WDPXlICEV5ijlKAriG0Qp3/N1P0Wo4NIuSX45ZUEFlh3AhlSj2VjPO6
	 FH7ar+suJWuS1d6rxkBPSc6n43WGzTMYBEopYfsdukSNu42A5q+b3UL7rKmAMwIzNs
	 w6g+NI19JCraKIe+LPvUK4sOOIEm3TYQ2WvTPiVq0KAPDQFUrlyVU3/EyzaqCnRqeG
	 pVJksJSz5S7vw==
Date: Wed, 8 Jan 2025 00:21:28 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: make controller available until the
 system enters suspend_noirq() and from resume_noirq().
Message-ID: <2pikoj7o5qppdysbyhrla2ur3vfsrhl5nfmp2ot3iqii5msuac@qky2ij7jtgov>
References: <20241227084736.1323943-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227084736.1323943-1-carlos.song@nxp.com>

Hi Carlos,

On Fri, Dec 27, 2024 at 04:47:36PM +0800, Carlos Song wrote:
> This is a general i2c controller feature. Some I2C devices may need the
> I2C controller to remain active during resume_noirq() or suspend_noirq().
> If the controller is autosuspended, there is no way to wake it up once
> runtime PM disabled (in suspend_late()). During system resume, the I2C
> controller will be available only after runtime PM is re-enabled
> (in resume_early()). However, this may be too late for some devices.
> 
> Wake up the controller in the suspend() callback while runtime PM is
> still enabled. The I2C controller will remain available until the
> suspend_noirq() callback (pm_runtime_force_suspend()) is called. During
> resume, the I2C controller can be restored by the resume_noirq() callback
> (pm_runtime_force_resume()). Finally, the resume() callback re-enables
> autosuspend. As a result, the I2C controller can remain available until
> the system enters suspend_noirq() and from resume_noirq().
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Merged to i2c/i2c-host.

Thanks,
Andi

