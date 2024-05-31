Return-Path: <linux-i2c+bounces-3734-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFBA8D6B04
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 22:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691542891B6
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2024 20:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A613478286;
	Fri, 31 May 2024 20:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5d/F1wh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7EF2594;
	Fri, 31 May 2024 20:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717188321; cv=none; b=ixQ5iFw+MYXazFYUoCXb+L+wzIOOtDTWFyWFE/iaST3RcIIJPpMUDOaB6/nhdP1fCQFIU8t45d4hWuk+vg8+shyz2EHonYWx8l1WdJJKIwuHeWM4kv+E1P0KcyZfDLy8MMVFM2BJjwuLbfvxFEtuTQ6AbOMj0MPgBENMM4UW/5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717188321; c=relaxed/simple;
	bh=LI7Mxc6ebEw74KTKSXniaGRNgbV1HGFMZRF0qE9uLro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lTDs5EEBAoaB/ETXh+abkDsjULbSI9AcU5YyOfxAwzUGRqWZijrAyMslszzVsgcMpg/1EFynJxVGMpot7gxpsPCbt0rZzaPZCy9oWtS4AABFz/qqWPsO5Xj3McDd4AjtOV+cWDIm/mo7vjp+5bmAQRxIK5DIzsprxQ6G9Lk3TNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5d/F1wh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A78C32786;
	Fri, 31 May 2024 20:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717188320;
	bh=LI7Mxc6ebEw74KTKSXniaGRNgbV1HGFMZRF0qE9uLro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=A5d/F1whnzZ402gKLjGwRqrGh1azcQqGb6v1b8Z0nOQS+Pb7S9CA/D/a27MYh1QEl
	 3M7eFzQGywj5lfat7LW4VBCKh0owNQsqPCusZ1F/pUoGQRXDZhnIxyiv5Sz/eeK0YK
	 xU3BijQQLqhovPuORhK/zCqYXFgJBJURhKMUbv38Pf16bqPzhcqWRglZ1fEz9odp5q
	 zdCDlJ/UKnwdSJ4+2FBTtATj9Vhe1nftDmqMOsSSbuYaGb9i3jxFPFclaSNKA3zRLl
	 wZUxEh4g+GP4NwOKsCaLayLBvRjezRCOWzlFUqpx3XWoIJcHPh0anhfXNA7Q4R68R5
	 D9dUPHsvJCfrg==
Date: Fri, 31 May 2024 15:45:18 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, linux@roeck-us.net,
	conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net,
	Delphine_CC_Chiu@wiwynn.com, peteryin.openbmc@gmail.com,
	javier.carrasco.cruz@gmail.com, patrick.rudolph@9elements.com,
	luca.ceresoli@bootlin.com, chou.cosmo@gmail.com,
	bhelgaas@google.com, lukas@wunner.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [v3,2/2] dt-bindings: hwmon: Add mps mp2891
Message-ID: <20240531204518.GA608574@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR04MB64822856CA4E461787C3593BFAFC2@SEYPR04MB6482.apcprd04.prod.outlook.com>

On Fri, May 31, 2024 at 03:26:02PM +0800, Noah Wang wrote:
> Add support for mps mp2891 controller

s/mps/MPS/ in subject and commit log.

When you have more than one patch, it's nice if you can include a
cover letter and send the patches as responses to it.  That helps
tools like b4 connect them all together:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/5.Posting.rst?id=v6.9#n349

